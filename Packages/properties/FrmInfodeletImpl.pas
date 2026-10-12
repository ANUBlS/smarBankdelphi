unit FrmInfodeletImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Evanescence, Buttons;

type
  TFrmproperties_creditDel = class(TForm)
    DelOtherPAPERNO: TEvanescence;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmproperties_creditDel: TFrmproperties_creditDel;
  propid:integer;
implementation

uses DMprop,sboapiDataModuleImpl,SBTranslateProc;

{$R *.DFM}

procedure TFrmproperties_creditDel.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close
end;

procedure TFrmproperties_creditDel.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TFrmproperties_creditDel.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmproperties_creditDel.FormShow(Sender: TObject);
var
propid:integer;
begin
{propid:=DMproperties.DataSetPropIns.FieldByname('id').asinteger;
with DMproperties.DSet_Prop_Kredit do
begin
 close ;
   SetVariable('id',propid);
 open   ;
 refresh
 end }

end;

procedure TFrmproperties_creditDel.BitBtn1Click(Sender: TObject);
var
 i: Integer;
begin
   propid:=DMproperties.DataSetPropIns.FieldByname('id').asinteger;

   with DMproperties,DelOtherPAPERNO do
   begin
       for i:= 0 to Items.Count-1 do
       begin
            if Checked[i] then
             OraclePackage2.CallProcedure('Del_prop_credit', ['p_propid',propid,
                                          'p_numberofcredit',Items[i]]);
       end;
        DataSetCredit.Refresh;
        DSet_Prop_Kredit.Refresh;
        RefreshList;

end;
end;
procedure TFrmproperties_creditDel.BitBtn2Click(Sender: TObject);
begin
close
end;

end.
