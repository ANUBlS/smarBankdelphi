unit tr_destination_unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, StdCtrls, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TTr_destination_Form = class(TForm)
    GridDest: TDBGrid;
    DBNavigator1: TDBNavigator;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    TrDest: TOracleDataSet;
    TrDestData: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tr_destination_Form: TTr_destination_Form;

implementation

 uses transact_datamod_unit;
{$R *.DFM}

end.
