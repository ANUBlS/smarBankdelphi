unit SBDecls;

interface

uses SysUtils;

type
  ESBCMError = class(Exception);
  ENotFound = class(Exception);
  ENotImplemented = class(Exception);

const
  ComponentRegisterPage = 'Smart';

{type
  TAction = class(TDispatchedObject, IAction)
  end;}

implementation

end.
