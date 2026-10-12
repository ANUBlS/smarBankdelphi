unit UnitHesab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, StdCtrls, Grids, XDBGrids;

type
  TFormAccount = class(TForm)
    XDBGridAccounts: TXDBGrid;
    GroupBox1: TGroupBox;
    EditBalcn: TEdit;
    EditKli_id: TEdit;
    ODS_Account: TOracleDataSet;
    DS_Account: TDataSource;
    Balans: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Button2: TButton;
    EditACC_NO: TEdit;
    ODS_AccountACC_NO: TWideStringField;
    ODS_AccountACC_NO_SEARCH: TWideStringField;
    ODS_AccountNAME: TWideStringField;
    ODS_AccountBAL_CN1: TFloatField;
    ODS_AccountKLI_ID: TFloatField;
    procedure EditKli_idKeyPress(Sender: TObject; var Key: Char);
    procedure EditBalcnKeyPress(Sender: TObject; var Key: Char);
    procedure EditACC_NOKeyPress(Sender: TObject; var Key: Char);
    procedure XDBGridAccountsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActionSpeedSearchExecute(
  Sender: TObject);
  end;

var
  FormAccount: TFormAccount;

implementation
    uses sboapiDataModuleImpl,StatementFrmImpl;
{$R *.dfm}



procedure TFormAccount.ActionSpeedSearchExecute(
  Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    with  TOracleDataSet(XDBGridAccounts.DataSource.DataSet) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then
  {  if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlansın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then   }
    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmayıb!',mtInformation,[mbOK],0);
 end;

end;

procedure TFormAccount.Button2Click(Sender: TObject);
begin
FormAccount.Close;
end;

procedure TFormAccount.EditACC_NOKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13  then ActionSpeedSearchExecute(Sender);
end;

procedure TFormAccount.EditBalcnKeyPress(Sender: TObject; var Key: Char);
var a,b ,s :string;
begin


  if (EditBalcn.Text<>'') and( EditKli_id.Text='') then
begin
      a:='where bal_cn1='+ EditBalcn.Text;
      s:=a;

end;

  if (EditBalcn.Text<>'') and ( EditKli_id.Text<>'') then
 begin
   a:=' where bal_cn1= '+ EditBalcn.Text;
   b:=' and kli_id = '+EditKli_id.text;
   s:=a+b

 end;
 if ord(Key) = 13 then
   if EditBalcn.Text<>'' then
    begin
  with  ODS_Account do
  begin
   close;
   sql[7]:='';
     sql[7]:=sql[7]+s;
   open;
  end;
    end;

  {if EditBalcn.Text<>'' then
    begin
  with  ODS_Account do
  begin
   close;
   if EditBalcn.Text='' then  SetVariable('v_balcn1', '0 = 0')
   else SetVariable('v_balcn1', ' bal_cn1 = '+EditBalcn.Text);
   if EditKli_id.Text<>'' then
   SetVariable('v_kli_id', ' kli_id = '+EditKli_id.Text);
    if EditKli_id.Text='' then
   SetVariable('v_kli_id', ' kli_id = '+'0');
   open ;
  end;
    end;  }
end;

procedure TFormAccount.EditKli_idKeyPress(Sender: TObject; var Key: Char);
var a,b ,s :string;
begin


  if (EditBalcn.Text='') and( EditKli_id.Text<>'') then
begin
      a:='where kli_id='+ EditKli_id.Text;
      s:=a;

end;

  if (EditBalcn.Text<>'') and ( EditKli_id.Text<>'') then
 begin
   a:=' where bal_cn1= '+ EditBalcn.Text;
   b:=' and kli_id = '+EditKli_id.text;
   s:=a+b

 end;
  if ord(Key) = 13 then
   if EditKli_id.Text<>'' then
    begin
  with  ODS_Account do
  begin
   close;
     sql[7]:='';
     sql[7]:=sql[7]+s;
   open;
  end;
    end;
end;
procedure TFormAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
EditBalcn.Clear;
EditKli_id.Clear;
EditACC_NO.Clear;
ODS_Account.Close;
end;

{ if EditKli_id.Text<>'' then
 begin
if ord(Key) = 13 then
   with  ODS_Account do
 begin
 close;
    if EditKli_id.Text='' then  SetVariable('v_kli_id', '0 = 0')
    else
 SetVariable('v_kli_id', ' kli_id = '+EditKli_id.Text);
 if EditBalcn.Text<>'' then
  SetVariable('v_balcn1', ' bal_cn1 = '+EditBalcn.Text);
  if EditBalcn.Text='' then
  SetVariable('v_balcn1', ' bal_cn1 = '+'0');
 open ;

 end;
 end;
end;  }

procedure TFormAccount.XDBGridAccountsDblClick(Sender: TObject);
begin
StatementFrm.Edit_Acc_No.Text:=StatementFrm.Edit_Acc_No.Text+','+ODS_AccountACC_NO_SEARCH.AsString;
end;

end.
