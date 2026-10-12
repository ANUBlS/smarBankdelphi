unit UIMDIMainCaller;

interface

type
  IMDIMainCaller = interface;
  MDIMainCaller = IMDIMainCaller;
  IMDIMainCaller = interface(IUnknown)
  ['{68222A02-B60F-410E-96EC-4FAF7732F094}']
    procedure MDIChildClose(TabIdx : Integer); safecall;
  end;

implementation

end.
