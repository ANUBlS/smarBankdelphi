unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBViewComboBox, StdCtrls, SearchCombo, Mask, DBCtrls, SearchEdit;

type
  TIN_edit = class(TForm)
    IN_ID: TDBEdit;
    IN_REFERANS: TDBEdit;
    IN_VALU: TDBEdit;
    IN_VALUTA: TDBEdit;
    IN_BIC: TDBEdit;
    IN_MT: TDBEdit;
    IN_OK: TButton;
    IN_CANSEL: TButton;
    acas: TSearchEdit;
    acc_n: TDBEdit;
    procedure IN_ACOUNTClick(Sender: TObject);
    procedure IN_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IN_CANSELClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IN_edit: TIN_edit;

implementation

uses Unit2, SWIFT_MAINImpl1,SBTranslateProc,sboapiDataModuleimpl;

{$R *.DFM}

procedure TIN_edit.IN_ACOUNTClick(Sender: TObject);
begin
//IN_ACOUNT.Visible:=FALSE;
//IN_ACOUNT_SERCH.Visible:=TRUE;
//IN_ACOUNT_SERCH.Text:=IN_ACOUNT.Text;

end;

procedure TIN_edit.IN_OKClick(Sender: TObject);
begin
acc_n.Text:=acas.Text;
with swdatamodule.sw_in do
begin
swdatamodule.sw_in.Edit;
swdatamodule.sw_in.fieldbyname('acount').asstring:= acas.Text;
swdatamodule.sw_in.fieldbyname('status').asinteger:=2;
post;
 
end;
SWDataModule.sw_in_insert.CallProcedure('check_account',[in_id.text,
                                                           acas.text]);

SWDataModule.sw_in.Close;
SWDataModule.sw_in.Open;

 //sbcommit();
//IN_ACOUNT.Text:=IN_ACOUNT_SERCH.Text;
//IN_ACOUNT.Visible:=TRUE;
//IN_ACOUNT_SERCH.Visible:=FALSE;
end;

procedure TIN_edit.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
acas.Text:=acc_n.Text;
acc_n.Visible:=False;
acas.Visible:=TRUe;

end;

procedure TIN_edit.IN_CANSELClick(Sender: TObject);
begin
close;
end;

end.
