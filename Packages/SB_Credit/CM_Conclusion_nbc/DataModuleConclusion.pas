unit DataModuleConclusion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ConclusionCommonDecls, Oracle;

type
  TDataModuleConcl = class(TDataModule)
    DataSrcCreditProps: TDataSource;
    DataSrcLoanAccs: TDataSource;
    DataSrcDueLoanAccs: TDataSource;
    DueLoanAccs: TOracleDataSet;
    DataSrcPReserveAccs: TDataSource;
    PReserveAccs: TOracleDataSet;
    DataSrcSReserveAccs: TDataSource;
    SReserveAccs: TOracleDataSet;
    DataSrcCurrencys: TDataSource;
    CurrencysData: TOracleDataSet;
    DataSrcReserves: TDataSource;
    Reserves: TOracleDataSet;
    DataSrcCustomer: TDataSource;
    Customer: TOracleDataSet;
    CustomerID: TIntegerField;
    CustomerNAME: TWideStringField;
    DataSrcClientCategories: TDataSource;
    ClientCategories: TOracleDataSet;
    DataSrcCreditTypes: TDataSource;
    CreditTypes: TOracleDataSet;
    CreditProps: TOracleDataSet;
    AutoPayment: TOracleDataSet;
    DataSrcAutoPayment: TDataSource;
    AutoExpire: TOracleDataSet;
    DataSrcAutoExpire: TDataSource;
    DataSrcDueInterests: TDataSource;
    DueInterests: TOracleDataSet;
    Branches: TOracleDataSet;
    DataSrcBranches: TDataSource;
    PersonTypes: TOracleDataSet;
    DataSrcPersonTypes: TDataSource;
    UsrGroups: TOracleDataSet;
    DataSrcUsrGroups: TDataSource;
    ReservesID: TFloatField;
    ReservesPERCENT: TFloatField;
    ReservesDESCRIPTION: TWideStringField;
    CurrencysDataCURRID: TIntegerField;
    CurrencysDataCURRNAME: TWideStringField;
    ReservesFullDesc: TWideStringField;
    IUPackage: TOraclePackage;
    DataSrcOUTOUTObligationAccs: TDataSource;
    OUTObligationAccs: TOracleDataSet;
    DataSrcOUTCollatralAccs_: TDataSource;
    OUTCollatralAccs_: TOracleDataSet;
    DataSrcCustAccs: TDataSource;
    PercentAccounts: TOracleDataSet;
    DataSrcPercentAccounts: TDataSource;
    DataSrcDueReserves: TDataSource;
    DueReserves: TOracleDataSet;
    DueReservesID: TFloatField;
    DueReservesPERCENT: TFloatField;
    DueReservesDESCRIPTION: TWideStringField;
    DueReservesFullDesc: TWideStringField;
    LoanAccsLoanAccsID: TFloatField;
    LoanAccsCUSTID: TFloatField;
    LoanAccsACCNO: TWideStringField;
    LoanAccsCLIENTNAME: TWideStringField;
    LoanAccsVAL_ACC: TIntegerField;
    OUTInterestAccs: TOracleDataSet;
    DataSrcOUTInterestAccs: TDataSource;
    OUTInterestAccsID: TFloatField;
    OUTInterestAccsCUSTID: TFloatField;
    OUTInterestAccsACCNO: TWideStringField;
    OUTInterestAccsCLIENTNAME: TWideStringField;
    OUTInterestAccsVAL_ACC: TIntegerField;
    CrdLineoblAccs: TOracleDataSet;
    CrdLineoblAccsDataSrc: TDataSource;
    CustAccsCustAccsID: TFloatField;
    CustAccsCUSTID: TFloatField;
    CustAccsACCNO: TWideStringField;
    CustAccsCLIENTNAME: TWideStringField;
    CustAccsVAL_ACC: TIntegerField;
    CM_COMMON: TOraclePackage;
    cm_decls: TOraclePackage;
    OutLoanAccsDatSrc: TDataSource;
    OutLoanAccs: TOracleDataSet;
    OutLoanAccsID: TFloatField;
    OutLoanAccsCUSTID: TFloatField;
    OutLoanAccsACCNO: TWideStringField;
    OutLoanAccsCLIENTNAME: TWideStringField;
    OutLoanAccsVAL_ACC: TIntegerField;
    BalcnLoan: TOracleDataSet;
    BalcnLoanDatSrc: TDataSource;
    BalcnLoanBAL_CN: TFloatField;
    BalcnLoanBALNAME: TWideStringField;
    BalcnLoanFULLNAME: TWideStringField;
    BranchesID: TFloatField;
    BranchesNAME: TWideStringField;
    CalcIntMethod: TOracleDataSet;
    DatSrcCalcIntMethod: TDataSource;
    CalcIntMethodID: TFloatField;
    CalcIntMethodDESCRIPTION: TWideStringField;
    DataSrcContrys: TDataSource;
    Countrys: TOracleDataSet;
    CreditPropsCURRENCY: TFloatField;
    CreditPropsBOOROWERID: TFloatField;
    CreditPropsCREDITLINEAMOUNT: TFloatField;
    CreditPropsANNUALYINTERESTRATE: TFloatField;
    CreditPropsANNUALYOVERDUERATE: TFloatField;
    CreditPropsANNUALYPENALTYRATE: TFloatField;
    CreditPropsDATEOFCONCLUSION: TDateTimeField;
    CreditPropsDUEDATEFIRSTCONTRACT: TDateTimeField;
    CreditPropsNUMBEROFCREDIT: TWideStringField;
    CreditPropsPURPOSEOFCREDIT: TWideStringField;
    CreditPropsCUSTOMERTYPE: TFloatField;
    CreditPropsCREDITTYPE: TFloatField;
    CreditPropsPERSONALTYPE: TFloatField;
    CreditPropsAUTOPAYMENT: TFloatField;
    CreditPropsAUTOEXPIRE: TFloatField;
    CreditPropsUSRGROUP: TFloatField;
    CreditPropsBRANCHID: TFloatField;
    CreditPropsANNUALBANKRATE: TFloatField;
    CreditPropsNEWFINANCEAMOUNT: TFloatField;
    CreditPropsNUMBEROFBANKCREDIT: TWideStringField;
    CreditPropsINTCALCMETHOD: TFloatField;
    CreditPropsBOOROWERACCID: TFloatField;
    CreditPropsLOANACCID: TFloatField;
    CreditPropsDUELOANACCID: TFloatField;
    CreditPropsINTERESTACCID: TFloatField;
    CreditPropsDUEINTERESTACCID: TFloatField;
    CreditPropsPRIMARYRESERVEACCID: TFloatField;
    CreditPropsSECONDARYRESERVEACCID: TFloatField;
    CreditPropsOUTCOLLATERALACCID: TFloatField;
    CreditPropsOUTGUARANTEEACCID: TFloatField;
    CreditPropsOUTINTERESTACCID: TFloatField;
    CreditPropsCRDLINEOBLACCID: TFloatField;
    CreditPropsOUTLOANACCID: TFloatField;
    CreditPropsPRIMARYPURRESERVEACCID: TFloatField;
    CreditPropsSECONDARYPURRESERVEACCID: TFloatField;
    CreditPropsRESERVEID: TFloatField;
    CreditPropsDUERESERVEID: TFloatField;
    CreditPropsNAME: TWideStringField;
    CreditPropsCOUNTRYCODE: TWideStringField;
    CreditPropsBANKRUPTEYSTATUS: TFloatField;
    CreditPropsADDRESS: TWideStringField;
    CreditPropsFIRSTOWNERNAME: TWideStringField;
    CreditPropsSECONDOWNERNAME: TWideStringField;
    CreditPropsTHIRDOWNERNAME: TWideStringField;
    CreditPropsGUARANTORNAME: TWideStringField;
    CreditPropsGUARANTORID: TWideStringField;
    CreditPropsGUARANTORSALARY: TWideStringField;
    CreditPropsPeriodContracts: TIntegerField;
    CreditPropsPLEDGSORTS: TFloatField;
    CreditPropsBOORID: TWideStringField;
    CreditPropsPHONENUMBER: TWideStringField;
    CreditPropsSALARY: TWideStringField;
    CreditPropsFIRSTOWNERID: TWideStringField;
    CreditPropsSECONDOWNERID: TWideStringField;
    CreditPropsTHIRDOWNERID: TWideStringField;
    CreditPropsGUARANTORNAME2: TWideStringField;
    CreditPropsGUARANTORID2: TWideStringField;
    CreditPropsGUARANTORSALARY2: TWideStringField;
    CreditPropsGUARANTORNAME3: TWideStringField;
    CreditPropsGUARANTORID3: TWideStringField;
    CreditPropsGUARANTORSALARY3: TWideStringField;
    CreditPropsPINCODE: TWideStringField;
    CurrencysDataVAL_NAME: TWideStringField;
    DataSrcActivities: TDataSource;
    DataSetActivities: TOracleDataSet;
    creditcatData: TOracleDataSet;
    creditcat: TDataSource;
    EstateTypeData: TOracleDataSet;
    EstateType: TDataSource;
    DataSrcActivities_type: TDataSource;
    creditcatDataID: TFloatField;
    creditcatDataNAME: TWideStringField;
    creditcatDataKOD: TWideStringField;
    CreditPropsCREDITACT: TFloatField;
    CreditPropsACTIVITIES: TFloatField;
    CreditPropsACTIVITIES_TYPE: TFloatField;
    Aim_Set: TOracleDataSet;
    AIM_Src: TDataSource;
    CreditPropsAIM_ID: TFloatField;
    ID: TFloatField;
    CODE: TWideStringField;
    DESCRIPTION: TWideStringField;
    ACT_ID: TFloatField;
    DataSetActivitiesID: TFloatField;
    DataSetActivitiesDESCRIPTION: TWideStringField;
    DataSetActivitiesBANK_KOD: TWideStringField;
    DataSetActivitiesACT_ID: TFloatField;
    DataSetActivitiesNEWID: TFloatField;
    PldDataSrc: TDataSource;
    PldDataSet: TOracleDataSet;
    custSrc: TDataSource;
    SexDataSet: TOracleDataSet;
    custe_: TOracleDataSet;
    custe_ID: TIntegerField;
    custe_SEX: TIntegerField;
    custe_sex_cust: TWideStringField;
    PrinadDataSet: TOracleDataSet;
    PrinadSrc: TDataSource;
    CreditPropsPLEDGEID_P: TFloatField;
    creditcatDataVID_SOB: TFloatField;
    ClientCategoriesID: TFloatField;
    ClientCategoriesPERSON: TFloatField;
    ClientCategoriesDESCRIPTION: TWideStringField;
    ClientCategoriesCODE: TWideStringField;
    ClientCategoriesACT_ID: TFloatField;
    ExpertSrc: TDataSource;
    ExpertSet: TOracleDataSet;
    CreditPropsEXPERTID: TFloatField;
    ClientCategoriesKODU: TWideStringField;
    EstateTypeDataID: TFloatField;
    EstateTypeDataNAME: TWideStringField;
    EstateTypeDataKODU: TWideStringField;
    CreditPropsPAYPERIOD: TFloatField;
    OracleDataSet: TOracleDataSet;
    DataSourc: TDataSource;
    PayIntSet: TOracleDataSet;
    PayIntSrc: TDataSource;
    CreditPropsPAYINTDAY: TFloatField;
    UsrGroupsID: TFloatField;
    UsrGroupsDESCRIPTION: TWideStringField;
    DataSrcSeynbol: TDataSource;
    DataSenbol: TOracleDataSet;
    DataSenbolID: TFloatField;
    DataSenbolNAM: TWideStringField;
    DataSenbolKOD: TFloatField;
    DataSrcInterests: TDataSource;
    Interests: TOracleDataSet;
    adm: TOraclePackage;
    CreditPropsSTATUS: TFloatField;
    CreditPropsMEHSULID: TFloatField;
    IPReserveAccs: TOracleDataSet;
    ISReserveAccs: TOracleDataSet;
    IDataSrcSReserveAccs: TDataSource;
    IDataSrcPReserveAccs: TDataSource;
    CreditPropsIPRIMARYRESERVEACCID: TFloatField;
    CreditPropsISECONDARYRESERVEACCID: TFloatField;
    InterestsID: TFloatField;
    InterestsCUSTID: TFloatField;
    InterestsACCNO: TWideStringField;
    InterestsCLIENTNAME: TWideStringField;
    InterestsVAL_ACC: TIntegerField;
    DueInterestsID: TFloatField;
    DueInterestsCUSTID: TFloatField;
    DueInterestsACCNO: TWideStringField;
    DueInterestsCLIENTNAME: TWideStringField;
    DueInterestsVAL_ACC: TIntegerField;
    CustAccs: TOracleDataSet;
    LoanAccs: TOracleDataSet;
    loc: TOracleDataSet;
    Qovluq: TDataSource;
    Partnyor: TDataSource;
    QovluqSet: TOracleDataSet;
    PartnyorSet: TOracleDataSet;
    CreditPropsPARTID: TFloatField;
    CreditPropsQOVID: TFloatField;
    DataSource1: TDataSource;
    OracleDataSet1: TOracleDataSet;
    mehsul: TOracleDataSet;
    DataSrcMehsul: TDataSource;
    mehsulID: TFloatField;
    mehsulNAME: TWideStringField;
    OracleDataSet2: TOracleDataSet;
    OracleDataSet3: TOracleDataSet;
    CreditPropsPENACCID: TFloatField;
    PenSet: TOracleDataSet;
    PenSource: TDataSource;
    PReserveAccsID: TFloatField;
    PReserveAccsCUSTID: TFloatField;
    PReserveAccsACCNO: TWideStringField;
    PReserveAccsCLIENTNAME: TWideStringField;
    PReserveAccsVAL_ACC: TIntegerField;
    SReserveAccsID: TFloatField;
    SReserveAccsCUSTID: TFloatField;
    SReserveAccsACCNO: TWideStringField;
    SReserveAccsCLIENTNAME: TWideStringField;
    SReserveAccsVAL_ACC: TIntegerField;
    OracleDataSet4: TOracleDataSet;
    Sbvid_sob: TOracleDataSet;
    Vid_sob: TDataSource;
    sbotrasli: TOracleDataSet;
    otrasli: TDataSource;
    CreditPropsVID_SOB: TFloatField;
    CreditPropsOTID: TFloatField;
    CreditPropsPOST: TWideStringField;
    CreditPropsKOMISION: TFloatField;
    CreditPropsINFO: TWideStringField;
    CreditPropsTESNIFID: TFloatField;
    CreditPropsREZERVEAUTO: TFloatField;
    Tesnifat: TOracleDataSet;
    SrcTesnifat: TDataSource;
    Ehtiyyathesabsec: TOracleDataSet;
    EhtiyyathesabsecFaiz: TOracleDataSet;
    custe_KEFNAM: TWideStringField;
    PrinadDataSetID: TIntegerField;
    PrinadDataSetTELS: TWideStringField;
    PrinadDataSetWORK_POST: TWideStringField;
    PrinadDataSetKEFNAM: TWideStringField;
    PrinadDataSetNAME: TWideStringField;
    PrinadDataSetPASSPIN: TWideStringField;
    PrinadDataSetPASNUM: TWideStringField;
    PrinadDataSetADDRESS: TWideStringField;
    PrinadDataSetWORK_PLACE: TWideStringField;
    PrinadDataSetMONTHLYPROFIT: TWideStringField;
    PrinadDataSetWORK_VID_SOB: TFloatField;
    PrinadDataSetWORK_OTRASLI: TFloatField;
    PrinadDataSetSEX: TIntegerField;
    PrinadDataSetsex_cust: TWideStringField;
    mehsulCREDITTYPE: TFloatField;
    Kefset: TOracleDataSet;
    Rest: TOracleDataSet;
    PrinadDataSetQUALITY_ID: TFloatField;
    DepozitDSet: TOracleDataSet;
    DepozitSrc: TDataSource;
    CreditPropsDEPOZITIDS: TWideStringField;
    DepAccSet: TOracleDataSet;
    DepAccSrc: TDataSource;
    Depozitqaliq: TOracleDataSet;
    CreditPropsWORK1: TWideStringField;
    PrinadDataSetPHONE_M: TWideStringField;
    CreditPropsAIF: TIntegerField;
    CreditPropsAIF_BANKS: TWideStringField;
    CreditPropsDTI: TFloatField;
    Ssb_Set: TOracleDataSet;
    Ssb_Dsrc: TDataSource;
    CreditPropsSSBID: TFloatField;
    CreditPropsMONTHS_PAY: TFloatField;
    CreditPropsMONTHS_PAY_ZAM: TFloatField;
    procedure CreditPropsApplyRecord(Sender: TOracleDataSet; Action: Char;
      var Applied: Boolean; var NewRowId: String);
    procedure CreditPropsCURRENCYChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CreditPropsLOANACCIDChange(Sender: TField);
    procedure DueReservesCalcFields(DataSet: TDataSet);
    procedure ReservesCalcFields(DataSet: TDataSet);
    procedure CreditPropsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    FInsertCredit : Boolean;
    FLastCrdID : Integer;
    { Public declarations }
  end;

