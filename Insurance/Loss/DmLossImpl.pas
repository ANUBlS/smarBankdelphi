unit DmLossImpl;
                //dsmodel
interface

uses
  SysUtils, Classes, DB, OracleData, Oracle,Messages,Dialogs,Graphics;

type
  TDmLoss = class(TDataModule)
    DSClaims: TDataSource;
    ODSClaims: TOracleDataSet;
    ODSClaimsID: TFloatField;
    ODSClaimsMK_ID: TFloatField;
    ODSClaimsENAME: TWideStringField;
    ODSClaimsCOUNT: TFloatField;
    ODSClaimsCOST: TFloatField;
    ODSClaimsSTATE: TWideStringField;
    DSClaimSal: TDataSource;
    ODSClaimSal: TOracleDataSet;
    ODSClaimSalID: TFloatField;
    ODSClaimSalEID: TFloatField;
    ODSClaimSalNAME: TWideStringField;
    ODSClaimSalCOST: TFloatField;
    ODSClaimDescription: TOracleDataSet;
    ODSClaimDescriptionID: TFloatField;
    ODSClaimDescriptionREGION: TWideStringField;
    ODSClaimDescriptionSTREET: TWideStringField;
    ODSClaimDescriptionDETAIL: TWideStringField;
    ODSClaimDescriptionPERSON: TWideStringField;
    ODSClaimDescriptionSTATENUM: TWideStringField;
    ODSClaimDescriptionAVTOSERVIS: TWideStringField;
    ODSClaimDescriptionAPPDATE: TDateTimeField;
    ODSClaimDescriptionLETTERDATE: TDateTimeField;
    ODSClaimDescriptionLETTERNUM: TWideStringField;
    ODSClaimDescriptionSPRNUM: TWideStringField;
    ODSClaimDescriptionPRTNUM: TWideStringField;
    ODSClaimDescriptionACTDATE: TDateTimeField;
    DSClaimDescription: TDataSource;
    DSMarks: TDataSource;
    DSModels: TDataSource;
    ODSClaimReport: TOracleDataSet;
    ODSClaimReportID: TFloatField;
    ODSClaimReportMK_ID: TFloatField;
    ODSClaimReportENAME: TWideStringField;
    ODSClaimReportCOUNT: TFloatField;
    ODSClaimReportCOST: TFloatField;
    ODSClaimReportSTATE: TWideStringField;
    DSAvalute: TDataSource;
    ODSAvalute: TOracleDataSet;
    ODSAvaluteVALUTE: TIntegerField;
    ODSAvaluteVAL_NAME: TWideStringField;
    ODSAvaluteVALU_NAME: TWideStringField;
    ODSAvaluteVALU_SHORT: TWideStringField;
    DSSysdat: TOracleDataSet;
    DSSysdatTEK_DAT: TDateTimeField;
    DSSysdatPRED_DAT: TDateTimeField;
    DSSysdatARC_DAY: TDateTimeField;
    DSSysdatCLOSE: TIntegerField;
    ODSContracts: TOracleDataSet;
    ODSContractsID: TFloatField;
    ODSContractsTYPE_ID: TFloatField;
    ODSContractsINS_DATE: TDateTimeField;
    ODSContractsBEGIN_DATE: TDateTimeField;
    ODSContractsEND_DATE: TDateTimeField;
    ODSContractsVALUTE_ID: TFloatField;
    ODSContractsAMMOUNT: TFloatField;
    ODSContractsCLOSE_PREFIX: TIntegerField;
    ODSContractsKLI_ID: TFloatField;
    ODSContractsLOANACC_ID: TFloatField;
    ODSContractsCURRACC_ID: TFloatField;
    ODSContractsPOLICY_NUM: TWideStringField;
    ODSContractsINSSUMM: TFloatField;
    ODSContractsFRANSHIZ: TFloatField;
    ODSContractsTARIFF: TFloatField;
    ODSContractsSTATE: TIntegerField;
    ODSContractsAGENT_ID: TFloatField;
    ODSContractsBEN_ID: TFloatField;
    ODSContractsBENEFICIARY: TWideStringField;
    ODSContractsCONDITIONS: TWideStringField;
    DSContracts: TDataSource;
    DSMotorkasco: TDataSource;
    ODSMotorkasko: TOracleDataSet;
    ODSMotorkaskoID: TFloatField;
    ODSMotorkaskoCID: TFloatField;
    ODSMotorkaskoINSUREDTYPE: TWideStringField;
    ODSMotorkaskoINSUREDCOLOR: TWideStringField;
    ODSMotorkaskoINSUREDOUTPUTYEAR: TIntegerField;
    ODSMotorkaskoINSUREDSTATENUM: TWideStringField;
    ODSMotorkaskoUNDERFRAMENUM: TWideStringField;
    ODSMotorkaskoINSUREDBANNUM: TWideStringField;
    ODSMotorkaskoINSUREDENGINENUM: TWideStringField;
    ODSMotorkaskoDRIVECOST: TFloatField;
    ODSMotorkaskoBEGINDATE: TDateTimeField;
    ODSMotorkaskoENDDATE: TDateTimeField;
    ODSMotorkaskoTYPEID: TIntegerField;
    ODSMotorkaskoCLOSE_PREFIX: TIntegerField;
    ODSMotorkaskoBANK_ID: TFloatField;
    ODSMotorkaskoMONTH_ID: TFloatField;
    ODSMotorkaskoINSUREDMARK: TWideStringField;
    ODSMotorkaskoINSUREDMODEL: TWideStringField;
    ODSMotorkaskoCLAIM_DATE: TDateTimeField;
    ODSMotorkaskoCLAIM_NUM: TWideStringField;
    ODSMotorkaskoAREA: TWideStringField;
    ODSMotorkaskoACT_NUM: TWideStringField;
    ODSMotorkaskoFRANSHIZ: TFloatField;
    ODSMotorkaskoTARIFF: TFloatField;
    ODSMotorkaskoINSSUMM: TFloatField;
    ODSMotorkaskoAMMOUNT: TFloatField;
    ODSMotorkaskoNOTES: TWideStringField;
    ODSMotorkaskoEXTRAFRANSHIZ: TWideStringField;
    ODSMotorkaskoMARKA_ID: TFloatField;
    ODSMotorkaskoMODEL_ID: TFloatField;
    ODSMotorkaskoCOLOR_ID: TFloatField;
    ODSMotorkaskoINSUREDTYPE_ID: TFloatField;
    DSCusts: TDataSource;
    ODSCusts: TOracleDataSet;
    ODSCustsID: TIntegerField;
    ODSCustsNAME: TWideStringField;
    ODSCustsADDRESS: TWideStringField;
    ODSCustsINSURED_TYPEID: TIntegerField;
    OPCOMMON: TOraclePackage;
    ODSClaimDescriptionMK_ID: TFloatField;
    ODSClaimDescriptionCID: TFloatField;
    ODSClaimSalDESC_ID: TFloatField;
    ODSClaimsDESC_ID: TFloatField;
    DSAutoTypes: TDataSource;
    ODSAutoTypes: TOracleDataSet;
    ODSAutoTypesID: TFloatField;
    ODSAutoTypesNAME: TWideStringField;
    DSAutoColors: TDataSource;
    ODSAutoColors: TOracleDataSet;
    DSRcities: TDataSource;
    DScities: TOracleDataSet;
    DScitiesID: TFloatField;
    DScitiesCOUNTRY_ID: TFloatField;
    DScitiesCITY_NAME: TWideStringField;
    DScitiesPHONE_CODE: TIntegerField;
    DsRmain: TDataSource;
    Dsmain: TOracleDataSet;
    DsmainID: TFloatField;
    DsmainCID: TFloatField;
    DsmainPERSON: TWideStringField;
    DsmainSTATENUM: TWideStringField;
    DsmainMARK: TWideStringField;
    DsmainMODEL: TWideStringField;
    DsmainDETAIL: TWideStringField;
    DSMaincount: TOracleDataSet;
    OracleDataSet2: TOracleDataSet;
    ODSMarks: TOracleDataSet;
    ODSModels: TOracleDataSet;
    ODSClaimDescriptionMARK: TWideStringField;
    ODSClaimDescriptionMODEL: TWideStringField;
    ODSClaimDescriptionMODELID: TFloatField;
    ODSClaimDescriptionMARKAID: TFloatField;
    dsmodel: TOracleDataSet;
    dsmarka: TOracleDataSet;
    dsmarkaID: TFloatField;
    dsmarkaNAME: TWideStringField;
    dsmarkaSTATE_ID: TFloatField;
    dsmarkaCALCOPTIONS: TIntegerField;
    dsmodelID: TFloatField;
    dsmodelNAME: TWideStringField;
    dsmodelMARK_ID: TFloatField;
    dsmodelCALCOPTIONS: TIntegerField;
    ODSMarksID: TFloatField;
    ODSMarksNAME: TWideStringField;
    ODSMarksSTATE_ID: TFloatField;
    ODSMarksCALCOPTIONS: TIntegerField;
    ODSModelsID: TFloatField;
    ODSModelsNAME: TWideStringField;
    ODSModelsMARK_ID: TFloatField;
    ODSModelsCALCOPTIONS: TIntegerField;
    DsmainCLAIM_NUM: TWideStringField;
    DsmainCLAIM_DATE: TDateTimeField;
    ODSClaimDescriptionCLAIM_NUM: TWideStringField;
    ODSClaimDescriptionCLAIM_DATE: TDateTimeField;
    ODSClaimDescriptionSUBRAQASIYA: TFloatField;
    DScontr_type: TOracleDataSet;
    DScontr_typeID: TFloatField;
    DScontr_typeTYPE_ID: TFloatField;
    DSRclaim_status: TDataSource;
    DSclaim_status: TOracleDataSet;
    DSclaim_statusID: TFloatField;
    DSclaim_statusDEP_ID: TFloatField;
    DSclaim_statusSTATUS: TFloatField;
    DSclaim_statusSTAGE_FORMA4: TFloatField;
    DSclaim_statusSTAGE_BANKIN_CAVABI: TFloatField;
    DSclaim_statusSTAGE_QARSI_TEREF_QIYMCAVAB: TFloatField;
    DSclaim_statusSTAGE_QUSUR_AKTI: TFloatField;
    DSclaim_statusSTAGE_YOXLAMA: TFloatField;
    DSclaim_statusSTAGE_MURACIET: TFloatField;
    DSclaim_statusSTAGE_OK_VERILIB: TFloatField;
    DSclaim_statusSTAGE_TESDIQ: TFloatField;
    DSMaincountSAY: TFloatField;
    DSRins_dict_employee_acc: TDataSource;
    DSins_dict_employee_acc: TOracleDataSet;
    DSins_dict_employee_accID: TFloatField;
    DSins_dict_employee_accNAME: TWideStringField;
    DSRService: TDataSource;
    DSService: TOracleDataSet;
    DSServiceID: TFloatField;
    DSServiceNAME: TWideStringField;
    ODSClaimDescriptionEMPL_ACC: TFloatField;
    ODSClaimDescriptionPROBEG: TFloatField;
    ODSClaimDescriptionUTO_TRANSPORTATION_COSTS: TFloatField;
    ODSClaimDescriptionFINAL_AMOUNT_LOSS: TFloatField;
    ODSClaimDescriptionAUTO_ASSESS_COSTS: TFloatField;
    ODSClaimDescriptionVALUE_NEW_SPARE_PARTS: TFloatField;
    ODSClaimDescriptionOTHER_COSTS: TFloatField;
    ODSClaimDescriptionMANAGEMENT_RIGHTS: TWideStringField;
    ODSClaimDescriptionINS_AGAINST_ORGANIZATION: TFloatField;
    ODSClaimDescriptionINS_AGAINST_POLISN_DAT: TWideStringField;
    ODSClaimDescriptionEVENT_PUB_AUTHORITY_REG: TWideStringField;
    DScompanes: TOracleDataSet;
    DSRcompanes: TDataSource;
    ODSClaimDescriptionAUTO_REAL_MARKET_VALUE: TFloatField;
    ODSClaimDescriptionREMAINS_VALUE: TFloatField;
    ODSClaimDescriptionBANK_ACCNO: TWideStringField;
    DSclaim_statusSTAGE_FORMA4_DAT: TDateTimeField;
    DSclaim_statusSTAGE_BANKIN_CAVABI_DAT: TDateTimeField;
    DSclaim_statusSTAGE_QARSI_TEREF_QCAVAB_DAT: TDateTimeField;
    DSclaim_statusSTAGE_QUSUR_AKTI_DAT: TDateTimeField;
    DSclaim_statusSTAGE_YOXLAMA_DAT: TDateTimeField;
    DSclaim_statusSTAGE_MURACIET_DAT: TDateTimeField;
    DSclaim_statusSTAGE_OK_VERILIB_DAT: TDateTimeField;
    DSclaim_statusSTAGE_TESDIQ_DAT: TDateTimeField;
    ODSClaimDescriptionTYPE: TFloatField;
    ODSClaimDescriptionC_TYPE: TFloatField;
    DSmesuli: TOracleDataSet;
    DSmesuliID: TFloatField;
    DSmesuliTYPEID: TFloatField;
    DSmesuliCID: TFloatField;
    DSmesuliCLOSE_PREFIX: TFloatField;
    DSmesuliRESP_AMMOUNT: TFloatField;
    DSmesuliRESP_PREMIUM: TFloatField;
    DSmesuliRESP_PILISNUM: TWideStringField;
    DSmesuliRESP_CID: TFloatField;
    DSFqeza: TOracleDataSet;
    DSFqezaID: TFloatField;
    DSFqezaTYPEID: TFloatField;
    DSFqezaCID: TFloatField;
    DSFqezaPERSONAL_COUNT: TFloatField;
    DSFqezaONE_ACCIDENT_AMOUNT: TFloatField;
    DSFqezaONE_ACCIDENT_EVENT_AMOUNT: TFloatField;
    DSFqezaONE_MAX_MED_EXPENSES: TFloatField;
    DSFqezaONEINSEVENT_MAX_MED_EXPENSES: TFloatField;
    DSFqezaINS_PREMIUM: TFloatField;
    DSFqezaACCIDENT_POLISNUM: TWideStringField;
    DSFqezaACCIDENT_CID: TFloatField;
    DSRFqeza: TDataSource;
    DSRmesuli: TDataSource;
    DSRother_Claim: TDataSource;
    DSother_Claim: TOracleDataSet;
    DSother_ClaimID: TFloatField;
    DSother_ClaimDEP_ID: TFloatField;
    DSother_ClaimDESCRIPTION: TWideStringField;
    ODSClaimDescriptionCLAIM_STATUS: TFloatField;
    DSRdriver: TDataSource;
    DSdriver: TOracleDataSet;
    ODSClaimDescriptionDRIVER: TWideStringField;
    DSRALLMain: TDataSource;
    DSALLMain: TOracleDataSet;
    DSALLMainINSNAME: TWideStringField;
    DSALLMainCUSTNAME: TWideStringField;
    DSALLMainPOLICY_NUM: TWideStringField;
    DSALLMainCLAIM_NUM: TWideStringField;
    DSALLMainCLAIM_DATE: TDateTimeField;
    DSALLMainFINAL_AMOUNT_LOSS: TFloatField;
    DSALLMainKLI_ID: TFloatField;
    DSALLMainTYPE: TFloatField;
    DSALLMainID: TFloatField;
    DSALLMainCID: TFloatField;
    DSALLRins_type: TDataSource;
    DSALLins_type: TOracleDataSet;
    DSALLins_typeID: TIntegerField;
    DSALLins_typeNAME: TWideStringField;
    DSALLins_typeMAINFORMNAME: TWideStringField;
    DSALLins_typeMAINFORMGUID: TWideStringField;
    DSALLins_typeCHANGEGUID: TWideStringField;
    DSALLins_typeSUGGESTIONGUID: TWideStringField;
    DSALLins_typePOLICYGUID: TWideStringField;
    DSALLins_typeLOAN_BAL_CN: TFloatField;
    DSALLins_typeCURR_BAL_CN: TFloatField;
    DSALLins_typePREFIX: TWideStringField;
    DSALLins_typePROFIT_ACC_ID: TFloatField;
    DSALLins_typeOBEYKT_TYPE: TWideStringField;
    DSALLCust: TOracleDataSet;
    DSRALLCust: TDataSource;
    DSALLCustID: TIntegerField;
    DSALLCustOP_ID: TFloatField;
    DSALLCustOPEN_DAT: TDateTimeField;
    DSALLCustCLOSE_DAT: TDateTimeField;
    DSALLCustNEREZIDENT: TFloatField;
    DSALLCustPRINAD_KOD: TFloatField;
    DSALLCustNAME: TWideStringField;
    DSALLCustSHORT_NAME: TWideStringField;
    DSALLCustGROUP_KLIE: TFloatField;
    DSALLCustVID_SOB: TFloatField;
    DSALLCustORG_SOB: TFloatField;
    DSALLCustSFERA_DEY: TFloatField;
    DSALLCustOTRASL: TFloatField;
    DSALLCustNALOG_KOD: TFloatField;
    DSALLCustKOD_OKPRO: TWideStringField;
    DSALLCustINN: TWideStringField;
    DSALLCustDAT_NAL: TDateTimeField;
    DSALLCustDAT_USTAV: TDateTimeField;
    DSALLCustBIK: TWideStringField;
    DSALLCustOTV_LICO: TWideStringField;
    DSALLCustOTV_PASSPORT: TWideStringField;
    DSALLCustOTV_ISSUED: TWideStringField;
    DSALLCustOTV_ISDATE: TDateTimeField;
    DSALLCustOLD_INN: TFloatField;
    DSALLCustCUST_TYPE: TIntegerField;
    DSALLCustCATEGORY: TFloatField;
    DSALLCustINCORPORATION_NUMBER: TWideStringField;
    DSALLCustTPH_CONTACT_TYPE: TWideStringField;
    DSALLCustTPH_COMMUNICATION_TYPE: TWideStringField;
    DSALLCustTPH_NUMBER: TWideStringField;
    DSALLCustADDRESS_TYPE: TWideStringField;
    DSALLCustADDRESS: TWideStringField;
    DSALLCustCITY: TWideStringField;
    DSALLCustCOUNTRY_CODE: TWideStringField;
    DSALLCustDIRECTOR_ID: TFloatField;
    DSALLCustEMAIL: TWideStringField;
    DSALLCustURL: TWideStringField;
    DSALLCustINCORPORATION_STATE: TWideStringField;
    DSALLCustINCORPORATION_CNTR: TWideStringField;
    DSALLCustTPH_EXTENSION: TWideStringField;
    DSALLCustTPH_ZIP: TWideStringField;
    DSALLCustTPH_COUNTRY_PREFIX: TWideStringField;
    DSALLCustTPH_STATE: TWideStringField;
    DSALLCustRISK_CATEG: TFloatField;
    DSALLCustCUST_JUR: TIntegerField;
    DSALLCustCUST_PHYS: TIntegerField;
    DSALLCustCUST_FS: TIntegerField;
    DSALLCustRISKDESCID: TFloatField;
    DSALLCustSAMELYDATE: TDateTimeField;
    DSALLMainCount: TOracleDataSet;
    DSRALLMainCount: TDataSource;
    DSALLMainCountSAY: TFloatField;
    DSALLMainSTATUS: TFloatField;
    DsmainPOLICY_NUM: TWideStringField;
    DsmainFINAL_AMOUNT_LOSS: TFloatField;
    DSRclaimmed: TDataSource;
    DSclaimmed: TOracleDataSet;
    DSclaimmedID: TFloatField;
    DSclaimmedCID: TFloatField;
    DSclaimmedDEP_ID: TFloatField;
    DSclaimmedAMOUNT_MEDICAL_SERVICES: TFloatField;
    DSclaimmedAMOUNT_MEDICINE_USED: TFloatField;
    DSclaimmedAMOUNT_SERVICE_STOMOTALOJI: TFloatField;
    DSclaimmedA_S_A: TWideStringField;
    DSclaimmedA_S_A_ID: TFloatField;
    DSclaimmedMEDICAL_ESTABLISHMENTS: TFloatField;
    DSmedinstitution: TOracleDataSet;
    DSEmploes: TOracleDataSet;
    DSRmedinstitution: TDataSource;
    DSREmploes: TDataSource;
    DSEmploesID: TIntegerField;
    DSEmploesMED_ID: TIntegerField;
    DSEmploesNAME1: TWideStringField;
    DSPrintBank: TOracleDataSet;
    DSPrintBankCLAIM_DATE: TDateTimeField;
    DSPrintBankSTAGE_BANKIN_CAVABI_DAT: TDateTimeField;
    DSPrintBankBENEFICIARY: TWideStringField;
    DSPrintBankNAME1: TWideStringField;
    DSPrintBankINSUREDSTATENUM: TWideStringField;
    DSPrintBankINSUREDMARK: TWideStringField;
    DSSorgu: TOracleDataSet;
    DSSorguCLAIM_DATE: TDateTimeField;
    DSSorguSTAGE_FORMA4_DAT: TDateTimeField;
    DSSorguBENEFICIARY: TWideStringField;
    DSSorguINSUREDSTATENUM: TWideStringField;
    DSSorguMARKA: TWideStringField;
    DSSorguREGION: TWideStringField;
    DSSorguNAME1: TWideStringField;
    DSSigortaAkt: TOracleDataSet;
    DSSigortaAktPOLICY_NUM: TWideStringField;
    DSSigortaAktNAME1: TWideStringField;
    DSSigortaAktDRIVER: TWideStringField;
    DSSigortaAktMARKA: TWideStringField;
    DSSigortaAktINSUREDSTATENUM: TWideStringField;
    DSSigortaAktSASSI: TWideStringField;
    DSSigortaAktINSUREDENGINENUM: TWideStringField;
    DSSigortaAktQEZAEMEKTASI: TWideStringField;
    DSSigortaAktTARIX: TWideStringField;
    DSSigortaAktINSSUMM: TFloatField;
    DSSigortaAktSAY: TFloatField;
    DSSigortaAktSAYYAZI: TWideStringField;
    DSSigortaAktAVTODEYER: TFloatField;
    DSSigortaAktYENI_E_DEYERI: TFloatField;
    DSSigortaAktFRANSHIZ: TFloatField;
    DSSigortaAktCLAIM_DATE: TDateTimeField;
    DSSigortaAktUNVAN: TWideStringField;
    DSSigortaAktDETAIL: TWideStringField;
    DSSigortaAktTEXSIRLISEXS: TWideStringField;
    DSSigortaAktIDAREETMEHUQUQU: TWideStringField;
    DSSigortaAktSERVIS: TWideStringField;
    DSSigortaAktAUTO_ASSESS_COSTS: TFloatField;
    DSSigortaAktUTO_TRANSPORTATION_COSTS: TFloatField;
    DSSigortaAktOTHER_COSTS: TFloatField;
    DSSigortaAktFINAL_AMOUNT_LOSS: TFloatField;
    DSSigortaAktCUSTNAME: TWideStringField;
    DSSigortaAktQARSI_TEREF_S_TESKILAT: TWideStringField;
    DSSigortaAktINS_AGAINST_POLISN_DAT: TWideStringField;
    DSSigortaAktZERER: TWideStringField;
    DSSigortaAktREALBAZARDEYERI: TFloatField;
    DSSigortaAktQALIQ: TFloatField;
    DSSigortaAktHESB: TWideStringField;
    DSSigortaAktODENISMEBLEGI: TFloatField;
    ODSClaimDescriptionFINAL_PAYMENT_AMOUNT_LOSS: TFloatField;
    DSclaimmedPROVISION: TFloatField;
    ODSContractsPNUM: TFloatField;
    ODSContractsSUGNUM: TWideStringField;
    ODSContractsBLANK_ID: TFloatField;
    ODSContractsOP_ID: TFloatField;
    ODSContractsREINS: TFloatField;
    ODSContractsCHKASKO: TFloatField;
    ODSContractsCHM: TFloatField;
    ODSContractsCHFQ: TFloatField;
    ODSContractsCOMMITOP_ID: TFloatField;
    ODSContractsCOMMIT_DATE: TDateTimeField;
    ODSContractsCANCELOPID: TFloatField;
    ODSContractsCANCELDATE: TDateTimeField;
    DSclaim_statusTRID: TFloatField;
    DsmainSTAGE_TESDIQ_DAT: TDateTimeField;
    DSALLMainROWID: TStringField;
    DSALLMainASFINAL_PAYMENT_AMOUNT_LOSS: TFloatField;
    DSSigortaAktFINAL_PAYMENT_AMOUNT_LOSS: TFloatField;
    DSRClaimCargo: TDataSource;
    DSClaimCargo: TOracleDataSet;
    DSClaimCargoID: TFloatField;
    DSClaimCargoCARGO_NAME_SORT: TWideStringField;
    DSClaimCargoCARGO_INFO: TWideStringField;
    DSClaimCargoCID: TFloatField;
    DSClaimCargoDEP_ID: TFloatField;
    ODSClaimDescriptionAMORTIZASIYA_AMMOUNT: TFloatField;
    sb_aca: TOraclePackage;
    DSPaymentLossReal: TOracleDataSet;
    DSPaymentLossRealID: TFloatField;
    DSPaymentLossRealCID: TFloatField;
    DSPaymentLossRealTRAID: TFloatField;
    DSPaymentLossRealPAYDATE: TDateTimeField;
    DSPaymentLossRealNAME: TWideStringField;
    DSPaymentLossRealMEBLEG: TFloatField;
    DSALLMainSTATE: TIntegerField;
    ODSClaimDescriptionEKSPERTIZA_AMOUNT: TFloatField;
    ODSClaimDescriptionAPPROXIMATE_AMMOUNT: TFloatField;
    ODSClaimDescriptionOTHER_DRIVER: TFloatField;
    DSALLMainSTATUSU: TWideStringField;
    DSRAlldict_emp_acc: TDataSource;
    DSAlldict_emp_acc: TOracleDataSet;
    DSAlldict_emp_accID: TFloatField;
    DSAlldict_emp_accNAME: TWideStringField;
    DSALLMainEMPL_ACC: TFloatField;
    ODSClaimDescriptionREFUSAL_AMMOUNT: TFloatField;
    ODSClaimDescriptionREFUSAL_DATE: TDateTimeField;
    ODSClaimDescriptionREFUSAL_DESCRIPTION: TWideStringField;
    DsmainREFUSAL_DATE: TDateTimeField;
    DsmainSTATUSU: TWideStringField;
    ODSClaimDescriptionINS_AGAINST_OWNER: TWideStringField;
    ODSMotorkaskoDRIVEINTENDED: TFloatField;
    ODSMotorkaskoNUMSEATS: TFloatField;
    DSReins: TOracleDataSet;
    DSReinsSAY: TFloatField;
    DSlosspayment: TOracleDataSet;
    DSlosspaymentSAY: TFloatField;
    DSLossBarderoSay: TOracleDataSet;
    DSLossBarderoSaySAY: TFloatField;
    DSALLMainSUBRAQASIYA: TFloatField;
    DSALLMainINSUREDSTATENUM: TWideStringField;
    ODSMotorkaskoENGINE_SIZE: TFloatField;
    ODSMotorkaskoENGINE_TYPE: TFloatField;
    amartizator: TOraclePackage;
    DSFarnsiza: TOracleDataSet;
    DSFarnsizaFRANSIZA: TFloatField;
    DsmainSTAGE_TESDIQ: TFloatField;
    DsmainSTATUS: TFloatField;
    ins_claim_desc: TOracleDataSet;
    ins_claim_descID: TFloatField;
    ins_claim_descREGION: TWideStringField;
    ins_claim_descSTREET: TWideStringField;
    ins_claim_descDETAIL: TWideStringField;
    ins_claim_descPERSON: TWideStringField;
    ins_claim_descMARK: TWideStringField;
    ins_claim_descSTATENUM: TWideStringField;
    ins_claim_descAVTOSERVIS: TWideStringField;
    ins_claim_descMODEL: TWideStringField;
    ins_claim_descAPPDATE: TDateTimeField;
    ins_claim_descLETTERDATE: TDateTimeField;
    ins_claim_descLETTERNUM: TWideStringField;
    ins_claim_descSPRNUM: TWideStringField;
    ins_claim_descPRTNUM: TWideStringField;
    ins_claim_descACTDATE: TDateTimeField;
    ins_claim_descMK_ID: TFloatField;
    ins_claim_descCID: TFloatField;
    ins_claim_descMODELID: TFloatField;
    ins_claim_descMARKAID: TFloatField;
    ins_claim_descCLAIM_NUM: TWideStringField;
    ins_claim_descCLAIM_DATE: TDateTimeField;
    ins_claim_descSUBRAQASIYA: TFloatField;
    ins_claim_descEMPL_ACC: TFloatField;
    ins_claim_descPROBEG: TFloatField;
    ins_claim_descUTO_TRANSPORTATION_COSTS: TFloatField;
    ins_claim_descFINAL_AMOUNT_LOSS: TFloatField;
    ins_claim_descAUTO_ASSESS_COSTS: TFloatField;
    ins_claim_descVALUE_NEW_SPARE_PARTS: TFloatField;
    ins_claim_descOTHER_COSTS: TFloatField;
    ins_claim_descMANAGEMENT_RIGHTS: TWideStringField;
    ins_claim_descINS_AGAINST_ORGANIZATION: TFloatField;
    ins_claim_descINS_AGAINST_POLISN_DAT: TWideStringField;
    ins_claim_descEVENT_PUB_AUTHORITY_REG: TWideStringField;
    ins_claim_descAUTO_REAL_MARKET_VALUE: TFloatField;
    ins_claim_descREMAINS_VALUE: TFloatField;
    ins_claim_descBANK_ACCNO: TWideStringField;
    ins_claim_descTYPE: TFloatField;
    ins_claim_descC_TYPE: TFloatField;
    ins_claim_descCLAIM_STATUS: TFloatField;
    ins_claim_descDRIVER: TWideStringField;
    ins_claim_descFINAL_PAYMENT_AMOUNT_LOSS: TFloatField;
    ins_claim_descAMORTIZASIYA_AMMOUNT: TFloatField;
    ins_claim_descEKSPERTIZA_AMOUNT: TFloatField;
    ins_claim_descAPPROXIMATE_AMMOUNT: TFloatField;
    ins_claim_descOTHER_DRIVER: TFloatField;
    ins_claim_descREFUSAL_AMMOUNT: TFloatField;
    ins_claim_descREFUSAL_DATE: TDateTimeField;
    ins_claim_descREFUSAL_DESCRIPTION: TWideStringField;
    ins_claim_descINS_AGAINST_OWNER: TWideStringField;
    DSSigortaAktAMORTIZASIYA_AMMOUNT: TFloatField;
    DSSigortaAktBAREDINDE_REQ_TELE_SURU_WEXS: TWideStringField;
    DSSigortaAktAVT_R_DEYER_S_MEBLEQE_NISBETI: TFloatField;
    DSSigortaAktTAM_MEHV_FRANS_MEBLEQI: TFloatField;
    DSSigortaAktEXTRAFRANSHIZ: TWideStringField;
    ODSClaimDescriptionREFUSAL_LETTER_NUM: TWideStringField;
    DSclaim_statusUSER: TWideStringField;
    ODSClaimDescriptionSUBRAQASIYA1: TFloatField;
    subroqas: TOracleDataSet;
    dscsub: TDataSource;

    Procedure DataModuleCreate(Sender: TObject);
    procedure ODSClaimsAfterInsert(DataSet: TDataSet);
    procedure ODSClaimSalAfterInsert(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ODSClaimDescriptionAfterInsert(DataSet: TDataSet);
    procedure DSALLMainAfterScroll(DataSet: TDataSet);
    procedure DsmainAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmLoss: TDmLoss;

implementation

{$R *.dfm}
    uses sboapiDataModuleImpl,CommanParametrs, FrmMainLossImpl, FrmAddLossImpl,
  FrmCargo_claimimpl, FrmAllLossImpl,frmstatusimpl;
procedure TDmLoss.DataModuleCreate(Sender: TObject);
begin
ODSContracts.Close;
ODSContracts.SetVariable('cid',commoncid);
ODSContracts.Open;


ODSMotorkasko.Close;
ODSMotorkasko.SetVariable('cid',commoncid);
ODSMotorkasko.Open;

   DSdriver.close;
   DSdriver.SetVariable('pcid',contactid);
   DSdriver.SetVariable('p_kli_id',ODSContracts.FieldByName('kli_id').AsInteger);
   DSdriver.Open;

   DSins_dict_employee_acc.Open;
   DSService.Open;
   DScompanes.Open;
  DSSysdat.Open;
   DSmedinstitution.Open;
   DSAlldict_emp_acc.Open;





end;

procedure TDmLoss.DataModuleDestroy(Sender: TObject);
begin
   DSins_dict_employee_acc.close;
   DSService.close;
   DScompanes.close;
   DSSysdat.close;
   DSdriver.close;
   DSmedinstitution.close;
   DSAlldict_emp_acc.close;



  // DSALLins_type.close;
  // DSALLCust.close;
end;

procedure TDmLoss.DSALLMainAfterScroll(DataSet: TDataSet);
begin


 DmLoss.DSclaim_status.Close;
 DmLoss.DSclaim_status.SetVariable('pdep_id',FrmAllLoss.XDBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger);
 DmLoss.DSclaim_status.Open;
  DmLoss.DSclaim_status.edit;
 contactid:=FrmAllLoss.XDBGrid1.DataSource.DataSet.FieldByName('cID').AsInteger;
 contractstatus:=FrmAllLoss.XDBGrid1.DataSource.DataSet.FieldByName('state').AsInteger;
    //showmessage(DmLoss.DSclaim_status.FieldByName('status').AsString);
    DmLoss.ODSContracts.Close;
     DmLoss.ODSContracts.SetVariable('cid',contactid);
     DmLoss.ODSContracts.Open;

         ODSClaimDescription.Close;
         ODSClaimDescription.SetVariable('id',FrmAllLoss.XDBGrid1.DataSource.DataSet.FieldByName('id').AsInteger);
         ODSClaimDescription.Open;
         ODSClaimDescription.Edit;
    ////////
 if (DmLoss.DSclaim_status.FieldByName('status').AsInteger=0)or (DmLoss.DSclaim_status.FieldByName('status').AsInteger=2) then
 begin
   FrmAllLoss.XFRadioButton1.Checked:=true;
   FrmAllLoss.XFGroupBox2.Color:=clRed;

 end;

  if DmLoss.DSclaim_status.FieldByName('status').AsInteger=1 then
 begin
   FrmAllLoss.XFRadioButton2.Checked:=true;
   FrmAllLoss.XFGroupBox2.Color:=clRed;
 end;

  if DmLoss.DSclaim_status.FieldByName('status').AsInteger=2 then
 begin
   FrmAllLoss.XFRadioButton3.Checked:=true;
   FrmAllLoss.XFGroupBox2.Color:=clGray;

 end;
         //showmessage(DmLoss.DSclaim_status.FieldByName('status').AsString);

  if FrmAllLoss.XDBGrid1.DataSource.DataSet.RecordCount=0 then
begin
 FrmAllLoss.CheckBox1.Checked:=false;
 FrmAllLoss.CheckBox2.Checked:=false;
 FrmAllLoss.CheckBox3.Checked:=false;
 FrmAllLoss.CheckBox4.Checked:=false;
 FrmAllLoss.CheckBox5.Checked:=false;
 FrmAllLoss.CheckBox6.Checked:=false;
 FrmAllLoss.CheckBox7.Checked:=false;
 FrmAllLoss.CheckBox8.Checked:=false;
end
else
begin

if DmLoss.DSclaim_status.FieldByName('stage_forma4').AsInteger=0 then
begin
FrmAllLoss.CheckBox1.Checked:=false;
FrmAllLoss.DateTimePicker5.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox1.Color:=clRed
end
else
begin
FrmAllLoss.DateTimePicker5.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsDateTime;
FrmAllLoss.CheckBox1.Checked:=true;
FrmAllLoss.CheckBox1.Color:=clGray

end;

if DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi').AsInteger=0 then
begin
FrmAllLoss.DateTimePicker1.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox2.Checked:=false;
FrmAllLoss.CheckBox2.Color:=clRed
end
else
begin
FrmAllLoss.DateTimePicker1.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsDateTime;
FrmAllLoss.CheckBox2.Checked:=true;
FrmAllLoss.CheckBox2.Color:=clGray

end;

if DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qiymcavab').AsInteger=0 then
begin
FrmAllLoss.DateTimePicker6.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox3.Checked:=false;
FrmAllLoss.CheckBox3.Color:=clRed
end
else
begin
FrmAllLoss.DateTimePicker6.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsDateTime;
FrmAllLoss.CheckBox3.Checked:=true;
FrmAllLoss.CheckBox3.Color:=clGray
end;

if DmLoss.DSclaim_status.FieldByName('stage_qusur_akti').AsInteger=0 then
begin
FrmAllLoss.CheckBox4.Checked:=false;
 FrmAllLoss.DateTimePicker2.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox4.Color:=clRed
end
else
begin
FrmAllLoss.CheckBox4.Checked:=true;
FrmAllLoss.DateTimePicker2.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsDateTime;
FrmAllLoss.CheckBox4.Color:=clGray
end;
if DmLoss.DSclaim_status.FieldByName('stage_yoxlama').AsInteger=0 then
begin
FrmAllLoss.CheckBox5.Checked:=false;
   FrmAllLoss.DateTimePicker7.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox5.Color:=clRed
end
else
begin
   FrmAllLoss.DateTimePicker7.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsDateTime;
FrmAllLoss.CheckBox5.Checked:=true;
FrmAllLoss.CheckBox5.Color:=clGray
end;

if DmLoss.DSclaim_status.FieldByName('stage_muraciet').AsInteger=0 then
begin
FrmAllLoss.CheckBox6.Checked:=false;
   FrmAllLoss.DateTimePicker3.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox6.Color:=clRed
end
else
begin
FrmAllLoss.CheckBox6.Checked:=true;
FrmAllLoss.CheckBox6.Color:=clGray;
   FrmAllLoss.DateTimePicker3.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsDateTime;
end;
if DmLoss.DSclaim_status.FieldByName('stage_ok_verilib').AsInteger=0 then
begin
FrmAllLoss.CheckBox7.Checked:=false ;
 FrmAllLoss.DateTimePicker8.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox7.Color:=clRed
end
else
begin
FrmAllLoss.CheckBox7.Checked:=true;
FrmAllLoss.CheckBox7.Color:=clGray ;
   FrmAllLoss.DateTimePicker8.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsDateTime;
end;

if DmLoss.DSclaim_status.FieldByName('stage_tesdiq').AsInteger=0 then
begin
FrmAllLoss.CheckBox8.Checked:=false;
   FrmAllLoss.DateTimePicker4.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmAllLoss.CheckBox8.Color:=clRed;
   FrmAllLoss.XFButton6.Enabled:=true;
end
else
begin
FrmAllLoss.CheckBox8.Checked:=true;
FrmAllLoss.CheckBox8.Color:=clGray  ;
   FrmAllLoss.DateTimePicker4.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime;
   FrmAllLoss.XFButton6.Enabled:=false;
end;


end;


if DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsString='30.12.1899' then
   FrmAllLoss.DateTimePicker5.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker5.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsDateTime;

     //showmessage(DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsString);

   if DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsString='' then
   FrmAllLoss.DateTimePicker1.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker1.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsString='' then
   FrmAllLoss.DateTimePicker6.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker6.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsDateTime;


   if DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsString='' then
   FrmAllLoss.DateTimePicker2.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker2.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsDateTime;


   if DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsString='' then
   FrmAllLoss.DateTimePicker7.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker7.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsString='' then
   FrmAllLoss.DateTimePicker3.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker3.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsString='' then
   FrmAllLoss.DateTimePicker8.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker8.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsString='' then
   FrmAllLoss.DateTimePicker4.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmAllLoss.DateTimePicker4.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime;


                  {  if  DSclaim_status.FieldByName('STATUS').AsInteger=2 then
                 begin
                   FrmAllLoss.XFGroupBox1.Enabled:=true;
                 end
                 else
                 FrmAllLoss.XFGroupBox1.Enabled:=false;     }

   if (DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime>
DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime)
and (DmLoss.DSclaim_status.FieldByName('stage_tesdiq').AsInteger=1) then
begin
    FrmAllLoss.XFPanel3.Enabled:=false;
end
else
begin
    FrmAllLoss.XFPanel3.Enabled:=true;
end;
end;

procedure TDmLoss.DsmainAfterScroll(DataSet: TDataSet);
begin

DmLoss.DScontr_type.close;
DmLoss.DScontr_type.SetVariable('pid',commoncid);
DmLoss.DScontr_type.OPEN;

 DmLoss.DSclaim_status.Close;
 DmLoss.DSclaim_status.SetVariable('pdep_id',FrmMainLoss.XDBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger);
 DmLoss.DSclaim_status.Open;

DmLoss.DSMaincount.Close;
DmLoss.DSMaincount.SetVariable('p_cid',commoncid);
DmLoss.DSMaincount.Open;


 if (DmLoss.DSclaim_status.FieldByName('status').AsInteger=0) or (DmLoss.DSclaim_status.FieldByName('status').AsInteger=2)then
 begin
   FrmMainLoss.XFRadioButton1.Checked:=true;
   FrmMainLoss.XFGroupBox2.Color:=clRed;

 end;

  if DmLoss.DSclaim_status.FieldByName('status').AsInteger=1 then
 begin
   FrmMainLoss.XFRadioButton2.Checked:=true;
   FrmMainLoss.XFGroupBox2.Color:=clRed;
 end;

  if DmLoss.DSclaim_status.FieldByName('status').AsInteger=2 then
 begin
   FrmMainLoss.XFRadioButton3.Checked:=true;
   FrmMainLoss.XFGroupBox2.Color:=clGray;
 end;


  if DmLoss.DSMaincount.FieldByName('say').AsInteger=0 then
begin
 FrmMainLoss.CheckBox1.Checked:=false;
 FrmMainLoss.CheckBox2.Checked:=false;
 FrmMainLoss.CheckBox3.Checked:=false;
 FrmMainLoss.CheckBox4.Checked:=false;
 FrmMainLoss.CheckBox5.Checked:=false;
 FrmMainLoss.CheckBox6.Checked:=false;
 FrmMainLoss.CheckBox7.Checked:=false;
 FrmMainLoss.CheckBox8.Checked:=false;
end
else
begin

if DmLoss.DSclaim_status.FieldByName('stage_forma4').AsInteger=0 then
begin
FrmMainLoss.CheckBox1.Checked:=false;
FrmMainLoss.DateTimePicker5.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox1.Color:=clRed
end
else
begin
FrmMainLoss.DateTimePicker5.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsDateTime;
FrmMainLoss.CheckBox1.Checked:=true;
FrmMainLoss.CheckBox1.Color:=clGray

end;

if DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi').AsInteger=0 then
begin
FrmMainLoss.DateTimePicker1.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox2.Checked:=false;
FrmMainLoss.CheckBox2.Color:=clRed
end
else
begin
FrmMainLoss.DateTimePicker1.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsDateTime;
FrmMainLoss.CheckBox2.Checked:=true;
FrmMainLoss.CheckBox2.Color:=clGray

end;

if DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qiymcavab').AsInteger=0 then
begin
FrmMainLoss.DateTimePicker6.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox3.Checked:=false;
FrmMainLoss.CheckBox3.Color:=clRed
end
else
begin
FrmMainLoss.DateTimePicker6.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsDateTime;
FrmMainLoss.CheckBox3.Checked:=true;
FrmMainLoss.CheckBox3.Color:=clGray
end;

if DmLoss.DSclaim_status.FieldByName('stage_qusur_akti').AsInteger=0 then
begin
FrmMainLoss.CheckBox4.Checked:=false;
 FrmMainLoss.DateTimePicker2.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox4.Color:=clRed
end
else
begin
FrmMainLoss.CheckBox4.Checked:=true;
FrmMainLoss.DateTimePicker2.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsDateTime;
FrmMainLoss.CheckBox4.Color:=clGray
end;
if DmLoss.DSclaim_status.FieldByName('stage_yoxlama').AsInteger=0 then
begin
FrmMainLoss.CheckBox5.Checked:=false;
   FrmMainLoss.DateTimePicker7.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox5.Color:=clRed
end
else
begin
   FrmMainLoss.DateTimePicker7.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsDateTime;
FrmMainLoss.CheckBox5.Checked:=true;
FrmMainLoss.CheckBox5.Color:=clGray
end;

if DmLoss.DSclaim_status.FieldByName('stage_muraciet').AsInteger=0 then
begin
FrmMainLoss.CheckBox6.Checked:=false;
   FrmMainLoss.DateTimePicker3.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox6.Color:=clRed
end
else
begin
FrmMainLoss.CheckBox6.Checked:=true;
FrmMainLoss.CheckBox6.Color:=clGray;
   FrmMainLoss.DateTimePicker3.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsDateTime;
end;
if DmLoss.DSclaim_status.FieldByName('stage_ok_verilib').AsInteger=0 then
begin
FrmMainLoss.CheckBox7.Checked:=false ;
 FrmMainLoss.DateTimePicker8.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox7.Color:=clRed
end
else
begin
FrmMainLoss.CheckBox7.Checked:=true;
FrmMainLoss.CheckBox7.Color:=clGray ;
   FrmMainLoss.DateTimePicker8.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsDateTime;
end;

if DmLoss.DSclaim_status.FieldByName('stage_tesdiq').AsInteger=0 then
begin
FrmMainLoss.CheckBox8.Checked:=false;
   FrmMainLoss.DateTimePicker4.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime;
FrmMainLoss.CheckBox8.Color:=clRed
end
else
begin
FrmMainLoss.CheckBox8.Checked:=true;
FrmMainLoss.CheckBox8.Color:=clGray  ;
   FrmMainLoss.DateTimePicker4.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime;
end;


end;

if DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsString='' then
   FrmMainLoss.DateTimePicker5.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker5.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_forma4_dat').AsDateTime;

     //showmessage(DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsString);

   if DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsString='' then
   FrmMainLoss.DateTimePicker1.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker1.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_bankin_cavabi_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsString='' then
   FrmMainLoss.DateTimePicker6.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker6.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qarsi_teref_qcavab_dat').AsDateTime;


   if DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsString='' then
   FrmMainLoss.DateTimePicker2.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker2.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_qusur_akti_dat').AsDateTime;


   if DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsString='' then
   FrmMainLoss.DateTimePicker7.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker7.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_yoxlama_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsString='' then
   FrmMainLoss.DateTimePicker3.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker3.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_muraciet_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsString='' then
   FrmMainLoss.DateTimePicker8.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker8.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_ok_verilib_dat').AsDateTime;

   if DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsString='' then
   FrmMainLoss.DateTimePicker4.DateTime:=DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime
   else
   FrmMainLoss.DateTimePicker4.DateTime:=DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime;


   if (DmLoss.DSSysdat.FieldByName('tek_dat').AsDateTime>
DmLoss.DSclaim_status.FieldByName('stage_tesdiq_dat').AsDateTime)
and (DmLoss.DSclaim_status.FieldByName('stage_tesdiq').AsInteger=1) then
begin
    FrmMainLoss.XFPanel3.Enabled:=false;
end
else
begin
    FrmMainLoss.XFPanel3.Enabled:=true;
end;


end;

procedure TDmLoss.ODSClaimDescriptionAfterInsert(DataSet: TDataSet);

begin



        if FrmMainLoss.ptype='Kasko' then
                begin
        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=4;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=4;


                end;


       if FrmMainLoss.ptype='Fərdi qəza' then
                begin
        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=DmLoss.ODSContracts.FieldByName('type_id').AsInteger;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=1;
        //
                end;


       if FrmMainLoss.ptype='Məsuliyyət' then
                begin

        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=DmLoss.ODSContracts.FieldByName('type_id').AsInteger;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=13;

                end;


       if FrmMainLoss.ptype='Yük' then
                begin


        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=8;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=8;

                end;


          if FrmMainLoss.ptype='Səyahət' then
                begin


        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=21;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=21;

                end;


          if FrmMainLoss.ptype='Əmlak' then
                begin


        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=3;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=3;

                end;

        if FrmMainLoss.ptype='Tibbi' then
                begin


        ODSClaimDescription.FieldByName('C_TYPE').AsInteger:=2;
        ODSClaimDescription.FieldByName('TYPE').AsInteger:=2;

                end;






end;

procedure TDmLoss.ODSClaimsAfterInsert(DataSet: TDataSet);
begin
    ODSClaimsMk_ID.Value:=ODSMotorkaskoId.Value;
    ODSClaimsDESC_ID.Value:=FrmMainLoss.dep_id;
    {if FrmMainLoss.dep_id<>-1 then
     begin
    ODSClaimsDESC_ID.Value:=FrmMainLoss.dep_id;
     end;

     if (FrmMainLoss.dep_id=-1) or (FrmMainLoss.dep_id=0) then
     begin
        FrmAddLoss.BitBtn1Click(Self);
        ODSClaimsDESC_ID.Value:=FrmMainLoss.dep_id;
     end;   }
end;

procedure TDmLoss.ODSClaimSalAfterInsert(DataSet: TDataSet);
begin
ODSClaimSalEID.Value:=ODSMotorkaskoId.Value;
ODSClaimSalDESC_ID.Value:=FrmMainLoss.dep_id;
{if FrmMainLoss.dep_id<>-1 then
     begin
    ODSClaimSalDESC_ID.Value:=FrmMainLoss.dep_id;
     end;

     if (FrmMainLoss.dep_id=-1) or (FrmMainLoss.dep_id=0) then
     begin
        FrmAddLoss.BitBtn1Click(Self);
        ODSClaimSalDESC_ID.Value:=FrmMainLoss.dep_id;
     end;  }
     end;
end.
