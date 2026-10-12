unit InsSettings;
// TabSheet3
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DBViewComboBox, Mask, DBCtrls, ExtCtrls, DB,
  Grids, DBGrids, XFSCtrls, XDBGrids, XDBCtrls;

const
    caPost = mrOk;
    caCancel = mrCancel;

type
  TfmSettings = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Splitter1: TSplitter;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid5: TDBGrid;
    DBNavigator5: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    DBNavigator7: TDBNavigator;
    DBGrid7: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    DBNavigator6: TDBNavigator;
    DBGrid6: TDBGrid;
    DBNavigator8: TDBNavigator;
    DBGrid8: TDBGrid;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox5: TGroupBox;
    GridPSettings: TDBGrid;
    DBNavigator9: TDBNavigator;
    Panel4: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Panel5: TPanel;
    DBGrid9: TDBGrid;
    Panel6: TPanel;
    CheckBox2: TCheckBox;
    TabSheet4: TTabSheet;
    GroupBox6: TGroupBox;
    DBGrid10: TDBGrid;
    DBNavigator10: TDBNavigator;
    TabSheet5: TTabSheet;
    XFGroupBox1: TXFGroupBox;
    DBNavigator11: TDBNavigator;
    DBGrid11: TDBGrid;
    TabSheet6: TTabSheet;
    XFGroupBox2: TXFGroupBox;
    DBNavigator12: TDBNavigator;
    DBGrid12: TDBGrid;
    TabSheet7: TTabSheet;
    XFGroupBox3: TXFGroupBox;
    DBNavigator13: TDBNavigator;
    DBGrid13: TDBGrid;
    TabSheet8: TTabSheet;
    XFGroupBox4: TXFGroupBox;
    DBNavigator14: TDBNavigator;
    XDBGrid1: TXDBGrid;
    XFPanel1: TXFPanel;
    XFGroupBox5: TXFGroupBox;
    XFPanel2: TXFPanel;
    DBGrid14: TDBGrid;
    XFButton1: TXFButton;
    XFButton3: TXFButton;
    XFPanel3: TXFPanel;
    XFGroupBox6: TXFGroupBox;
    DBGrid15: TDBGrid;
    XDBNavigator1: TXDBNavigator;
    XFGroupBox7: TXFGroupBox;
    DBGrid16: TDBGrid;
    XDBNavigator2: TXDBNavigator;
    XFGroupBox8: TXFGroupBox;
    XFPanel4: TXFPanel;
    XFButton2: TXFButton;
    XFButton4: TXFButton;
    XDBGrid2: TXDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet3Show(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAndCloseDataset(sender : TDataSet; cAction : Integer);
  end;

var
  fmSettings: TfmSettings;

implementation

uses InsDataModule,sboapiDataModuleimpl,SBTranslateProc,
  FrmAddAccpayment_lossImpl, FrmAddBanksImpl;

{$R *.DFM}

procedure TfmSettings.SaveAndCloseDataset(sender : TDataSet; cAction : Integer);
begin
   if (sender.State = dsEdit) then
    case cAction of
     caPost : sender.Post;
     caCancel : sender.Cancel;
    end; 
   Sender.Close;
end;


procedure TfmSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);

  procedure CloseLinkedTables(CName : TWinControl; cAction : Integer);
  var i : Integer;
  begin
    with CName do
      for i := 0 to ControlCount -1 do begin
        if (Controls[i] is TCustomControl) then
          CloseLinkedTables(Controls[i] as TCustomControl, cAction);

        if (Controls[i] is TDBgrid) then
         if (Controls[i] as TDBgrid).tag = 0 then
          SaveAndCloseDataset((Controls[i] as TDBgrid).DataSource.DataSet, cAction);

    end
  end;

begin
  with InsDataMod do begin
    CloseLinkedTables(TabSheet1, ModalResult);
    CloseLinkedTables(TabSheet2, ModalResult);
    CloseLinkedTables(TabSheet3, ModalResult);
  end;

end;

procedure TfmSettings.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
PageControl1.ActivePage:=TabSheet2;
end;

procedure TfmSettings.FormShow(Sender: TObject);
begin
//InsDataMod.DSPay_loss_acc.Close;
InsDataMod.DSPay_loss_acc.open;
//InsDataMod.DSins_dict_next_per.Close;
InsDataMod.DSins_dict_next_per.open;
InsDataMod.dspaymentpercent.Open;
end;

procedure TfmSettings.TabSheet3Show(Sender: TObject);
begin
 with InsDataMod do
  CheckBox1.Checked := OPCOMMON.CallIntegerFunction('disablepolicies', []);
end;

procedure TfmSettings.XFButton1Click(Sender: TObject);
begin
InsDataMod.DSAccountPayment.Close;
InsDataMod.DSAccountPayment.open;
FrmAddAccpayment_loss:=TFrmAddAccpayment_loss.Create(self);
FrmAddAccpayment_loss.ShowModal;
FrmAddAccpayment_loss.DBLookupComboBox1.KeyValue:='';
end;

procedure TfmSettings.XFButton2Click(Sender: TObject);
begin
FrmAddBanks.DBLookupComboBox1.KeyValue:='';
FrmAddBanks.ShowModal;
end;

procedure TfmSettings.XFButton3Click(Sender: TObject);
begin
//InsDataMod.DSRPay_loss_acc
//DBGrid14.DataSource.DataSet.Delete;
InsDataMod.OPCOMMON.CallProcedure('del_acc_no_pay_loss',[DBGrid14.DataSource.DataSet.FieldByName('id').AsInteger]);
 DBGrid14.DataSource.DataSet.Refresh;

end;

procedure TfmSettings.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel
end;

procedure TfmSettings.CheckBox1Click(Sender: TObject);
begin
 with InsDataMod do
  OPCOMMON.CallIntegerFunction('disablepolicies', [Integer(CheckBox1.Checked)]);
end;

procedure TfmSettings.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
  CheckBox1Click(Sender);
end;

procedure TfmSettings.CheckBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckBox1Click(Sender);
end;

procedure TfmSettings.CheckBox2Click(Sender: TObject);
begin
  with InsDataMod do
    ODSInsurances.Filtered := CheckBox2.Checked;
end;

end.
