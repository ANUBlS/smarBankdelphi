unit UInsAppMotor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, LDialogs,
  StdCtrls, Mask, DBCtrls, ComCtrls, Grids, DBGrids, Buttons,Db, ExtCtrls;

type
  TFullCascoForm = class(TForm)
    MotorAppPageControl: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditBanking: TDBEdit;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEditModel: TDBEdit;
    DBEditType: TDBEdit;
    DBEdit1StateNum: TDBEdit;
    DBEditColor: TDBEdit;
    DBEditOutputYear: TDBEdit;
    DBEditSeatCount: TDBEdit;
    DBEditEnginNum: TDBEdit;
    DBEditChassisNum: TDBEdit;
    DBEditActualValue: TDBEdit;
    Label31: TLabel;
    DBEditTransmission: TDBEdit;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    AccesoriesDBGrid: TDBGrid;
    TabSheet6: TTabSheet;
    GroupBox6: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label22: TLabel;
    Label23: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Back: TBitBtn;
    Next: TBitBtn;
    BitBtn2: TBitBtn;
    Commit: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    DBComboBox2: TDBComboBox;
    Label17: TLabel;
    DBComboBox3: TDBComboBox;
    Label32: TLabel;
    DBEdit1: TDBEdit;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    Label20: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    lbBeginDate: TLabel;
    edBeginDate: TDateTimePicker;
    edEndDate: TDateTimePicker;
    lbEndDate: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    procedure ButtonCommitClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NextClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure MotorAppPageControlChange(Sender: TObject);
    procedure DBEditContactPersonKeyPress(Sender: TObject; var Key: Char);
    procedure edBeginDateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
   
  end;

var
  FullCascoForm: TFullCascoForm;
  f:boolean=true;

implementation

uses DataUnitFullMotor, UInsFullMotorCasco,sboapiDataModuleImpl;

{$R *.DFM}


procedure TFullCascoForm.ButtonCommitClick(Sender: TObject);
var
   a1,a2:real;
begin
      if DBEditModel.Text='' then
      begin
         MessageDlg('Марка вя модел дахил едилмяйиб!',mtWarning,[mbOK],0);
         exit;
      end;

      if DataModuleFullMotor.Ins_MotorFull.State in [dsEdit] then
      begin
         a1:=DataModuleFullMotor.ins_motorfullid.value;
         a2:=DataModuleFullMotor.ins_motorfullkli_id.value;
         DataModuleFullMotor.OPCommon.CallBooleanFunction('setblankdata',[4,a1,edBeginDate.DateTime,edEndDate.DateTime,a2]);
      end;

      with DataModuleFullMotor.Ins_MotorFull do
      if State in [dsInsert, dsEdit] then
      begin
        Post;
        Refresh;
      end;
         if DataModuleFullMotor.Accesories.State in [dsInsert, dsEdit] then
         begin
            DataModuleFullMotor.Accesories.Post;
            DataModuleFullMotor.Accesories.Refresh;
         end;
         if DataModuleFullMotor.MoreThanOne.State in [dsInsert, dsEdit] then
         begin
            DataModuleFullMotor.MoreThanOne.Post;
            DataModuleFullMotor.MoreThanOne.Refresh;
         end;
      Close;
      MotorAppPageControl.ActivePageIndex:=0;
end;

procedure TFullCascoForm.ButtonCancelClick(Sender: TObject);
begin

     {if insfullmotorcasco.ActionInsert.Execute then
     if (DBEditModel.Text<>'') and (MotorAppPageControl.ActivePageIndex=2) then
        if MessageDlg('Имтина едилсин ?',mtWarning,[mbOK],0)=mrOK   then
        begin
           Refresh;
           DataModuleFullMotor.Ins_MotorFull.Locate('ID',dataModuleFullMotor.ResultID,[]);
           DataModuleFullMotor.DeleteMotorInfo(dataModuleFullMotor.ResultID);

        end; }
     Close;
     MotorAppPageControl.ActivePageIndex:=0;
