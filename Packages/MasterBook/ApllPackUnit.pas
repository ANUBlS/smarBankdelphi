unit ApllPackUnit;
interface

uses SysUtils, MasterBookImpl, ComObj, dialogs, Db, OracleData, Oracle, Controls;



const
   Months :array [1..12] of widestring =(
     'Yanvar', 'Fevral', 'Mart', 'Aprel', 'May', 'İyun', 'İyul', 'Avqust', 'Sentyabr', 'Oktyabr', 'Noyabr', 'Dekabr'
      );
const
   Capt = '____N-li hesabın kreditindən %s N-li jurnal-order üzrə';

const
   Debt_sumCol = 'Cəmi debet üzrə';
   Sum_kreditCol = 'Kredit üzrə dövriyyə';
   CapiSaldoCol = 'Qalıq (saldo)';
   DebtCol = 'Debet';
   KreditCol = 'Kredit';
   MonthCol =  'Ay';

type
   TRepType = (rtAll, rtOne);


var
  XL, Sheet : Variant;
  MinDate : TDate;
  MaxDate : TDate;
  kredit_num : array of WideString;
  kredit_num_column : array of String;




function SearchArray(arr : Array of WideString; Value: String):Integer;
procedure ExoprtExcel(BeginTurn, EndTurn: TDate; Type_:TRepType; Bal:WideString = '');


implementation




function SearchArray(arr : Array of WideString; Value: String):Integer;
var
  i:Integer;
begin

 for i:=Low(arr) to High(arr) do
   if value = arr[i] then
     begin
      Result := i;
      Break;
     end
     else Result := 0;
end;



procedure SetCell( stopRow:Integer; bal:WideString; activ: Real; passiv: Real; name:WideString=''  );

 function GetEXLCol(Num:Integer):String;
  const fonts = 26;
  var i,l: Integer;
  str : String;
 begin
   l := num;
   if l<0 then
   begin
     str := 'A';
     Result := Str;
     exit;
   end
   else
   if l<fonts then
   begin
     str := CHR(65+Num);
     Result := Str;
     exit;
   end;

   i:=0;
   repeat
     str := CHR(65+i);
     dec(l, fonts);
     inc(i);
   until l<fonts;
   if l>0 then
     str := str+CHR(65+l);
   Result := str;
 end;

var
   i, n,l : Integer;
   col :Integer;
begin
//********** Set Bal_cn name **************
       XL.Range['B' + IntToStr(StopRow)].value := Bal;
       XL.Range['C' + IntToStr(StopRow)].value := Name;
//**************** End *******************

