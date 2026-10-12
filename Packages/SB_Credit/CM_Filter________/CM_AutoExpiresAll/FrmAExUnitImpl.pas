unit FrmAExUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ComCtrls, Grids, DBGridEh, NLSLocalizer, ImgList, ToolWin, ActnList,
  StdCtrls, CMExcelExport,oracle,oracledata, ExtCtrls, Mask, DBCtrlsEh,
  DBLookupEh, Buttons;

type
  TFrmAEx = class(TForm)
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    NLSLocalizer1: TNLSLocalizer;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    GRDate: TGroupBox;
    ToolButton8: TToolButton;
    DTPExp: TDateTimePicker;
    ActnRefresh: TAction;
    ActnCreditProperties: TAction;
    ExcelExport: TCMExcelExport;
    ActnExport: TAction;
    Panel2: TPanel;
    ToolButton9: TToolButton;
    ActnSearch: TAction;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ActnFilter: TAction;
    PanelFilter: TPanel;
    ToolButton10: TToolButton;
    PanelSearch: TPanel;
    Panel3: TPanel;
    StaticText5: TStaticText;
    EditContractaccno: TEdit;
    Panel4: TPanel;
    StaticText4: TStaticText;
    EditPRINCIPAL: TEdit;
    Panel6: TPanel;
    StaticText2: TStaticText;
    EditName: TEdit;
    Panel7: TPanel;
    StaticText1: TStaticText;
    EditNumberofcredit: TEdit;
    Panel1: TPanel;
    GroupBox8: TGroupBox;
    CBValute: TDBLookupComboboxEh;
    ChBValute: TCheckBox;
    GroupBox7: TGroupBox;
    CBFilial: TDBLookupComboboxEh;
    ChBFilial: TCheckBox;
    GroupBox6: TGroupBox;
    CBPersons: TDBLookupComboboxEh;
    ChBPersons: TCheckBox;
    GroupBox5: TGroupBox;
    CBCategories: TDBLookupComboboxEh;
    ChBCategories: TCheckBox;
    GroupBox4: TGroupBox;
    CBCreditTypes: TDBLookupComboboxEh;
    ChBCreditTypes: TCheckBox;
    GroupBox3: TGroupBox;
    CBreserves: TDBLookupComboboxEh;
    ChBreserves: TCheckBox;
    SpeedButton1: TSpeedButton;
    Panel8: TPanel;
    ActnExecuteFilter: TAction;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ActnPayment: TAction;
    DBGridEhMain: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActnRefreshExecute(Sender: TObject);
    procedure ActnCreditPropertiesExecute(Sender: TObject);
    procedure ActnExportExecute(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEhMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure ActnSearchExecute(Sender: TObject);
    procedure EditNumberofcreditKeyPress(Sender: TObject; var Key: Char);
    procedure EditNumberofcreditExit(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ActnFilterExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActnExecuteFilterExecute(Sender: TObject);
    procedure ActnPaymentExecute(Sender: TObject);
  private
    procedure SetKeyValue;
    procedure LoadPayment(CrdID :Integer);
  public
    function BuildFilterString :String;
   // FDefExport : Boolean
  end;

var
  FrmAEx: TFrmAEx;
 procedure InitPlugin(S:String);export;

 procedure ShowExpires(Dat :TDateTime);export;

implementation
{$R *.DFM}

uses CommonDecls,SystemState,
     DatModAexUnitImpl,CreditPropertiesUnitImpl;


procedure ShowExpires(Dat :TDateTime);export;
//var ContrlDate :TDateTime;
begin

   // ContrlDate := Integer(Trunc(Dat));
   //FDefExport := False;
   with DatModAex , DatSetExpCredits do
   begin

      if Active then Close;
      SetVariable('OrderField','NumberOfcredit');
      SetVariable('PDat',Dat);
      Open;
   end;

  with FrmAEx do begin
     GRDate.Visible := False;
     ShowModal;
  end;
  
end;
  exports
    ShowExpires;

procedure InitPlugin(S:String);export;
begin
   FrmAEx.GRDate.Visible := true;
   FrmAEx.ShowModal;

end;

exports
  InitPlugin;


procedure TFrmAEx.LoadPayment(CrdID :Integer);
var ApplicationDir :String;
    PluginHandle : THANDLE;
    ExportPayment : procedure( s:integer);
begin
    ApplicationDir := ExtractFilePath(CommonApplication.ExeName);
    PluginHandle := LoadPackage(ApplicationDir+'cm_payment.bpl');

    if PluginHandle >0 then begin
       @ExportPayment := GetProcAddress(PluginHandle,'ExportPayment');
       ExportPayment(CrdID);
    end;   

end;




procedure TFrmAEx.SetKeyValue;
begin
  with CBValute do
  KeyValue := ListSource.DataSet.FieldByName('Valute').AsInteger;

  with CBFilial do
  KeyValue := ListSource.DataSet.FieldByName('ID').AsInteger;

  with CBPersons do
  KeyValue := ListSource.DataSet.FieldByName('ID').AsInteger;

  with CBCategories do
  KeyValue := ListSource.DataSet.FieldByName('ID').AsInteger;

  with CBCreditTypes do
  KeyValue := ListSource.DataSet.FieldByName('ID').AsInteger;

  with CBreserves do
  KeyValue := ListSource.DataSet.FieldByName('ID').AsInteger;

end;

function TFrmAEx.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;   
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + 'and ' + Temp;
    end;
    
  end;
begin
  Result := '';
  ConcatFilter(Result,'CURRENCY',ChBValute.Checked,CBValute.KeyValue);
  ConcatFilter(Result,'BRANCHID',ChBFilial.Checked,CBFilial.KeyValue);
  ConcatFilter(Result,'RESERVEID',ChBreserves.Checked,CBreserves.KeyValue);
  ConcatFilter(Result,'PERSONALTYPE',ChBPersons.Checked,CBPersons.KeyValue);
  ConcatFilter(Result,'CUSTOMERTYPE',ChBCategories.Checked,CBCategories.KeyValue);
  ConcatFilter(Result,'CREDITTYPE',ChBCreditTypes.Checked,CBCreditTypes.KeyValue);
end;


procedure TFrmAEx.FormCreate(Sender: TObject);
begin
   DatModAex := TDatModAex.Create(Self);
   FrmCreditProperties := TFrmCreditProperties.Create(Self);
   DTPExp.DateTime := Get_CurrentDate;
   SetKeyValue
end;

procedure TFrmAEx.FormDestroy(Sender: TObject);
begin
  FrmCreditProperties.Free;
  DatModAex.Free
end;

procedure TFrmAEx.ActnRefreshExecute(Sender: TObject);
var ContrlDate :TDateTime;
begin

   ContrlDate := Integer(Trunc(DTPExp.DateTime));
   with DatModAex , DatSetExpCredits do
   begin

      if Active then Close;
      SetVariable('OrderField','exdatcount');
      SetVariable('Dat',ContrlDate);
      Open;
     // FrmAExProgress.Close;
   end;

end;

procedure TFrmAEx.ActnCreditPropertiesExecute(Sender: TObject);
var CreditID :Integer;
    CreditNum :string;
begin
   with DatModAex do
   begin
       with DatSetExpCredits do
       begin
          CreditID := FieldByName('ID').AsInteger;
          CreditNum := FieldByName('NumberofCredit').AsString;
       end;

       with DatSetPayments do
       begin
          if Active then Close;
          SetVariable('CrdID',CreditID);
          Open;
       end;

       with DatSetSchedule do
       begin
          if Active then Close;
          SetVariable('CrdID',CreditID);
          Open;
       end;

       with DatSetTranches do
       begin
          if Active then Close;
          SetVariable('CrdID',CreditID);
          Open;
       end;

       with DatSetInterests do
       begin
          if Active then Close;
          SetVariable('CrdID',CreditID);
          Open;
       end;

       with FrmCreditProperties do
       begin
          NLSCreditProperties.Caption := CreditNum + ' є-ли кредитин верил€нл€ри';
          ShowModal;
       end;

   end;
end;

procedure TFrmAEx.ActnExportExecute(Sender: TObject);
begin
   with ExcelExport do
   begin
       Connect;
       ExportDataset(DatModAex.DatSetExpCredits,'№ежикм€л€р',true);
       Disconnect;
   end;
end;

procedure TFrmAEx.ToolButton7Click(Sender: TObject);
begin
  close
end;

procedure TFrmAEx.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE Then Close
end;

procedure TFrmAEx.DBGridEhMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
var
  SortField : String;
begin
  SortField := Column.FieldName;
  if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
  with DBGridEhMain , TOracleDataSet(DataSource.DataSet) do
  begin
    close;
    SetVariable('OrderField',SortField);
    Open;
  end;
end;

procedure TFrmAEx.ActnSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    with  TOracleDataSet(DBGridEhMain.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              ' јхтарыш сона чатды  .'+#13+' давам етм€к ист€йирсинизми ? '
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg(' …азы тапылмады !',mtInformation,[mbOK],0);
  end;
end;

procedure TFrmAEx.EditNumberofcreditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Ord(Key) = VK_RETURN) and
     ((Sender as TEdit).Text <> '') then
    ActnSearchExecute(Sender)
end;

procedure TFrmAEx.EditNumberofcreditExit(Sender: TObject);
begin
   (Sender as TEdit).Text := ''
end;

procedure TFrmAEx.ToolButton9Click(Sender: TObject);
begin
   with (Sender as TToolButton) do begin
   Down := not PanelSearch.Visible;
   end;

   PanelSearch.Visible := not PanelSearch.Visible;
end;

procedure TFrmAEx.ActnFilterExecute(Sender: TObject);
begin
   PanelFilter.Visible := not PanelFilter.Visible;
end;

procedure TFrmAEx.SpeedButton1Click(Sender: TObject);
begin
   PanelFilter.Visible := not PanelFilter.Visible;
   ToolButton11.Down :=  not ToolButton11.Down
end;

procedure TFrmAEx.ActnExecuteFilterExecute(Sender: TObject);
begin
  with DBGridEhMain ,DataSource.DataSet do
  begin
    Filter := BuildFilterString;
    Filtered := False;
    Filtered := True;
    SelectedRows.Clear;
  end;

end;

procedure TFrmAEx.ActnPaymentExecute(Sender: TObject);
var creditid :integer;
begin
//  LoadPlugin(CommonApplication,'CM_PAYMENT.bpl','');
with DatModAex,DatSetExpCredits do
    creditid := FieldByName('ID').AsInteger;
LoadPayment (creditid);
end;

initialization
  FrmAEx := TFrmAEx.Create(CommonApplication)
end.