var
  DataModuleConcl: TDataModuleConcl;

implementation

{$R *.DFM}

uses
   sboapiDataModuleImpl,CommonDecls, ConclusionMainUnitImpl;

procedure TDataModuleConcl.CreditPropsApplyRecord(Sender: TOracleDataSet;
  Action: Char; var Applied: Boolean; var NewRowId: String);
var
  Result : Integer;
begin
  Result := 0;
  case Action of
  'I' :
       begin
         with IUPackage ,SavedCredit do
         Result :=
         CallIntegerFunction('Contract_Add',[
           'Currency',Currency,
           'BoorowerID',BoorowerID,
           'PINCODE',PINCODE,
           'CreditLineAmount',CreditLineAmount,
           'AnnualyInterestRate',AnnualyInterestRate,
           'AnnualyOverdueRate',AnnualyOverdueRate,
           'AnnualyPenaltyRate',AnnualyPenaltyRate,
           'AnnualBankRate',AnnualBankRate,
           'DateOfConclusion',DateOfConclusion,
           'DueDateFirstContract',DueDateFirstContract,
           'NumberOfCredit',NumberOfCredit,
           'PurposeOfCredit',PurposeOfCredit,
           'CustomerType',CustomerType,
           'CreditType',CreditType,
           'PersonalType',PersonalType,
           'AutoPayment',AutoPayment,
           'AutoExpire',AutoExpire,
           'UsrGroup',UsrGroup,
           'BranchID',BranchID,
           'newfinanceamount',newfinanceamount,
           'numberofBankCredit',numberofBankCredit,
           'intcalcmethod', intcalcmethod,
           'BoorowerAccID',BoorowerAccID,
           'LoanAccID',LoanAccID,
           'DueLoanAccID',DueLoanAccID,
           'InterestAccID',InterestAccID,
           'DueInterestAccID',DueInterestAccID,
           'PrimaryReserveAccID',PrimaryReserveAccID,
           'SecondaryReserveAccID',SecondaryReserveAccID,
           'OutCollateralAccID',OutCollateralAccID,
           'OutGuaranteeAccID',OutGuaranteeAccID,
           'OutInterestAccID',OutInterestAccID,
           'CrdLineOblAccID',CrdLineOblAccID ,
           'OUTLoanAccID',OUTLoanAccID,
           'primarypurreserveaccid',primarypurreserveaccid ,
           'secondarypurreserveaccid',secondarypurreserveaccid ,
           'ReserveID',ReserveID,
           'DueReserveID',DueReserveID,
           'BOORID',BOORID,
           'COUNTRYCODE',COUNTRYCODE,
           'BANKRUPTEYSTATUS',BANKRUPTEYSTATUS,
           'PHONENUMBER',PHONENUMBER,
           'ADDRESS',ADDRESS,
           'FIRSTOWNERID',FIRSTOWNERID,
           'FIRSTOWNERNAME',FIRSTOWNERNAME,
           'SECONDOWNERID',SECONDOWNERID,
           'SECONDOWNERNAME',SECONDOWNERNAME,
           'THIRDOWNERID',THIRDOWNERID,
           'THIRDOWNERNAME',THIRDOWNERNAME,
           'salary',salary,
           'guarantorname',guarantorname,
           'guarantorid',guarantorid,
           'guarantorsalary',guarantorsalary,
           'guarantorname2',guarantorname2,
           'guarantorid2',guarantorid2,
           'guarantorsalary2',guarantorsalary2,
           'guarantorname3',guarantorname3,
           'guarantorid3',guarantorid3,
           'guarantorsalary3',guarantorsalary3,
           'activities' ,activities ,
           'activities_type',activities_type,
           'CREDITACT',CREDITACT ,
           'aim_id',aim_id,
           'insuranceid',222 ,
           'PLEDGEID_P',PLEDGEID_P,
           'EXPERTID',EXPERTID,
           'payperiod',payperiod,
           'payintday',payintday ,
           'MEHSULID',MEHSULID,
           'iPrimaryReserveAccID',iPrimaryReserveAccID,
           'iSecondaryReserveAccID',iSecondaryReserveAccID  ,
           'qovid',qovid,
           'partid',partid,
           'PENACCID',PENACCID,
           'post',post,
           'work',work,
           'vid_sob',vid_sob,
           'otid',otid ,
           'KOMISION',KOMISION ,
           'info',info,
           'TESNIFID',TESNIFID  ,
           'REZERVEAUTO', REZERVEAUTO,
           'DEPOZITIDS',DEPOZITIDS ,
           'AIF',aif ,
           'aif_banks',aif_banks,
           'DTI',DTI ,
           'ssbid' ,ssbid ,
           'months_pay' ,months_pay,
           'months_pay_zam' , months_pay_zam
         ]);
         Applied := True;
     
       end;
  'U' :
       begin
         with IUPackage ,SavedCredit do
         Result :=
         CallIntegerFunction('Contract_Edit',[
           'CreditID',CreditProps.GetVariable('CreditID'),
           'Currency',Currency,
           'BoorowerID',BoorowerID,
           'PINCODE',PINCODE,
           'CreditLineAmount',CreditLineAmount,
           'AnnualyInterestRate',AnnualyInterestRate,
           'AnnualyOverdueRate',AnnualyOverdueRate,
           'AnnualyPenaltyRate',AnnualyPenaltyRate,
           'AnnualBankRate',AnnualBankRate,
           'DateOfConclusion',DateOfConclusion,
           'DueDateFirstContract',DueDateFirstContract,
           'NumberOfCredit',NumberOfCredit,
           'PurposeOfCredit',PurposeOfCredit,
           'CustomerType',CustomerType,
           'CreditType',CreditType,
           'PersonalType',PersonalType,
           'AutoPayment',AutoPayment,
           'AutoExpire',AutoExpire,
           'UsrGroup',UsrGroup,
           'BranchID',BranchID,
           'newfinanceamount',newfinanceamount,
           'numberofBankCredit',numberofBankCredit,
           'intcalcmethod',intcalcmethod,
           'BoorowerAccID',BoorowerAccID,
           'LoanAccID',LoanAccID,
           'DueLoanAccID',DueLoanAccID,
           'InterestAccID',InterestAccID,
           'DueInterestAccID',DueInterestAccID,
           'PrimaryReserveAccID',PrimaryReserveAccID,
           'SecondaryReserveAccID',SecondaryReserveAccID,
           'OutCollateralAccID',OutCollateralAccID,
           'OutGuaranteeAccID',OutGuaranteeAccID,
           'OutInterestAccID',OutInterestAccID,
           'CrdLineOblAccID',CrdLineOblAccID ,
           'OUTLoanAccID',OUTLoanAccID,
           'primarypurreserveaccid',primarypurreserveaccid ,
           'secondarypurreserveaccid',secondarypurreserveaccid ,
           'ReserveID',ReserveID,
           'DueReserveID',DueReserveID,           
           'BOORID',BOORID,
           'COUNTRYCODE',COUNTRYCODE,
           'BANKRUPTEYSTATUS',BANKRUPTEYSTATUS,
           'PHONENUMBER',PHONENUMBER,
           'ADDRESS',ADDRESS,
           'FIRSTOWNERID',FIRSTOWNERID,
           'FIRSTOWNERNAME',FIRSTOWNERNAME,
           'SECONDOWNERID',SECONDOWNERID,
           'SECONDOWNERNAME',SECONDOWNERNAME,
           'THIRDOWNERID',THIRDOWNERID,
           'THIRDOWNERNAME',THIRDOWNERNAME,
           'salary',salary,
           'guarantorname',guarantorname,
           'guarantorid',guarantorid,
           'guarantorsalary',guarantorsalary,
           'guarantorname2',guarantorname2,
           'guarantorid2',guarantorid2,
           'guarantorsalary2',guarantorsalary2,
           'guarantorname3',guarantorname3,
           'guarantorid3',guarantorid3,
           'guarantorsalary3',guarantorsalary3,
           'activities' ,activities,
           'activities_type',activities_type ,
           'CREDITACT',CREDITACT,
           'aim_id',aim_id,
           'insuranceid',0,
           'PLEDGEID_P',PLEDGEID_P ,
           'EXPERTID',EXPERTID,
           'payperiod',payperiod,
           'payintday',payintday ,
           'MEHSULID',MEHSULID,
           'iPrimaryReserveAccID',iPrimaryReserveAccID,
           'iSecondaryReserveAccID',iSecondaryReserveAccID ,
           'qovid',qovid,
           'partid',partid,
           'PENACCID',PENACCID,
           'post',post,
           'work',work,
           'vid_sob',vid_sob,
           'otid',otid ,
           'KOMISION',KOMISION,
           'info',info ,
           'TESNIFID',TESNIFID  ,
           'REZERVEAUTO', REZERVEAUTO ,
           'DEPOZITIDS',DEPOZITIDS,
           'AIF',aif,
           'aif_banks',aif_banks,
           'DTI',DTI ,
           'ssbid' ,ssbid ,
           'months_pay' ,months_pay,
           'months_pay_zam' , months_pay_zam
         ]);
         Applied := True;
       end;
    end;
    FLastCrdID := Result;
