unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, DBCtrlsEh, DBViewComboBox, ExtCtrls,
  SearchEdit, Mask;

type
  TForm7 = class(TForm)
    PageControl1: TPageControl;
    Header: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    reciverbic: TSearchEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    sendertype: TComboBox;
    ComboBox2: TComboBox;
    recivertype: TComboBox;
    senderlt: TComboBox;
    monitoring: TComboBox;
    Application: TComboBox;
    priority: TComboBox;
    GroupBox5: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    MainPanel: TPanel;
    MF20: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    MF23B: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    MF32A: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    mf32_date: TDateTimePicker;
    DBLookupComboBox1: TDBLookupComboBox;
    mf32a_val: TDBViewComboBox;
    DBEdit8: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    MF50: TPanel;
    MF50_main: TPanel;
    Label20: TLabel;
    Edit1: TEdit;
    MF50K: TPanel;
    Edit3_MF50: TSearchEdit;
    DBMemo1: TDBMemo;
    DBEdit12: TDBEdit;
    MF70: TPanel;
    Label27: TLabel;
    MF70_memo: TMemo;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    DBMemo2: TDBMemo;
    MF71A: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Edit1_MF71A: TEdit;
    MF72: TPanel;
    Label34: TLabel;
    Label37: TLabel;
    DBMemo4: TDBMemo;
    MF71G: TPanel;
    Label38: TLabel;
    Edit1_MF71G: TEdit;
    Edit2_MF71G: TEdit;
    MF59_59A: TPanel;
    MF59_main: TPanel;
    Label33: TLabel;
    CMF59: TComboBox;
    MF59: TPanel;
    DBEdit11: TDBEdit;
    DBMemo3: TDBMemo;
    MF59A: TPanel;
    DBEdit9: TDBEdit;
    DBMemo5: TDBMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    RichEdit1: TRichEdit;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TForm7.FormActivate(Sender: TObject);
begin
reciverbic.Text:=DBEdit1.Text;
SWDataModule.tobic.Close;
SWDataModule.tobic.SetVariable('dbs',DBEdit1.Text);
SWDataModule.tobic.open;

Edit2.Text:= SWDataModule.tobic.fieldbyname('name').asstring;
Edit3.Text:= SWDataModule.tobic.fieldbyname('city').asstring;
Edit4.Text:= SWDataModule.tobic.fieldbyname('address').asstring;
Edit5.Text:= SWDataModule.tobic.fieldbyname('country').asstring;
//reciverbic.OnChange.Execute(sender);
senderlt.Text:=SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
sendertype.Text:='Institution';
ComboBox2.Text:= SWDataModule.bankinfo.fieldbyname('SWIFT').asstring;
recivertype.Text:='Institution';
Application.Text:='FIN';
priority.Text:='N';
monitoring.Text:='N';

SWDataModule.sw_out_2.Edit;
reciverbic.Text:=DBEdit1.Text;
Edit3_MF50.Text:=DBEdit12.Text;
mf32a_val.Text:='AZN';
if SWDataModule.sw_out_2M59.AsString=':59:'  then
begin
CMF59.ItemIndex:=1;
MF59.Visible:=True;
MF59A.Visible:=False;
end;
if SWDataModule.sw_out_2M59.AsString=':59A:' then
begin
CMF59.ItemIndex:=2;
MF59.Visible:=False;
MF59A.Visible:=True;
//RichEdit1.Text:=DBMemo5.Text;
DBLookupComboBox2.CanFocus;

end;
end;

procedure TForm7.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=False;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
