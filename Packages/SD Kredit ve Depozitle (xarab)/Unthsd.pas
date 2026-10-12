unit Unthsd;

interface

uses
  Classes, Uninfo;

type
  ThSD = class(TThread)
  private
    { Private declarations }
  protected
    procedure createform;
    procedure updateprog;
    procedure Execute; override;
  public
    x: integer;
    mypotstart: Boolean;
  end;

implementation

uses zamirImpl1;
{ thsd }

Procedure ThSD.createform;
begin
  with frminfo do
  Begin
    frminfo := Tfrminfo.Create(nil);
    // DoubleBuffered:=true;
    Show;
  end; { with end }
end;

Procedure ThSD.updateprog;
Begin
  frminfo.Timer1Timer(nil);
  frminfo.Update;
end;

procedure ThSD.Execute;
begin
  Synchronize(createform);
  while (true) do
    if stopFlag then
      frminfo.Free
    else
      updateprog;

  // Synchronize(updateprog);
end;

end.
