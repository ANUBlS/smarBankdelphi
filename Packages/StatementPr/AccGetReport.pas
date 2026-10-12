unit AccGetReport;
interface
 uses SysUtils, Oracle, OracleData, unitdata,StatementFrmImpl , Dialogs, Graphics;

 procedure ExportToExcelBySubAcc(Acc : String; ByVal:Boolean);
 procedure ExportData(DataSet: TOracleDataSet; Position : LongWord );
 procedure FormingData(BeginPos: LongWord; FinishPos : LongWord);
 procedure GetBySubAccout(Acc : String; ByVal:Boolean; BDat:TDateTime; EDat : TDateTime);
 procedure GetByBal(Bal : String; BDat:TDateTime; EDat : TDateTime);
 procedure GetAll(BDat:TDateTime; EDat : TDateTime);
const
 FinishPosition :LongWord = 0;
var
 Val_name : String;
 Accname : String;
 BegDat, EndDat : TDateTime;
 acc_id : Real;
   Ostat, Pok_ostat : Real;
implementation

procedure SetFilterByVisibleValue;
begin
 with StatementFrm, DataModSTX, OraDataSetMainExell do
   if CBTurnOver.Checked then
    begin
      Filtered:=False;
      Filter:= '(debet<>0) or (kredit<>0)';
      Filtered:=True;
    end
   else
    begin
      Filter:= '';
      Filtered:=False;
    end;
end;

procedure SetHeaderReportCaption(Acc : String);

begin
 with DataModSTX, OraDataSetMainExell, OraPackVExtraction do
  try
   Exl.Range['A:A'].select;
   Exl.Selection.NumberFormat := 'm/d/yyyy'; 
   Sheet.Cells[FinishPosition+1,5] :=  'Щесаб No:  '+Acc;
   Sheet.Cells[FinishPosition+2,5] :=  'Щесабын ады:  '+Accname;
   Sheet.Cells[FinishPosition+3,2] :=  'Ямяллийатын тарихи:';
   Sheet.Cells[FinishPosition+3,3] :=  FormatDateTime('dd-mmm-yyyy', BegDat);
   Sheet.Cells[FinishPosition+3,4] :=  FormatDateTime('dd-mmm-yyyy', EndDat);
   Sheet.Cells[FinishPosition+4,2] :=  'Валйута:';
   Sheet.Cells[FinishPosition+4,3] :=  Val_name;
   Sheet.Cells[FinishPosition+5,2] :=  'Эцнцн яввялиня галыг:';
   Sheet.Cells[FinishPosition+6,2] :=  'Валйутада:';
   Sheet.Cells[FinishPosition+7,2] :=  'Еквивалент:';
   Sheet.Cells[FinishPosition+8,2] :=  'Рясми мязяння:';
   Sheet.Cells[FinishPosition+8,3] := FloatToStr(CallFloatFunction('get_rate', [Acc_id, BegDat]));
   CallProcedure('get_ostat',[acc_id,  BegDat, 'OLD', ostat, pok_ostat]);

   Sheet.Cells[FinishPosition+6,3] :=  FormatFloat('#,##0.00', Abs(GetParameter(3)));
   Sheet.Cells[FinishPosition+7,3] :=  FormatFloat('#,##0.00', Abs(GetParameter(4)));
   Exl.Rows[IntToStr(FinishPosition+1)+':'+IntToStr(FinishPosition+9)].Select;

   Exl.Selection.Font.Bold := True;
   Exl.Selection.Font.Name := 'Arial AzLat';

  except
   on E:EOracleError do showmessage(E.Message);
  end;
end;

procedure SetFotherReportCaption(FinishPos: LongWord);

begin
    Sheet.Cells[FinishPos, 2] :=  'Эцнцн сонуна галыг:';
    Sheet.Cells[FinishPos+1, 2] :=  'Валйутада:';
    Sheet.Cells[FinishPos+2, 2] :=  'Еквивалент:';
    Sheet.Cells[FinishPosition+3,2] :=  'Рясми мязяння:';
    with DataModSTX, OraPackVExtraction do
    begin
      CallProcedure('get_ostat',[acc_id,  EndDat, 'CURR', ostat, pok_ostat]);
      Sheet.Cells[FinishPos+1, 3] :=
         FormatFloat('#,##0.00', Abs(GetParameter(3)));
      Sheet.Cells[FinishPos+2, 3] :=
         FormatFloat('#,##0.00', Abs(GetParameter(4)));
      Sheet.Cells[FinishPosition+3,3] :=
         FloatToStr(CallFloatFunction('get_rate', [Acc_id, EndDat]));         
    end;
    Exl.Rows[intToStr(FinishPos)+':'+intToStr(FinishPos+3)].Select;
    Exl.Selection.Font.Bold := True;
    Exl.Selection.Font.Name := 'Arial AzLat';
    FinishPosition := FinishPos+3;
