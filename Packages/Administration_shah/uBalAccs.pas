unit uBalAccs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Evanescence, Grids, DBGrids, DBCtrls;

type
  TfrmBalAccs = class(TForm)
    Evanescence1: TEvanescence;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBalAccs: TfrmBalAccs;

implementation

uses AdministrationDataModule;

{$R *.DFM}

procedure TfrmBalAccs.FormShow(Sender: TObject);
begin
  with  Evanescence1.DataSource.DataSet,Evanescence1 do begin
    Close;
    Open;
    First;
    while (not Eof) do begin
      Checked[RecNo-1] := fields[1].asinteger<>0;
      Next;
    end;
  end;
end;

procedure TfrmBalAccs.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBalAccs.Button2Click(Sender: TObject);
var
  i: Integer;
begin
  with AdministrationData , Evanescence1 do begin
    ODSQuery.SQL.text := 'delete from sba_balance_acc where optype='+ODSOpTypesID.AsString+' and username='''+UsersDataname.asstring+'''';
    ODSQuery.ExecSQL;
    for i:=0 to Items.Count-1 do
      if Checked[i] then begin
        odsquery.sql.text := 'insert into sba_balance_acc values ('''+usersdataname.asstring+''','+items[i]+','+ODSOpTypesID.AsString+')';
        ODSQuery.ExecSQL;
      end;
    ODSQuery.session.commit;  
  end;
end;

procedure TfrmBalAccs.CheckBox1Click(Sender: TObject);
begin
  if (sender as TCheckBox).checked then
    Evanescence1.CheckAll
  else
    Evanescence1.UncheckAll;
end;

procedure TfrmBalAccs.DBLookupComboBox1Click(Sender: TObject);
const sqls: string = 'select bal_cn bal_acc, nvl(bal_acc, 0) hav from (select bal_acc from sba_balance_acc where upper(username)=upper(''%s'') and optype=%d) s, bal_spr1 b where s.bal_acc(+)=b.bal_cn';
begin
  with AdministrationData, ODSBalAcc do begin
    ODSBalAcc.Close;    
    sql.Text := format(sqls, [usersdataname.asstring, ODSOpTypesid.asinteger]);
    ODSBalAcc.open;
  end;
  with  Evanescence1.DataSource.DataSet,Evanescence1 do begin
    Close;
    Open;
    First;
    while (not Eof) do begin
      Checked[RecNo-1] := fields[1].asinteger<>0;
      Next;
    end;
  end;
end;

end.
