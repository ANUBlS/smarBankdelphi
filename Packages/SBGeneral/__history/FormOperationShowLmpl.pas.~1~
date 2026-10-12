unit FormOperationShowLmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFormOperationShow = class(TForm)
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    XFLabel2: TXFLabel;
    XFLabel4: TXFLabel;
    XFLabel3: TXFLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    XFPanel2: TXFPanel;
    XFBitBtn1: TXFBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOperationShow: TFormOperationShow;

implementation

uses
  UnitDataModPCustService,SBTranslateProc, sboapiDataModuleImpl;
{$R *.dfm}

procedure TFormOperationShow.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

procedure TFormOperationShow.FormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TFormOperationShow.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = 27 then
    Close;
end;

procedure TFormOperationShow.FormShow(Sender: TObject);
begin
  Edit1.Text := DataModPCustService.ODS_sb_business_opers.FieldByName
    ('REFERENCE').AsString;
  Edit2.Text := DataModPCustService.ODS_sb_business_opers.FieldByName
    ('NAME').AsString;
  DateTimePicker1.DateTime := DataModPCustService.ODS_sb_business_opers.
    FieldByName('DAT').AsDateTime;
  DateTimePicker2.DateTime := DataModPCustService.ODS_sb_business_opers.
    FieldByName('TIM').AsDateTime;
end;

procedure TFormOperationShow.XFBitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
