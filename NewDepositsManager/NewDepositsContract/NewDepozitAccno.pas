unit NewDepozitAccno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HintBox, StdCtrls, Buttons, ExtCtrls, XFSCtrls, Grids, XDBGrids;

type
  TFormDepositAccount = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFButton1: TXFButton;
    XFBitBtn1: TXFBitBtn;
    XDBGrid_account: TXDBGrid;
    procedure FormShow(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDepositAccount: TFormDepositAccount;

implementation

{$R *.dfm}

uses   sboapiDataModuleImpl,NewDepositsContractImpl, NewFormDepositContractImpl,NewContractCommonDecls;

procedure TFormDepositAccount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  NewFormDepositContract.Close;
end;

procedure TFormDepositAccount.FormCreate(Sender: TObject);
begin
  {with  NewDataModDepositsContract do begin
                                        Sequreid.Close;
                                        Sequreid.Open;
                                      end; *}


end;

procedure TFormDepositAccount.FormShow(Sender: TObject);
begin
  With NewDataModDepositsContract do begin
                                       ODSAccno.Close;
                                       ODSAccno.Open;
                                     end;
end;

procedure TFormDepositAccount.XFBitBtn1Click(Sender: TObject);
begin
  sboapiDataModule.SBSession.Commit;
  FormDepositAccount.Close;
end;

procedure TFormDepositAccount.XFButton1Click(Sender: TObject);
var
i:integer;
R:integer;
begin
  FormShow(Sender);
  with NewDataModDepositsContract,ODSAccno do
  begin
    First;
    for I := 0 to RecordCount-1 do
    begin
   //   if  XDBGrid_account.Columns.Items[0].IsCheckBoxValue(True) then
    //  begin
        with NewFormDepositContract do
        begin
          R:=dm_contract.CallIntegerFunction('getaddaccount',[         'p_id',        I
                                                                      ,'v_contractid',SaveDeposit.contractid
                                                                      ,'v_customerid',ODSAccnoCUSTOMERID.asinteger
                                                                      ,'v_accno'     ,ODSAccnoACCNO.AsString
                                                                      ,'v_val_id'    ,ODSAccnoVAL_ID.AsInteger
                                                                      ,'v_nameaccno' ,ODSAccnoNAMEACCNO.AsString
                                                                      ,'v_opendat'   ,ODSAccnoOPENDAT.AsDateTime
                                                                      ,'v_old_balcn' ,ODSAccnoOLD_BALCN.AsInteger
                                                                      ,'v_new_balcn' ,ODSAccnoNEW_BALCN.AsInteger
                                                                      ,'v_filial'    ,ODSAccnoFILIAL.AsInteger
                                                                      ,'v_fieldname' ,ODSAccnoDEPOSITFIELDACCNO.AsString
                                                                      ]);
        end;
        Next;
     // end;
    end;
   // sboapiDataModule.SBSession.Commit;
  //  SaveDeposit.pcontractid:=SequreidCONTRACTID.AsInteger;
    NewFormDepositContract.SaveState(True);
    NewFormDepositContract.FCommited:=True;
    FormDepositAccount.Close;
   end;
end;



end.
