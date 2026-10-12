unit frmDetail2Impl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  ComCtrls, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, Grids, DBGridEh, ActnList,oracle,oracledata,
  DBGridEhGrouping, GridsEh;

type
  TfrmDetail2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEditEh1: TDBEditEh;
    DBEditEh2: TDBEditEh;
    DBEditEh3: TDBEditEh;
    DTPd2: TDateTimePicker;
    SearchPanel: TGroupBox;
    Panel4: TPanel;
    StaticText1: TStaticText;
    EditNUMBEROFCREDIT: TEdit;
    Panel7: TPanel;
    StaticText2: TStaticText;
    EditACC_NO: TEdit;
    Panel8: TPanel;
    StaticText3: TStaticText;
    EditCUSTNAME: TEdit;
    MainGrid: TDBGridEh;
    ActionList1: TActionList;
    ActionSearch: TAction;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MainGridTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure ActionSearchExecute(Sender: TObject);
    procedure EditNUMBEROFCREDITKeyPress(Sender: TObject; var Key: Char);
    procedure EditNUMBEROFCREDITExit(Sender: TObject);
    procedure MainGridDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetail2: TfrmDetail2;

implementation

{$R *.DFM}

uses dmRepByCreditPayImpl, frmPaymentAndPlanImpl,SBTranslateProc,sboapiDataModuleImpl;

procedure TfrmDetail2.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TfrmDetail2.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Ord(Key) = VK_ESCAPE then close
end;

procedure TfrmDetail2.MainGridTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);

var
  SortField : String;
begin
  if (Sender as TDBGridEh).DataSource.DataSet.active then   begin
  SortField := Column.FieldName;
    if Column.Title.SortMarker = smDownEh then
    SortField := SortField + ' DESC';
  with Sender as TDBGridEh , TOracleDataSet(DataSource.DataSet) do
  begin
   // ClearVariables;
    Screen.Cursor := crSQLWait;
    SetVariable('OrderField',SortField);
    RefResh;
    Screen.Cursor := crDefault;
   end;
    end;

end;

procedure TfrmDetail2.ActionSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    MainGrid.SelectedRows.Clear;
    with  TOracleDataSet(MainGrid.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
    if MessageDlg(
              'Ахтарыш сона чатыб.'+#13+'яввялдян башламаг истяйирсиниэми?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then
    if  not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Йазы тапылмады!',mtInformation,[mbOK],0);
  end;
end;

procedure TfrmDetail2.EditNUMBEROFCREDITKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(Key) = VK_RETURN
  then  ActionSearchExecute(Sender)
end;

procedure TfrmDetail2.EditNUMBEROFCREDITExit(Sender: TObject);
begin
  with (Sender as TEdit) do
       Text := '' 
end;

procedure TfrmDetail2.MainGridDblClick(Sender: TObject);
begin

   with dmRepByCreditPay do
   begin
      with Payments do begin
      CloseAll;
      SetVariable('crdid',Detailinf2.FieldByName('id').AsInteger);
      Open;
      end;

      with Plans do begin
      CloseAll;
      SetVariable('crdid',Detailinf2.FieldByName('id').AsInteger);
      Open;
      end;
   end;
    frmPaymentAndPlan.showmodal;

end;

end.
