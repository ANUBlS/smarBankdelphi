unit CRACommon;

interface
uses Controls;
type

  TContract = record
      currency:INTEGER;
      personaltype:INTEGER;
      clienttype:INTEGER;
      branchid :INTEGER;
      contractaccid :INTEGER;
      interestaccid :INTEGER;
      opendate  :INTEGER;
      closedate :TDATETime;
      annualIntRest :Real;
      contractno  :string;
  end;


implementation

var SContract :TContract;
end.