end;

procedure TFullCascoForm.FormShow(Sender: TObject);
begin
    with DataModuleFullMotor do
    begin
        if not Accesories.Active then Accesories.Open;
        if not MoreThanOne.Active then MoreThanOne.Open;
    end;

end;

procedure TFullCascoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     with DataModuleFullMotor, INS_Motorfull do
     if State in [dsInsert, dsEdit] then
     begin
          Cancel;
          RefreshRecord;
     end;
     MotorAppPageControl.ActivePageIndex:=0;
end;

procedure TFullCascoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
     Close;
end;

procedure TFullCascoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
     end;
end;


procedure TFullCascoForm.NextClick(Sender: TObject);
begin

      MotorAppPageControl.ActivePageIndex:= MotorAppPageControl.ActivePageIndex+1;
      if MotorAppPageControl.ActivePageIndex=MotorAppPageControl.PageCount-1 then
      Next.Enabled:=false;
      Back.Enabled:=true;

      if MotorAppPageControl.ActivePageIndex=2 then
      begin
          if DBEditModel.Text='' then
          begin
          MessageDlg('Марка вя модел дахил едилмяйиб!',mtWarning,[mbOK],0);
          exit;
          end;
          with DataModuleFullMotor.Ins_MotorFull do
          if State in [dsInsert] then
          begin
             Refresh;
             Locate('ID',dataModuleFullMotor.ResultID,[]);
          end;
       end;

       case MotorAppPageControl.ActivePageIndex of
       0:DBLookupComboBox1.SetFocus;
       1:DBEditModel.SetFocus;
       2:AccesoriesDBGrid.SetFocus;  
       end;
end;

procedure TFullCascoForm.BackClick(Sender: TObject);
begin
     with MotorAppPageControl do
     begin
          ActivePageIndex:=ActivePageIndex-1;
          if ActivePageIndex=0 then
          Back.Enabled:=false;
             Next.Enabled:=true;

     end;
end;

procedure TFullCascoForm.MotorAppPageControlChange(Sender: TObject);
begin
      with MotorAppPagecontrol do
      begin
          if ActivePageIndex<>PageCount-1 then Next.Enabled:=true else Next.Enabled:=false;
          if ActivepageIndex<>0 then Back.Enabled:=true else Back.Enabled:=false;
      end;

       if MotorAppPageControl.ActivePageIndex=2 then
       begin
       if DBEditModel.Text='' then
       begin
          MessageDlg('Марка вя модел дахил едилмяйиб!',mtWarning,[mbOK],0);
          exit;
       end;
          with DataModuleFullMotor.Ins_MotorFull do
          if State in [dsInsert] then
          begin
             Refresh;
             Locate('ID',dataModuleFullMotor.ResultID,[]);
          end;
       end;

end;





procedure TFullCascoForm.DBEditContactPersonKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
        if HiWord(GetKeyState(VK_Shift))<>0 then
           with Sender as TControl do
           SelectNext(ActiveControl,False, True)
        else
           with Sender as TControl do
           SelectNext(ActiveControl,True, True);
        key:=#0;
     end;
end;

procedure TFullCascoForm.edBeginDateChange(Sender: TObject);
begin
     DataModuleFullMotor.Ins_MotorFull.Edit;
end;

procedure TFullCascoForm.FormActivate(Sender: TObject);
var
    id:real;
begin
      with DataModuleFullMotor do
     begin
          if Ins_MotorFull.State in [dsInsert] then
          begin
             edBeginDate.DateTime :=Now;
             edEndDate.DateTime :=Now;
          end
             else
          begin
             ODSContracts.Close;
             ODSContracts.SetVariable('blankid',ins_motorfullid.value);
             ODSContracts.Open;
             edBeginDate.DateTime :=DataModuleFullMotor.ODSContractsbegin_date.AsDateTime;
             edEndDate.DateTime :=DataModuleFullMotor.ODSContractsEnd_date.AsDateTime;
          end;
     end;
end;
end.
