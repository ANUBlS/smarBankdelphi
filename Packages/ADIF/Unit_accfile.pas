unit Unit_accfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, Gauges, ExtCtrls;

type
   TBankInfo = record
   BankName: WideString;
   BankID: WideString
   end;
  TFormAcc_file = class(TForm)
    XFPanel1: TXFPanel;
    Gauge_acc: TGauge;
    XFGroupBox1: TXFGroupBox;
    SpeedButton1: TSpeedButton;
    EditFile_acc: TEdit;
    XFBitBtn2: TXFBitBtn;
    XFBitBtn1: TXFBitBtn;
    SaveDlgAcc: TSaveDialog;
    procedure WriteString(S: string);
    procedure SpeedButton1Click(Sender: TObject);
    procedure XFBitBtn2Click(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
  private
  function Get_BankInfo: TBankInfo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
     f: TextFile;
      FilePAth: String;
  FormAcc_file: TFormAcc_file;

implementation

uses IniFiles,UnitAdifData, Unit_interval;

{$R *.dfm}
const
  SIniLocation ='BankInfo.ini';
  SSection = 'BankInfo';
  SBankID = 'BankID';
  SBankName = 'BankName';

function TFormAcc_file.Get_BankInfo: TBankInfo;
var
  INI: TIniFile;
  BankID, BankName: String;
  Path: String;
begin
  Path := ExtractFilePath(Application.ExeName) + SIniLocation;
  INI := TIniFile.Create(Path);
  with INI do
    try
      BankID := ReadString(SSection, SBankID, '');
      BankName := ReadString(SSection, SBankName, '');
      Result.BankName := Utf8Decode(BankName);
      Result.BankID := Utf8Decode(BankID);
    finally
      Free;
    end;
end;

procedure TFormAcc_file.WriteString(S: string);
begin

  AssignFile(f, FilePAth); { Assigns the Filename }
  Append(f); { Opens the file for editing }
  Write(f, UTF8Encode(StringReplace(S, #13 + #10, '', [rfReplaceAll])));
  Closefile(f);
end;

procedure TFormAcc_file.SpeedButton1Click(Sender: TObject);
begin
  with SaveDlgAcc do
    if Execute then
      EditFile_acc.Text:= FileName;
      AssignFile(f, EditFile_acc.Text);
      Rewrite(f);
      Closefile(f);
end;

procedure TFormAcc_file.XFBitBtn1Click(Sender: TObject);
var
   end_dat:TDateTime;
    sr, r,j, i,n, a,rec_count: integer;
    BankID, BankName: String;
    ABankInfo: TBankInfo;
      begin
 if EditFile_acc.Text = '' then
  begin
    ShowMessage('      Faylı seçməmisiz!     ');
    Exit;
  end;
  Adif_Data.ods_account.QueryAllRecords:=true;
   Adif_Data.ods_account.refresh;
  r:=Adif_Data.ods_account.recordcount;
 // sr:= Adif_Data.ods_adf_custxml.recordcount;

    ABankInfo := Get_BankInfo;
    BankID := ABankInfo.BankID;
    BankName := ABankInfo.BankName;

  FilePAth := EditFile_acc.Text;
  AssignFile(f, FilePAth);
  Rewrite(f);
  Closefile(f);

    end_dat:=Form_Interval.DateTim_end.DateTime;
    WriteString('<?xml version="1.0" encoding="UTF-8" ?>');
    WriteString('<BALANCE>');
    WriteString('<BANK_CODE>');
    WriteString(BankID);
    WriteString('</BANK_CODE>');
    WriteString('<BANK_NAME>');
    WriteString(BankName);
    WriteString('</BANK_NAME>');
    WriteString('<BALANCE_DATE>');
    WriteString(FormatDateTime('yyyy-dd-mm',end_dat));
    WriteString('</BALANCE_DATE>');
    WriteString('<ROWCOUNT>');
    WriteString(inttostr(r));
    WriteString('</ROWCOUNT>');

    Adif_Data.ods_account.First;
      for I := 0 to r-1 do
      begin
      WriteString('<DETAILS>');

    with Adif_Data,ods_account do begin
    WriteString('<BRANCH_CODE>');
    WriteString(FieldByName('fil_kod').AsString);
    WriteString('</BRANCH_CODE>');

    WriteString('<BRANCH_NAME>');
    WriteString(FieldByName('fil_name').AsString);
    WriteString('</BRANCH_NAME>');

    WriteString('<BALANCE_ACCOUNT_NUMBER>');
    WriteString(FieldByName('bal_cn1').AsString);
    WriteString('</BALANCE_ACCOUNT_NUMBER>');

    WriteString('<BALANCE_ACCOUNT_NAME>');
    WriteString(FieldByName('name').AsString);
    WriteString('</BALANCE_ACCOUNT_NAME>');

    WriteString('<CURRENCY_CODE>');
    WriteString(FieldByName('val_kod').AsString);
    WriteString('</CURRENCY_CODE>');

    WriteString('<YTD_DR>');
    WriteString(FieldByName('debt_dov').AsString);
    WriteString('</YTD_DR>');

    WriteString('<YTD_CR>');
    WriteString(FieldByName('kredit_dov').AsString);
    WriteString('</YTD_CR>');

    WriteString('<BALANCE>');
    WriteString(FieldByName('ostat').AsString);
    WriteString('</BALANCE>');

    WriteString('<AZN_BALANCE>');
    WriteString(FieldByName('pok_ostat').AsString);
    WriteString('</AZN_BALANCE>');
     end;
      Adif_Data.ods_account.next;
      WriteString('</DETAILS>');
    Gauge_acc.Progress := Trunc(j*100 / r);
        j := j + 1;
       end;
    WriteString('</BALANCE>');
    ShowMessage( 'İxrac qurtardı '+inttostr(r)+ '- sayda hesab ixrac olundu' );
    MessageDlg('XML file uğurla yaradıldı', mtInformation, [mbOk], 0);
    Gauge_acc.Progress :=0;
    EditFile_acc.Text:='';


end;

procedure TFormAcc_file.XFBitBtn2Click(Sender: TObject);
begin
FormAcc_file.Close;
end;

end.
