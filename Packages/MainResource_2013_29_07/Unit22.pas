unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls,DB;

type
  TForm2 = class(TForm)
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    DBGrid3: TDBGrid;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses UnitData,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
var vv:string;
begin

if DataModWares.OracleDataSet9.State in [dsEdit,dsinsert]//,dsInsert]
 then

DataModWares.OracleDataSet9.post else
begin
 vv:=Edit1.text;

DataModWares.SalaryPackage.CallProcedure('WA_INS',[vv]);
DataModWares.OracleDataSet9.Refresh;


Edit1.text:='';


end;
 ShowMessage('İstifadəçi daxil edildi');

end;

procedure TForm2.Button2Click(Sender: TObject);
var vv:string;
begin
if DataModWares.OracleDataSet10.State in [dsEdit,dsinsert]//,dsInsert]
 then
DataModWares.OracleDataSet10.post
     else
     begin
vv:=Edit2.text;
DataModWares.SalaryPackage.CallProcedure('WA_INS1',[vv]);
DataModWares.OracleDataSet10.Refresh;

Edit2.text:='';
     end;
     ShowMessage('Şöbə daxil edildi');
end;

procedure TForm2.Button3Click(Sender: TObject);
var v_id : integer;
begin
v_id:=DataModWares.OracleDataSet9.fieldbyname('id').asinteger;
DataModWares.SalaryPackage.CallProcedure('WA_DEL',[v_id]);
DataModWares.OracleDataSet9.Refresh;
ShowMessage('Silindi');

end;

procedure TForm2.Button4Click(Sender: TObject);
var v_id1 : integer;
begin
v_id1:=DataModWares.OracleDataSet10.fieldbyname('id').asinteger;
DataModWares.SalaryPackage.CallProcedure('WA_DEL1',[v_id1]);
DataModWares.OracleDataSet10.Refresh;
ShowMessage('Silindi');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
