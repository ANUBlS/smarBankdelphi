{ Verbatim copy of Packages/LVPCSSManager_Turan/LVPCSSImpl.pas lines 1394-1847 (unchanged; executed by api/app/pascal.py) }
function TLVPCSSForm.LoadToRich(FileName :string):string;
   var stpos,endpos: integer;
   ref : String;
begin
   RichEdit1.Clear;
   RichEdit1.Lines.LoadFromFile(FileName,TEncoding.UTF8);
   stpos:=RichEdit1.FindText('<msg_user_reference>',0,RichEdit1.GetTextLen,[stMatchCase]);
   endpos:=RichEdit1.FindText('</msg_user_reference>',0,RichEdit1.GetTextLen,[stMatchCase]);
   RichEdit1.SelStart:=stpos+length('<msg_user_reference>');
   RichEdit1.SelLength:=abs(endpos-stpos)-length('<msg_user_reference>');
   ref:=RichEdit1.SelText;
   DataMod.DataCheck.Close;
   DataMod.DataCheck.sql.Clear;
   DataMod.DataCheck.SQL.Add('Select reference from xs_incoming where reference='''+ref+'''');
   DataMod.DataCheck.Open;
   if DataMod.DataCheck.RecordCount > 0 then begin RichEdit1.Clear;Result:='0'; end else Result:=ref;
end;
{CONVERT TO BASE}
procedure TLVPCSSForm.ConvertToBase(Rich : TRichEdit;ref :string);
   var  startPos,EndPos, FnStartPos, FnEndPos,P,
        TempPos,TempLine, LineIndex, TempVar : integer;
        StMessage,sub50K,name50K,inn50K,Code50K,BnkRek50K : string;
        Fn77B: boolean; accfinded: Boolean;
        I : Integer;
        {Xs_incoming tabele deyisenler}

        v_transdate      :TDateTime;
        v_reference      :string;
        v_F20            :string;
        v_F21            :string;
        v_Valcod         :integer;
        v_amount         :real;
        v_senacc         :string;
        v_senname        :string;
        v_seninn         :string;
        v_sencode        :string;
        v_senbankid      :integer;
        v_senbanksubacc  :string;
        v_recbanksubacc  :string;
        v_recbankbik     :string;
        v_recclientacc   :string;
        v_filial         :integer;
        v_recclientname  :string;
        v_recclientinn   :string;
        v_recclientcode  :string;
        v_recclientaccid :integer;
        v_remitinf       :string;
        v_typecode       :integer;
        v_addinf         :string;

        v_senbankbik     :string;
        v_senbankcode    :integer;
        v_senbankinn     :string;
        v_senbankkrno    :string;



 function FindMyText(Tx:string;posStart,posEnd : integer) :integer;
   var  temp : integer;
   begin
    Temp:=Rich.FindText(Tx,posStart+1,posEnd+1,[stMatchCase]);
    Rich.SelStart:=Temp;
    Rich.SelLength:=length(tx);
    Result:=temp;
   end;
 function FindLines(Tx:string;posStart,posEnd : integer) :integer;
   var  temp : integer;
   begin
     Temp:=Rich.FindText(Tx,posStart+1,posEnd+1,[stMatchCase]);
     if temp >-1 then
     begin
       Rich.SelStart:=Temp;
       Rich.SelLength:=length(tx);
       Result:=Rich.CaretPos.y
     end
     else  Result:=-1;
   end;
 function Replace(s:string):string;
 var
    j:integer;
    Text:string;
 begin
   j:=0;
   repeat
     inc(j);
     if s[j] ='/' then  begin
                          delete(s,j,1);
                          j:=j-1;
                        end;
     if s[j] =' ' then begin
                         delete(s,j,1);
                          j:=j-1;
                     end;
    until  j>=length(s);
    Replace:=s;
end;


begin
  TRY
   if Rich.GetTextLen = 0 then exit;
   startPos:=0;
   Fn77B:=false;
   FnStartPos:=FindMyText(':20:',startPos,Rich.GetTextLen);
   P:=FnStartPos-1;
   LineIndex:=Rich.CaretPos.y;
   FnEndPos:=FindMyText(':26T:',startPos,Rich.GetTextLen);
   TempPos:=FindMyText(':77B:',startPos,Rich.GetTextLen);
   if (TempPos >-1)and(TempPos=FnEndPos+10) then begin FnEndPos:=TempPos;Fn77B:=true; end;
   while  FnStartPos >-1 do
   begin
     v_addinf:='';
       //DataMod.XS_Incoming.Insert;
       {READ FROM BODY}
        //DataMod.XS_Incoming.FieldByName('trans_date').AsDateTime := GetUseDate;  //DataMod.GetSysDate.CallDateFunction('Get_date',[]);
        v_transdate:=GetUseDate;

        //DataMod.XS_Incoming.FieldByName('reference').AsString:=ref;

        v_reference:=ref;

       // DataMod.XS_Incoming.FieldByName('part').AsInteger:=1;
        {20}
         TempLine:=   FindLines(':20:',P,FnEndPos);
         StMessage:= trim(copy(Rich.Lines[TempLine],26,7));
         //ShowMessage(StMessage);
         //DataMod.XS_Incoming.FieldByName('F_20').AsString:=StMessage;
         v_F20:=StMessage;

        {21}
         TempLine:=   FindLines(':21:',FnStartPos-38,FnEndPos);
         StMessage:= trim(copy(Rich.Lines[TempLine],5,15));
         //DataMod.XS_Incoming.FieldByName('F_21').AsString:=StMessage;
         v_F21:=StMessage;

        {32B}
        TempLine:=   FindLines(':32B:',FnStartPos,FnEndPos);

        StMessage:=trim(copy(Rich.Lines[TempLine],6,3));
        DataMod.DataTemp.Close;
        DataMod.DataTemp.SQL.Clear;
        DataMod.DataTemp.SQL.Add('Select valute from avalute where val_name='''+StMessage+'''');
        DataMod.DataTemp.Open;

        //DataMod.XS_Incoming.FieldByName('val_cod').AsInteger:=DataMod.DataTemp.fieldbyname('valute').AsInteger;

        v_Valcod:=DataMod.DataTemp.fieldbyname('valute').AsInteger;

        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));

   //     ShowMessage(StMessage);

        StMessage :=StringReplace(StMessage,',',DecimalSeparator,[rfReplaceAll]);

    //    ShowMessage(StMessage);

       // DataMod.XS_Incoming.FieldByName('amount').AsFloat:=StrToFloat(StMessage);

        v_amount:=StrToFloat(StMessage);
//        DataMod.XS_Incoming.FieldByName('amount').AsString:=StMessage;
        {50K}
        TempLine:=   FindLines(':50K:',FnStartPos,FnEndPos);
        TempVar:=abs(FindLines(':52A:',FnStartPos,FnEndPos)-TempLine);
        if (tempvar<=5) then
        begin
          StMessage:=trim(copy(Rich.Lines[TempLine],7,Length(Rich.Lines[TempLine])-6));

          sub50K:=StMessage;
        //  DataMod.XS_Incoming.FieldByName('sen_acc').AsString:=StMessage;

          v_senacc:=StMessage;

          {}
          StMessage:=trim(Rich.Lines[TempLine+1]);
          name50K:=StMessage;
          //DataMod.XS_Incoming.FieldByName('sen_name').AsString:=StMessage;

          v_senname:=StMessage;
          {}
          StMessage:=copy(trim(Rich.Lines[TempLine+2]),0,pos('/',trim(Rich.Lines[TempLine+2]))-1);
          inn50K:=StMessage;
          v_seninn:= StMessage;

          StMessage:=copy(trim(Rich.Lines[TempLine+2]),pos('/',trim(Rich.Lines[TempLine+2]))+1,pos('/',trim(Rich.Lines[TempLine+2]))+20);
          {}
          Code50K:=StMessage;
          v_sencode:=StMessage;

         // StMessage:=trim(Rich.Lines[TempLine+3]);


          //DataMod.XS_Incoming.FieldByName('sen_inn').AsString:=StMessage;

          {}
          StMessage:=copy(trim(Rich.Lines[TempLine+3]),0,pos('/',trim(Rich.Lines[TempLine+3]))-1);
          BnkRek50K:=StMessage;
          v_senbankcode:=StrToInt(StMessage);

          StMessage:=copy(trim(Rich.Lines[TempLine+3]),pos('/',trim(Rich.Lines[TempLine+3]))+1,pos('/',trim(Rich.Lines[TempLine+4]))+9);
          v_senbankinn:=StMessage;


          {}
          StMessage:=trim(Rich.Lines[TempLine+4]);
          v_senbankkrno:=StMessage;





          DataMod.DataTemp.Close;
          DataMod.DataTemp.SQL.Clear;
          DataMod.DataTemp.SQL.Add('Select id from BankM where bankcode='''+BnkRek50K+'''');
          DataMod.DataTemp.Open;
          //DataMod.XS_Incoming.FieldByName('sen_bank_id').AsInteger:=DataMod.DataTemp.fieldbyname('id').AsInteger;
          v_senbankid:=DataMod.DataTemp.fieldbyname('id').AsInteger;
        end
         else
            begin
             // DataMod.XS_Incoming.FieldByName('sen_acc').AsString:=sub50K;
                v_senacc:=sub50K;
              {}
             // DataMod.XS_Incoming.FieldByName('sen_name').AsString:=name50K;
              v_senname:=name50K;
              {}
              //DataMod.XS_Incoming.FieldByName('sen_inn').AsInteger:=strtoint(inn50K);
              v_seninn:=inn50K;
              {}
              v_sencode:=Code50K;

              DataMod.DataTemp.Close;
              DataMod.DataTemp.SQL.Clear;
              DataMod.DataTemp.SQL.Add('Select id from BankM where bankcode='''+BnkRek50K+'''');
              DataMod.DataTemp.Open;
             // DataMod.XS_Incoming.FieldByName('sen_bank_id').AsInteger:=DataMod.DataTemp.fieldbyname('id').AsInteger;
             v_senbankid:=DataMod.DataTemp.fieldbyname('id').AsInteger;
            end;

        {52A}
        TempLine:=   FindLines(':52A:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));
        //DataMod.XS_Incoming.FieldByName('sen_bank_subacc').AsFloat:=StrToFloat(StMessage);
         v_senbanksubacc:=StMessage;
        {}
        StMessage:=Rich.Lines[TempLine+1];
        v_senbankbik:=StMessage;

        {57A}
        TempLine:=   FindLines(':57A:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],9,Length(Rich.Lines[TempLine])-8));
        //DataMod.XS_Incoming.FieldByName('rec_bank_subacc').AsFloat:=strtoFloat(StMessage);
        v_recbanksubacc:=StMessage;
        {}
        StMessage:=trim(Rich.Lines[TempLine+1]);
        //DataMod.XS_Incoming.FieldByName('rec_bank_bik').AsString:=StMessage;

        v_recbankbik:=StMessage;

        {59}
        TempLine:=   FindLines(':59:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],6,Length(Rich.Lines[TempLine])-5));
        //DataMod.XS_Incoming.FieldByName('rec_client_acc').AsString:=StMessage;


        v_recclientacc:=StMessage;
        //ShowMessage(v_recclientacc);
        v_recclientacc:=Replace(v_recclientacc);


        //ShowMessage(te);
        //DataMod.XS_Incoming.FieldByName('Filial').AsInteger:=0;
        v_Filial:=0;

        {DataMod.DataTemp.Close;
        DataMod.DataTemp.SQL.Clear;
        DataMod.DataTemp.SQL.Add('Select id,filial from account where acc_no='''+StMessage+''' and close_dat is null');
        DataMod.DataTemp.Open;
        if DataMod.DataTemp.RecordCount >0 then
        Begin
          accfinded:=true;
          DataMod.XS_Incoming.FieldByName('rec_client_acc_id').AsInteger:=DataMod.DataTemp.fieldbyname('id').AsInteger;}
          {Find FILIAL CLIENT OR HEAD OFFICE}
        {  if DataMod.DataTemp.FieldByName('filial').AsInteger>0 then
             DataMod.XS_Incoming.FieldByName('Filial').AsInteger:=DataMod.DataTemp.FieldByName('Filial').AsInteger;

        end else
        accfinded:=false;}

        {}
        StMessage:=trim(Rich.Lines[TempLine+1]);

       // DataMod.XS_Incoming.FieldByName('rec_client_name').AsString:=StMessage;
        v_recclientname:=StMessage;
        {}
        StMessage:=copy(trim(Rich.Lines[TempLine+2]),0,pos('/',trim(Rich.Lines[TempLine+2]))-1);

        v_recclientinn:=StMessage;
        {}
        StMessage:=copy(trim(Rich.Lines[TempLine+2]),pos('/',trim(Rich.Lines[TempLine+2]))+1,pos('/',trim(Rich.Lines[TempLine+2]))+6);
        v_recclientcode:=StMessage;

      //  DataMod.XS_Incoming.FieldByName('rec_client_inn').AsString:=StMessage;



        {FIND INN OF CLIENT after CLIENT ACCOUNT ID}
        AccFinded :=True; {for not working the next condition. In future I may need it}
        //Memo1.Text:=StMessage;

        if (Length(Trim(StMessage)) > 0)and(accfinded=false) then begin
          for i := Length(StMessage) - 1 downto  0 do
            if not( StMessage[I]  in ['0'..'9']) then
             Delete(StMessage, I, 1);
          DataMod.DataTemp.Close;
          DataMod.DataTemp.SQL.Clear;
          DataMod.DataTemp.SQL.Add('Select a.id acc_id,a.acc_no acc_no from customers c,account a,avalute v   where (c.inn='''+StMessage+''')and(a.kli_id=c.id)and(a.close_dat is null)and(v.valute = a.val_acc)and((v.val_name=''AZM''))');
          DataMod.DataTemp.Open;
          //Memo1.Text:=DataMod.DataTemp.SQL.Text;

          {if inn find then find client}
          if DataMod.DataTemp.RecordCount > 0 then
          begin
            //DataMod.XS_Incoming.FieldByName('rec_client_acc_id').AsInteger:=DataMod.DataTemp.fieldbyname('acc_id').AsInteger;
            v_recclientaccid:=DataMod.DataTemp.fieldbyname('acc_id').AsInteger;
           // DataMod.XS_Incoming.FieldByName('rec_client_acc').AsString:=DataMod.DataTemp.fieldbyname('acc_no').AsString;
            v_recclientacc:=DataMod.DataTemp.fieldbyname('acc_no').AsString;
          end;
        end;

        {}
        StMessage:=copy(trim(Rich.Lines[TempLine+3]),0,pos('/',trim(Rich.Lines[TempLine+3]))-1);  {Bank code}
        //StMessage:=Trim(Copy(Rich.Lines[TempLine+4],1,6)); {Bank code}
        //ShowMessage(StMessage);

      // StMessage:=copy(trim(Rich.Lines[TempLine+4]),0,pos('/',trim(Rich.Lines[TempLine+4]))-1);

        with DataMod.DataTemp do begin
         Close;
         SQL.Clear;
         SQL.Add('Select Kod_Fil from BankInfo_T where Kod_B='''+StMessage+'''');
         Open;
         if RecordCount =1 then
         // DataMod.XS_Incoming.FieldByName('Filial').AsInteger:=DataMod.DataTemp.FieldByName('Kod_Fil').AsInteger;
         v_Filial:=DataMod.DataTemp.FieldByName('Kod_Fil').AsInteger;
        end;{with DataMod.DataTemp}

        with DataMod.DataTemp do begin
         Close;
         SQL.Clear;
         (*SQL.Add('Select ID from Account where Acc_no='''+DataMod.XS_Incoming.FieldByName('Rec_Client_Acc').AsString+
                 '''and Filial='''+DataMod.XS_Incoming.FieldByName('Filial').AsString+
                  ''' and close_dat is null');   *)

          SQL.Add('Select ID from Account where Acc_no='''+v_recclientacc+
               {  '''and Filial='''+IntToStr(v_Filial)+ }
                  ''' and close_dat is null');
         Open;
        if RecordCount =1 then
         // DataMod.XS_Incoming.FieldByName('Rec_Client_Acc_ID').AsInteger:=DataMod.DataTemp.FieldByName('ID').AsInteger;

         v_RecClientAccID:=DataMod.DataTemp.FieldByName('ID').AsInteger
         else  v_RecClientAccID:=0;
        end;{with DataMod.DataTemp}

        {70}
        startPos:=FindMyText(':70:',FnStartPos,Rich.GetTextLen);
        EndPos:=FindMyText(':26T:',FnStartPos,FnEndPos);
        Rich.SelStart:=startPos + 4;
        Rich.SelLength:=EndPos-startPos - 4;
        StMessage:=trim(Rich.SelText);
        StMessage:=StringReplace(StMessage, chr(10), ' ', [rfReplaceAll]);
        StMessage:=StringReplace(StMessage, '  ', ' ', [rfReplaceAll]);
       // DataMod.XS_Incoming.FieldByName('remit_inf').AsString:=StMessage;
        // ShowMessage(StMessage);
        v_remitinf:=StMessage;
        {26T}
        TempLine:=   FindLines(':26T:',FnStartPos,FnEndPos);
        StMessage:=trim(copy(Rich.Lines[TempLine],6,3));
       // DataMod.XS_Incoming.FieldByName('typecode').AsInteger:=strtoint(StMessage);
        v_typecode:=strtoint(StMessage);

        {77B}
        if Fn77B then
        begin
            startPos:=FindMyText(':77B:',FnStartPos,Rich.GetTextLen);

            EndPos:=FindMyText(':21:',startPos,FnEndPos);

            Rich.SelStart:=startPos+5;
            Rich.SelLength:=EndPos-startPos-5;
            StMessage:=trim(Rich.SelText);
           

            StMessage:=StringReplace(StMessage,chr(10),' ',[rfReplaceAll]);

            StMessage:=StringReplace(StMessage,'  ',' ',[rfReplaceAll]);

           // DataMod.XS_Incoming.FieldByName('add_inf').AsString:=StMessage;

            v_addinf:=StMessage;

        end;
   {FIND NEW MESSAGE BLOCK}
   FnStartPos:=FindMyText(':21:',FnEndPos,Rich.GetTextLen);
   LineIndex:=Rich.CaretPos.y;
   FnEndPos:=FindMyText(':26T:',FnEndPos,Rich.GetTextLen);
   TempPos:=FindMyText(':77B:',FnEndPos,Rich.GetTextLen);


   if (TempPos >-1)and(TempPos=FnEndPos+10) then
   begin
    FnEndPos:=TempPos;
    Fn77B:=true;
   end
     else

       Fn77B:=false;


   DataMod.Ins.CallProcedure('xs_incoming_insert',[ v_transdate
                                                   ,v_reference
                                                   ,v_F20
                                                   ,v_F21
                                                   ,v_Valcod
                                                   ,v_amount
                                                   ,v_senacc
                                                   ,v_senname
                                                   ,v_seninn
                                                   ,v_sencode
                                                   ,v_senbankid
                                                   ,v_senbanksubacc
                                                   ,v_senbankbik
                                                   ,v_senbankcode
                                                   ,v_senbankkrno
                                                   ,v_senbankinn
                                                   ,v_recbanksubacc
                                                   ,v_recbankbik
                                                   ,v_recclientacc
                                                   ,v_filial
                                                   ,v_recclientname
                                                   ,v_recclientinn
                                                   ,v_recclientcode
                                                   ,v_recclientaccid
                                                   ,v_remitinf
                                                   ,v_typecode
                                                   ,v_addinf         ])


   end;
   finally
    // DataMod.XS_Incoming.Post;
     Rich.Clear;
   end;
end;