end;

procedure TDataModuleConcl.CreditPropsCURRENCYChange(Sender: TField);
begin
  with CreditProps do
  begin
    FieldByName('BOOROWERACCID').Clear;
    FieldByName('LOANACCID').Clear;
    FieldByName('DUELOANACCID').Clear;
    FieldByName('INTERESTACCID').Clear;
    FieldByName('DUEINTERESTACCID').Clear;
    FieldByName('PRIMARYRESERVEACCID').Clear;
    FieldByName('SECONDARYRESERVEACCID').Clear;
    FieldByName('OUTCOLLATERALACCID').Clear;
    FieldByName('OUTGUARANTEEACCID').Clear;
    FieldByName('OUTINTERESTACCID').Clear;
  end
end;

procedure TDataModuleConcl.DataModuleCreate(Sender: TObject);
var
p_id : variant ;
begin
  Customer.Open;
  SexDataSet.Open;
  Ssb_Set.open ;
  EstateTypeData.open;
  ExpertSet.Open;
 // DataSetActivities.open;
  //ClientCategories.Open;
  OracleDataSet.open;
  Aim_Set.open ;
  Reserves.Open;
  DueReserves.Open;
  PersonTypes.Open;
  AutoPayment.Open;
  CurrencysData.Open;
  AutoExpire.Open;
   CalcIntMethod.Open;
   LoanAccs.open;
   Interests.open;
   CustAccs.Open;
   PReserveAccs.Open;
   SReserveAccs.Open;
   Branches.Open;
   DueLoanAccs.open;
   PercentAccounts.Open;
   CrdLineoblAccs.Open;

  DueInterests.open;
  Countrys.Open;
   BalcnLoan.Open;

  // OUTObligationAccs.Open;
 //OUTCollatralAccs.Open;
 // OUTInterestAccs.Open;
  OutLoanAccs.Open;
 // PrinadDataSet.open;
  PldDataSet.open;
  ///////
  DataSenbol.open;
  PayIntSet.open ;
 // IPReserveAccs.open;
 // ISReserveAccs.open;
  QovluqSet.Open;
  PartnyorSet.Open;
  mehsul.Open ;
  Sbvid_sob.open ;
  sbotrasli.open   ;
  Tesnifat.Open;
 end;

