unit DataModTM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Oracle, OracleData;

const
  GridColors: array[1..5]of TColor=(clRed,clTeal,clGreen,clBlue,clPurple);

type
  TDataModuleTicketMan = class(TDataModule)
    ODSTickets: TOracleDataSet;
    Tickets: TDataSource;
    ODSArchive: TOracleDataSet;
    Archive: TDataSource;
    TM_MANAGE: TOraclePackage;
    ODSAccount: TOracleDataSet;
    Account: TDataSource;
    ODSBankM: TOracleDataSet;
    BankM: TDataSource;
    ODSAllTickets: TOracleDataSet;
    AllTickets: TDataSource;
    ODSforPrint: TOracleDataSet;
    ODSSettings: TOracleDataSet;
    Settings: TDataSource;
    ODSStatuses: TOracleDataSet;
    Statuses: TDataSource;
    ODSPaymentDecree: TOracleDataSet;
    ChangeStat: TDataSource;
    ODSTicketsID: TFloatField;
    ODSTicketsPDATE: TDateTimeField;
    ODSTicketsPNUM: TFloatField;
    ODSTicketsDBANKFILIAL: TFloatField;
    ODSTicketsDBANKCODE: TWideStringField;
    ODSTicketsDBANKNAME: TWideStringField;
    ODSTicketsDBANKINN: TWideStringField;
    ODSTicketsDBANKSWIFT: TWideStringField;
    ODSTicketsDBANKKACC: TWideStringField;
    ODSTicketsDACC_NO: TWideStringField;
    ODSTicketsDACCNAME: TWideStringField;
    ODSTicketsDACCINN: TWideStringField;
    ODSTicketsKBANKFILIAL: TFloatField;
    ODSTicketsKBANKCODE: TWideStringField;
    ODSTicketsKBANKNAME: TWideStringField;
    ODSTicketsKBANKINN: TWideStringField;
    ODSTicketsKBANKSWIFT: TWideStringField;
    ODSTicketsKBANKKACC: TWideStringField;
    ODSTicketsKBANKSUBKACC: TWideStringField;
    ODSTicketsKACC_NO: TWideStringField;
    ODSTicketsKACCNAME: TWideStringField;
    ODSTicketsKACCINN: TWideStringField;
    ODSTicketsAMMOUNT: TFloatField;
    ODSTicketsDESCRIPTION: TWideStringField;
    ODSTicketsINFORMATION: TWideStringField;
    ODSTicketsUSERID: TFloatField;
    ODSTicketsSTATUS: TFloatField;
    ODSTicketsTICKTYPE: TFloatField;
    ODSTicketsTUSER: TWideStringField;
    ODSSettingsID: TFloatField;
    ODSSettingsREPORTNAME: TWideStringField;
    ODSSettingsLBLABEL: TWideStringField;
    ODSSettingsLBTITLE: TWideStringField;
    ODSSettingsLBDESCR: TWideStringField;
    ODSSettingsLBBNUMB: TWideStringField;
    ODSSettingsFORMATDAT: TWideStringField;
    ODSArchiveSTATUS: TFloatField;
    ODSArchiveID: TFloatField;
    ODSArchivePDATE: TDateTimeField;
    ODSArchivePNUM: TFloatField;
    ODSArchiveDBANKFILIAL: TFloatField;
    ODSArchiveDBANKCODE: TWideStringField;
    ODSArchiveDBANKNAME: TWideStringField;
    ODSArchiveDBANKINN: TWideStringField;
    ODSArchiveDBANKSWIFT: TWideStringField;
    ODSArchiveDBANKKACC: TWideStringField;
    ODSArchiveDACC_NO: TWideStringField;
    ODSArchiveDACCNAME: TWideStringField;
    ODSArchiveDACCINN: TWideStringField;
    ODSArchiveKBANKFILIAL: TFloatField;
    ODSArchiveKBANKCODE: TWideStringField;
    ODSArchiveKBANKNAME: TWideStringField;
    ODSArchiveKBANKINN: TWideStringField;
    ODSArchiveKBANKSWIFT: TWideStringField;
    ODSArchiveKBANKKACC: TWideStringField;
    ODSArchiveKBANKSUBKACC: TWideStringField;
    ODSArchiveKACC_NO: TWideStringField;
    ODSArchiveKACCNAME: TWideStringField;
    ODSArchiveKACCINN: TWideStringField;
    ODSArchiveAMMOUNT: TFloatField;
    ODSArchiveDESCRIPTION: TWideStringField;
    ODSArchiveINFORMATION: TWideStringField;
    ODSArchiveUSERID: TFloatField;
    ODSArchiveTUSER: TWideStringField;
    ODSAccountID: TFloatField;
    ODSAccountNAME: TWideStringField;
    ODSAccountACC_NO: TWideStringField;
    ODSAccountINN: TWideStringField;
    ODSStatusesID: TFloatField;
    ODSStatusesPRIVNAME: TWideStringField;
    ODSStatusesPRIVDESC: TWideStringField;
    ODSAllTicketsID: TFloatField;
    ODSAllTicketsPDATE: TDateTimeField;
    ODSAllTicketsPNUM: TFloatField;
    ODSAllTicketsDBANKFILIAL: TFloatField;
    ODSAllTicketsDACC_NO: TWideStringField;
    ODSAllTicketsDACCNAME: TWideStringField;
    ODSAllTicketsDACCINN: TWideStringField;
    ODSAllTicketsKBANKFILIAL: TFloatField;
    ODSAllTicketsKACC_NO: TWideStringField;
    ODSAllTicketsKACCNAME: TWideStringField;
    ODSAllTicketsKACCINN: TWideStringField;
    ODSAllTicketsAMMOUNT: TFloatField;
    ODSAllTicketsDESCRIPTION: TWideStringField;
    ODSAllTicketsINFORMATION: TWideStringField;
    ODSAllTicketsUSERID: TFloatField;
    ODSAllTicketsSTATUS: TFloatField;
    ODSPaymentDecreeID: TFloatField;
    ODSPaymentDecreePDATE: TDateTimeField;
    ODSPaymentDecreePNUM: TFloatField;
    ODSPaymentDecreeDBANKFILIAL: TFloatField;
    ODSPaymentDecreeDBANKCODE: TWideStringField;
    ODSPaymentDecreeDBANKNAME: TWideStringField;
    ODSPaymentDecreeDBANKINN: TWideStringField;
    ODSPaymentDecreeDBANKSWIFT: TWideStringField;
    ODSPaymentDecreeDBANKKACC: TWideStringField;
    ODSPaymentDecreeDACC_NO: TWideStringField;
    ODSPaymentDecreeDACCNAME: TWideStringField;
    ODSPaymentDecreeDACCINN: TWideStringField;
    ODSPaymentDecreeKBANKFILIAL: TFloatField;
    ODSPaymentDecreeKBANKCODE: TWideStringField;
    ODSPaymentDecreeKBANKNAME: TWideStringField;
    ODSPaymentDecreeKBANKINN: TWideStringField;
    ODSPaymentDecreeKBANKSWIFT: TWideStringField;
    ODSPaymentDecreeKBANKKACC: TWideStringField;
    ODSPaymentDecreeKBANKSUBKACC: TWideStringField;
    ODSPaymentDecreeKACC_NO: TWideStringField;
    ODSPaymentDecreeKACCNAME: TWideStringField;
    ODSPaymentDecreeKACCINN: TWideStringField;
    ODSPaymentDecreeAMMOUNT: TFloatField;
    ODSPaymentDecreeDESCRIPTION: TWideStringField;
    ODSPaymentDecreeINFORMATION: TWideStringField;
    ODSPaymentDecreeUSERID: TFloatField;
    ODSPaymentDecreeSTATUS: TFloatField;
    ODSforPrintSTATUS: TFloatField;
    ODSforPrintID: TFloatField;
    ODSforPrintPDATE: TDateTimeField;
    ODSforPrintPNUM: TFloatField;
    ODSforPrintDBANKFILIAL: TFloatField;
    ODSforPrintDBANKCODE: TWideStringField;
    ODSforPrintDBANKNAME: TWideStringField;
    ODSforPrintDBANKINN: TWideStringField;
    ODSforPrintDBANKSWIFT: TWideStringField;
    ODSforPrintDBANKKACC: TWideStringField;
    ODSforPrintDACC_NO: TWideStringField;
    ODSforPrintDACCNAME: TWideStringField;
    ODSforPrintDACCINN: TWideStringField;
    ODSforPrintKBANKFILIAL: TFloatField;
    ODSforPrintKBANKCODE: TWideStringField;
    ODSforPrintKBANKNAME: TWideStringField;
    ODSforPrintKBANKINN: TWideStringField;
    ODSforPrintKBANKSWIFT: TWideStringField;
    ODSforPrintKBANKKACC: TWideStringField;
    ODSforPrintKBANKSUBKACC: TWideStringField;
    ODSforPrintKACC_NO: TWideStringField;
    ODSforPrintKACCNAME: TWideStringField;
    ODSforPrintKACCINN: TWideStringField;
    ODSforPrintAMMOUNT: TFloatField;
    ODSforPrintDESCRIPTION: TWideStringField;
    ODSforPrintINFORMATION: TWideStringField;
    ODSforPrintUSERID: TFloatField;
    ODSforPrintTUSER: TWideStringField;
    ODSBankMID: TFloatField;
    ODSBankMBNAME: TWideStringField;
    ODSBankMINN: TWideStringField;
    ODSBankMSWIFT: TWideStringField;
    ODSBankMBANKCODE: TWideStringField;
    ODSBankMKRNO: TWideStringField;
    ODSBankMSUBKRNO: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleTicketMan: TDataModuleTicketMan;

implementation

uses sboapiDataModuleImpl;

{$R *.DFM}

procedure TDataModuleTicketMan.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for i:=0 to ComponentCount-1 do begin
    if ((Components[i].Tag=0) and (Components[i] is TOracleDataSet)) then begin
      (Components[i] as TOracleDataSet).Open;
      (Components[i] as TOracleDataSet).First;
    end;
  end;
end;

end.
