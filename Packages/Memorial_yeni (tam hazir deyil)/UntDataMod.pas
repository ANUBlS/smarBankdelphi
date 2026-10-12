unit UntDataModMemorial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Oracle, Db, OracleData;

type
  TDataModMemorial = class(TDataModule)
    OraclePackage: TOraclePackage;
    DataSrcMain: TDataSource;
    ODSMain: TOracleDataSet;
    ODSRate: TOracleDataSet;
    DataSrcRate: TDataSource;
    BankInfo: TOracleDataSet;
    BankInfoINN: TWideStringField;
    BankInfoBANK: TWideStringField;
    BankInfoLOGO: TBlobField;
    ReferDataSet: TOracleDataSet;
    DataSrcRefer: TDataSource;
    UsersList: TOracleDataSet;
    DataSrcUsersList: TDataSource;
    UsersListID: TFloatField;
    UsersListNAME: TWideStringField;
    Branches: TOracleDataSet;
    DataSrcBranches: TDataSource;
    BranchesID: TFloatField;
    BranchesNAME: TWideStringField;
    ODSMainDBAL_CN: TFloatField;
    ODSMainKBAL_CN: TFloatField;
    ODSMainDAT: TDateTimeField;
    ODSMainDIFFRATE: TFloatField;
    ODSMainNAME: TWideStringField;
    ODSMainID: TFloatField;
    ODSMainSHIFR: TIntegerField;
    ODSMainVAL_ACC: TWideStringField;
    ODSMainCURRENCYID_C: TWideStringField;
    ODSMainAMMOUNT: TFloatField;
    ODSMainAMMOUNT_C: TFloatField;
    ODSMainLAMMOUNT: TFloatField;
    ODSMainOP_ID: TFloatField;
    ODSMainDEBITOR: TWideStringField;
    ODSMainDEBTINN: TFloatField;
    ODSMainDNAME: TWideStringField;
    ODSMainKREDITOR: TWideStringField;
    ODSMainKREDINN: TFloatField;
    ODSMainKNAME: TWideStringField;
    ODSMainDEBT: TFloatField;
    ODSMainKREDIT: TFloatField;
    ODSSelected: TOracleDataSet;
    DSSelected: TDataSource;
    ODSSelectedDBAL_CN: TFloatField;
    ODSSelectedKBAL_CN: TFloatField;
    ODSSelectedDAT: TDateTimeField;
    ODSSelectedDIFFRATE: TFloatField;
    ODSSelectedNAME: TWideStringField;
    ODSSelectedID: TFloatField;
    ODSSelectedSHIFR: TIntegerField;
    ODSSelectedVAL_ACC: TWideStringField;
    ODSSelectedCURRENCYID_C: TWideStringField;
    ODSSelectedAMMOUNT: TFloatField;
    ODSSelectedAMMOUNT_C: TFloatField;
    ODSSelectedLAMMOUNT: TFloatField;
    ODSSelectedOP_ID: TFloatField;
    ODSSelectedDEBITOR: TWideStringField;
    ODSSelectedDEBTINN: TFloatField;
    ODSSelectedDNAME: TWideStringField;
    ODSSelectedKREDITOR: TWideStringField;
    ODSSelectedKREDINN: TFloatField;
    ODSSelectedKNAME: TWideStringField;
    ODSSelectedDEBT: TFloatField;
    ODSSelectedKREDIT: TFloatField;
    procedure ODSMainCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModMemorial: TDataModMemorial;

implementation

{$R *.DFM}

uses  sboapiDataModuleImpl,CurrencyToHR_Azeri_Impl, MemorialImpl;

procedure TDataModMemorial.ODSMainCalcFields(DataSet: TDataSet);
var
   CurrInNational :String;
   DInn,KInn :string;
   fState    :Integer;
begin
   with  DataSet  do
   begin
     CurrInNational :=CurrencyToHR_Azeri(
                        FieldByName('LAmmount').AsFloat
                       ,2
                       ,[2]
                       );

{*     if Round(100*Frac(FieldByName('LAmmount').AsFloat))>0 then
     FieldByName('CurrInNational').AsString :=CurrInNational+' - '+FloatToStr(
                                                Round(100*Frac(
                                                FieldByName('LAmmount').AsFloat
                                               )))+' г€пик'
     else
       FieldByName('CurrInNational').AsString :=CurrInNational;
}

      FieldByName('CurrInNational').AsString :=CurrInNational;

      KInn :='';
      DInn :='';

       if (Length(FieldByName('KredInn').AsString)<9) and (FieldByName('KredInn').AsString<>'')  then
        begin
         for fState :=1 to 9-Length(FieldByName('KredInn').AsString) do
          KInn :=KInn +'0';
           FieldByName('Kinn').AsString :=Kinn +FieldByName('KredInn').AsString;
        end
       else
         FieldByName('Kinn').AsString :=FieldByName('KredInn').AsString;

       if (Length(FieldByName('DebtInn').AsString)<9) and (FieldByName('DebtInn').AsString<>'') then
        begin
         for fState :=1 to 9-Length(FieldByName('DebtInn').AsString) do
          DInn :=DInn +'0';
           FieldByName('DInn').AsString :=Dinn +FieldByName('DebtInn').AsString;
        end
       else
        FieldByName('DInn').AsString :=FieldByName('DebtInn').AsString;

   end;
end;

procedure TDataModMemorial.DataModuleCreate(Sender: TObject);
begin
BankInfo.Open;
UsersList.Open;
Branches.Open;
end;

procedure TDataModMemorial.DataModuleDestroy(Sender: TObject);
begin
BankInfo.CloseAll;
UsersList.CloseAll;
Branches.CloseAll;
end;

end.
