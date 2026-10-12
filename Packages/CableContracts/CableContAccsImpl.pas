unit CableContAccsImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, StdCtrls, DBCtrls, Mask;

type
  TfrmAcc = class(TForm)
    AccountGB: TGroupBox;
    Label1: TLabel;
    DBText1: TDBText;
    AccNoEdit: TEdit;
    OkButton: TButton;
    CancelButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcc: TfrmAcc;

implementation

uses sboapidatamoduleimpl;

{$R *.DFM}

end.
