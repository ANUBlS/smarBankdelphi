unit Get_to_shablon_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, OracleData, StdCtrls, ExtCtrls, SearchEdit;

type
  TForm_get_to_shablon = class(TForm)
    GridReadyBatchs: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    SearchEdit3: TSearchEdit;
    SearchEdit4: TSearchEdit;
    SearchEdit5: TSearchEdit;
    SearchEdit6: TSearchEdit;
    SearchEdit7: TSearchEdit;
    procedure GridReadyBatchsDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GridReadyBatchsTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_get_to_shablon: TForm_get_to_shablon;

implementation
uses Data_Unit,Payment_Det;
{$R *.DFM}

procedure TForm_get_to_shablon.GridReadyBatchsDblClick(Sender: TObject);
var
    i   :integer;
begin
   with DataMod.ODS_shablon,PaymentDetalsForm do
   begin
      if RecordCount>0 then
      begin
         Edit_amount.Text:=Fields[0].AsString;
         Edit_TransCode.Text:=Fields[1].AsString;
         Combo_BankName.Text:=Fields[2].AsString;
         Combo_BankName.ItemIndex:=Combo_BankName.Items.IndexOf(Combo_BankName.Text);
         Combo_BankNameChange(self);
         Edit_Client_acc_no.Text:=Fields[3].AsString;
         Edit_Client_Name.Text:=Fields[4].AsString;
         Edit_Client_Code.Text:=Fields[5].AsString;
         Edit_Client_Voen.Text:=Fields[6].AsString;
         Edit_tey1.Text:=Fields[7].AsString;
         Edit_tey2.Text:=Fields[8].AsString;
         Edit_tey3.Text:=Fields[9].AsString;
         Edit_tey4.Text:=Fields[10].AsString;
         Edit_inf1.Text:=Fields[11].AsString;
         Edit_inf2.Text:=Fields[12].AsString;
         Edit_inf3.Text:=Fields[13].AsString;
         SpeedButton2Click(Sender);
         Button1.Enabled:=true;
         Edit_amount.SetFocus;
         Form_get_to_shablon.Close;
      end;
   end;
   SearchEdit1.Clear;   SearchEdit2.Clear;   SearchEdit3.Clear;
   SearchEdit4.Clear;   SearchEdit5.Clear;   SearchEdit6.Clear;
   SearchEdit7.Clear;
end;

procedure TForm_get_to_shablon.Button1Click(Sender: TObject);
begin
   GridReadyBatchsDblClick(Sender);
end;

procedure TForm_get_to_shablon.Button2Click(Sender: TObject);
var
BookmarkList : TBookmarkList;
Bookmark     : TBookmarkStr;
           i :integer;
begin
  //if DbGrid1.SelectedRows.Count < 1 then exit;
  Bookmark     := DataMod.ODS_shablon.Bookmark;
  BookmarkList := GridReadyBatchs.SelectedRows;
  for i := 0 to BookmarkList.Count -1 do
  begin
     with DataMod.INS,DataMod.ODS_shablon do
     begin
       DataMod.ODS_shablon.Bookmark := BookmarkList[i];
       Callprocedure('xs_Beneficiary_shablon_delete',[Fields[14].AsString]);
       showMessage(Fields[14].AsString);
     end;
  end;
  DataMod.ODS_shablon.refresh;
end;
procedure TForm_get_to_shablon.GridReadyBatchsTitleClick(Column: TColumn);
begin
   DataMod.ODS_shablon.Close;
   with DataMod.ODS_shablon.SQL do
   begin
      Clear;
      Add('SELECT mebleg, odenish_kod, bankin_kodu, hesab_no, adi, kodu, voen, ');
      Add(' od_tey1, od_tey2, od_tey3, od_tey4, elave_mel1, elave_mel2, ');
      Add(' elave_mel3, shablonun_adi, bankin_adi, odenish ');
      Add(' FROM xs_beneficiary_shablon order by '+Column.FieldName+' ');
   end;
   DataMod.ODS_shablon.Open;
end;

end.
