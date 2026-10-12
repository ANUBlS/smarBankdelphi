unit TrDescrForm_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, OracleData;

type
  TTrDescrForm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    OkButton: TButton;
    CancelButton: TButton;
    DescrTable: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
    FCommited       : Boolean;
    function GetValue: String;
  public
    { Public declarations }
    property Commited: Boolean read FCommited;
    property Value: String read GetValue;
  end;

var
  TrDescrForm: TTrDescrForm;

implementation

{$R *.DFM}

uses sboapiDataModuleImpl;

procedure TTrDescrForm.FormCreate(Sender: TObject);
begin
  FCommited := False;
end;

procedure TTrDescrForm.OkButtonClick(Sender: TObject);
begin
  FCommited := True;
  Close;
end;

function TTrDescrForm.GetValue: String;
begin
  Result := DescrTable.FieldByName('NAME').AsString;
end;

procedure TTrDescrForm.DBGrid1DblClick(Sender: TObject);
begin
  FCommited := True;
  Close;
end;

procedure TTrDescrForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then
  begin
    if DescrTable.State = dsBrowse then
    begin
      FCommited := True;
      Close;
    end;
  end
  else
  if Ord(Key) = VK_ESCAPE then
    Close;
end;

procedure TTrDescrForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

end.
