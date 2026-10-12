unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdatamod, StdCtrls, ComCtrls, DBCtrls, DBGridEh, Mask, DBCtrlsEh,
  DBLookupEh, SearchEdit;

type
  TFormat102 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    referens: TEdit;
    mf23b: TEdit;
    val: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit5: TEdit;
    amount: TEdit;
    Edit6: TEdit;
    Label19: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Memo1: TMemo;
    searchcombo: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    reciverbic: TSearchEdit;
    SearchCombo2: TComboBox;
    SearchEdit2: TSearchEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    OF70_RichEdit: TRichEdit;
    OF72_RichEdit: TRichEdit;
    Button1: TButton;
    Button2: TButton;
    relatedrf: TEdit;
    Label16: TLabel;
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure searchcomboExit(Sender: TObject);
    procedure reciverbicKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure SearchEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure SearchCombo2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Format102: TFormat102;

implementation

{$R *.dfm}

procedure TFormat102.Button1Click(Sender: TObject);
var k, ids :integer;
begin
    k:=0;
    ids:=0;

if referens.text='' then begin
DataModbpl.referans.Close;
      //DataModbpl.referans.Open;
with DataModbpl.referans do
 begin
   SetVariable('FORMATS','');
   SetVariable('CURRENSY','10-');
  end;
 DataModbpl.referans.Open;
referens.text:=DataModbpl.referansrefe.asstring ;

end;
if OF70_RichEdit.Text='' then   ShowMessage( 'Təyinat boş saxlamaq olmaz!!')
                  else begin
    DataModbpl.pack.CallProcedure('saving102',[ DateTimePicker1.DateTime,
                                              referens.Text,
                                              searchcombo.Text,
                                              reciverbic.Text,
                                              SearchCombo2.Text,
                                              edit2.Text,
                                              edit3.Text,
                                              Edit4.Text,
                                              OF70_RichEdit.Text,
                                              OF72_RichEdit.Text,
                                              strtofloat(amount.Text),
                                              k,
                                              ids,
                                              memo1.Text,
                                              memo2.Text ,
                                              SearchCombo2.Text,
                                              reciverbic.Text,
                                              memo1.Lines[1],
                                              memo2.Lines[1],
                                              relatedrf.Text ]);

              searchcombo.Text:='';
             reciverbic.Text:='';
             memo1.Text:='';
             memo2.Text:='';
              amount.Text:='';
              edit6.Text:='';
              edit2.Text:='';
              edit3.Text:='';
              edit4.Text:='';
              SearchEdit2.Text:='';
              searchcombo2.Text:='';
              relatedrf.Text:='';
                end;

        close;


end;

procedure TFormat102.Button2Click(Sender: TObject);
var k,ids :integer;
begin
if referens.text='' then begin
DataModbpl.referans.Close;
      //DataModbpl.referans.Open;
with DataModbpl.referans do
 begin
   SetVariable('FORMATS','');
   SetVariable('CURRENSY','10-');
  end;
 DataModbpl.referans.Open;
referens.text:=DataModbpl.referansrefe.asstring ;

end;
if OF70_RichEdit.Text='' then   ShowMessage( 'Təyinat boş saxlamaq olmaz!!')
                  else begin
    DataModbpl.pack.CallProcedure('saving102',[ DateTimePicker1.DateTime,
                                              referens.Text,
                                              searchcombo.Text,
                                              reciverbic.Text,
                                              SearchCombo2.Text,
                                              edit2.Text,
                                              edit3.Text,
                                              Edit4.Text,
                                              OF70_RichEdit.Text,
                                              OF72_RichEdit.Text,
                                              strtofloat(amount.Text),
                                              k,
                                              ids,
                                              memo1.Text,
                                              memo2.Text ,
                                              SearchCombo2.Text,
                                              reciverbic.Text,
                                              memo1.Lines[1],
                                              memo2.Lines[1],
                                              relatedrf.Text ]);

              searchcombo.Text:='';
             reciverbic.Text:='';
             memo1.Text:='';
             memo2.Text:='';
              amount.Text:='';
              edit6.Text:='';
              edit2.Text:='';
              edit3.Text:='';
              edit4.Text:='';
              SearchEdit2.Text:='';
              searchcombo2.Text:='';
              relatedrf.Text:='';
                end;




end;

procedure TFormat102.Edit2Exit(Sender: TObject);
begin
     try      //Showmessage( copy (edit2.Text,5,4));
        //showmessage( copy (SearchEdit2.Text,0,4));
        if copy (edit2.Text,5,4)<>copy (SearchEdit2.Text,0,4)then
        begin
          ShowMessage('Hesabla Swift kodu uyğun deyil!!!!');
        end;


IF DataModbpl.SBOP.CallIntegerFunction('check_IBAN_acc_num',[Edit2.Text])=0 THEN
begin
ShowMessage('Hesab ibana  uyğun deyil!!!!!!');
end;
Memo2.Lines[0]:= '/'+edit2.Text;




   except on    E:  Exception       do
      begin
                 ShowMessage('IBAN Hesabi yazilmayib');
      end;
end;

end;