end;

procedure ExportToExcelBySubAcc(Acc : String; ByVal:Boolean);
var BegPos  : LongWord;
begin
 with StatementFrm, DataModSTX, OraDataSetMainExell do
  try
   SetFilterByVisibleValue;
   Close;
   SetVariable('acc_id', acc_id);
   SetVariable('BeginDat', BegDat);
   SetVariable('EndDat', EndDat);
   if ByVal then
   begin
     SetVariable('ByValD', 'Ammount_c');
     SetVariable('ByValK', 'Ammount');
   end
   else
   begin
     SetVariable('ByValD', 'LAmmount');
     SetVariable('ByValK', 'LAmmount');
   end;
   Open;
   if (CBTurnOver.Checked) and (IsEmpty) then Exit; 
   SetHeaderReportCaption(Acc);
   BegPos := FinishPosition+9;
   ExportData(OraDataSetMainExell, FinishPosition+9);
   SetFotherReportCaption(FinishPosition);
   FormingData(BegPos, FinishPosition);
   Close;
   Exl.Cells[1,1].Select;    
  except
   on E:EOracleError do ShowMessage(E.Message);
  end;
end;
procedure FormingData(BeginPos: LongWord; FinishPos : LongWord);
begin
    Exl.Rows[intToStr(BeginPos)+':'+intToStr(FinishPos)].Select;
    Exl.Selection.Font.Name := 'Arial AzLat';
    Exl.Range[CHR(64+4)+IntToStr(BeginPos+1)+':'+ CHR(64+5)+IntToStr(FinishPos)].Select;
    Exl.Selection.Style := 'Comma';
end;
procedure ExportData(DataSet: TOracleDataSet; Position : LongWord );
var
  Col, Row: Word;
begin
  with DataSet do
  begin
   for Col :=0 to FieldCount-4 do
   begin
    Sheet.Cells[Position,Col+1] := Fields[Col].DisplayLabel;
    Exl.Selection.Font.Bold := True;
   end;
   if not IsEmpty then
     begin
       First;
       inc(Position,1 );
         for Row :=Position to Position+RecordCount-1 do
         begin
           for Col :=0 to FieldCount-4 do
           Sheet.Cells[Position, Col+1] := Fields[Col].asString;

             begin
              inc(Position, 1);
              if Fields[3].asFloat <> 0 then
                 Sheet.Cells[Position, 4] := Fields[6].asString
              else
                 Sheet.Cells[Position, 5] := Fields[8].asString;
              Exl.Range[CHR(64+4)+IntToStr(Position)+':'+CHR(64+5)+IntToStr(Position)].Select;
              Exl.Selection.Interior.ColorIndex := 14;
             end;

           inc(Position, 1);
           Next;
         end;
     end;
    FinishPosition := Position;
  end;
end;

procedure GetBySubAccout(Acc : String; ByVal:Boolean; BDat:TDateTime; EDat : TDateTime);
begin
  with DataModSTX, OraPackVExtraction do
    begin
       acc_id:= CallFloatFunction('check_account_number',[Acc, Val_name, Accname]);
       BegDat := BDat;
       EndDat := EDat;
       AccName := GetParameter(2);
       val_name := GetParameter(1);

       if val_name = '' then
         begin
          ShowMessage('Sub Account: "'+Acc+'" not found');
         end
       else
         ExportToExcelBySubAcc(Acc, ByVal);
    end;
end;

procedure GetByBal(Bal : String; BDat:TDateTime; EDat : TDateTime);
begin
  with DataModSTX, OraPackVExtraction do
    begin
       if CallFloatFunction('check_bal_number',[Bal]) = 0 then
         begin
           ShowMessage('Sub Account: "'+Bal+'" not found');
         end
       else
         with DataModSTX, OraDataSetBalcns do
         begin
           SetVariable('balcn', Bal);
           Open;
           First;
           while not EOF do
             begin
              GetBySubAccout(Fields[0].asString, False, BDat, EDat);
              Next;
             end;
           Close;
         end;
    end;
end;


procedure GetAll(BDat:TDateTime; EDat : TDateTime);
begin
   with DataModSTX, OraDataSetTurnBals do
   begin
     Open;
     First;
     while not EOF do
       begin
         GetByBal(Fields[0].Value, BDat, EDat);
         Next;
       end;
     Close;
     end;
end;


end.
