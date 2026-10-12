unit P_CO_Cust_Settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TP_Cust_Settings = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditCountry: TEdit;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Editcities: TEdit;
    DBEdit1: TDBEdit;
    DBGrid2: TDBGrid;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton4Click(Sender: TObject);
    procedure EditCountryKeyPress(Sender: TObject; var Key: Char);
    procedure EditcitiesKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P_Cust_Settings: TP_Cust_Settings;

implementation

uses P_Datamod_Unit;

{$R *.DFM}

procedure TP_Cust_Settings.SpeedButton1Click(Sender: TObject);
begin
  if EditCountry.Text = '' then
    showmessage('Boş daxil etmək olmaz')
  else
    P_Datamodule.phys_fs_customers.CallProcedure('add_countries',
      [EditCountry.Text]);
  P_Datamodule.Country.close;
  P_Datamodule.Country.Open;
  EditCountry.Text := '';
end;

procedure TP_Cust_Settings.SpeedButton2Click(Sender: TObject);

var
  p_id: integer;
begin
  p_id := P_Datamodule.Country.fieldbyname('id').asinteger;
  P_Datamodule.phys_fs_customers.CallProcedure('delete_countries', [p_id]);
  P_Datamodule.Country.close;
  P_Datamodule.Country.Open;

end;

procedure TP_Cust_Settings.SpeedButton3Click(Sender: TObject);
begin
  if Editcities.Text = '' then
    showmessage('Boş daxil etmək olmaz')
  else
    P_Datamodule.phys_fs_customers.CallProcedure('add_cities',
      [Editcities.Text, Strtoint(DBEdit1.Text)]);
  P_Datamodule.Cities.close;
  P_Datamodule.Cities.Open;
  Editcities.Text := '';
end;

procedure TP_Cust_Settings.FormActivate(Sender: TObject);
begin
  P_Datamodule.Country.Open;
end;

procedure TP_Cust_Settings.DBGrid1CellClick(Column: TColumn);
begin
  with P_Datamodule.Cities do
  begin
    close;
    SQL.clear;
    SQL.add('Select * from Cities where country_id=''' + DBEdit1.Text + ''' ');
    Open;

  end;
end;

procedure TP_Cust_Settings.SpeedButton4Click(Sender: TObject);

var
  p_id: integer;
begin
  p_id := P_Datamodule.Cities.fieldbyname('id').asinteger;
  P_Datamodule.phys_fs_customers.CallProcedure('delete_cities', [p_id]);
  P_Datamodule.Cities.close;
  P_Datamodule.Cities.Open;

end;

procedure TP_Cust_Settings.EditCountryKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if EditCountry.Text = '' then
      showmessage('Boş daxil etmək olmaz')
    else
      P_Datamodule.phys_fs_customers.CallProcedure('add_countries',
        [EditCountry.Text]);
    P_Datamodule.Country.close;
    P_Datamodule.Country.Open;
    EditCountry.Text := '';
  end;
end;

procedure TP_Cust_Settings.EditcitiesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if Editcities.Text = '' then
      showmessage('Boş daxil etmək olmaz')
    else
      P_Datamodule.phys_fs_customers.CallProcedure('add_cities',
        [Editcities.Text, Strtoint(DBEdit1.Text)]);
    P_Datamodule.Cities.close;
    P_Datamodule.Cities.Open;
    Editcities.Text := '';

  end;
end;

end.
