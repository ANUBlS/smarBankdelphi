unit ALDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Oracle;

type
  TDataModAL = class(TDataModule)
    ODSLogs: TOracleDataSet;
    ODSModuleLogs: TOracleDataSet;
    ODSUsersLogs: TOracleDataSet;
    ODSClassesLogs: TOracleDataSet;
    OdsGroupsLogs: TOracleDataSet;
    ODSUserGrantsLogs: TOracleDataSet;
    ODSGroupManLogs: TOracleDataSet;
    UserGrants: TDataSource;
    Module: TDataSource;
    Users: TDataSource;
    Classes: TDataSource;
    Groups: TDataSource;
    GroupMan: TDataSource;
    ODSLockedUsers: TOracleDataSet;
    ODSLockedUsersID: TFloatField;
    LockedUsers: TDataSource;
    SB_ADM: TOraclePackage;
    ODSSLLogs: TOracleDataSet;
    SLLog: TDataSource;
    ODSClasNames: TOracleDataSet;
    Classnames: TDataSource;
    ODSClasNamesID: TFloatField;
    ODSLogsID: TFloatField;
    ODSLogsLOGTYPE: TFloatField;
    ODSLogsLOGTP: TWideStringField;
    ODSLogsUSNAME: TWideStringField;
    ODSLogsMODTIME: TDateTimeField;
    ODSLogsMODUSER: TWideStringField;
    ODSLogsMODUL: TWideStringField;
    ODSLogsCINS: TIntegerField;
    ODSLogsCUPD: TIntegerField;
    ODSLogsCDEL: TIntegerField;
    ODSLogsOPER: TIntegerField;
    ODSLogsOPERAT: TWideStringField;
    ODSLogsDESCRIPTION: TWideStringField;
    ODSLogsTRVDESC: TWideStringField;
    ODSLogsADVANCED_GRANTS: TIntegerField;
    ODSLogsOTYPE: TWideStringField;
    ODSLogsOFULLNAME: TWideStringField;
    ODSLogsOPHONE: TWideStringField;
    ODSLogsOCLASSID: TFloatField;
    ODSLogsOFILIALID: TFloatField;
    ODSLogsOADVTYPE: TFloatField;
    ODSLogsOSYSUSERID: TFloatField;
    ODSUserGrantsLogsID: TFloatField;
    ODSUserGrantsLogsLOGTYPE: TFloatField;
    ODSUserGrantsLogsLOGTP: TWideStringField;
    ODSUserGrantsLogsUSNAME: TWideStringField;
    ODSUserGrantsLogsMODTIME: TDateTimeField;
    ODSUserGrantsLogsMODUSER: TWideStringField;
    ODSUserGrantsLogsMODUL: TWideStringField;
    ODSUserGrantsLogsCINS: TWideStringField;
    ODSUserGrantsLogsCUPD: TWideStringField;
    ODSUserGrantsLogsCDEL: TWideStringField;
    ODSUserGrantsLogsOPER: TIntegerField;
    ODSUserGrantsLogsOPERAT: TWideStringField;
    OdsGroupsLogsID: TFloatField;
    OdsGroupsLogsLOGTYPE: TFloatField;
    OdsGroupsLogsLOGTP: TWideStringField;
    OdsGroupsLogsUSNAME: TWideStringField;
    OdsGroupsLogsMODTIME: TDateTimeField;
    OdsGroupsLogsMODUSER: TWideStringField;
    OdsGroupsLogsOPER: TIntegerField;
    OdsGroupsLogsOPERAT: TWideStringField;
    OdsGroupsLogsDESCRIPTION: TWideStringField;
    OdsGroupsLogsOTYPE: TWideStringField;
    OdsGroupsLogsOADVTYPE: TWideStringField;
    ODSClasNamesOBJ: TWideStringField;
    ODSModuleLogsID: TFloatField;
    ODSModuleLogsLOGTYPE: TFloatField;
    ODSModuleLogsLOGTP: TWideStringField;
    ODSModuleLogsUSNAME: TWideStringField;
    ODSModuleLogsMODTIME: TDateTimeField;
    ODSModuleLogsMODUL: TWideStringField;
    ODSModuleLogsCINS: TWideStringField;
    ODSModuleLogsCUPD: TWideStringField;
    ODSModuleLogsCDEL: TWideStringField;
    ODSModuleLogsOPER: TIntegerField;
    ODSModuleLogsOPERAT: TWideStringField;
    ODSModuleLogsDESCRIPTION: TWideStringField;
    ODSModuleLogsTRVDESC: TWideStringField;
    ODSModuleLogsADVANCED_GRANTS: TIntegerField;
    ODSGroupManLogsID: TFloatField;
    ODSGroupManLogsLOGTYPE: TFloatField;
    ODSGroupManLogsLOGTP: TWideStringField;
    ODSGroupManLogsUSNAME: TWideStringField;
    ODSGroupManLogsMODTIME: TDateTimeField;
    ODSGroupManLogsMODUSER: TWideStringField;
    ODSGroupManLogsOPER: TIntegerField;
    ODSGroupManLogsOPERAT: TWideStringField;
    ODSGroupManLogsADVANCED_GRANTS: TIntegerField;
    ODSGroupManLogsOCLASSID: TWideStringField;
    ODSGroupManLogsOADVTYPE: TWideStringField;
    ODSGroupManLogsGRID: TFloatField;
    ODSUsersLogsID: TFloatField;
    ODSUsersLogsLOGTYPE: TFloatField;
    ODSUsersLogsLOGTP: TWideStringField;
    ODSUsersLogsUSNAME: TWideStringField;
    ODSUsersLogsMODTIME: TDateTimeField;
    ODSUsersLogsMODUSER: TWideStringField;
    ODSUsersLogsOPER: TIntegerField;
    ODSUsersLogsOPERAT: TWideStringField;
    ODSUsersLogsDESCRIPTION: TWideStringField;
    ODSUsersLogsOTYPE: TWideStringField;
    ODSUsersLogsOFULLNAME: TWideStringField;
    ODSUsersLogsOPHONE: TWideStringField;
    ODSUsersLogsOCLASSID: TWideStringField;
    ODSUsersLogsOFILIALID: TWideStringField;
    ODSUsersLogsOADVTYPE: TFloatField;
    ODSUsersLogsOSYSUSERID: TFloatField;
    ODSLockedUsersNAME: TWideStringField;
    ODSClassesLogsID: TFloatField;
    ODSClassesLogsLOGTYPE: TFloatField;
    ODSClassesLogsLOGTP: TWideStringField;
    ODSClassesLogsUSNAME: TWideStringField;
    ODSClassesLogsMODTIME: TDateTimeField;
    ODSClassesLogsMODUSER: TWideStringField;
    ODSClassesLogsOPER: TIntegerField;
    ODSClassesLogsOPERAT: TWideStringField;
    ODSClassesLogsOTYPE: TWideStringField;
    ODSSLLogsID: TFloatField;
    ODSSLLogsLOGTYPE: TFloatField;
    ODSSLLogsLOGTP: TWideStringField;
    ODSSLLogsUSNAME: TWideStringField;
    ODSSLLogsMODTIME: TDateTimeField;
    ODSSLLogsMODUSER: TWideStringField;
    ODSSLLogsOPERAT: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModAL: TDataModAL;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

end.