procedure TDataModuleConcl.DataModuleDestroy(Sender: TObject);
begin
  Reserves.CloseAll;
  Customer.CloseAll;
  Branches.CloseAll;
  UsrGroups.CloseAll;
  CreditTypes.CloseAll;
  ClientCategories.CloseAll;
  PersonTypes.CloseAll;
  AutoPayment.CloseAll;
  AutoExpire.CloseAll;
  CurrencysData.CloseAll;
  LoanAccs.CloseAll;
  CustAccs.CloseAll;
  PReserveAccs.CloseAll;
  SReserveAccs.CloseAll;
  PercentAccounts.CloseAll;
  DueLoanAccs.CloseAll;
  Interests.closeall;
  DueInterests.CloseAll;
  OUTObligationAccs.CloseAll;
 // OUTCollatralAccs.CloseAll;
  OUTInterestAccs.CloseAll;
  CrdLineoblAccs.CloseAll;
  OutLoanAccs.CloseAll;
  BalcnLoan.CloseAll;
  CalcIntMethod.CloseAll;
  Countrys.CloseAll;
  DataSetActivities.CloseAll;
  creditcatData.closeall;
  EstateTypeData.closeall ;
   Aim_Set.closeall ;
   PldDataSet.closeall ;
  SexDataSet.closeall  ;
  //custe.closeall;
  PrinadDataSet.closeall;
  PayIntSet .closeall;
  DataSenbol.closeall;
 // IPReserveAccs.closeall;
