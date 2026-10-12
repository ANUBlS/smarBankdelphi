unit adm_classesAdvInfoImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Evanescence, DBCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TfrmClassesAdvInfo = class(TForm)
    Panel1: TPanel;
    btnApply: TBitBtn;
    btnClose: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    evFlags: TEvanescence;
    evBalAccs: TEvanescence;
    cbOpType: TDBLookupComboBox;
    Label2: TLabel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure cbOpTypeCloseUp(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure cbOpTypeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    procedure applybalaccs(optyp: integer);
    procedure applyflags;
  public
    { Public declarations }
  end;

var
  frmClassesAdvInfo: TfrmClassesAdvInfo;

implementation

uses AdministrationDataModule;

{$R *.DFM}

procedure TfrmClassesAdvInfo.cbOpTypeCloseUp(Sender: TObject);
var
  i: Integer;
begin      
    with AdministrationData, odsClsBalAcc do begin
      Close;
      evBalAccs.Close;
      SetVariable('op', cbOpType.KeyValue);
      SetVariable('classname', Classesdata.FieldByName('obj').AsString);
      evBalAccs.Open;
      for i := 0 to evBalAccs.Items.Count-1 do begin
        Locate('bal_cn', evBalAccs.Items[i],[]);
        evBalAccs.Checked[i] := odsClsBalAccACC.AsInteger=1;
      end;
    end;
end;

procedure TfrmClassesAdvInfo.applybalaccs;
var
  i: Integer;
begin
  with AdministrationData do begin
    pcADM.CallProcedure('delclassbalacc',[Classesdata.FieldByName('obj').AsString, optyp]);
    for i:=0 to evBalAccs.Items.Count-1 do
      if evBalAccs.Checked[i] then begin
        pcADM.CallProcedure('addclassbalacc',[Classesdata.FieldByName('obj').AsVariant,
                                             evBalAccs.items[i],
                                             optyp]);         
      end;
  end;
end;  

procedure TfrmClassesAdvInfo.applyflags;
var
  i: Integer;
begin
  with AdministrationData do begin
    pcADM.CallProcedure('delclassflag',[Classesdata.FieldByName('obj').AsString]);
    for i:=0 to evFlags.Items.Count-1 do
      if evFlags.Checked[i] then begin      
        odsAccFlags.Locate('description', evFlags.Items[i],[]);
        pcADM.CallProcedure('addclassflag',[Classesdata.FieldByName('obj').AsVariant,
                                           odsAccFlagsSYMBOL.AsVariant]);
      end;
  end;
end;   

procedure TfrmClassesAdvInfo.btnApplyClick(Sender: TObject);
begin
  applybalaccs(cbOpType.KeyValue);
  applyflags;
end;

procedure TfrmClassesAdvInfo.cbOpTypeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  applybalaccs((sender as TDBLookupComboBox).KeyValue);
end;

procedure TfrmClassesAdvInfo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClassesAdvInfo.CheckBox1Click(Sender: TObject);
begin
  if (sender as TCheckBox).checked then
    evBalAccs.CheckAll
  else
    evBalAccs.UncheckAll
end;

end.
