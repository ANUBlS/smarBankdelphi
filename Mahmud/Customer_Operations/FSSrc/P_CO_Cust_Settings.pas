unit P_CO_Cust_Settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

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
    NLSLocalizer1: TNLSLocalizer;
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
if Editcountry.Text ='' then
showmessage('Бош дахил етмяк олмаз!')
else
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('add_countries',[Editcountry.Text]);
P_DataModuleFS.Country.close;
P_DataModuleFS.Country.Open;
Editcountry.Text :='' ;
end;

procedure TP_Cust_Settings.SpeedButton2Click(Sender: TObject);

var
p_id : integer;
begin
p_id :=P_DataModuleFS.Country.fieldbyname('id').asinteger;
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('delete_countries',[p_id]);
P_DataModuleFS.Country.close;
P_DataModuleFS.Country.Open;

end;


procedure TP_Cust_Settings.SpeedButton3Click(Sender: TObject);
begin
if Editcities.Text ='' then
showmessage('Бош дахил етмяк олмаз!')
else
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('add_cities',[Editcities.Text,
                                                     Strtoint(Dbedit1.text)]);
P_DataModuleFS.Cities.Close;
P_DataModuleFS.Cities.Open;
Editcities.Text :='';
end;

procedure TP_Cust_Settings.FormActivate(Sender: TObject);
begin
P_DataModuleFS.Country.Open;
end;

procedure TP_Cust_Settings.DBGrid1CellClick(Column: TColumn);
begin
with P_DataModuleFS.cities do begin
Close;
   SQL.clear;
Sql.add('Select * from Cities where country_id='''+dbedit1.text+''' ');
Open;

end;
end;

procedure TP_Cust_Settings.SpeedButton4Click(Sender: TObject);

var
p_id : integer;
begin
p_id :=P_DataModuleFS.Cities.fieldbyname('id').asinteger;
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('delete_cities',[p_id]);
P_DataModuleFS.Cities.close;
P_DataModuleFS.Cities.Open;


end;


procedure TP_Cust_Settings.EditCountryKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then begin
if Editcountry.Text ='' then
showmessage('Бош дахил етмяк олмаз!')
else
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('add_countries',[Editcountry.Text]);
P_DataModuleFS.Country.close;
P_DataModuleFS.Country.Open;
Editcountry.Text :='' ;
end;
end;

procedure TP_Cust_Settings.EditcitiesKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then begin
if Editcities.Text ='' then
showmessage('Бош дахил етмяк олмаз!')
else
P_DataModuleFS.PHYSICAL_CUSTOMERS.CallProcedure('add_cities',[Editcities.Text,
                                                     Strtoint(Dbedit1.text)]);
P_DataModuleFS.Cities.Close;
P_DataModuleFS.Cities.Open;
Editcities.Text :='';


end;
   end;


end.
