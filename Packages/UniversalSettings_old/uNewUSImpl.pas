unit uNewUSImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmNewUS = class(TForm)
    uTables: TOracleDataSet;
    uColumns: TOracleDataSet;
    Columns: TDataSource;
    Tables: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    uTablesID: TFloatField;
    uColumnsCOLUMNID: TFloatField;
    uColumnsCOLUMNWIDTH: TFloatField;
    uColumnsTABLEID: TFloatField;
    Splitter1: TSplitter;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    uTablesNAME: TWideStringField;
    uTablesQUERYST: TWideStringField;
    uTablesDESCRT: TWideStringField;
    uTablesORDERCOL: TWideStringField;
    uColumnsCOLUMNTITLE: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewUS: TfrmNewUS;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

end.
