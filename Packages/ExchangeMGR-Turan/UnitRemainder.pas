unit UnitRemainder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGridEh, DBGridEhGrouping, CMExcelExport, Menus, GridsEh,
  ComCtrls, ToolWin, ImgList, StdCtrls;

type
  TFormRemainder = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Excel1: TMenuItem;
    CMExcelExport1: TCMExcelExport;
    Panel6: TPanel;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Panel7: TPanel;
    DateTimePicker1: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRemainder: TFormRemainder;

implementation
    uses UnitDateExch,sboapiDataModuleImpl, SBTranslateProc, UnitRemandirReport,
  UnitRate, Unit_ExchangeMGR;
{$R *.DFM}

procedure TFormRemainder.Excel1Click(Sender: TObject);
begin
   if DBGridEh1.DataSource.DataSet.RecordCount=0 then begin
                                                       ShowMessage('Heç bir məlumat tapılmadı!...');
                                                       exit;
                                                     end;


 { with CMExcelExport1 do
  begin
    {DBGridEh1.DataSource.DataSet.Last;
    DBGridEh1.DataSource.DataSet.FieldByName('val_id').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('val_full_name').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_PURCHASE_COURSE').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_SELLING_COURSE').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_NB_COURSE').Visible:=false;}
    {DBGridEh1.DataSource.DataSet.FieldByName('EX_ID').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('DAT').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_ID').Visible:=false;
    DBGridEh1.DataSource.DataSet.FieldByName('TIM').Visible:=false;
    Connect;
    ExportDataset(DBGridEh1.DataSource.DataSet, 'Qalıqlar',true,false);
    Disconnect;
  end; }
   with DataModExch do
   begin
     ODSVDM.Close;
     ODSVDM.SetVariable('ex_id',ODSExRemainderEX_ID.AsInteger);
     ODSVDM.Open;
   end;

   FormRemandirReport.frxReportRem.ShowReport;
end;

procedure TFormRemainder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 {   DBGridEh1.DataSource.DataSet.Last;
    DBGridEh1.DataSource.DataSet.FieldByName('val_id').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('val_full_name').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_PURCHASE_COURSE').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_SELLING_COURSE').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('VAL_NB_COURSE').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('EX_ID').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('DAT').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('USR_ID').Visible:=True;
    DBGridEh1.DataSource.DataSet.FieldByName('TIM').Visible:=True;  }
end;

procedure TFormRemainder.FormCreate(Sender: TObject);
begin
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormRemainder.FormShow(Sender: TObject);
begin
  ToolButton1Click(sender);
end;

procedure TFormRemainder.ToolButton1Click(Sender: TObject);
var
  sysdate:TDateTime;
  sdat,dat:TDateTime;
  Calendar:boolean;
  FTime:TDateTime;
  lastday:TDateTime;
begin
  sysdate:=date;
  dat:=integer(trunc(DateTimePicker1.DateTime));
  sdat:=Integer(Trunc(DataModExch.SBOPDate.CallDateFunction('get_date',[])));
  Calendar:=DataModExch.OPExchMgr.CallBooleanFunction('Ex_Calendar',[dat]);
  lastday:=DataModExch.OPExchMgr.CallDateFunction('LastWorkDay_Calendar',[dat]);
  with DataModExch,ODS_ExRemain do
  begin
    Close;
    SQL.Clear;
    if  (sdat>=dat) then
      SQL.Add('begin exch_mgr.ExRemainderSql(vdat=>:dat,v_exid=>:ex_id,sdat=>:sdat,result=>:result); end;');
    if  (sdat<dat) and Calendar and (sdat=Lastday)  then
      SQL.Add('begin exch_mgr.ExRemainderSql(vdat=>:dat,v_exid=>:ex_id,sdat=>:sdat,result=>:result); end;');
    if  (sdat<dat) and (not(Calendar) or (sdat<Lastday)) then
      SQL.Add('begin exch_mgr.ExRemainderSql(vdat=>:dat,v_exid=>:ex_id,sdat=>:sdat,result=>:result); end;');

    SetVariable('dat',dat);
    SetVariable('sdat',sdat);
    SetVariable('ex_id',ODSExchOffice.FieldByName('ex_no').AsInteger);
    Open;
    Refresh;
  end;



end;

end.