procedure TFormat102.Edit3Exit(Sender: TObject);
begin
  Memo2.Lines[1]:= Edit3.Text;
end;

procedure TFormat102.Edit4Exit(Sender: TObject);
begin
if edit4.text <>'' then
begin
 if (length(edit4.text)<>10)  then
 begin     ShowMessage('Vöen 10 simvoldan azdır') ;
 end
 else
 Memo2.Lines[2]:= Edit4.Text+'/';

end
else Memo2.Lines[2]:= '/';

end;

procedure TFormat102.reciverbicKeyPress(Sender: TObject; var Key: Char);
begin
reciverbic.DataSource :=DataModbpl.bankssource;;
if key=#13 then
begin

if reciverbic.Text<>'' then
                      begin
//DataModbpl.banks.Locate('bankcode',strtoint(reciverbic.Text),[loCaseInsensitive,loPartialKey]);
 SearchEdit2.DataSource:= DataModbpl.bankssource;
SearchCombo2.Text:=DataModbpl.banks.FieldByName('name').AsString;
SearchEdit2.Text:= DataModbpl.banks.FieldByName('swift').AsString;
end else
SearchCombo2.Text:='';

Memo2.Lines[3]:= DataModbpl.banks.FieldByName('bankcode').AsString+'/'
+DataModbpl.banks.FieldByName('inn').AsString+'/'+DataModbpl.banks.FieldByName('swift').AsString+'XXX';
Memo2.Lines[4]:= DataModbpl.banks.FieldByName('krno').AsString;

end;

end;

procedure TFormat102.SearchCombo2Exit(Sender: TObject);
begin



Memo2.Lines[3]:= DataModbpl.banks.FieldByName('bankcode').AsString+'/'
+DataModbpl.banks.FieldByName('inn').AsString+'/'+DataModbpl.banks.FieldByName('swift').AsString+'XXX';
Memo2.Lines[4]:= DataModbpl.banks.FieldByName('krno').AsString;

end;

procedure TFormat102.searchcomboExit(Sender: TObject);
var custname : string     ;
begin
DataModbpl.account.Closeall;
 DataModbpl.account.SetVariable('accno',searchcombo.Text);
 DataModbpl.account.open;

 DataModbpl.gonderen.Close;
 DataModbpl.gonderen.SetVariable('fid',DataModbpl.account.FieldByName('filial').AsInteger);
 DataModbpl.gonderen.Open;

 DataModbpl.alanm.Close;
 DataModbpl.alanm.SetVariable('kid',edit6.Text);
 DataModbpl.alanm.Open;

custname:=  DataModbpl.alanm.FieldByName('d').AsString;//, ' " ', '''', [rfReplaceAll, rfIgnoreCase]);
custname:=  Copy(custname, 1, 35);
memo1.Text:= '/'+searchcombo.Text+#13#10+custname+
#13#10+DataModbpl.alanm.FieldByName('inn').AsString+'/'+ #13#10+
DataModbpl.gonderen.FieldByName('kod_b').AsString+'/'+DataModbpl.gonderen.FieldByName('inn').AsString+'/'+DataModbpl.gonderen.FieldByName('swift').AsString+'XXX'+#13#10+
DataModbpl.gonderen.FieldByName('krno').AsString ;

end;

procedure TFormat102.SearchEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if key =#13 then
begin

   if SearchEdit2.Text<>'' then
                      begin
//DataModbpl.banks.Locate('bankcode',strtoint(reciverbic.Text),[loCaseInsensitive,loPartialKey]);
reciverbic.DataSource:= DataModbpl.bankssource;
SearchCombo2.Text:=DataModbpl.banks.FieldByName('name').AsString;
reciverbic.Text:= DataModbpl.banks.FieldByName('bankcode').AsString
end else
SearchCombo2.Text:='';
Memo2.Lines[3]:= DataModbpl.banks.FieldByName('bankcode').AsString+'/'
+DataModbpl.banks.FieldByName('inn').AsString+'/'+
DataModbpl.banks.FieldByName('swift').AsString+'XXX';
Memo2.Lines[4]:= DataModbpl.banks.FieldByName('krno').AsString;


end;
end;

procedure TFormat102.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
IF not (key in ['0'..'9',#8,#13]) THEN key:=#0;
  IF  Key=#13 THEN BEGIN

                    DataModbpl.acount.CloseAll;
  DataModbpl.acount.SetVariable('ids',edit6.Text);
  DataModbpl.acount.Open;



  //ShowMessage(inttostr(DataModbpl.acount.RecordCount)+edit6.Text);

                    IF DataModbpl.acount.RecordCount=0 THEN  BEGIN
                                                ShowMessage('Müştəri tapılmadı');
                                                Edit6.Clear;
                    END;

  END;

end;

procedure TFormat102.FormCreate(Sender: TObject);
var i :integer;
begin
for i := 1 to DataModbpl.banks.RecordCount do
begin
    SearchCombo2.Items[i]:=DataModbpl.banks.FieldByName('name').AsString;
  DataModbpl.banks.Next;
end;
 DataModbpl.banks.First;
end;



end.
