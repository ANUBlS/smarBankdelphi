unit AdminUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, XFSCtrls, Grids, XDBGrids, StdCtrls, DB, OracleData;

type
  TAdminForm = class(TForm)
    XFGroupBox1: TXFGroupBox;
    XFGroupBox2: TXFGroupBox;
    XDBGrid1: TXDBGrid;
    XDBGridFilial: TXDBGrid;
    XDBGrid3: TXDBGrid;
    AdminUserDataSet: TOracleDataSet;
    AdminUserDataSource: TDataSource;
    ExpAdminDataSet: TOracleDataSet;
    ExpAdminDataSource: TDataSource;
    procedure XDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure XDBGridFilialDblClick(Sender: TObject);
    procedure XDBGridFilialKeyPress(Sender: TObject; var Key: Char);
    procedure XDBGrid3DblClick(Sender: TObject);
    procedure XDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure XDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminForm: TAdminForm;

implementation
uses ExpDataModuleUnit;
{$R *.DFM}

procedure TAdminForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AdminUserDataSet.Close;
  ExpAdminDataSet.Close;
end;

procedure TAdminForm.FormShow(Sender: TObject);
begin
  AdminUserDataSet.Open;
  ExpAdminDataSet.Open;
end;

procedure TAdminForm.XDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TAdminForm.XDBGridFilialDblClick(Sender: TObject);
begin
  with ExpDataModule do
  begin
    Repair.CallProcedure('ExpAdmin_add',[ AdminUserDataSet.FieldByName('ID').AsInteger
                                         ,AllFilialDataSet.FieldByName('ID').AsInteger
                                         ,AdminUserDataSet.FieldByName('NAME').AsString
                                         ,AllFilialDataSet.FieldByName('NAME').AsString]);
    ExpAdminDataSet.Refresh;
  end;

end;

procedure TAdminForm.XDBGridFilialKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
      XDBGridFilialDblClick(Sender);
   if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TAdminForm.XDBGrid3DblClick(Sender: TObject);
begin
  with ExpDataModule do
  begin
    Repair.CallProcedure('ExpAdmin_del',[ ExpAdminDataSet.FieldByName('USER_ID').AsInteger
                                         ,ExpAdminDataSet.FieldByName('FILIAL_ID').AsInteger
                                         ,ExpAdminDataSet.FieldByName('USER_NAME').AsString
                                         ,ExpAdminDataSet.FieldByName('FILIAL_NAME').AsString]);
    ExpAdminDataSet.Refresh;
  end;

end;

procedure TAdminForm.XDBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
   begin
      Close;
      key:=#0;
   end;
end;

procedure TAdminForm.XDBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key=46 then
   begin
      XDBGrid3DblClick(Sender);
      key:=0;
   end;
end;

end.
