unit uChangeStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls;

type
  TfrmChgStatus = class(TForm)
    cbStat: TDBLookupComboBox;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChgStatus: TfrmChgStatus;

implementation

uses DataModTM;

{$R *.DFM}

end.
