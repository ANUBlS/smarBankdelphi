unit UnitEditExch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,Oracle, DBCtrls;

type
  TFormEditExch = class(TForm)
    PanelMain: TPanel;
    SpBtnAbort: TSpeedButton;
    SpBtnOk: TSpeedButton;
    Label_ex_no: TLabel;
    Label_ex_name: TLabel;
    Label_ex_addres: TLabel;
    Label_ex_worker_name: TLabel;
    Label_ex_check_no: TLabel;
    Edit_ex_no: TEdit;
    Edit_ex_name: TEdit;
    Edit_ex_address: TEdit;
    Edit_ex_worker_name: TEdit;
    Edit_ex_check_no: TEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure Edit_ex_noKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpBtnOkClick(Sender: TObject);
    procedure SpBtnAbortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditExch: TFormEditExch;


        v_id             :integer;
        v_ex_no          :integer;
        v_ex_name        :string;
        v_ex_address     :string;
        v_ex_worker_name :string;
        v_ex_check_no    :string;
        v_filial         :integer;



implementation
                 Uses UnitDateExch,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure TFormEditExch.Edit_ex_noKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then
   Key :=#0
end;

procedure TFormEditExch.FormCreate(Sender: TObject);

begin
    with  DataModExch,DataModExch.OPExchMgr do
     begin

        v_id:=ODSExchOffice.FieldByName('id').AsInteger;
        CallProcedure('get_ex_office_out_params',
                                                            [
                                                             v_id,
                                                             parInteger,
                                                             parString,
                                                             parString,
                                                             parString,
                                                             parString,
                                                             parinteger
                                                             ]);

         v_ex_no:=GetParameter(1);
         v_ex_name:=GetParameter(2);
         v_ex_address:=GetParameter(3);
         v_ex_worker_name:=GetParameter(4);
         v_ex_check_no:=GetParameter(5);
         v_filial:=GetParameter(6);

     end;

          Edit_ex_no.Text:=IntToStr(v_ex_no);
          Edit_ex_name.Text:=v_ex_name;
          Edit_ex_address.Text:=v_ex_address;
          Edit_ex_worker_name.Text:=v_ex_worker_name;
          Edit_ex_check_no.Text:=v_ex_check_no;
          DBLookupComboBox1.KeyValue:=v_filial;
      SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
     end;

procedure TFormEditExch.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (ORD(Key) =VK_ESCAPE) then Close;
end;

procedure TFormEditExch.SpBtnOkClick(Sender: TObject);
begin
         v_id:= DataModExch.ODSExchOffice.FieldByName('id').AsInteger;
         v_ex_no:=StrToInt(Edit_ex_no.Text);
         v_ex_name:=Edit_ex_name.Text;
         v_ex_address:=Edit_ex_address.Text;
         v_ex_worker_name:=Edit_ex_worker_name.Text;
         v_ex_check_no:=Edit_ex_check_no.Text;
         v_filial:=DBLookupComboBox1.KeyValue;

     if (Trim(Edit_ex_no.Text)<>'0') or (Trim(Edit_ex_no.Text)<>'') then
      begin
             With DataModExch,DataModExch.OPExchMgr do
              begin
                 CallProcedure('ex_office_edit',[
                                                  v_id,
                                                  v_ex_no,
                                                  v_ex_name,
                                                  v_ex_address,
                                                  v_ex_worker_name,
                                                  v_ex_check_no,
                                                  v_filial
                                               ]);
                  ODSExchOffice.Refresh;
              end;
      end;
        Close;   
end;

procedure TFormEditExch.SpBtnAbortClick(Sender: TObject);
begin
Close;
end;

end.
