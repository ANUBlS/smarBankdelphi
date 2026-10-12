unit FormGuarpldginfolmpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, DBLookupEh, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, DBGridEh;

type
  TFormGuarpldginfo = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    DBEditEh13: TDBEditEh;
    Panel1: TPanel;
    Label2: TLabel;
    DBEditEh1: TDBEditEh;
    Panel4: TPanel;
    Label4: TLabel;
    DBEditEh3: TDBEditEh;
    Panel3: TPanel;
    Label3: TLabel;
    DBEditEh2: TDBEditEh;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label5: TLabel;
    DBLookupComboboxEh3: TDBLookupComboboxEh;
    DBLookupComboboxEh4: TDBLookupComboboxEh;
    DBEditEh16: TDBEditEh;
    SpeedButton1: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGuarpldginfo: TFormGuarpldginfo;

implementation
 uses  DataMGuarantee,sboapiDataModuleImpl,GuaranteeMgrImpl,FormGuarAddlmpl,SBTranslateProc;
{$R *.DFM}

procedure TFormGuarpldginfo.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TFormGuarpldginfo.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormGuarpldginfo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close
end;

procedure TFormGuarpldginfo.SpeedButton1Click(Sender: TObject);
begin
    p_generalarea  := DBEditEh13.Value;
     p_livingarea  :=DBEditEh1.Value;
     p_buildingsoilarea := DBEditEh2.Value;
     p_soilarea  := DBEditEh3.Value;
     p_adress   :='sss';
     p_inforegion :=2;
     p_infovilg:=1 ;

     DataMGuarante.OraclePackage1.CallProcedure('add_gua_pldginfo' ,
                              [guarid,
                               p_generalarea,
                               p_livingarea,
                               p_buildingsoilarea,
                               p_soilarea,
                               p_adress,
                               p_inforegion,
                               p_infovilg]);

close;
FormGuarAdd.Close;
end;

end.