///*************Set Columns ****************************
   with MasterBook, KreditAccDataSet do
     begin
       setVariable('Bal_cn', Bal);
       setVariable('MinDate', MinDate);
       setVariable('MaxDate', MaxDate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('wh', ' ')
       else setVariable('wh', ' where filial = '+IntToStr(Branch[ItemIndex]));
       Open;
       First;
       n:=0;
       kredit_num := nil;
       kredit_num_column := nil;
       SetLength(kredit_num, RecordCount);
       SetLength(kredit_num_column, RecordCount);
       if not IsEmpty then
       begin
        while not EOF do
         begin
          kredit_num[n]:= fieldByName('BAL_CN_KREDIT').asString;
          kredit_num_column[n]:= IntToStr(n+2);//CHR(66+n);
//          Sheet.Cells[kredit_num_column[n]+IntToStr(StopRow+1)].value:= fieldByName('BAL_CN_KREDIT').asString;
          Sheet.Cells[StopRow+1, StrToInt(kredit_num_column[n])] := fieldByName('BAL_CN_KREDIT').asString;
          Next;
          inc(n);
         end;
        dec(n);
       end;
       Close;

       try
       Sheet.Cells[StopRow+1, n+3] := Debt_sumCol;
       Sheet.Cells[StopRow+1, n+4] := Sum_kreditCol;
       Sheet.Cells[StopRow+1, n+5] := CapiSaldoCol;
       Sheet.Cells[StopRow+2, n+5] := DebtCol;
       Sheet.Cells[StopRow+3, n+5] := Activ;
       Sheet.Cells[StopRow+2, n+6] := KreditCol;
       Sheet.Cells[StopRow+3, n+6] := passiv;
       Sheet.Cells[StopRow+1, n+7] := MonthCol;
       except
         ShowMessage(intToStr(l)+'  '+intToStr(StopRow) +'  '+intToStr(n+5));
       end;
     end;

   XL.Range['A'+IntToStr(StopRow+1)].value := MonthCol;
   for i:= StopRow+4 to StopRow+15 do
     begin
       XL.Range['A'+IntToStr(i)].value := Months[i-StopRow-3];
     end;

///*************End*********************************

///*************************************************
///*************Set Data ***************************
///*************************************************

//*****************  SetObr Data *******************
   with MasterBook, ObrDebtDataSet do
     begin
       setVariable('Bal_cn', Bal);
       setVariable('MinDate', MinDate);
       setVariable('MaxDate', MaxDate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('wh', ' ')
       else setVariable('wh', ' where filial = '+IntToStr(Branch[ItemIndex]));
       Open;
       First;
       while not EOF do
         begin
          Sheet.Cells[StrToInt(FieldByName('MONTH').AsString)+StopRow+3,
                      StrToInt(kredit_num_column[SearchArray(kredit_num, FieldByName('BAL_CN_KREDIT').AsString)])]
                      := FieldByName('obr').AsString;
          Next;
         end;
       Close;
     end;

//*****************  Summ For Debt *******************
    with MasterBook, DataSetSumDebt do
     begin
       setVariable('Bal_cn', Bal);
       setVariable('MinDate', MinDate);
       setVariable('MaxDate', MaxDate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('wh', ' ')
       else setVariable('wh', ' where filial = '+IntToStr(Branch[ItemIndex]));
       Open;
       First;
       while not EOF do
         begin
          Sheet.Cells[ StrToInt(FieldByName('MONTH').AsString)+stopRow+3, n+3 ] :=
                 FieldByName('obrdebt').AsString;
          Next;
         end;
       Close;
     end;


////*****************Sum For Kredit************************
    with MasterBook, DataSetSumKredit do
     begin
       setVariable('Bal_cn', Bal);
       setVariable('MinDate', MinDate);
       setVariable('MaxDate', MaxDate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('wh', ' ')
       else setVariable('wh', ' where filial = '+IntToStr(Branch[ItemIndex]));
       Open;
       First;
       while not EOF do
         begin
          Sheet.Cells[StrToInt(FieldByName('MONTH').AsString)+stopRow+3, n+4 ] :=
                 FieldByName('OBRKREDIT').AsString;
          Next;
         end;
       Close;
     end;

////*****************Cemi Saldo************************
     with MasterBook, DataSetSumSaldo do
     begin
       setVariable('Bal_cn', Bal);
       setVariable('MinDate', MinDate);
       setVariable('MaxDate', MaxDate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('fil', ' ')
       else setVariable('fil', ' and filial = '+IntToStr(Branch[ItemIndex]));
       Open;
       First;
       while not EOF do
         begin
          Sheet.Cells[IntToStr(StrToInt(FieldByName('MONTH').AsString)+stopRow+3), n+5 ] :=
                 FieldByName('ACTIVE').AsString;
          Sheet.Cells[IntToStr(StrToInt(FieldByName('MONTH').AsString)+stopRow+3), n+6 ] :=
                 FieldByName('PASSIVE').AsString;
          Next;
         end;
       Close;
     end;

////*****************Months**********************
   for i:= StopRow+4 to StopRow+15 do
     begin
       Sheet.Cells[IntToStr(i), n+7] := Months[i-StopRow-3];
     end;
//***********************************************

//******************* Fother Sum ****************
   for i:=Low(kredit_num_column) to High(kredit_num_column) do
        Sheet.Cells[IntToStr(StopRow+17), i+2 ] :=
               '=SUM('+GetEXLCol(i+1) +IntToStr(StopRow+4)+':'+GetEXLCol(i+1)+ IntToStr(StopRow+15) +')';


   col := High(kredit_num_column)+1;

   for i:=1 to 2 do
      begin
       XL.Range[GetEXLCol(col+i)+IntToStr(StopRow+17)].value :=
               '=SUM('+GetEXLCol(col+i) +IntToStr(StopRow+4)+':'+GetEXLCol(col+i)+ IntToStr(StopRow+15) +')';
      end;
   XL.Range[GetEXLCol(col+3)+IntToStr(StopRow+17)].value := XL.Range[GetEXLCol(col+3)+IntToStr(StopRow+15)].value;
   XL.Range[GetEXLCol(col+4)+IntToStr(StopRow+17)].value := XL.Range[GetEXLCol(col+4)+IntToStr(StopRow+15)].value;
//*****************   End ***********************



//***********************************************
//************** Arange *************************
//***********************************************

  XL.Range['A' + InTtoStr(StopRow), GetEXLCol(n+6)+ IntToStr(StopRow+17)].Select;
  XL.Selection.Font.name := 'Tahoma';
  XL.Selection.Borders.Color:= $00000000;

  XL.Range['A' + InTtoStr(StopRow), GetEXLCol(n+6)+ IntToStr(StopRow)].Select;
  XL.Selection.Font.Size := 15;
  XL.Selection.Font.Bold := True;

  XL.Range['A' + InTtoStr(StopRow+1), GetEXLCol(n+6)+ IntToStr(StopRow+3)].Select;
  XL.Selection.Font.Bold := True;

  XL.Range['A' + InTtoStr(StopRow), 'A'+ IntToStr(StopRow+15)].Select;
  XL.Selection.Font.Bold := True;
  XL.Selection.ColumnWidth := 25;


  XL.Range[GetEXLCol(n+4)+ IntToStr(StopRow), GetEXLCol(n+6)+ IntToStr(StopRow+17)].Select;
  XL.Selection.Font.Bold := True;
  XL.Selection.ColumnWidth := 25;

  XL.Range['B'+IntToStr(StopRow+3), GetEXLCol(n+6) + IntToStr(StopRow+17)].Select;
  XL.Selection.Style := 'Comma';
  XL.Selection.ColumnWidth := 25;

end;




procedure ExoprtExcel(BeginTurn, EndTurn: TDate; Type_:TRepType; Bal:WideString = '');
var
  row : Integer;
begin
 try
   XL:=CreateOLEObject('Excel.Application');
   XL.WorkBooks.add;
   Sheet := XL.Application.Worksheets.Item[1];
 except
   ShowMessage('Can not create Excel file!');
   exit;
 end;
//   XL.visible:=true;
   minDate := BeginTurn;
   maxDate := EndTurn;

 with MasterBook, DataSetGetBalName do
     begin
     Close;
     SetVariable('minDat', mindate);
       with CBBranch do
       if ItemIndex = 0 then
        setVariable('fil', ' ')
       else setVariable('fil', ' and filial = '+IntToStr(Branch[ItemIndex]));
     Open;
       if Type_ = rtAll then
         begin
           Row := 1;
           ProgressBar.MaxValue := RecordCount;
           First;
           while not EOF do
              begin
                 SetCell( row, FieldByName('BAL_CN').asString,
                 FieldByName('ACTIVE').AsFloat, FieldByName('PASSIV').AsFloat, FieldByName('BALNAME').asString);
                 inc(row, 21);
                 ProgressBar.Progress:= ProgressBar.Progress+1;
                 Next;

              end;
         end
         else
           begin
             Locate('BAL_CN', Bal, []);
             SetCell(1, Bal , FieldByName('ACTIVE').AsFloat,
              FieldByName('PASSIV').AsFloat, FieldByName('BALNAME').asString);
           end;
      Close;
    end;

   try
     XL.Range['A1'].Select;
     XL.visible:=true;
     MasterBook.ProgressBar.Progress:= 100;
   finally
     Finalize(Sheet);
     Finalize(xl);
     MasterBook.ProgressBar.Progress:=0;
   end;
end;

end.
