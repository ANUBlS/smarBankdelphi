unit OracleUpdateSQL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;

type
  TOracleUpdateSQL = class(TUpdateSQL)
  private
    { Private declarations }
    procedure OracleExecSQL(UpdateKind: TUpdateKind);
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure Apply(UpdateKind: TUpdateKind); override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure TOracleUpdateSQL.OracleExecSQL(UpdateKind: TUpdateKind);
begin
  with Query[UpdateKind] do
  begin
    Prepare;
    ExecSQL;
//    if RowsAffected <> 1 then DatabaseError(SUpdateFailed);
  end;
end;

procedure TOracleUpdateSQL.Apply(UpdateKind: TUpdateKind);
begin
  SetParams(UpdateKind);
  OracleExecSQL(UpdateKind);
end;

procedure Register;
begin
  RegisterComponents('Data Access', [TOracleUpdateSQL]);
end;

end.
