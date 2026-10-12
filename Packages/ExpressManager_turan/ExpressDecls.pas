unit ExpressDecls;

interface

uses
  Controls;

type
  TExpressVariables = record
    exid: Variant;

    custid: Variant;
    remit_inf: string;
    doc_type: Variant;
    passpin: string;
    passer: string;
    paspnum: string;
    doc_country: Variant;
    paspplace: Variant;
    paspdate: Variant;
    passexpire: Variant;
    citizenship: integer;
    lastname: string;
    soname: string;
    name: string;
    sex: Variant;
    fam_status: Variant;
    bbirthplace: string;
    birth_state: string;
    birthday: Variant;
    aadrs_state: string;
    city: string;
    reg_zip: string;
    address: string;
    phone_m: string;
    phone_h: string;
    e_mail: string;
    filial: integer;
    v_nerezident: integer;
    v_cust_type: integer;
    v_inn: string;
    debetid: Variant;

    work_place: Variant;
    work_adrs_spec: Variant;
    work_cntr: Variant;
    work_city: Variant;
    work_state: Variant;
    work_zip: Variant;
    work_adress: Variant;
    work_phone_spec: Variant;
    work_phconttype: Variant;
    work_phoppref: Variant;
    work_phone: Variant;
    work_phext: Variant;
    work_phcode: Variant;

    { ---------------------------------------------------------------------------------------------------------------------------------------------- }

    custidI: Variant;
    remit_infI: string;
    doc_typeI: Variant;
    passpinI: string;
    passerI: string;
    paspnumI: string;
    doc_countryI: Variant;
    paspplaceI: Variant;
    paspdateI: Variant;
    passexpireI: Variant;
    citizenshipI: integer;
    lastnameI: string;
    sonameI: string;
    nameI: string;
    sexI: Variant;
    fam_statusI: Variant;
    bbirthplaceI: string;
    birth_stateI: string;
    birthdayI: Variant;
    aadrs_stateI: string;
    cityI: string;
    reg_zipI: string;
    addressI: string;
    phone_mI: string;
    phone_hI: string;
    e_mailI: string;
    filialI: integer;
    v_nerezidentI: integer;
    v_cust_typeI: integer;
    v_innI: string;
    creditid: Variant;

    work_placeI: Variant;
    work_adrs_specI: Variant;
    work_cntrI: Variant;
    work_cityI: Variant;
    work_stateI: Variant;
    work_zipI: Variant;
    work_adressI: Variant;
    work_phone_specI: Variant;
    work_phconttypeI: Variant;
    work_phopprefI: Variant;
    work_phoneI: Variant;
    work_phextI: Variant;
    work_phcodeI: Variant;

    { -------------------------------------------------------------------------------------------------------------------------------------------------- }

  end;

var
  ExpressVariables: TExpressVariables;

implementation

end.
