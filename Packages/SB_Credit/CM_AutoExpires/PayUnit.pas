unit PayUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, DBCtrlsEh, DBLookupEh,
  CMExcelExport, DBCtrls, OleServer, Excelxp, db, DBGridEh;

type
  TPayForm = class(TForm)
    GroupBox1: TGroupBox;
    ch_val: TCheckBox;
    lup_val: TDBLookupComboboxEh;
    GroupBox4: TGroupBox;
    ch_res: TCheckBox;
    lup_res: TDBLookupComboboxEh;
    GroupBox7: TGroupBox;
    ch_borc: TCheckBox;
    lup_borc: TDBLookupComboboxEh;
    GroupBox10: TGroupBox;
    ch_ple: TCheckBox;
    lup_ple: TDBLookupComboboxEh;
    GroupBox3: TGroupBox;
    lup_fil: TDBLookupComboboxEh;
    ch_fil: TCheckBox;
    GroupBox6: TGroupBox;
    lup_dres: TDBLookupComboboxEh;
    ch_dres: TCheckBox;
    GroupBox9: TGroupBox;
    ch_btip: TCheckBox;
    lup_btip: TDBLookupComboboxEh;
    GroupBox11: TGroupBox;
    ch_mus: TCheckBox;
    DBLCEh_mus: TDBLookupComboboxEh;
    GroupBox2: TGroupBox;
    lup_iqr: TDBLookupComboboxEh;
    ch_iqr: TCheckBox;
    GroupBox8: TGroupBox;
    ch_knov: TCheckBox;
    lup_knov: TDBLookupComboboxEh;
    BitBtn_E: TBitBtn;
    BitBtn_R: TBitBtn;
    GroupBox12: TGroupBox;
    ch_muq: TCheckBox;
    lup_muq: TDBLookupComboboxEh;
    GroupBox13: TGroupBox;
    ch_date: TCheckBox;
    DateTPic: TDateTimePicker;
    GroupBox14: TGroupBox;
    ch_hes: TCheckBox;
    lup_hes: TDBLookupComboboxEh;
    GroupBox15: TGroupBox;
    ch_musid: TCheckBox;
    lup_musid: TDBLookupComboboxEh;
    BitBtn_Exit: TBitBtn;
    procedure BitBtn_EClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_ExitClick(Sender: TObject);
    procedure BitBtn_RClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  PayDate:TDateTime;
  PayForm: TPayForm;
  Exl,Sheet :Variant;

implementation
uses AEDataModuleImpl,AEMainFormImpl,ComObj, PayRepUnit;

{$R *.DFM}



procedure DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except

  end;
end;

procedure ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
   end;
end;

procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;


