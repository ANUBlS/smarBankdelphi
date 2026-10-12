unit Vergi_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ImgList, StdCtrls, ComCtrls, Grids, DBGrids, ToolWin,sboapiDataModuleImpl,FileCtrl,
  ExtCtrls;

type
  TVergiForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ListBox1: TListBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    RichEdit1: TRichEdit;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1NAME: TWideStringField;
    OracleDataSet1BOSH: TWideStringField;
    OracleDataSet1TEK: TWideStringField;
    OracleDataSet1UCH: TWideStringField;
    OracleDataSet1DESCRIPTION: TWideStringField;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet2ID: TFloatField;
    OracleDataSet2NAME: TWideStringField;
    OracleDataSet2DESCRIPTION: TWideStringField;
    OracleDataSet3: TOracleDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Panel1: TPanel;
    OracleDataSet4: TOracleDataSet;
    OracleDataSet6: TOracleDataSet;
    OracleDataSet5: TOracleDataSet;
    procedure ToolButton5Click(Sender: TObject);
    Function LoadFileNames(Dir : String) : Boolean;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    function LoadToRich(FileName : String) : string;
    procedure ConvertToBase(Rich : TRichEdit;ref :string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VergiForm: TVergiForm;

implementation

uses Data_Unit, SBTranslateProc;

{$R *.DFM}

procedure TVergiForm.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

Function TVergiForm.LoadFileNames(Dir : String) : Boolean;
  var CurrDir : String;
      FileInfo: TSearchRec;
      FileDir: String;
      FileAttrs: Word;
begin
  CurrDir := GetCurrentDir;
  TRY
    FileDir := Dir;
    if DirectoryExists(FileDir) then
       ChDir(FileDir)
    else
    begin
      MessageDlg('Directory '+FileDir+' not Exists!',mtWarning,[mbOk],0);
      Result := False;
      Exit;
    end;
    FileAttrs := Integer(faReadOnly);
    FileAttrs := FileAttrs + faHidden;
    FileAttrs := FileAttrs + faSysFile;
    FileAttrs := FileAttrs + faVolumeID;
    FileAttrs := FileAttrs + faDirectory;
    FileAttrs := FileAttrs + faArchive;
    VergiForm.ListBox1.Items.Clear;
    if FindFirst('*.xml', FileAttrs, FileInfo) = 0 then
    begin
          repeat
            if (FileInfo.Attr and FileAttrs) = FileInfo.Attr then
              begin
                 VergiForm.ListBox1.Items.Add(FileInfo.Name);
              end
          until  FindNext(FileInfo) <> 0;

    FindClose(FileInfo);
    end;
  FINALLY
     ChDir(CurrDir);
  END;
  Result := False;
END;
procedure TVergiForm.ToolButton5Click(Sender: TObject);
begin
  DataMod.XS_CONFIG.Refresh;
  LoadFileNames(DataMod.XS_CONFIG.fieldbyname('ver_dir').AsString);
  ListBox1.Update;
end;

procedure TVergiForm.ToolButton1Click(Sender: TObject);
begin
  DataMod.XS_CONFIG.Refresh;
  LoadFileNames(DataMod.XS_CONFIG.fieldbyname('ver_dir').AsString);
  ListBox1.Update;
end;
function TVergiForm.LoadToRich(FileName : String) : string;
   var stpos,endpos: integer;
   ref : string;
begin
   RichEdit1.Clear;
   RichEdit1.Lines.LoadFromFile(FileName);
   stpos:=RichEdit1.FindText('<treasury>',0,RichEdit1.GetTextLen,[stMatchCase]);
   endpos:=RichEdit1.FindText('</treasury>',0,RichEdit1.GetTextLen,[stMatchCase]);
   RichEdit1.SelStart:=stpos+length('<treasury>');
   RichEdit1.SelLength:=abs(endpos-stpos)-length('</treasury>');
   ref:=RichEdit1.SelText;
   Result:=ref;
end;
procedure TVergiForm.ConvertToBase(Rich : TRichEdit;ref :string);
   var  startPos,EndPos, FnStartPos, FnEndPos,P,
        TempPos,TempLine, LineIndex, TempVar : integer;
        StMessage,S,Text1,Text2 : string;
        I,j,k,say,g : Integer;
        SS :array[1..3]of String;
        dataset:TOracleDataSet;

begin
  TRY
   i:=6;
   if Rich.GetTextLen = 0 then exit;
   startPos:=0;
   for say:=1 to 3 do
  begin
     if say=1 then begin
                     dataset:=OracleDataSet1;
                     ss[1]:='<institution name="';
                     s:='</institutions>';
                   end;
     if say=2 then begin
                     dataset:=OracleDataSet2;
                     ss[1]:='<destination name=">';
                     s:='</destinations>';
                     //i:=i+4;
                   end;
     if say=3 then begin
                     dataset:=OracleDataSet3;
                     ss[1]:='<level name="';
                     s:='</budget_levels>';
                   end;
     ss[2]:='code="';
     ss[3]:='inn="';
     while  StMessage <>s do
     begin
       k:=1;
       if (dataset.Name='OracleDataSet1')or(dataset.Name='OracleDataSet3') then j:=length(ss[k])+2;
       if dataset.Name='OracleDataSet2' then j:=length(ss[k]);
       TEXT1:='';
       dataset.Insert;
       StMessage:= Rich.Lines[i];
       while j<=length(StMessage) do
       begin
         if StMessage[j]<>'"' then
         begin
           Text1:=Text1+StMessage[j];
           inc(j);
         end
         else begin
                if k=1 then
                begin
                  if say=2 then  dataset.FieldByName('id').AsInteger:=StrToInt(Text1)
                  else dataset.FieldByName('Name').AsString:=Text1;
                  Text2:=Text1;
                  StMessage:=copy(StMessage,j+1,length(StMessage));
                end;
                if k=2 then
                begin
                  if say=2 then dataset.FieldByName('Name').AsString:=Text1
                  else dataset.FieldByName('id').AsVariant:=Text1;
                  dataset.FieldByName('DESCRIPTION').AsString:=Text1+ '-' + Text2;
                  StMessage:=copy(StMessage,j+1,length(StMessage));
                end;
                if k=3 then begin
                              text1:=stringReplace(StMessage,' ','',[rfReplaceAll, rfIgnoreCase]);
                              g:=pos('"',Text1);
                              delete(Text1,1,g);
                              g:=pos('"',Text1);
                              delete(Text1,g,length(text1));
                              dataset.FieldByName('TEK').AsString:=Text1;
                            end;

                if StMessage='/>' then Break;
                inc(k);
                if dataset.Name='OracleDataSet2' then j:=length(ss[k])+2
                else j:=length(ss[k])+2;
                TEXT1:='';
              end;
       end;
       inc(i);
     end;
   end;
     finally
     dataset.Post;
     {Rich.Clear;}
   end;
end;

procedure TVergiForm.ToolButton3Click(Sender: TObject);
    var i : integer;
     ref : string;
     ErrStr : String;
     FileDir : String;
begin
   OracleDataSet4.open;
   OracleDataSet4.Close;
   OracleDataSet5.Close;
   OracleDataSet5.Open;
   OracleDataSet6.Close;
   OracleDataSet6.Open;
   OracleDataSet1.Refresh;
   OracleDataSet2.Refresh;
   OracleDataSet3.Refresh;
   Screen.Cursor := crSQLWait;
    TRY
     ref:='';
     FileDir :=DataMod.XS_CONFIG.FieldByName('ver_dir').AsString+'\';
     for i:=0 to ListBox1.Items.Count - 1 do
     begin
         ref:=LoadToRich(FileDir+ListBox1.Items[i]);
         if ref <> '0' then
         begin
         OracleDataSet1.Open;
         OracleDataSet2.Open;
         OracleDataSet3.Open;
         ConvertToBase(RichEdit1,ref );
         end
     end;
   OracleDataSet1.Refresh;
   DBGrid1.SelectedRows.Clear;
   FINALLY
   Screen.Cursor := crDefault;
   END;
end;   

end.