//  ISReserveAccs.closeall;
  QovluqSet.Close;
  PartnyorSet.CloseAll;
  mehsul.CloseAll;
  PenSet.CloseAll;
   Sbvid_sob.CloseAll  ;
   sbotrasli.CloseAll ;
   Tesnifat.Close  ;
   Ssb_Set.CloseAll ;
end;

procedure TDataModuleConcl.CreditPropsLOANACCIDChange(Sender: TField);
begin
  if FInsertCredit then
  with Sender as TField do
  with DataSet do
  if not FieldByName('LoanAccID').IsNull then
    FieldByName('BOOROWERID').AsInteger := LoanAccs.FieldByName('CustID').AsInteger
  else
    FieldByName('BOOROWERID').Clear
end;

procedure TDataModuleConcl.DueReservesCalcFields(DataSet: TDataSet);
begin
  DueReservesFullDesc.AsString := DueReservesDESCRIPTION.AsString +' - '+ DueReservesPERCENT.AsString+' %';
end;

procedure TDataModuleConcl.ReservesCalcFields(DataSet: TDataSet);
begin
  ReservesFullDesc.AsString := ReservesDESCRIPTION.AsString +' - '+ ReservesPERCENT.AsString+' %';
end;

procedure TDataModuleConcl.CreditPropsCalcFields(DataSet: TDataSet);
begin
   with DataSet do
        FieldByName('PeriodContracts').AsInteger
          := cm_common.CallIntegerFunction('GetPeriod',
          [FieldByname('DATEOFCONCLUSION').AsDateTime,
           FieldByname('DUEDATEFIRSTCONTRACT').AsDateTime ]);
        {Trunc((integer(trunc(FieldByname('DUEDATEFIRSTCONTRACT').AsDateTime))-
         integer(trunc(FieldByname('DATEOFCONCLUSION').AsDateTime)))/30); }
end;

end.