procedure TPayForm.BitBtn_EClick(Sender: TObject);
var
i:integer;
ms,mu,h:string;
begin
try
Screen.Cursor:=crSQLWait;
       if ch_date.Checked=True then
                        DataModAE.PaymentData.Sql[20]:='and ps.paymentdate= '''+FormatDateTime('dd-MMM-yyyy',DateTPic.Date)+''''
       else
                        DataModAE.PaymentData.Sql[20]:=' ';
      if (ch_mus.Checked=True) AND (DBLCEh_mus.Text<>'') then
                        DataModAE.PaymentData.Sql[21]:='and b.name= '''+DBLCEh_mus.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[21]:=' ';
              end;
      if (ch_muq.Checked=True) AND (lup_muq.Text<>'') then
                        DataModAE.PaymentData.Sql[22]:='and p.numberofcredit= '''+lup_muq.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[22]:=' ';
              end;
      if (ch_hes.Checked=True) AND (lup_hes.Text<>'') then
                        DataModAE.PaymentData.Sql[23]:='and cm_common.AccountNumber_Get(a.contractaccid)='''+lup_hes.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[23]:=' ';
              end;
      if (ch_musid.Checked=True) AND (lup_musid.Text<>'') then
                        DataModAE.PaymentData.Sql[24]:='and p.boorowerid= '''+Inttostr(lup_musid.keyvalue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[24]:=' ';
              end;

       if (ch_borc.Checked=True) AND (lup_borc.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[25]:='and p.personaltype= '''+Inttostr(lup_borc.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[25]:=' ';
              end;

       if (ch_val.Checked=True) AND (lup_val.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[26]:='and p.currency= '''+Inttostr(lup_val.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[26]:=' ';
              end;

       if (ch_fil.Checked=True) AND (lup_fil.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[27]:='and p.branchid= '''+Inttostr(lup_fil.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[27]:=' ';
              end;

       if (ch_knov.Checked=True) AND (lup_knov.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[28]:='and p.credittype= '''+Inttostr(lup_knov.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[28]:=' ';
              end;
       if (ch_btip.Checked=True) AND (lup_btip.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[29]:='and p.CUSTOMERTYPE= '''+Inttostr(lup_btip.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[29]:=' ';
              end;
       if (ch_iqr.Checked=True) AND (lup_iqr.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[30]:='and p.USRGROUP= '''+Inttostr(lup_iqr.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[30]:=' ';
              end;
       if (ch_res.Checked=True) AND (lup_res.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[31]:='and cm_ak_reports.get_reserves(p.id)= '''+Inttostr(lup_res.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[31]:=' ';
              end;
       if (ch_dres.Checked=True) AND (lup_dres.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[32]:='and cm_ak_reports.get_reserves(p.id)= '''+Inttostr(lup_dres.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[32]:=' ';
              end;
       if (ch_ple.Checked=True) AND (lup_ple.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[33]:='and cm_ak_reports.get_pledge(p.id)= '''+Inttostr(lup_ple.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[33]:=' ';
              end;

   if DataModAE.PaymentData.Active=true then DataModAE.PaymentData.Close; DataModAE.PaymentData.Open;

   CreateSheet;

     Sheet.Range['A1:A60000'].ColumnWidth:=3;
     Sheet.Range['B1:B60000'].ColumnWidth:=20;
     Sheet.Range['C1:C60000'].ColumnWidth:=20;
     Sheet.Range['D1:D60000'].ColumnWidth:=20;
     Sheet.Range['E1:E60000'].ColumnWidth:=15;
     Sheet.Range['F1:F60000'].ColumnWidth:=18;
     Sheet.Range['G1:G60000'].ColumnWidth:=21;
     Sheet.Range['H1:H60000'].ColumnWidth:=20;
     Sheet.Range['I1:I60000'].ColumnWidth:=26;
     

     Exl.Range['A2:I2'].Select;
     Exl.Selection.Font.Name:='Arial AzLat';
     Exl.Selection.Font.Color:=clBlue;
     Exl.Selection.Font.Size:=11;

     Sheet.Cells[2,2]:='Müştərinin adı';
     Sheet.Cells[2,3]:='Müqavilənin nömrəsi';
     Sheet.Cells[2,4]:='Hesab';
     Sheet.Cells[2,5]:='Ödəyəcəyi tarix';
     Sheet.Cells[2,6]:='Ödəyəcəyi məbləğ';
     Sheet.Cells[2,7]:='Ödənmiş əsas məbləğ';
     Sheet.Cells[2,8]:='Ödənmiş faiz məbləği';
     Sheet.Cells[2,9]:='Ay ərzində ödənmiş məbləği';

     Sheet.Range['B2:I2'].Borders.Color:=clRed;
      ms:=' '; mu:=' '; h:=' ';
      for i:=3 to DataModAE.PaymentData.RecordCount+2 do begin
        if ms<>DataModAE.PaymentData.FieldByName('NAME').AsString then
        Sheet.Cells[i,2]:=DataModAE.PaymentData.FieldByName('NAME').AsString;
        Sheet.Cells[i,2].Font.Name:='Arial AzLat';
        if mu<>DataModAE.PaymentData.FieldByName('NUMBEROFCREDIT').AsString then
        Sheet.Cells[i,3]:=DataModAE.PaymentData.FieldByName('NUMBEROFCREDIT').AsString;
        Sheet.Cells[i,3].Font.Name:='Arial AzLat';
        if h<>DataModAE.PaymentData.FieldByName('ACC_NUMBER').AsString then
        Sheet.Cells[i,4]:=DataModAE.PaymentData.FieldByName('ACC_NUMBER').AsString;
        Sheet.Cells[i,4].Font.Name:='Arial AzLat';
        Sheet.Cells[i,5]:=DataModAE.PaymentData.FieldByName('PAYMENTDATE').AsString;
        Sheet.Cells[i,5].Font.Name:='Arial AzLat';
        Sheet.Cells[i,6]:=DataModAE.PaymentData.FieldByName('PRINCIPAL').AsInteger;
        Sheet.Cells[i,6].Font.Name:='Arial AzLat';
        Sheet.Cells[i,7]:=DataModAE.PaymentData.FieldByName('PAYMENTAMOUNT').AsInteger;
        Sheet.Cells[i,7].Font.Name:='Arial AzLat';
        Sheet.Cells[i,8]:=DataModAE.PaymentData.FieldByName('PAYEDINTAMT').AsInteger;
        Sheet.Cells[i,8].Font.Name:='Arial AzLat';
        Sheet.Cells[i,9]:=DataModAE.PaymentData.FieldByName('MOUNTHPAY').AsInteger;
        Sheet.Cells[i,9].Font.Name:='Arial AzLat';
        ms:=DataModAE.PaymentData.FieldByName('NAME').AsString;
        mu:=DataModAE.PaymentData.FieldByName('NUMBEROFCREDIT').AsString;
        h:=DataModAE.PaymentData.FieldByName('ACC_NUMBER').AsString;
        DataModAE.PaymentData.Next;
      end;

finally
     Exl.Range['A1:A1'].Select;
     Screen.Cursor:=crDefault;
     ShowSheet;
end;
     DestroySheet;

end;

procedure TPayForm.FormCreate(Sender: TObject);
begin
     lup_borc.keyvalue:=-1;

with DataModAE do
begin
if BoorDSet.Active=true then BoorDSet.Close; BoorDSet.Open;
if AvalDSet.Active=true then AvalDSet.Close; AvalDSet.Open;
if FilialDSet.Active=true then FilialDSet.Close; FilialDSet.Open;
if PortDSet.Active=true then PortDSet.Close; PortDSet.Open;
if PReserves.Active=true then PReserves.Close; PReserves.Open;
if DateDSet.Active=true then DateDSet.Close; DateDSet.Open;
if Persons.Active=true then Persons.Close; Persons.Open;
if Pledges.Active=true then Pledges.Close; Pledges.Open;
if SReserves.Active=true then SReserves.Close; SReserves.Open;
if Categories.Active=true then Categories.Close; Categories.Open;
if UserGroups.Active=true then UserGroups.Close; UserGroups.Open;
if CreditTypes.Active=true then CreditTypes.Close; CreditTypes.Open;
if AccDSet.Active=true then AccDSet.Close; AccDSet.Open;
if MusIdDSet.Active=true then MusIdDSet.Close; MusIdDSet.Open;

PayRepForm := TPayRepForm.Create(Self);
end;
//DateTPic.Date:=DataModAE.DateDSet.FieldbyName('tek_dat').asdate;
end;

procedure TPayForm.BitBtn_ExitClick(Sender: TObject);
begin
close;
end;

procedure TPayForm.BitBtn_RClick(Sender: TObject);
begin
try
//Screen.Cursor:=crSQLWait;
      if ch_date.Checked=True then
                        DataModAE.PaymentData.Sql[20]:='and ps.paymentdate= '''+FormatDateTime('dd-MMM-yyyy',DateTPic.Date)+''''
       else
                        DataModAE.PaymentData.Sql[20]:=' ';
      if (ch_mus.Checked=True) AND (DBLCEh_mus.Text<>'') then
                        DataModAE.PaymentData.Sql[21]:='and b.name= '''+DBLCEh_mus.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[21]:=' ';
              end;
      if (ch_muq.Checked=True) AND (lup_muq.Text<>'') then
                        DataModAE.PaymentData.Sql[22]:='and p.numberofcredit= '''+lup_muq.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[22]:=' ';
              end;
      if (ch_hes.Checked=True) AND (lup_hes.Text<>'') then
                        DataModAE.PaymentData.Sql[23]:='and cm_common.AccountNumber_Get(a.contractaccid)='''+lup_hes.value+''''
       else
              begin
                        DataModAE.PaymentData.Sql[23]:=' ';
              end;
      if (ch_musid.Checked=True) AND (lup_musid.Text<>'') then
                        DataModAE.PaymentData.Sql[24]:='and p.boorowerid= '''+Inttostr(lup_musid.keyvalue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[24]:=' ';
              end;

       if (ch_borc.Checked=True) AND (lup_borc.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[25]:='and p.personaltype= '''+Inttostr(lup_borc.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[25]:=' ';
              end;

       if (ch_val.Checked=True) AND (lup_val.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[26]:='and p.currency= '''+Inttostr(lup_val.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[26]:=' ';
              end;

       if (ch_fil.Checked=True) AND (lup_fil.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[27]:='and p.branchid= '''+Inttostr(lup_fil.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[27]:=' ';
              end;

       if (ch_knov.Checked=True) AND (lup_knov.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[28]:='and p.credittype= '''+Inttostr(lup_knov.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[28]:=' ';
              end;
       if (ch_btip.Checked=True) AND (lup_btip.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[29]:='and p.CUSTOMERTYPE= '''+Inttostr(lup_btip.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[29]:=' ';
              end;
       if (ch_iqr.Checked=True) AND (lup_iqr.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[30]:='and p.USRGROUP= '''+Inttostr(lup_iqr.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[30]:=' ';
              end;
       if (ch_res.Checked=True) AND (lup_res.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[31]:='and cm_ak_reports.get_reserves(p.id)= '''+Inttostr(lup_res.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[31]:=' ';
              end;
       if (ch_dres.Checked=True) AND (lup_dres.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[32]:='and cm_ak_reports.get_reserves(p.id)= '''+Inttostr(lup_dres.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[32]:=' ';
              end;
       if (ch_ple.Checked=True) AND (lup_ple.keyValue<>-1) then
                        DataModAE.PaymentData.Sql[33]:='and cm_ak_reports.get_pledge(p.id)= '''+Inttostr(lup_ple.keyValue)+''''
       else
              begin
                        DataModAE.PaymentData.Sql[33]:=' ';
              end;

   if DataModAE.PaymentData.Active=true then DataModAE.PaymentData.Close; DataModAE.PaymentData.Open;
PayRepForm.PayQRep.Preview;

finally
Screen.Cursor:=crDefault;
end;

end;

procedure TPayForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Ord(Key) = VK_ESCAPE then
  begin
    Close;
    Key := #0;
  end;
end;

initialization

end.
