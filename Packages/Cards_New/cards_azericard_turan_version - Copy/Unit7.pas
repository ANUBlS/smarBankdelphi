unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFormSearch = class(TForm)
    DBGridMainCard: TDBGrid;
    PnlAdvSearch: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    EditCardNumber: TEdit;
    EditMainCard: TEdit;
    EditRBSNum: TEdit;
    EditRBSNum2: TEdit;
    EditReference: TEdit;
    EditCardHolder: TEdit;
    EditLastName: TEdit;
    EditFirstName: TEdit;
    CBoxCurrencies: TComboBox;
    ComboCISearch: TComboBox;
    ComCIType: TComboBox;
    EditCompany: TEdit;
    DTPickerOpenDate: TDateTimePicker;
    Panel49: TPanel;
    ButtonCICard: TSpeedButton;
    ButtonCISUB: TSpeedButton;
    buttonCIother: TSpeedButton;
    ButtonCISelec: TSpeedButton;
    PrintButton: TSpeedButton;
    BtnExcel: TSpeedButton;
    CheckGridRowSelect: TCheckBox;
    procedure EditCardNumberEnter(Sender: TObject);
    procedure DBGridMainCardDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
   // procedure EditRBSNumKeyPress(Sender: TObject; var Key: Char);
    procedure ComCITypeChange(Sender: TObject);
    procedure ComboCISearchChange(Sender: TObject);
    procedure ButtonCICardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearch: TFormSearch;

implementation

uses Unit18, MAINFORMImpl1;

{$R *.DFM}

procedure TFormSearch.EditCardNumberEnter(Sender: TObject);
begin
(Sender as TEdit).Clear;
end;

procedure TFormSearch.DBGridMainCardDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if buttonCIother.Down = false then
   begin
       if (DBGridMainCard.DataSource.DataSet.FieldByName('expiry').AsDateTime < date) then
       begin
         DBGridMainCard.Canvas.Brush.Color:=$00C08000;
         DBGridMainCard.DefaultDrawColumnCell(rect,datacol,column,state);
       end;
       if (DBGridMainCard.DataSource.DataSet.FieldByName('dateclose').AsString <> '') then
       begin
         DBGridMainCard.Canvas.Brush.Color:=Clsilver;
         DBGridMainCard.DefaultDrawColumnCell(rect,datacol,column,state);
       end;
   end;
end;

procedure TFormSearch.ComCITypeChange(Sender: TObject);
 var
  sqlstr :string;
begin
   if ButtonCICard.down then
   begin
       {}
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex = 0) then
       SqlStr:='Select clients.rowid,clients.* from cardmanager.clients where (messtype<3)'
       else
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex > 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex = 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex > 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')';
   end else
   {IF SUB CARD SELECT}
   if ButtonCISUB.down then
   begin
       {}
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex = 0) then
       sqlstr:='Select clients.rowid,clients.* from cardmanager.clients a where (messtype=2)'
       else
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex > 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex = 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex > 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')';
   end
   else
   if buttonCIother.Down then
   begin
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=9)and(othtype='''+ComCIType.items[ComCIType.itemindex]+''')';
   end;

end;

procedure TFormSearch.ComboCISearchChange(Sender: TObject);
 var  SqlStr : String;
begin
   if ButtonCICard.down then
   begin
       {}
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex = 0) then
       SqlStr:='Select clients.rowid,clients.* from cardmanager.clients where (messtype<3)'
       else
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex > 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex = 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex > 0) then
       SqlStr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype<3)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')';
   end else
   {IF SUB CARD SELECT}
   if ButtonCISUB.down then
   begin
       {}
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex = 0) then
       sqlstr:='Select clients.rowid,clients.* from cardmanager.clients where (messtype=2)'
       else
       if (ComboCISearch.ItemIndex = 0)and(ComCIType.ItemIndex > 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex = 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')'
       else
       if (ComboCISearch.ItemIndex > 0)and(ComCIType.ItemIndex > 0) then
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=2)and(cardtype='''+ComCIType.items[ComCIType.itemindex]+''')and(cardstatus='''+ComboCISearch.items[ComboCISearch.itemindex]+''')';
   end
   else
   if buttonCIother.Down then
   begin
       sqlstr:='Select clients.rowid, clients.* from cardmanager.clients where (messtype=9)and(othtype='''+ComCIType.items[ComCIType.itemindex]+''')';
   end;
   {Execute Sql text}
   ShowMessage(SqlStr);


end;

procedure TFormSearch.ButtonCICardClick(Sender: TObject);
var I:integer;
    strsql: String;
begin

end;

end.
