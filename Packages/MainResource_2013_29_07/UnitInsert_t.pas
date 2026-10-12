unit UnitInsert_t;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormInsert_t = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Edit8: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInsert_t: TFormInsert_t;
  gg:integer;
implementation

uses UnitWares, UnitInsWares, UnitData,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormInsert_t.BitBtn2Click(Sender: TObject);
begin
FormInsert_t.Close;
end;

procedure TFormInsert_t.BitBtn1Click(Sender: TObject);
var 
   v_diger   :string ;
begin
   FormInsert_t.Close;

end;
  // FormInsert_t.close;

procedure TFormInsert_t.FormActivate(Sender: TObject);
begin
if gg=2 then
       begin
edit1.text:=FormUpdWares.Edit_Wares_Name.Text;
edit5.Text:=FormUpdWares.Edit_Keeping_Sec1.Text;
edit8.Text:=FormUpdWares.Edit_Inv_No.Text;
edit4.Text:=FormUpdWares.Edit_Keeping_Sec1.Text;
edit6.Text:=FormUpdWares.CBoxFXM.Text;
edit2.Text:=DataModWares.ODSWares.fieldbyname('CHARACTER').asstring;
edit3.Text:=DataModWares.ODSWares.fieldbyname('PRODUCTION').asstring;
edit7.Text:=DataModWares.ODSWares.fieldbyname('INFORMATION').asstring;

       end;
       if gg=1 then
       begin
edit1.text:=FormInsert.Edit_Wares_Name.Text;
edit5.Text:=FormInsert.Edit_Keeping_Sec.Text;
edit8.Text:=FormInsert.Edit_Inv_No.Text;
edit4.Text:=FormInsert.Edit_User.Text;
edit6.Text:=FormInsert.CBoxFXM.Text;
edit2.Text:=DataModWares.ODSWares.fieldbyname('CHARACTER').asstring;
edit3.Text:=DataModWares.ODSWares.fieldbyname('PRODUCTION').asstring;
edit7.Text:=DataModWares.ODSWares.fieldbyname('INFORMATION').asstring;


       end;


end;

procedure TFormInsert_t.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
