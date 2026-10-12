unit UnitbussProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls, XFSCtrls, ExtCtrls,
  DB, OracleData;

type
  TFormBussProc = class(TForm)
    Panel_BsProc: TPanel;
    XFPanel1: TXFPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    MainGrid1: TDBGridEh;
    procedure MainGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
 //   procedure Account_A;
  public
    { Public declarations }
  end;

var
cust_elaqe_Transaction:integer;
  FormBussProc: TFormBussProc;

implementation
  uses FormTransaction1Lmpl,FormTransaction2Lmpl, FormTransaction3Lmpl,UnitTransaction,UnitDataBussProc,
  Creditİmpl,DepozLmpl,OpenAccountImpl, UnitProc_type;
{$R *.dfm}

procedure TFormBussProc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
with DataModule_bussProc.ODS_BussProc do
begin
     close;
     SetVariable('custtype','is null');
      SetVariable('ids', null);
      open;
end;
end;

procedure TFormBussProc.FormCreate(Sender: TObject);
begin
DataModule_bussProc:=TDataModule_bussProc.Create(self);

end;

procedure TFormBussProc.FormShow(Sender: TObject);
   var
xy:string;
begin
with DataModule_bussProc,Ods_cust_proc do
 begin
close;
 SetVariable('custid',phys_jur_custid);
open;

end;

  case DataModule_bussProc.Ods_cust_proc.FieldByName('cust_type').AsInteger of
   0:begin
       with DataModule_bussProc.ODS_BussProc do
       begin
       close;
        SetVariable('custtype',' in 0');
       open;
        end
             end;
   1:begin
      with DataModule_bussProc.ODS_BussProc do
       begin
       close;
        SetVariable('custtype',' in 1');
       open;
    end;
   end;

    2:begin
      with DataModule_bussProc.ODS_BussProc do
       begin
       close;
        SetVariable('custtype',' in 2');
       open;
    end;
    end;
  end;



 { case DataModule_bussProc.Ods_cust_proc.FieldByName('cust_type').AsInteger of
     0,1,2:begin
    with DataModule_bussProc.ODS_BussProc do
    begin
    close;
     xy:='in ' + inttostr(DataModule_bussProc.Ods_cust_proc.FieldByName('cust_type').AsInteger );
     SetVariable('custtype',xy);
     SetVariable('ids',inttostr(DataModule_bussProc.Ods_cust_proc.FieldByName('id').AsInteger ));
    open;
     end;
     end;
     3:begin
   with DataModule_bussProc.ODS_BussProc do
    begin
   FormBussProc_type:=TFormBussProc_type.create(self);
    FormBussProc_type.ShowModal;
  close;
  SetVariable('custtype',' in 10');
  SetVariable('ids',inttostr(DataModule_bussProc.Ods_cust_proc.FieldByName('id').AsInteger ));
  open;

    end;
    end;
  end;    }

DataModule_bussProc.ODS_BussProc.Open;
MainGrid1.DataSource:=DataModule_bussProc.DS_BusProc;
end;


