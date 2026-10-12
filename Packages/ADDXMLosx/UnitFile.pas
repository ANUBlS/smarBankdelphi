unit UnitFile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, Gauges, ExtCtrls, DB, OracleData;

type
  TFormFile = class(TForm)
    XFPanel1: TXFPanel;
    Gauge_cust: TGauge;
    XFGroupBox1: TXFGroupBox;
    SpeedButton1: TSpeedButton;
    EditFile: TEdit;
    XFBitBtn2: TXFBitBtn;
    XFBitBtn1: TXFBitBtn;
    SaveDlgKredit: TSaveDialog;
    ods_sysdat: TOracleDataSet;
    ods_sysdatTEK_DAT: TWideStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
    procedure WriteString(S: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFile: TFormFile;
    f: TextFile;
    UnusableGrops: Set Of Byte;
    FilePAth: String;
implementation
 uses   sboapiDataModuleImpl,ADD_XML;

{$R *.dfm}

procedure TFormFile.WriteString(S: string);
begin

  AssignFile(f, FilePAth); { Assigns the Filename }
  Append(f); { Opens the file for editing }
  Write(f, UTF8Encode(StringReplace(S, #13 + #10, '', [rfReplaceAll])));
  Closefile(f);
end;
procedure TFormFile.SpeedButton1Click(Sender: TObject);
begin
  with SaveDlgKredit do
    if Execute then
      EditFile.Text:= FileName;
      AssignFile(f, EditFile.Text);
      Rewrite(f);
      Closefile(f);


end;

procedure TFormFile.XFBitBtn1Click(Sender: TObject);
var i:integer;
begin
 if EditFile.Text = '' then
  begin
    ShowMessage('      Faylı seçməmisiz!     ');
    Exit;
  end;
  FilePAth := EditFile.Text;
  AssignFile(f, FilePAth);
  Rewrite(f);
  Closefile(f);
  WriteString('<ADD>');

      WriteString('<REPORT_INFO>');

       WriteString('<BANK_LICENSE_NUMBER>');
       WriteString('2');
       WriteString('</BANK_LICENSE_NUMBER>');

       WriteString('<REPORT_DATE>');
       WriteString(ods_sysdatTEK_DAT.AsString);
       WriteString('</REPORT_DATE>');

       WriteString('</REPORT_INFO>');
  //if FormADDXML.ods then
          FormADDXML.ods_kreditxml.open;
           FormADDXML.ods_kreditxml.First;
   for I := 0 to FormADDXML.ods_kreditxml.RecordCount-1 do
     begin

     with FormADDXML,ods_kreditxml  do
     begin
    WriteString('<NO>');
    showmessage(FieldByName('filial').AsString);
    WriteString(FieldByName('ROWNUM').AsString);
    WriteString('</NO>');


  WriteString('<BRANCH_NAME>' );
  WriteString('bas');
  WriteString('</BRANCH_NAME>');

  WriteString('<BORROWER_NAME>');
  WriteString('TEST');
  WriteString('</BORROWER_NAME>');

  WriteString('<VOEN_OR_DOCNUM>');
  WriteString('dd');
  WriteString('</VOEN_OR_DOCNUM>');

  WriteString('<OWNR_NAME>');
  WriteString('Test');
  WriteString('</OWNR_NAME> ');

  WriteString('<FOUNDER_NAME>');
  WriteString('EST');
  WriteString('</FOUNDER_NAME>');

  WriteString('<CONNECTED_BORROWERS_GROUP_CODE>');
  WriteString('1');
  WriteString('</CONNECTED_BORROWERS_GROUP_CODE>');

  WriteString('<RELATED_TO_BANK>');
  WriteString('0');
  WriteString('</RELATED_TO_BANK>');

  WriteString('<TRANSACTION_NATURE>');
  WriteString('1');
  WriteString('</TRANSACTION_NATURE>');

  WriteString('<GRANT_DATE>');
  WriteString('2016-10-10');
  WriteString('</GRANT_DATE>');

  WriteString('<REPAYMENT_DATE>');
  WriteString('2015-10-10');
  WriteString('</REPAYMENT_DATE>');

  WriteString('<REPAYMENT_DATE2>') ;
  WriteString('2015-01-01 ');
  WriteString('</REPAYMENT_DATE2> ');

  WriteString('<EXTENSION_NUMBER>');
  WriteString('2');
  WriteString('</EXTENSION_NUMBER>');

  WriteString('<CURRENCY>');
  WriteString('AZN ');
  WriteString('</CURRENCY>');

  WriteString('<INTEREST>');
  WriteString('12 ');
  WriteString(' </INTEREST> ');

  WriteString('<INITIAL_AMOUNT>');
  WriteString('312312');
  WriteString('</INITIAL_AMOUNT>');

  WriteString('<RESIDUAL_AMOUNT>');
  WriteString('312');
  WriteString('</RESIDUAL_AMOUNT> ');

  WriteString('<RESIDUAL_AMOUNT2>');
  WriteString('312');
  WriteString('</RESIDUAL_AMOUNT2>');

  WriteString('<OVERDUE_DEBT>');
  WriteString('44');
  WriteString('</OVERDUE_DEBT>');

  WriteString('<TOTAL_INTEREST_DEBT>');
  WriteString('12');
  WriteString('</TOTAL_INTEREST_DEBT>');

  WriteString('<CALCULATED_INTEREST_DEBT_WITHOUT_DELAYED>');
  WriteString('31');
  WriteString('</CALCULATED_INTEREST_DEBT_WITHOUT_DELAYED> ');

  WriteString('<CALCULATED_INTEREST_DEBT_WITH_DELAYED>');
  WriteString('32');
  WriteString('</CALCULATED_INTEREST_DEBT_WITH_DELAYED>');

  WriteString('<CALCULATED_FINE_DEBT>');
  WriteString('12');
  WriteString('</CALCULATED_FINE_DEBT> ');

  WriteString('<PAYMENT_SCHEDULE>');
  WriteString('2 ');
  WriteString('</PAYMENT_SCHEDULE>');

  WriteString('<MAIN_DEBT_PAYMENT_TERM>');
  WriteString('3');
  WriteString('</MAIN_DEBT_PAYMENT_TERM>');

  WriteString('<INTEREST_PAYMENT_TERM>');
  WriteString('4 ');
  WriteString('</INTEREST_PAYMENT_TERM>');

  WriteString('<LAST_PAYMENT_DATE>');
  WriteString('2016-11-12');
  WriteString('</LAST_PAYMENT_DATE> ');

  WriteString('<LAST_PAYMENT_AMOUNT>');
  WriteString('321 ');
  WriteString('</LAST_PAYMENT_AMOUNT>');

  WriteString('<MAIN_DEBT_DELAYED>');
  WriteString('0 ');
  WriteString('</MAIN_DEBT_DELAYED> ');

  WriteString('<INTEREST_DEBT_DELAYED>');
  WriteString('4');
  WriteString('</INTEREST_DEBT_DELAYED>');

  WriteString('<MAIN_DEBT_RESERVE_DEGREE>');
  WriteString('1');
  WriteString('</MAIN_DEBT_RESERVE_DEGREE> ');

  WriteString('<MAIN_DEBT_RESERVE_AMOUNT>') ;
  WriteString('12');
  WriteString('</MAIN_DEBT_RESERVE_AMOUNT> ');

  WriteString('<INTEREST_DEBT_RESERVE_DEGREE>');
  WriteString('1');
  WriteString('</INTEREST_DEBT_RESERVE_DEGREE>');

  WriteString('<INTEREST_DEBT_RESERVE_AMOUNT>');
  WriteString('32');
  WriteString('</INTEREST_DEBT_RESERVE_AMOUNT>');

  WriteString('<RESTRUCTURATION>');
  WriteString('0');
  WriteString('</RESTRUCTURATION>');

  WriteString('<LAST_RESTRUCTURATION_DATE>');
  WriteString('2016-09-08');
  WriteString('</LAST_RESTRUCTURATION_DATE>');

  WriteString('<RESTRUCTURATION_COUNT>');
  WriteString('2');
  WriteString('</RESTRUCTURATION_COUNT>');

  WriteString('<QUALITY_CRITERIA>') ;
  WriteString('1');
  WriteString('</QUALITY_CRITERIA>');

  WriteString('<COLLATERALISED_METALS_VALUE>');
  WriteString('4 ');
  WriteString('</COLLATERALISED_METALS_VALUE>');

  WriteString('<GUARANTEES_BY_BANKS_VALUE>');
  WriteString('43243');
  WriteString('</GUARANTEES_BY_BANKS_VALUE>');

  WriteString('<SECURITIES_OF_OECD_COUNTRIES>');
  WriteString('32312');
  WriteString('</SECURITIES_OF_OECD_COUNTRIES> ');

  WriteString('<REAL_ESTATE_MARKET_VALUE>');
  WriteString('56');
  WriteString('</REAL_ESTATE_MARKET_VALUE>');

  WriteString('<MOVABLE_PROPERTY_MARKET_VALUE>');
  WriteString('42');
  WriteString('</MOVABLE_PROPERTY_MARKET_VALUE>');

  WriteString('<FOURTH_GROUP_COLLATERAL_MARKET_VALUE>');
  WriteString('2');
  WriteString('</FOURTH_GROUP_COLLATERAL_MARKET_VALUE>');

  WriteString('<FOURTH_GROUP_COLLATERAL_TYPE>');
  WriteString('432');
  WriteString('</FOURTH_GROUP_COLLATERAL_TYPE> ');

  WriteString('<CREDIT_TYPE>');
  WriteString('2 ');
  WriteString('</CREDIT_TYPE>');

  WriteString('<ECONOMY_AREA>');
  WriteString('132');
  WriteString('</ECONOMY_AREA>');

  WriteString('<REGION>');
  WriteString('55 ');
  WriteString('</REGION> ');

  WriteString('<FUNDING_SOURCE>');
  WriteString('wewer ');
  WriteString('</FUNDING_SOURCE>');

  WriteString('<INBANK_RATING>');
  WriteString('rwer');
  WriteString('</INBANK_RATING>');

  WriteString('<AGENCY_RATING>');
  WriteString('23 ');
  WriteString('</AGENCY_RATING>');

  WriteString('<RESPONSIBLE_PERSON>');
  WriteString('wer23');
  WriteString('</RESPONSIBLE_PERSON>');

  WriteString('<NOTE>');
  WriteString('wefwe wefwe fwe');
  WriteString('</NOTE> ');

  WriteString('<REAL_ESTATE_LAST_EVALUATION_DATE>');
  WriteString('2015-12-12');
  WriteString('</REAL_ESTATE_LAST_EVALUATION_DATE>');

  WriteString('<REAL_ESTATE_EVALUATION_COMPANY>');
  WriteString('eqweqw');
  WriteString('</REAL_ESTATE_EVALUATION_COMPANY>');

      FormADDXML.ods_kreditxml.next;
      end;
     end;


      WriteString('</ADD>');
end;

end.
