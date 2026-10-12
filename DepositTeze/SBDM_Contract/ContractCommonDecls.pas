unit ContractCommonDecls;

interface

uses
  Controls;

type
  TDeposit = record
     TypeD :Integer;
     ContractNo :String;
     opendate : TDateTime;
     CloseDate : TDateTime;
     amount : Real;
     contracttype : Integer;
     clienttype : Integer;
     branchid :Integer;
     currency : Integer;
     personaltype: Integer;
     customerid: Integer;
     interest: string;
     overdueinterest: Real;
     dueinterest: Real;
     contractaccid: Integer;
     clientaccid: Integer;
     interestaccid: Integer;
     booroweraccid: Integer;
     overdueaccid : Integer;
     FirstPayDateforInt :TDateTime;
     PeriodID :Integer;
     capitalperid :integer;
     autopr : integer;

  end;

var
  SaveDeposit :TDeposit;  

implementation



end.