procedure TFormBussProc.MainGrid1DblClick(Sender: TObject);
procedure call_FormTransaction1;
  begin
  if not Assigned(FormTransaction1) then

    FormTransaction1 := TFormTransaction1.Create(self);
    FormTransaction1.ShowModal;

  end;
  procedure call_FormTransaction2;
  var x:integer;
  begin
    if not Assigned(FormTransaction2) then
      FormTransaction2 := TFormTransaction2.Create(self);

    with DataModule_bussProc.ODS_AccNO_A do
    begin
     Close;
      SetVariable('CustID', strtoint(phys_jur_custid));
      SetVariable('Acc_id', strtoint(phys_jur_accid));
      showmessage('dd');
    {  if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_A')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_A').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_A').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_A')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_A').AsString);
         showmessage('d5d');       }
     DataModule_bussProc.BusProcFilter(DataModule_bussProc.ODS_AccNO_A);

     open;
     end;
      FormTransaction2.ShowModal;

  end;

  procedure call_FormTransaction3;
  begin
    if not Assigned(FormTransaction3) then
      FormTransaction3 := TFormTransaction3.Create(self);

    with DataModule_bussProc.ODS_AccNO_A do
    begin

      Close;
      SetVariable('CustID', DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.
        FieldByName('ID').AsInteger);
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_A')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_A').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_A').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_A')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_A').AsString);

      DataModule_bussProc.BusProcFilter(DataModule_bussProc.ODS_AccNO_A);
      Open;

  //     SHOWMESSAGE(inttostr( DataModPCustService.ODS_AccNO_A.recordcount));
    end;
    with DataModule_bussProc.ODS_AccNO_B do
    begin
      Close;

      if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_B')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_B').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_B').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_B')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_B').AsString);

       Open;
    end;

    FormTransaction3.ShowModal;

  end;

  procedure call_FormTransaction4;
  begin

    if not Assigned(FormTransaction4) then
      FormTransaction4 := TFormTransaction4.Create(self);
    with DataModule_bussProc.ODS_AccNO_A do
    begin
      ClearVariables;
      Close;
      SetVariable('CustID', DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.
        FieldByName('ID').AsInteger);
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_A')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_A').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_A').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_A')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_A').AsString);
      DataModule_bussProc.BusProcFilter(DataModule_bussProc.ODS_AccNO_A);
      Open;

      // FormTransaction.EditDescription.Text :=DataModPCustService.ODS_BusProc.FieldByName();
    end;

    with DataModule_bussProc.ODS_AccNO_B do
    begin
      Close;
       if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_B')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_B').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_B').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_B')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_B').AsString);
      Open;
    end;

    with DataModule_bussProc.ODS_AccNO_C do
    begin
      Close;
       if DataModule_bussProc.ODS_BussProc.FieldByName('AccBalCn_C')
        .AsString = '' then
        SetVariable('BalCn', ' not in (-1)')
      else
        SetVariable('BalCn', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccBalCn_C').AsString);
      SetVariable('vTipAcc', '''%' + DataModule_bussProc.ODS_BussProc.FieldByName
        ('AccSymb_C').AsString + '%''');
      if DataModule_bussProc.ODS_BussProc.FieldByName('AccCurr_C')
        .AsString = '' then
        SetVariable('Currency', ' not in (-1)')
      else
        SetVariable('Currency', DataModule_bussProc.ODS_BussProc.FieldByName
          ('AccCurr_C').AsString);
          Open;
    end;

    FormTransaction4.ShowModal;

  end;

begin

{  if (DataModPCustService.ODS_CUSTOMERS_PHYS_FS.FieldByName('cust_phys').asinteger=1)
       and
      (DataModPCustService.ODS_CUSTOMERS_PHYS_FS.FieldByName('cust_fs').AsInteger=1)
      and
      (XFRadioGroupCust_type.ItemIndex=3)
      and
      (DataModPCustService.ODS_CUSTOMERS_PHYS_FS.FieldByName('cust_phys').AsInteger=1)
      then
      begin
      showmessage('Fiziki şəxs və fiziki sahibkara əməliyyat vermek üun onun tipni dəyişin   !');
      exit
      end;  }



  case DataModule_bussProc.ODS_BussProcFORMNUM.AsInteger of
    1:begin
    call_FormTransaction1;
    end;
    2:
    begin
    if DataModule_bussProc.Ods_cust_proc.FieldByName('cust_type').AsInteger=4 then
    begin
      showmessage('Nominala əməliyyat vermek olmaz   !');
      exit;
    end;
           DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.open;
           DataModule_bussProc.ODS_CUSTOMERSPHYS_FSid.AsInteger:=169;;
        if (DataModule_bussProc.Ods_cust_proc.Active) and
          (DataModule_bussProc.Ods_cust_proc.RecordCount <> 0) then
          begin
          call_FormTransaction2

          end
        else
        begin
          ShowMessage('Heç bir məlumat seçilməyib !');
          exit;
        end;
      end;
    3:
      begin
      if DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.FieldByName('cust_type').AsInteger=4 then
      begin
      showmessage('Nominala əməliyyat vermek olmaz   !');
      exit;
      end;

        if (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.Active) and
          (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.RecordCount <> 0) then
          begin
          call_FormTransaction3;
          end
        else
        begin
          ShowMessage('Heç bir məlumat seçilməyib !');
          exit;
        end;
      end;
    4:
     begin
      if DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.FieldByName('cust_type').AsInteger=4 then
      begin
      showmessage('Nominala əməliyyat vermek olmaz   !');
      exit;
      end;

        if (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.Active) and
          (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.RecordCount <> 0) then
         begin
        call_FormTransaction4  ;
         end
        else
        begin
          ShowMessage('Heç bir məlumat seçilməyib !');
          exit;
        end;
     end;
    5:
      begin
       if DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.FieldByName('cust_type').AsInteger=4 then
    begin
      showmessage('Nominala kredit vermek olmaz   !');
      exit;
    end;

        if (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.Active) and
          (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.RecordCount <> 0) then
        begin
          if not Assigned(CreditFrm) then
            CreditFrm := TCreditFrm.Create(self);
          CreditFrm.ShowModal

        end
        else
        begin
          ShowMessage('Heç bir məlumat seçilməyib !');
          exit;
        end;

      end;
    6:
      begin
       if DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.FieldByName('cust_type').AsInteger=4 then
    begin
      showmessage('Nominala depozit vermek olmaz   !');
      exit;
    end;
        if (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.Active) and
          (DataModule_bussProc.ODS_CUSTOMERSPHYS_FS.RecordCount <> 0) then
        begin
          if not Assigned(DepozitFrm) then
            DepozitFrm := TDepozitFrm.Create(self);
          DepozitFrm.ShowModal;
        end
        else
        begin
          ShowMessage('Heç bir məlumat seçilməyib !');
          exit;
        end;

      end;

  end;




end;

end.
