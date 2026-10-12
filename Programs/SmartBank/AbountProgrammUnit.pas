unit AbountProgrammUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ImgList,ShellAPI, DBCtrls, DB, OracleData, Oracle;
   
type
  TfrmAbout = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    ImageList1: TImageList;
    Panel3: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    p_sb_adm: TOraclePackage;
    procedure Image4Click(Sender: TObject);
    procedure Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     OkIsWhite : Boolean;
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.DFM}
        uses sboapiDataModuleImpl, sbMainForm_Unit;
procedure TfrmAbout.Image4Click(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TfrmAbout.Image4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   BMP : TBitmap;
begin
  if OkIsWhite then EXIT;
  BMP := TBitmap.Create;
  try
   ImageList1.GetBitmap(0,BMP);
   Image4.Picture.Bitmap := BMP;
   Image4.Update;
   OkIsWhite := True;
  finally
    BMP.Free;
  end
end;

procedure TfrmAbout.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   BMP : TBitmap;
   i :Integer;
begin
  with TControl(Sender).Parent do
   for i:=0 to  ControlCount-1 do
    if (Controls[i] is TLabel) then
     begin
      (Controls[i] as TLabel).Font.Color:=clWhite;
       (Controls[i] as TLabel).Update;
     end;

  if not OkIsWhite then EXIT;
  BMP := TBitmap.Create;
  try
   ImageList1.GetBitmap(1,BMP);
   Image4.Picture.Bitmap := BMP;
   Image4.Update;
   OkIsWhite := False;
  finally
    BMP.Free;
  end;




end;

procedure TfrmAbout.DBLookupComboBox1Click(Sender: TObject);
begin
{with sboapiDataModule,p_sb_adm do
begin
//showmessage(FloatToStr(DBLookupComboBox1.KeyValue));
//exit;
    CallProcedure('upd_sba_objinf_skinid',[DBLookupComboBox1.KeyValue,sboapiDataModule.sbsession.LogonUsername]);
    sbMainForm.dxSkinController1.SkinName:=CallStringFunction('skin_typ',[sboapiDataModule.sbsession.LogonUsername]);
end;}
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  OkIsWhite := False;
  //DSskin_type.Open;

end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
   {with p_sb_adm do
begin
//frmAbout.DBLookupComboBox1.ListSource.DataSet.FieldByName('id').AsInteger:=CallIntegerFunction('skin_typ_id',[sboapiDataModule.sbsession.LogonUsername]);
frmAbout.DBLookupComboBox1.KeyValue:=CallIntegerFunction('skin_typ_id',[sboapiDataModule.sbsession.LogonUsername]);
end;}
end;

procedure TfrmAbout.Label4Click(Sender: TObject);
begin
  ShellExecute(Handle,'open',PChar((Sender as TLabel).Caption),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmAbout.Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  (Sender as TLabel).Font.Color:=clBlue;
end;

end.
