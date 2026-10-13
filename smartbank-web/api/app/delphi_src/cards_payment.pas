{ Verbatim copy of Packages/Cards_New/cards_azericard/payment.pas lines 203-445 (unchanged; executed by api/app/pascal.py) }
  function whenday:integer;
  const yan=31;mar=31;apr=30;may=31;jun=30;jul=31;avg=31;seb=30;okt=31;nov=30;dec=31;
  var   wday,feb:integer;
 begin
  wday:=0;
  if IsLeapYear(strtoint(FormatDateTime('yyyy',date))) then feb:=29 else feb:=28;
  case strtoint(FormatDateTime('mm',date)) of
                                              1:wday:=StrToInt(FormatDateTime('dd',date));
                                              2:wday:=yan+StrToInt(FormatDateTime('dd',date));
                                              3:wday:=yan+feb+StrToInt(FormatDateTime('dd',date));
                                              4:wday:=yan+feb+mar+StrToInt(FormatDateTime('dd',date));
                                              5:wday:=yan+feb+mar+apr+StrToInt(FormatDateTime('dd',date));
                                              6:wday:=yan+feb+mar+apr+may+StrToInt(FormatDateTime('dd',date));
                                              7:wday:=yan+feb+mar+apr+may+jun+StrToInt(FormatDateTime('dd',date));
                                              8:wday:=yan+feb+mar+apr+may+jun+jul+StrToInt(FormatDateTime('dd',date));
                                              9:wday:=yan+feb+mar+apr+may+jun+jul+avg+StrToInt(FormatDateTime('dd',date));
                                             10:wday:=yan+feb+mar+apr+may+jun+jul+avg+seb+StrToInt(FormatDateTime('dd',date));
                                             11:wday:=yan+feb+mar+apr+may+jun+jul+avg+seb+okt+StrToInt(FormatDateTime('dd',date));
                                             12:wday:=yan+feb+mar+apr+may+jun+jul+avg+seb+okt+nov+StrToInt(FormatDateTime('dd',date));
  end;
  Result:=wday;
 end;

 Function when2Str(wday:integer): string;
  var
  wd: string;

 begin
  wd:=InttoStr(wday);
  case length(wd) of
                    1: wd:='00'+wd;
                    2: wd:='0'+wd;
  end;
  when2Str:=wd;
 end;





procedure TPayments.Button3Click(Sender: TObject);

begin
Button5.Click;
end;

procedure TPayments.Button5Click(Sender: TObject);
var
  F:TextFile;
  SumOfBalance, SumOfBalanceRD :Real;
  BHCount, {BHRecordCount,} RDCount, {RDRecordCount,} RowCount, Nom, i, j :Integer;
  FileName, FHeader, {FFooter,} STMessage, RowNum, all, TempSTR, TempCUR, TempDIR :String;
