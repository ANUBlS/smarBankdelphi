unit AdminAllUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, ExtCtrls, DB, OracleData;

type
  TAdminAllForm = class(TForm)
    Panel1: TPanel;
    XDBGrid1: TXDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    XDBGrid2: TXDBGrid;
    Panel4: TPanel;
    XDBGrid3: TXDBGrid;
    AdminAllUserDataSet: TOracleDataSet;
    ExpAdminAllDataSet: TOracleDataSet;
    AdminAllUserDataSource: TDataSource;
    ExpAdminAllDataSource: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure XDBGrid2DblClick(Sender: TObject);
    procedure XDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure XDBGrid3DblClick(Sender: TObject);
    procedure XDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure XDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminAllForm: TAdminAllForm;

implementation

uses ExpDataModuleUnit;

{$R *.dfm}

procedure TAdminAllForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AdminAllUserDataSet.Close;
  ExpAdminAllDataSet.Close;
end;

procedure TAdminAllForm.FormShow(Sender: TObject);
begin
  AdminAllUserDataSet.Open;
  ExpAdminAllDataSet.Open;
end;

procedure TAdminAllForm.XDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TAdminAllForm.XDBGrid2DblClick(Sender: TObject);
begin
  with ExpDataModule do
  begin
    Repair.CallProcedure('ExpAdminAll_add',
      [AdminAllUserDataSet.FieldByName('ID').AsInteger,
      AllFilialDataSet.FieldByName('ID').AsInteger,
      AdminAllUserDataSet.FieldByName('NAME').AsString,
      AllFilialDataSet.FieldByName('NAME').AsString]);
    ExpAdminAllDataSet.Refresh;
  end;
end;

procedure TAdminAllForm.XDBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    XDBGrid2DblClick(Sender);
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TAdminAllForm.XDBGrid3DblClick(Sender: TObject);
begin
  with ExpDataModule do
  begin
    Repair.CallProcedure('ExpAdminAll_del',
      [ExpAdminAllDataSet.FieldByName('USER_ID').AsInteger,
      ExpAdminAllDataSet.FieldByName('FILIAL_ID').AsInteger,
      ExpAdminAllDataSet.FieldByName('USER_NAME').AsString,
      ExpAdminAllDataSet.FieldByName('FILIAL_NAME').AsString]);
    ExpAdminAllDataSet.Refresh;
  end;
end;

procedure TAdminAllForm.XDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
  begin
    XDBGrid3DblClick(Sender);
    Key := 0;
  end;
end;

procedure TAdminAllForm.XDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

end.
