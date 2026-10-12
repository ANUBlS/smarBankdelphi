unit DecaMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, StdCtrls, Buttons, ComCtrls, ImgList, ActnList, DB,
  ExtCtrls, Grids, DBGrids;

type
  TDecaForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    ActionList1: TActionList;
    ImageList1: TImageList;
    StartExport: TAction;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    OutputPathEdit: TEdit;
    ProgressShower: TProgressBar;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Label1: TLabel;
    DTPRepDate: TDateTimePicker;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StartExportExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ShowDecaForm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DecaForm: TDecaForm;

procedure InitPlugin(S : String);export;

implementation

uses DecaDataModuleImpl, CommonDecls , SystemState, CMOracleAPIDataModuleImpl;

{$R *.DFM}

procedure TDecaForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TDecaForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ORD(Key) = VK_ESCAPE then
  Close;
end;

procedure TDecaForm.ShowDecaForm;
begin
  DecaDataModule := TDecaDataModule.Create(Self);
  DTPRepDate.DateTime := Get_CurrentDate;
  ShowModal;
end;

procedure TDecaForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TDecaForm.SpeedButton1Click(Sender: TObject);
begin
  with DecaDataModule.SaveDlg do
  if Execute then
  OutputPathEdit.Text := FileName;
end;

procedure TDecaForm.StartExportExecute(Sender: TObject);
var
   lpExistingFileName :array [0..255] of Char;
   lpNewFileName :array [0..255] of Char;
   Path : String;
   DBaseName , TblName : String;
   HDATE : TDateTime;
   I : Integer;
   TempStr : String;
   SourceStrMaxLength : Integer;
begin

   Path :=ExtractFilePath(Application.ExeName)+'Deca.dbf';

   StrPCopy(lpExistingFileName,Path);
   StrPCopy(lpNewFileName,OutputPathEdit.Text);

   if  FileExists(OutputPathEdit.Text) then
   if  MessageDlg(
           Format('Файл мювжуддур! %s'+#13+'Силинсин ?',[OutputPathEdit.Text])
           ,mtConfirmation
           ,MBYESNOCANCEL,0
        )<>mrYes  then  Exit;

   if not CopyFile(lpExistingFileName,lpNewFileName,False) then
   begin
     ShowMessage('Файлын йардылмасы мцмкцн олмады !');
     Exit;
   end;
   

   DBaseName :=ExtractFileDir(OutputPathEdit.Text);
   TblName  :=ExtractFileName(OutputPathEdit.Text);
   HDATE := DTPRepDate.DateTime;
   Screen.Cursor := crHourGlass;
   
   with DecaDataModule do
   try
     with DecaTable do
     begin
       DatabaseName := DBaseName;
       TableName := TblName;
       Open;
     end;
     with DecaData do
     begin
       ClearVariables;
       SetVariable('HDATE',HDATE);
       Open;
       First;
       ProgressShower.Max := RecordCount;
       LogInformation(inttostr(RecordCount),true);
       while not EOF do
       begin
         DecaTable.Insert;
         
         for I := 0 to Fields.Count - 1 do
         begin
           if DecaTable.FindField(Fields[I].FieldName) <> nil then
           if not Fields[I].IsNull then
           if (Fields[I].DataType = ftString) then
           begin
             TempStr := Fields[I].AsString;
             TempStr := Trim(TempStr);

             // Axot olanda umimileshdirmek lazimdi
             TempStr := StringReplace(TempStr,'-','',[rfReplaceAll]);
             TempStr := StringReplace(TempStr,'"','',[rfReplaceAll]);
             TempStr := StringReplace(TempStr,'№','',[rfReplaceAll]);
             TempStr := StringReplace(TempStr,'_','',[rfReplaceAll]);
             TempStr := StringReplace(TempStr,'.','',[rfReplaceAll]);
             SourceStrMaxLength := DecaTable.FieldByName(Fields[I].FieldName).Size;
             if Length(TempStr) > SourceStrMaxLength then
               TempStr := Copy(TempStr,1,SourceStrMaxLength);
             DecaTable.FieldByName(Fields[I].FieldName).AsString := TempStr;

           end else  try
             DecaTable.FieldByName(Fields[I].FieldName).Value := Fields[I].AsVariant;
             except on e:exception do logerror(e.message);end;

         end;
         DecaTable.Post;
         ProgressShower.Position := ProgressShower.Position + 1;
         Next;
       end;

       MessageDlg(
            'Чыхыш файлы йарадылды .'
           ,mtInformation
           ,[mbOK]
           ,0);
           
     end;
   finally
     ProgressShower.Position := 0;
     DecaData.Close;
     DecaTable.Close;
     Screen.Cursor := crDefault;
   end;
end;

procedure TDecaForm.FormDestroy(Sender: TObject);
begin
  DecaDataModule.Free;
end;

procedure InitPlugin(S : String);export;
begin
  DecaForm.ShowDecaForm;
end;

exports
  InitPlugin;
  
initialization
  DecaForm := TDecaForm.Create(CommonApplication);

end.