begin

 {   DataMod_CARDS.checkmulti.close;

     DataMod_CARDS.checkmulti.SetVariable('V_RBS',DataMod_CARDS.payment.FieldByName('RBSNUMBER_1').AsString);
      DataMod_CARDS.checkmulti.open;

      if DataMod_CARDS.checkmulti.FieldByName('multi').AsInteger=0 then
         begin          }




  if DataMod_CARDS.payment.RecordCount=0 then exit;
  if DBGrid1.SelectedRows.Count=0 then exit;
  {FILE NAME}
  if not DirectoryExists('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE))
   then MkDir('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE));
  FileListBox1.Directory:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE);
  FileListBox1.Update;
  Nom :=0;
  for i :=1 to 999 do begin
   all :='';
   for j :=Length(IntToStr(i)) to 2 do all :='_'+all;
   FileName:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\P'+DataMod_CARDS.settings.fieldbyname('bankid').asstring +all+IntToStr(i)+'.'+when2Str(WhenDay);
   if not(FileExists(FileName)) then begin Nom:=i; Break; end;
  end;{for i :=1 to 999}
  AssignFile(F,Filename);
  Rewrite(F);

  {FH File Header}
  FHeader :='';
  all :=IntToStr(Nom);
  for j :=length(all) to 1 do all :='0'+all;
  FHeader :='FH000001PAYMENT   12 ' + DataMod_CARDS.settings.fieldbyname('bankid').asstring + '  ' + FormatDateTime('yyyymmdd',date) + FormatDateTime('hhmmss',time)+ '00' + all + DataMod_CARDS.settings.fieldbyname('bankid').asstring + '  RRNBD N';
  for j :=59 to 203 do FHeader :=FHeader+' ';
  FHeader :=FHeader+'*'; Writeln(F, FHeader);

  DataMod_CARDS.payment.First;
  SumOfBalance :=0;
  BHCount :=0;
  i :=0;
  while (i<DBGrid1.SelectedRows.Count) do begin
   DataMod_CARDS.Payment.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
   {FILE MESSAGE}
   STmessage:='';
   RowCount :=0;
   BHCount :=BHCount+1;
   RDCount :=0;
   SumOfBalanceRD :=0;
   Reset(F);
   while not eof(F) do begin RowCount :=RowCount+1; Readln(F); end;
   {BH Batch Header}
   Append(F);
   RowNum :=IntToStr(RowCount+1);
   for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
   RDCount :=0;
   TempCUR :=DataMod_CARDS.Payment.FieldByName('Currency').AsString;
   TempDIR :=DataMod_CARDS.Payment.FieldByName('TIP').AsString;
   STmessage :='BH' + RowNum;
   RowNum :=IntToStr(BHCount);
   for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
   if DataMod_CARDS.Payment.FieldByName('TIP').AsString='D' then TempSTR :='PAYFACC'
    else TempSTR :='PAYACC';
   for j :=Length(TempSTR) to 11 do TempSTR :=TempSTR+' ';
   STMessage :=STMessage+RowNum+'    '+TempSTR+{P}' ';
   STMessage :=STMessage+'    ';
   STMessage :=STMessage+DataMod_CARDS.Payment.FieldByName('TIP').AsString;
   STMessage :=STMessage+DataMod_CARDS.Payment.FieldByName('Currency').AsString;
   for j :=41 to 204 do STMessage :=STMessage+' ';
   STMessage :=STMessage+'*';
   if not DataMod_CARDS.Payment.Eof then
   Writeln(F,STmessage);
   {RD Message Structure}
   TempCUR :=DataMod_CARDS.Payment.FieldByName('Currency').AsString;
   TempDIR :=DataMod_CARDS.Payment.FieldByName('TIP').AsString;
   while ((i <DBGrid1.SelectedRows.Count)
     and (TempCUR =DataMod_CARDS.Payment.FieldByName('Currency').AsString)
     and (TempDIR =DataMod_CARDS.Payment.FieldByName('TIP').AsString)) do begin
    RowCount :=RowCount+1;
    RDCount :=RDCount+1;
    RowNum :=IntToStr(RowCount+1);
    for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
    STMessage :='RD'+RowNum;
    RowNum :=IntToStr(RDCount);
    for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
    STMessage :=STMessage+RowNum;
    RowNum :=FloatToStr((DataMod_CARDS.Payment.FieldByName('Ammount').AsFloat)*100); {Transaction amount}
    SumOfBalanceRD :=SumOfBalanceRD+StrToFloat(RowNum);
    for j :=Length(RowNum) to 14 do RowNum :='0'+RowNum;
    STMessage :=STMessage+RowNum;




       //  RowNum :=DataMod_CARDS.Payment.FieldByName('RBSNumber_1').AsString; {Contract number}
      RowNum :=DataMod_CARDS.Payment.FieldByName('multiacc').AsString; {Contract number}







    for j :=Length(RowNum) to 31 do RowNum :=RowNum+' ';
    STMessage :=STMessage+RowNum;
    for j :=62 to 203 do STMessage :=STMessage+' ';
    STMessage :=STMessage+'*';
    Writeln(F,STmessage);
    {------------------------------Payment-Filter-----------------------------}
    //   DataMod.OP_Payment.CallProcedure('ADD_PAYMENT_FILTER',[
                              //       DataMod.ODSPayments.FieldByName('id').AsString
                              //                                  ]);
                             //

                             with    DataMod_CARDS.payment do begin
                                   DataMod_CARDS.mainpacket.CallProcedure('delete_payment',[]);
                                    DataMod_CARDS.payment.Open;


                                   DataMod_CARDS.mainpacket.CallProcedure('insert_payment',[FieldbyName('id').asinteger,
                                                                         FieldbyName('CARDNUMBER').AsString,
                                                                         FieldbyName('RBSNUMBER_1').AsString,
                                                                         FieldbyName('ACCID').AsiNTEGER,
                                                                         FieldbyName('CURRENCY').AsString,
                                                                         FieldbyName('AMMOUNT').AsiNTEGER,
                                                                         FieldbyName('LAMMOUNT').AsiNTEGER,
                                                                         FieldbyName('NAME').AsString,
                                                                         FieldbyName('TIP').AsString,
                                                                         FieldbyName('DAT').AsDATETIME,
                                                                         FieldbyName('OPID').AsString,
                                                                         FieldbyName('COMMITEDOPID').AsString,
                                                                         FieldbyName('FILIAL').AsString,
                                                                         FieldbyName('TIM').ASDATETIME]) ;   end;



    {------------------------------Payment-Filter-----------------------------}
    i:=i+1;
    if i<DBGrid1.SelectedRows.Count then
     DataMod_CARDS.Payment.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
   end;{while i and TempCUR and TempDIR}
   {RD close}
   RowCount :=RowCount+1;
   RowNum :=IntToStr(RowCount+1);
   for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
   STMessage :='BT'+RowNum;
   RowNum:=IntToStr(RDCount);
   for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
   STMessage :=STMessage+RowNum;
   RowNum :=FloatToStr(SumOfBalanceRD);
   for j :=Length(RowNum) to 17 do RowNum :='0'+RowNum;
   STMessage :=STMessage+RowNum;
   for j :=33 to 203 do STMessage :=STMessage+' ';
   STMessage :=STMessage+'*';
   Writeln(F,STMessage);
   SumOfBalance :=SumOfBalance+SumOfBalanceRD;
   {BH close}
  end;{while (i<DBGridPayment.SelectedRows.Count)}
  {File footer}
  RowCount :=RowCount+1;
  RowNum :=IntToStr(RowCount+1);
  for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
  STMessage :='FT'+RowNum;
  RowNum :=IntToStr(BHCount);
  for j :=Length(RowNum) to 5 do RowNum :='0'+RowNum;
  STMessage :=STMessage+RowNum;
  RowNum :=FloatToStr(SumOfBalance);
  for j :=Length(RowNum) to 17 do RowNum :='0'+RowNum;
  STMessage :=STMessage+RowNum;
  for j :=33 to 203 do STMessage :=STMessage+' ';
  STMessage :=STMessage+'*';
  Writeln(F,STMessage);
  CloseFile(F);
  {------------------------------------------------}
   // ActRefreshExecute(Sender);
  {------------------------------------------------}
 
  DataMod_CARDS.payment.Refresh;
  ShowMessage('PAYMENT FILE CREATED');

         {end else

         begin

            //  Button6.Click;
         end;   }

end;


