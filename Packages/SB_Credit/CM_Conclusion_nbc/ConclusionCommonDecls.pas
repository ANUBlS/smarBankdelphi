unit ConclusionCommonDecls;

interface

uses
  Controls;

type

  TCredit = record
    Currency : Integer;
    BoorowerID : Integer;
    PINCODE: String;
    CreditLineAmount : Real;
    AnnualyInterestRate : Real;
    AnnualyOverdueRate : Real;
    AnnualyPenaltyRate : Real;
    AnnualBankRate :Real;
    DateOfConclusion : TDateTime;
    DueDateFirstContract : TDateTime;
    NumberOfCredit : String;
    PurposeOfCredit : String;
    CustomerType : Integer;
    CreditType : Integer;
    PersonalType : Integer;
    AutoPayment : Integer;
    AutoExpire : Integer;
    UsrGroup : Integer;
    BranchID : Integer;
    BoorowerAccID : Integer;
    LoanAccID : Integer;
    DueLoanAccID : Integer;
    InterestAccID : Integer;
    DueInterestAccID : Integer;
    PrimaryReserveAccID : Integer;
    SecondaryReserveAccID : Integer;
    OutCollateralAccID : Integer;
    OutGuaranteeAccID : Integer;
    OutInterestAccID :Integer;
    CRDLINEOBLACCID  :Integer;
    OUTLOANACCID : Integer;
    primarypurreserveaccid :Integer;
    secondarypurreserveaccid :Integer;
    ReserveID : Integer;
    DueReserveID : Integer;
    months_pay,months_pay_zam,komision, newfinanceamount :Real;
    numberofBankCredit :String;
    intcalcmethod :integer;
    info,BOORID : String;
    NAME : String;
    COUNTRYCODE : String;
    BANKRUPTEYSTATUS :Integer;
    PHONENUMBER :String;
    ADDRESS :String;
    FIRSTOWNERID :String;
    FIRSTOWNERNAME :String;
    SECONDOWNERID :String;
    SECONDOWNERNAME :String;
    THIRDOWNERID :String;
    THIRDOWNERNAME :String;
    salary :String;
    guarantorname :String;
    guarantorid :String;
    guarantorsalary :String;
    guarantorname2 :String;
    guarantorid2 :String;
    guarantorsalary2 :String;
    guarantorname3 :String;
    DEPOZITIDS,guarantorid3 :String;
  aif_banks,post,work,  guarantorsalary3 :String;
  aif, TESNIFID, REZERVEAUTO,otid,vid_sob, penaccid, qovid,partid,iprimaryreserveaccid,isecondaryreserveaccid,MEHSULID,payintday,payperiod,activities,activities_type,CREDITACT,aim_id,PLEDGEID_P,EXPERTID:integer;
 ssbid, DTI :Integer;
  end;

var
  SavedCredit : TCredit;

implementation

end.
