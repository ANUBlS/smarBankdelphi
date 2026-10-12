unit SBCustomer;

interface

uses Windows;

type
  TCustomer = record
    OperatorID: Integer;
    Name: ShortString;
    ShortName: ShortString;
    OpenDate: TDateTime;
    CloseDate: TDateTime;
    IsResident: Boolean; {!NEREZIDENT}
    RelationID: Integer; {PRINAD_KOD}
    GroupID: Integer; {GROUP_KLIE}
    EstateType: Integer; {VID_SOB}
    OrganizationType: Integer; {ORG_SOB}
    ActionArea: Integer; {SFERA_DEY}
    BranchID: Integer; {OTRASL}
    TaxAreaID: Integer; {NALOG_KOD}
    TaxIDString: ShortString;
    BankIDString: ShortString;
    OKPRO: ShortString;
    GovOfficer: ShortString; {OTV_LICO}
    TaxDepartmentRegDate: TDateTime;
    CapitalRegDate: TDateTime;
    {about 10 items pending}
  end;

  TCustomerInfo = record
    Name: ShortString;
    LastName: ShortString;
    SurName: ShortString;
    BirthDate: TDateTime;
    BirthPlace: ShortString;
    Address: ShortString;
    City: ShortString;
    Country: ShortString;
    WorkPlace: ShortString;
    {phone section will be modified}
    PhoneWork: ShortString;
    PhoneHome: ShortString;
    PhoneCelular: ShortString;

    Email: ShortString;
    Url: ShortString;
    Sign: HBITMAP;
    Photo: HBitmap;
    Recomendation: ShortString;
  end;

function Sb_AddCustomer(const Customer: TCustomer): Integer;
procedure Sb_GetCustomer(ID: Integer; var Customer: TCustomer);
procedure Sb_CloseCustomer(ID: Integer);
procedure Sb_EditCustomer(ID: Integer; const Customer: TCustomer);

function Sb_AddCustomerInfo(CustomerID: Integer; const Info: TCustomerInfo): Integer;
procedure Sb_EditCustomerInfo(ID: Integer; const Info: TCustomerInfo);
function Sb_DropCustomerInfo(ID: Integer): Integer;

implementation

uses sboapiDataModuleImpl, SysUtils, Classes, SBCore, SBSrvIntf;

procedure Sb_GetCustomer(ID: Integer; var Customer: TCustomer);
begin
  with sboapiDataModule.GetCustomer do
  begin
    Close;
    SetVariable('CustomerID', ID);
    Open;

    with Customer do
    begin
      Name := FieldByName('NAME').AsString;
      OpenDate := Trunc(FieldByName('OPEN_DAT').AsDateTime);
      CloseDate := Trunc(FieldByName('CLOSE_DAT').AsDateTime);
      IsResident := FieldByName('NEREZIDENT').AsInteger = 0;
      RelationID := FieldByName('PRINAD_KOD').AsInteger;
      GroupID := FieldByName('GROUP_KLIE').AsInteger;
      EstateType := FieldByName('VID_SOB').AsInteger;
      OrganizationType := FieldByName('ORG_SOB').AsInteger;
      ActionArea := FieldByName('SFERA_DEY').AsInteger;
      BranchID := FieldByName('OTRASL').AsInteger;
      TaxAreaID := FieldByName('NALOG_KOD').AsInteger;
      OKPRO := FieldByName('KOD_OKPRO').AsString; 
    end;

    Close;
  end;
end;

function Sb_AddCustomer(const Customer: TCustomer): Integer;
begin
  with sboapiDataModule, Customer do
    SBOperationDay.CallProcedure(sPN_AddCustomer, [
      'OP_ID', 0,
      'OPEN_DAT', Customer.OpenDate,
      'NAME', Customer.Name,
      'CLOSE_DAT', NullDate,
      'NEREZIDENT', Integer(IsResident),
      'PRINAD_KOD', RelationID,
      'SHORT_NAME', ShortName,
      'GROUP_KLIE', GroupID,
      'VID_SOB', EstateType,
      'ORG_SOB', OrganizationType,
      'SFERA_DEY', ActionArea,
      'OTRASL', BranchID,
      'NALOG_KOD', TaxAreaID,
      'INN', TaxIDString,
      'BIK', BankIDString,
      'KOD_OKPRO', OKPRO,
      'DAT_NAL', TaxDepartmentRegDate,
      'DAT_USTAV', CapitalRegDate
    ]);
  Result := -1;
end;

procedure Sb_CloseCustomer(ID: Integer);
begin
  with sboapiDataModule.SBOperationDay do
    CallProcedure(sPN_CloseCustomer, [
      'v_ID', ID,
      'CURRENTDATE', Sb_GetSystemDate(),
      'RESULT', 0]);
end;

procedure Sb_EditCustomer(ID: Integer; const Customer: TCustomer);
begin
  with sboapiDataModule.SBOperationDay, Customer do
    CallProcedure(sPN_UpdateCustomer, [
      'v_ID', ID,
      'v_OP_ID', 0,
      'v_OPEN_DAT', Customer.OpenDate,
      'v_NAME', Customer.Name,
      'v_CLOSE_DAT', NullDate,
      'v_NEREZIDENT', Integer(IsResident),
      'v_PRINAD_KOD', RelationID,
      'v_SHORT_NAME', ShortName,
      'v_GROUP_KLIE', GroupID,
      'v_VID_SOB', EstateType,
      'v_ORG_SOB', OrganizationType,
      'v_SFERA_DEY', ActionArea,
      'v_OTRASL', BranchID,
      'v_NALOG_KOD', TaxAreaID,
      'v_INN', TaxIDString,
      'v_BIK', BankIDString,
      'v_KOD_OKPRO', OKPRO,
      'v_DAT_NAL', TaxDepartmentRegDate,
      'v_DAT_USTAV', CapitalRegDate
    ]);
end;

function Sb_AddCustomerInfo(CustomerID: Integer; const Info: TCustomerInfo): Integer;
begin
  with sboapiDataModule.SBReferences, Info do
    Result := CallIntegerFunction('add_custinfo', [
      'v_idcust', CustomerID,
      'v_soname', SurName,
      'v_name', Name,
      'v_lastname', LastName,
      'v_birthday', BirthDate,
      'v_birthplace', BirthPlace,
//      'v_passer',
//      'v_paspnum
//      'v_paspdate
//      'v_paspplace
      'v_city', City,
      'v_address', Address,
      'v_workplace', WorkPlace,
      'v_phone_w', PhoneWork,
      'v_phone_h', PhoneHome,
      'v_phone_m', PhoneCelular,
      'v_e_mail', EMail,
      'v_url', Url
//      'v_recomendation' Recomendations,
//      'v_garanted
//      'v_photo
//      'v_custsign
    ]);
end;

procedure Sb_EditCustomerInfo(ID: Integer; const Info: TCustomerInfo);
begin
end;

function Sb_DropCustomerInfo(ID: Integer): Integer;
begin
  with sboapiDataModule.SBReferences do
    Result := CallIntegerFunction('del_custinfo', ['v_ID', ID]);
end;

end.
