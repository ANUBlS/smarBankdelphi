{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 686-2071 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.PACS0008Execute(Sender: TObject);
var
   sum,kesr:real;
   i,Ij,testiq,prior:integer;
   output:TextFile;
   FileName,Swmessage,Swmessage1,dir,edit_ref,BeginMessage,Endmesage,valu,info:String;
   Index :Integer;
   WaitNextConfirm, WillRefresh: Boolean;
   TransactionID :Integer;
   v_DataSet1: TDataSet;
   nameaa : string;
   k:integer;
   FourthLine,firstline,fifthline,thirdline,secondline: string;

   sendebankcode,senderbankinn,senderinn,recname,
   sendername,recinn,senderbankbankcode,recbankcode,recbankinn,recbankbankcode: string;
   InputString,recinfo,recinfo2: string;
   Lines: TStringList;

begin


  WaitNextConfirm :=True;
  WillRefresh :=False;
  if Gridout3.CanFocus then
  Gridout3.SetFocus;

  //Focus;
  with  Gridout3, SelectedRows, DataSource.DataSet, SWDataModule do
  try
    if Count = 0 then CurrentRowSelected := True;
    for  Index :=0 to  Count - 1 do
    begin
      GotoBookmark(Pointer(Items[Index]));
      TransactionID :=FieldbyName('ID').AsInteger;

      if  WaitNextConfirm  then
      case MessageDlg(
        Format('Fayl #%d yaradılsın?',[TransactionID])
       ,mtConfirmation
       ,[mbYes, mbNo ,mbCancel ,mbYesToAll]
       ,0
       )   of
        mrNo       : Continue;
        mrCancel   : Break;
        mrYesToAll :
          if MessageDlg(Format('%d  sayda köçürməyə fayl yaradılsın ?', [Count - Index]), mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
           WaitNextConfirm :=False
          else
           Continue;
      end;
      Application.ProcessMessages;
      testiq:=SwDataModule.sw_in_insert.CallIntegerFunction('sw_out_fileafter',[GRIDOUT3.DataSource.DataSet.FieldByName('id').asinteger,GRIDOUT2.DataSource.DataSet.FieldByName('MF32A_DATE').asdatetime]);
      //------------------------------------------------------------------------------------create file
 if testiq=6 then

 begin
 v_dataset1:=GRIDOUT3.DataSource.DataSet;
 with  v_dataset1 do
begin

   if (v_dataset1.FieldByName('status').asinteger=1) {or (FieldByName('status').asinteger=7)} then
  begin
  edit_ref:=FieldByName('id').asstring;


  for i:=1 to (5-length(edit_ref)) do begin
  edit_ref:='0'+edit_ref;
  end;
  valu:=FieldByName('MF32A_CURR').asstring;
  if valu='AZN' then valu:='AZM';

   begin
  if not DirectoryExists(SWDataModule.sw_settings.fieldbyname('path_out').asstring) then
  MkDir(SWDataModule.sw_settings.fieldbyname('path_out').asstring);
  dir:=SWDataModule.sw_settings.fieldbyname('path_out').asstring+'\';
  if not DirectoryExists(dir) then
  MkDir(dir);
   //bke:=copy(GRIDOUT2.DataSource.DataSet.FieldByName('SENDERBIC').asstring,0,6);
   FileName:=dir+'pacs'+edit_ref+'.xml';
   nameaa:=  'pacs'+edit_ref+'.xml';
    AssignFile(output,FileName);
   Rewrite(output);


     if (v_dataset1.FieldByName('messagetype').AsString='MT298') then
    begin

    if v_dataset1.FieldByName('mf12').AsString='200' then
             begin
     Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
              +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> '+#13#10
              +'<Body> '+#13#10
              +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">'+#13#10
              +'<Fr>'+#13#10
              +'<FIId>'+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
              +'</FinInstnId>    '+#13#10
              +'</FIId>  '+#13#10
              +'</Fr>'+#13#10
              +'<To> '+#13#10
              +'<FIId> '+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</FIId>'+#13#10
              +'</To> '+#13#10
               +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>   '+#13#10
              +'<MsgDefIdr>camt.056.001.10</MsgDefIdr> '+#13#10
              +'<BizSvc>cba.rtsx.01</BizSvc>     '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10

              +'</AppHdr>   '+#13#10
              +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.056.001.10">'+#13#10
              +'<FIToFIPmtCxlReq>'+#13#10
                +'<Assgnmt>'+#13#10

                +'<Id>'+FieldByName('MF20_REFERENCE').asstring+'</Id> '+#13#10
                +'<Assgnr> '+#13#10

                +'<Agt>'+#13#10
                +'<FinInstnId>'+#13#10


                +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>'+#13#10
               +' </FinInstnId>'+#13#10
                +'</Agt>'+#13#10
                +'</Assgnr>'+#13#10

                 +'<Assgne>'+#13#10

               +'<Agt>'+#13#10
               +'<FinInstnId>'+#13#10
               +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
               +'</FinInstnId>'+#13#10
               +'</Agt>'+#13#10
               +'</Assgne> '+#13#10

               +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00+'+'</CreDtTm> '+#13#10
               +'</Assgnmt> '+#13#10

                +'<Undrlyg>'+#13#10
                 +'<TxInf>'+#13#10
                 +'<OrgnlGrpInf>'+#13#10
                //<!-- Original message id of payment to be cancelled -->
                 +'<OrgnlMsgId>'+ FieldByName('l02').AsString+'</OrgnlMsgId>'+#13#10
                //<!-- Original Message Type of payment to be cancelled -->
                 +'<OrgnlMsgNmId>NOTPROVIDED</OrgnlMsgNmId> '+#13#10
                 +'</OrgnlGrpInf> '+#13#10
                //<!-- Original Interbank settlement date -->
                 +'<OrgnlIntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'</OrgnlIntrBkSttlmDt> '+#13#10
                 +'<Assgnr>  '+#13#10
                //<!-- Participant who sent the original transfer message -->
                 +'<FinInstnId>  '+#13#10
                //<!-- BICFI for SWIFT-registered participants. ClrSysMmbId/MmbId for pseudo-BIC codes (non-SWIFT registered) -->
                 +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                 +'</FinInstnId>'+#13#10
                 +'</Assgnr>  '+#13#10
                 +'</TxInf>  '+#13#10
                 +'</Undrlyg>  '+#13#10

                 +'</FIToFIPmtCxlReq> '+#13#10
+'</Document> '+#13#10
+'</Body> '+#13#10
+'</DataPDU>  '+#13#10 ;


             end;

              if  v_dataset1.FieldByName('mf12').AsString='800'   then
              begin

               Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
              +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> '+#13#10
              +'<Body> '+#13#10
              +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">'+#13#10
              +'<Fr>'+#13#10
              +'<FIId>'+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
              +'</FinInstnId>    '+#13#10
              +'</FIId>  '+#13#10
              +'</Fr>'+#13#10
              +'<To> '+#13#10
              +'<FIId> '+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</FIId>'+#13#10
              +'</To> '+#13#10
               +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>   '+#13#10
              +'<MsgDefIdr>pacs.028.001.05</MsgDefIdr> '+#13#10
              +'<BizSvc>cba.rtsx.01</BizSvc>     '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10

              +'</AppHdr>   '+#13#10
              +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pacs.028.001.05">  '+#13#10


               +'<FIToFIPmtStsReq> '+#13#10
               +'<GrpHdr> '+#13#10
              //<!-- Status request message Unique identifier -->
               +'<MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId>'+#13#10
               +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
               +'</GrpHdr> '+#13#10
              +' <OrgnlGrpInf>  '+#13#10
             // <!-- Original message id of the transfer for which status request is sent -->
               +'<OrgnlMsgId>'+FieldByName('l02').asstring+'</OrgnlMsgId>  '+#13#10
             //<!-- MX type of the original transfer for which status request is sent -->
               +'<OrgnlMsgNmId>NOTPROVIDED</OrgnlMsgNmId> '+#13#10
               +'</OrgnlGrpInf> '+#13#10
              +' <TxInf>  '+#13#10
               //<!-- Instructing agent. Participant who sent original message to the system -->
               +'<InstgAgt> '+#13#10
               +'<FinInstnId>'+#13#10
              //<!-- BICFI for SWIFT-registered BICs. ClrSysMmbId/MmbId for pseudo-BIC codes (non-SWIFT registered) -->
               +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
               +'</FinInstnId>   '+#13#10
               +'</InstgAgt>  '+#13#10
               +'<OrgnlTxRef> '+#13#10
              //<!-- Settlement date from the original message -->
               +'<IntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime) +'</IntrBkSttlmDt>'+#13#10
               +'</OrgnlTxRef>    '+#13#10
               +'</TxInf>    '+#13#10
               +'</FIToFIPmtStsReq>   '+#13#10
               +'</Document>  '+#13#10
+'</Body>  '+#13#10
+'</DataPDU>  '+#13#10;

              end;

             if  v_dataset1.FieldByName('mf12').AsString='202'   then
              begin

               Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
              +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> '+#13#10
              +'<Body> '+#13#10
              +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">'+#13#10
              +'<Fr>'+#13#10
              +'<FIId>'+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
              +'</FinInstnId>    '+#13#10
              +'</FIId>  '+#13#10
              +'</Fr>'+#13#10
              +'<To> '+#13#10
              +'<FIId> '+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</FIId>'+#13#10
              +'</To> '+#13#10
               +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>   '+#13#10
              +'<MsgDefIdr>camt.087.001.08</MsgDefIdr> '+#13#10
              +'<BizSvc>cba.rtsx.01</BizSvc>     '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10

              +'</AppHdr>   '+#13#10
              +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.087.001.08">'+#13#10

              +'<ReqToModfyPmt>  '+#13#10
              +'  <Assgnmt> '+#13#10
              +'  <Id>'+FieldByName('MF20_REFERENCE').asstring+'</Id>   '+#13#10
              +'  <Assgnr>  '+#13#10
              +'  <Agt>    '+#13#10
              +'  <FinInstnId>    '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</Agt> '+#13#10
              +'</Assgnr>  '+#13#10
              +'<Assgne> '+#13#10
              +'<Agt>  '+#13#10
              +'<FinInstnId>  '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
              +'</FinInstnId> '+#13#10
              +'</Agt>  '+#13#10
              +'</Assgne>  '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10

              +'</Assgnmt>   '+#13#10

              +'<Undrlyg>'+#13#10
              +'<IntrBk>'+#13#10
              +'<OrgnlGrpInf>'+#13#10
        //<!-- Original message id of the transfer which priority is changed -->
              +'<OrgnlMsgId>'+FieldByName('l02').AsString+'</OrgnlMsgId> '+#13#10
            //  <!-- MX type of the original transfer which payment priority is changed -->
              +'<OrgnlMsgNmId>NOTPROVIDED</OrgnlMsgNmId>'+#13#10
              +'</OrgnlGrpInf>'+#13#10
             // <!-- Amount taken from the original payment message or 0. -->
              +'<OrgnlIntrBkSttlmAmt Ccy="AZN">0.</OrgnlIntrBkSttlmAmt> '+#13#10
             // <!-- Value Date of the original transfer -->
              +'<OrgnlIntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('CDAT').AsDateTime)+'</OrgnlIntrBkSttlmDt> '+#13#10
              +'</IntrBk> '+#13#10
              +'</Undrlyg> '+#13#10
              +'<Mod>  '+#13#10
              //<!-- New priority -->
              +'<PmtTpInf><SvcLvl><Prtry>'+FieldByName('priority').asstring+'</Prtry></SvcLvl></PmtTpInf>'+#13#10
              +'</Mod>    '+#13#10
              +'<InstrForAssgne>'+#13#10

               +'<InstrInf>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</InstrInf> '+#13#10
               +'</InstrForAssgne> '+#13#10
               +'</ReqToModfyPmt>'+#13#10
               +'</Document>'+#13#10
               +'</Body>  '+#13#10
               +'</DataPDU>  '+#13#10;

              end;


    end;

    if (v_dataset1.FieldByName('messagetype').AsString='MT205') then
    begin

    if FieldByName('codex').AsString='99' then
    begin

    Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
              +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> '+#13#10
              +'<Body> '+#13#10
              +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">'+#13#10
              +'<Fr>'+#13#10
              +'<FIId>'+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
              +'</FinInstnId>    '+#13#10
              +'</FIId>  '+#13#10
              +'</Fr>'+#13#10
              +'<To> '+#13#10
              +'<FIId> '+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</FIId>'+#13#10
              +'</To> '+#13#10
              +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>   '+#13#10
              +'<MsgDefIdr>camt.050.001.06</MsgDefIdr> '+#13#10
              +'<BizSvc>cba.rtsx.01</BizSvc>     '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10
              +'<Prty>0050</Prty> '+#13#10
              +'</AppHdr>   '+#13#10
              +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.050.001.06">'+#13#10



              +'<LqdtyCdtTrf>'+#13#10
              +'<MsgHdr> '+#13#10
              +'<MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId> '+#13#10
              +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>  '+#13#10
              +'</MsgHdr> '+#13#10
              +'<LqdtyCdtTrf>'+#13#10
              +'<LqdtyTrfId>'+#13#10
              +'<EndToEndId>NOTPROVIDED</EndToEndId> '+#13#10
              +'<TxId>'+FieldByName('MF20_REFERENCE').asstring+'</TxId> '+#13#10
             // +'<UETR>44bf930a-f18c-4031-8b13-42d225940f75</UETR>'+#13#10
              +'</LqdtyTrfId>  '+#13#10
              +'<Cdtr> '+#13#10
              +'<FinInstnId>' +#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>'+#13#10;

              InputString := fieldbyname('mf52_name$adress').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 secondline:= Lines[1];
                 FourthLine := Lines[3];
                 thirdline:= Lines[2];
                 fifthline:= Lines[4];
                 firstline:=Lines[0];

                // ShowMessage(Lines[1]+'*'+Lines[3]+'*'+Lines[2]);
                // senderbankbankcode:=Copy(fifthline, 1, 28);
                 sendebankcode := Copy(firstline, 2, 8);
                 senderbankinn:=Copy(fifthline, 1, 10);
                 senderbankbankcode:=Copy(thirdline, 1, 28);
                 sendername :=Copy(secondline, 1, 35) ;
                 finally
                  Lines.Free;
                end;


              Swmessage:=Swmessage+'<Nm>'+sendername+'</Nm>'+#13#10
              +'<Othr>'+#13#10
              +'<Id>'+FieldByName('mf50_account').asstring+'</Id> '+#13#10
              +'<SchmeNm><Prtry>'+FourthLine+'</Prtry></SchmeNm> '+#13#10
              +'</Othr>'+#13#10
              +'</FinInstnId>'+#13#10
              +'</Cdtr> '+#13#10

              +'<CdtrAcct> '+#13#10
              +'  <Id><IBAN>'+thirdline+'</IBAN></Id> '+#13#10
              +'  <Tp><Prtry>BCSL</Prtry></Tp>' +#13#10
              +'</CdtrAcct>' +#13#10


              +'<TrfdAmt>' +#13#10
              +'<AmtWthCcy Ccy="'+FieldByName('MF32A_CURR').asstring+'">'+ReplaceStr(FieldByName('MF32A_AMOUNT').asstring,',','.')+'</AmtWthCcy>'+#13#10
              +'</TrfdAmt>' +#13#10

              +'<Dbtr>'+  #13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+fieldbyname('receiverbic').AsString+'</BICFI> '+#13#10
              +'<Nm>'+fieldbyname('rname').AsString+'</Nm> '+#13#10
              +'<Othr> '+#13#10;

               InputString := fieldbyname('mf58_name$location').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 secondline:= Lines[1];
                 FourthLine := Lines[3];
                 thirdline:= Lines[2];
                 fifthline:= Lines[4];
                 firstline:= Lines[0];
                // recbankbankcode:=Copy(fifthline, 1, 28);
                 recbankcode := Copy(firstline, 2, 8);
                 recbankinn:=Copy(FourthLine, 1, 10);
                 recbankbankcode:=Copy(thirdline, 1, 28);
                 recname :=Copy(thirdline, 1, 28) ;
                 finally
                  Lines.Free;
                end;


              Swmessage:=Swmessage+'<Id>'+recbankcode +'</Id> '+#13#10
              +'<SchmeNm><Prtry>'+recbankinn+'</Prtry></SchmeNm> '+#13#10
              +'</Othr> '+#13#10
              +'</FinInstnId> '+#13#10


              +'</Dbtr> '+#13#10
              +'<DbtrAcct>' +#13#10

              +'<Id><IBAN>'+ recbankbankcode+'</IBAN></Id>'+#13#10
              +'</DbtrAcct>' +#13#10


              +'<SttlmDt>'+
              FormatDateTime('yyyy-mm-dd', fieldbyname('MF32A_DATE').AsDateTime)+'</SttlmDt>'+#13#10
                +'</LqdtyCdtTrf> '+#13#10
                +'</LqdtyCdtTrf>' +#13#10


              +'</Document>'+#13#10
              +'</Body> ' +#13#10
              +'</DataPDU>' +#13#10;


    end
    else
    begin

     Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
              +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0"> '+#13#10
              +'<Body> '+#13#10
              +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">'+#13#10
              +'<Fr>'+#13#10
              +'<FIId>'+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
              +'</FinInstnId>    '+#13#10
              +'</FIId>  '+#13#10
              +'</Fr>'+#13#10
              +'<To> '+#13#10
              +'<FIId> '+#13#10
              +'<FinInstnId> '+#13#10
              +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI> '+#13#10
              +'</FinInstnId> '+#13#10
              +'</FIId>'+#13#10
              +'</To> '+#13#10
              +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>   '+#13#10
              +'<MsgDefIdr>pacs.009.001.10</MsgDefIdr> '+#13#10
              +'<BizSvc>cba.rtsx.01</BizSvc>     '+#13#10
              +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt> '+#13#10
              +'<Prty>0050</Prty> '+#13#10
              +'</AppHdr>   '+#13#10
              +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pacs.009.001.10">'+#13#10

            +'<FICdtTrf>'+#13#10
				+'<GrpHdr>'+#13#10
					+'<MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId>'+#13#10
					+'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm> '+#13#10
					+'<BtchBookg>false</BtchBookg>'+#13#10
					+'<NbOfTxs>1</NbOfTxs> '+#13#10
					+'<SttlmInf>'+#13#10
					 +'	<SttlmMtd>CLRG</SttlmMtd>'+#13#10
					+'</SttlmInf> '+#13#10
				+'</GrpHdr>'+#13#10

        			 +'	<CdtTrfTxInf> '+#13#10
						 +'<PmtId>'+#13#10
							 +'<EndToEndId>NOTPROVIDED</EndToEndId>'+#13#10
							 +'<TxId>'+FieldByName('MF20_REFERENCE').asstring+'</TxId> '+#13#10
							 +'<UETR>44bf930a-f18c-4031-8b13-42d225940f75</UETR>  '+#13#10
						 +'</PmtId> '+#13#10

             					+'<PmtTpInf>'+#13#10
						+'<ClrChanl>RTGS</ClrChanl>'+#13#10
						+'<LclInstrm>'+#13#10
							+'<Prtry>RTGS-TPCT</Prtry>'+#13#10
						+'</LclInstrm> '+#13#10
					+'</PmtTpInf>'+#13#10

          +'<IntrBkSttlmAmt Ccy="'+fieldbyname('MF32A_CURR').AsString+'">'+StringReplace( fieldbyname('MF32A_AMOUNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase])+'</IntrBkSttlmAmt> '+#13#10
					+'<IntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'</IntrBkSttlmDt>'+#13#10
					+'<InstgAgt>'+#13#10

           +'<FinInstnId>' +#13#10
              +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>'+#13#10;


              InputString := fieldbyname('mf52_name$adress').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 secondline:= Lines[1];
                 FourthLine := Lines[3];
                 thirdline:= Lines[2];
                 fifthline:= Lines[4];
                 firstline:=Lines[0];

                // ShowMessage(Lines[1]+'*'+Lines[3]+'*'+Lines[2]);
                // senderbankbankcode:=Copy(fifthline, 1, 28);

                 sendebankcode := Copy(firstline, 2, 8);
                 senderbankinn:=Copy(FourthLine, 1, 10);
                 senderbankbankcode:=Copy(thirdline, 1, 28);
                 sendername :=Copy(secondline, 1, 35) ;
                 finally
                  Lines.Free;
                end;


                      InputString := fieldbyname('mf58_name$location').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 thirdline:=Lines[2];
                 FourthLine := Lines[3];
                 fifthline:= Lines[4];

                 recinn:=Copy(FourthLine, 1, 10);
                 recbankbankcode:=Copy(thirdline, 1, 28);
                 recbankcode := Copy(Lines[0], 2, 7);
                 recbankinn:=Copy(FourthLine, 0, 10);
                 finally
                  Lines.Free;
                end;


              Swmessage:=Swmessage+'<Othr>'+#13#10
              +'<Id>'+senderbankbankcode+'</Id> '+#13#10
              +'<SchmeNm><Prtry>IBAN</Prtry></SchmeNm> '+#13#10
              +'</Othr>'+#13#10
              +'</FinInstnId>'+#13#10


              					+'</InstgAgt>'+#13#10
					+'<InstdAgt> '+#13#10
						+'<FinInstnId>'+#13#10
							+'<BICFI>'+copy(FieldByName('RECEIVERBIC').asstring,0,8)+'</BICFI>'+#13#10
							+'<Othr>'+#13#10
								+'<Id>'+recbankbankcode+'</Id> '+#13#10
								+'<SchmeNm> '+#13#10
									+'<Prtry>IBAN</Prtry>'+#13#10
								+'</SchmeNm>'+#13#10
							+'</Othr> '+#13#10
					 +'	</FinInstnId>  '+#13#10
					+'</InstdAgt> '+#13#10

          	+'<Dbtr>'+#13#10
						+'<FinInstnId>'+#13#10
							+'<BICFI>'+FieldByName('senderbic').asstring+'</BICFI> '+#13#10
						 +'	<Nm>'+sendername+'</Nm> '+#13#10
						 +'	<Othr> '+#13#10
							+'	<Id>'+ sendebankcode+'</Id>'+#13#10
							 +'	<SchmeNm>  '+#13#10
							+'		<Prtry>'+senderbankinn+'</Prtry>  '+#13#10
							+'	</SchmeNm>'+#13#10
							+'</Othr> '+#13#10
					 +'	</FinInstnId>'+#13#10
					+'</Dbtr>'+#13#10

          					+'<DbtrAcct>' +#13#10

              +'<Id><IBAN>'+ senderbankbankcode+'</IBAN></Id>'+#13#10
              +'</DbtrAcct>' +#13#10


              				 +'	<Cdtr>' +#13#10

					 +'	<FinInstnId>' +#13#10
							+'<BICFI>'+FieldByName('receiverbic').asstring+'</BICFI>' +#13#10
							+'<Nm>'+fieldbyname('rname').AsString+'</Nm>' +#13#10
							+'<Othr>' +#13#10
								+'<Id>'+recbankcode+'</Id>' +#13#10
								+'<SchmeNm>' +#13#10
									+'<Prtry>'+recbankinn+'</Prtry>' +#13#10
								+'</SchmeNm> ' +#13#10
							+'</Othr> ' +#13#10
						+'</FinInstnId> ' +#13#10
					+'</Cdtr>  ' +#13#10
				 +'	<CdtrAcct> ' +#13#10
						+'<Id>  ' +#13#10
							+'<IBAN>'+recbankbankcode+'</IBAN> ' +#13#10
						+'</Id>  ' +#13#10
					+'</CdtrAcct>  ';

             if trim(fieldbyname('MF72').AsString)<>'' then
                     begin
                 InputString := fieldbyname('MF72').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                  for I := 0 to Lines.Count-1 do
                  begin
                   recinfo2:=recinfo2+'<InstrForCdtrAgt>'+#13#10
                                        +'<InstrInf>'+lines[i]+'</InstrInf>'+#13#10
                                        +'</InstrForCdtrAgt>'+#13#10
                  end;

                 finally
                  Lines.Free;
                end;

                     end;
        Swmessage:=Swmessage +recinfo2					+'<Purp>' +#13#10
					 +'	<Prtry>001</Prtry> ' +#13#10
					+'</Purp>     ' +#13#10
				+'</CdtTrfTxInf> ' +#13#10
			+'</FICdtTrf> ' +#13#10


      	 +'</Document>'+#13#10
	+'</Body>'+#13#10
+'</DataPDU>';

    end;
    end;






     if (v_dataset1.FieldByName('messagetype').AsString='MT999') then
    begin

    if FieldByName('MONITORING').AsString ='text' then
    begin


     Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
                   +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '+#13#10
                    +'<Body>   '+#13#10
                    +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">   '+#13#10
                    +'<Fr>'+#13#10
                    +'<FIId> '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</FinInstnId>  '+#13#10
                    +'</FIId> '+#13#10
                    +'</Fr>  '+#13#10
                    +'<To>     '+#13#10
                    +'<FIId>   '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
                    +'</FinInstnId>   '+#13#10
                    +'</FIId>    '+#13#10
                    +'</To>'+#13#10
                    +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>'+#13#10
                    +'<MsgDefIdr>camt.998.001.03</MsgDefIdr>'+#13#10
                    +'<BizSvc>cba.rtsx.01</BizSvc>'+#13#10
                    +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt>'+#13#10
                    +'<Prty>0020</Prty>'+#13#10
                    +'</AppHdr>' +#13#10
                    +'<Document xmlns="urn:swift:xsd:camt.998.001.03">'  +#13#10
                    +'<CshMgmtPrtryMsg>'
                    +'<MsgHdr>'+#13#10
                    +'<MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId> '+#13#10
                    +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
                    +'</MsgHdr>'+#13#10
                    +'<PrtryData>'+#13#10
                    +'<Tp>cma.textMessage.001.03</Tp>'+#13#10
                    +'<Data>'+#13#10
                    +'<Document xmlns="urn:cma:xsd:cma.textMessage.001.03">'+#13#10
                    +'<TxtMsg>'+#13#10
                    +'<Rcvr>'+#13#10
                    +'<PrtcId>'+#13#10
                    +'<BICFI>'+copy(FieldByName('receiverbic').asstring,0,8)+'</BICFI> '+#13#10
                    +'</PrtcId>'+#13#10
                    +'</Rcvr>'+#13#10
                    +'<Sndr>'+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</Sndr>'+#13#10
                    +'<Impt>INFO</Impt>'+#13#10
                    +'<Txt>'+FieldByName('MF79').asstring+'</Txt> '+#13#10
                    +'</TxtMsg>'+#13#10
                    +'</Document>'+#13#10
                    +'</Data>'+#13#10
                    +'</PrtryData>'+#13#10
                    +'</CshMgmtPrtryMsg>'+#13#10
                    +'</Document>'+#13#10
                    +'</Body>'+#13#10
                    +'</DataPDU>';


          end;

          if FieldByName('MONITORING').AsString ='days' then
          begin
          Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
                   +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '+#13#10
                    +'<Body>   '+#13#10
                    +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">   '+#13#10
                    +'<Fr>'+#13#10
                    +'<FIId> '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</FinInstnId>  '+#13#10
                    +'</FIId> '+#13#10
                    +'</Fr>  '+#13#10
                    +'<To>     '+#13#10
                    +'<FIId>   '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
                    +'</FinInstnId>   '+#13#10
                    +'</FIId>    '+#13#10
                    +'</To>'+#13#10
                    +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>'+#13#10
                    +'<MsgDefIdr>camt.018.001.05</MsgDefIdr>'+#13#10
                    +'<BizSvc>cba.rtsx.01</BizSvc>'+#13#10
                    +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt>'+#13#10
                    +'</AppHdr>'+#13#10
                   // <!-- Document -->
                   +' <Document xmlns="urn:iso:std:iso:20022:tech:xsd:camt.018.001.05">'+#13#10
                   +' <GetBizDayInf>'+#13#10
                   +' <MsgHdr>'+#13#10
                   +' <MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId>'+#13#10
                    +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
                    +'</MsgHdr>'+#13#10

                   +'<BizDayInfQryDef>'+#13#10
                  +'<Crit> '+#13#10
                 +' <NewCrit>'+#13#10
                  +'<SchCrit>'+#13#10
                  +'<EvtTp>'+#13#10
                  +'<Prtry>'+#13#10
                  +'<Id>GETBUSINESSDAYPERIOD</Id>'+#13#10
                  +'</Prtry>'+#13#10
                  +'</EvtTp> '+#13#10
                  +'</SchCrit>'+#13#10
                  +'</NewCrit> '+#13#10
                  +'</Crit>  '+#13#10
                  +'</BizDayInfQryDef> '+#13#10
                  +'</GetBizDayInf>'+#13#10
                  +'</Document>'+#13#10
                  +'</Body>   '+#13#10
                  +'</DataPDU>  '+#13#10;


          end;

          if FieldByName('MONITORING').AsString ='pass' then
          begin

           Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
                   +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '+#13#10
                    +'<Body>   '+#13#10
                    +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">   '+#13#10
                    +'<Fr>'+#13#10
                    +'<FIId> '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</FinInstnId>  '+#13#10
                    +'</FIId> '+#13#10
                    +'</Fr>  '+#13#10
                    +'<To>     '+#13#10
                    +'<FIId>   '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
                    +'</FinInstnId>   '+#13#10
                    +'</FIId>    '+#13#10
                    +'</To>'+#13#10
                    +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>'+#13#10
                    +'<MsgDefIdr>camt.998.001.03</MsgDefIdr>'+#13#10
                    +'<BizSvc>cba.rtsx.01</BizSvc>'+#13#10
                    +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt>'+#13#10
                    +'</AppHdr>'+#13#10
                    +'<Document xmlns="urn:swift:xsd:camt.998.001.03"> '+#13#10

                     +'<CshMgmtPrtryMsg>'+#13#10
                     +' <MsgHdr>'+#13#10
                   +' <MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId>'+#13#10
                    +'<CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
                    +'</MsgHdr>'+#13#10
                      +'<PrtryData>'+#13#10
                      //<!-- Subtype of camt.998 message -->
                     +'<Tp>cma.changePassword.001.01</Tp>'+#13#10
                      +'<Data>'+#13#10
                     +' <Document xmlns="urn:cma:xsd:cma.changePassword.001.01">'+#13#10
                      +'<ChngPwd>'+#13#10
                     // <!-- New password -->
                     +' <NewPwd>'+FieldByName('l03').asstring+'</NewPwd> '+#13#10
                      //<!-- Old password -->
                      +'<OldPwd>'+FieldByName('l04').asstring+'</OldPwd> '+#13#10
                      +'</ChngPwd>'+#13#10
                      +'</Document>'+#13#10
                      +'</Data>'+#13#10
                      +'</PrtryData>'+#13#10
                      +'</CshMgmtPrtryMsg>'+#13#10
                      +'</Document>'+#13#10
                      +'</Body>  '+#13#10
                      +'</DataPDU> '+#13#10

          end;

    end;



    if (v_dataset1.FieldByName('messagetype').AsString='MT103')    then
    begin

    sum:= fieldbyname('MF32A_AMOUNT').AsFloat;
    kesr:=frac(sum);




       Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
                   +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '+#13#10
                    +'<Body>   '+#13#10
                    +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">   '+#13#10
                    +'<Fr>'+#13#10
                    +'<FIId> '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</FinInstnId>  '+#13#10
                    +'</FIId> '+#13#10
                    +'</Fr>  '+#13#10
                    +'<To>     '+#13#10
                    +'<FIId>   '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
                    +'</FinInstnId>   '+#13#10
                    +'</FIId>    '+#13#10
                    +'</To>'+#13#10
                    +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>'+#13#10
                    +'<MsgDefIdr>pacs.008.001.10</MsgDefIdr>'+#13#10
                    +'<BizSvc>cba.rtsx.01</BizSvc>'+#13#10
                    +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt>'+#13#10
                    +'<Prty>0050</Prty>'+#13#10
                    +'</AppHdr>' +#13#10
                    +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pacs.008.001.10">' +#13#10
                    +'<FIToFICstmrCdtTrf> '+#13#10
                    +'<GrpHdr>'+#13#10
                    +' <MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId> '+#13#10
                    +' <CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
                    +' <BtchBookg>false</BtchBookg>'+#13#10
                    +'<NbOfTxs>1</NbOfTxs> '+#13#10
                    +'<SttlmInf><SttlmMtd>CLRG</SttlmMtd></SttlmInf>'+#13#10
                    +'</GrpHdr>'+#13#10
                    +'<CdtTrfTxInf> '+#13#10
                    +'<PmtId>'+#13#10
                    +'<EndToEndId>NOTPROVIDED</EndToEndId>'+#13#10
                    +'<TxId>'+FieldByName('MF20_REFERENCE').asstring+'</TxId> '+#13#10
                    +'<UETR>4e7b08db-68e1-4af3-ac40-cd06623bac8a</UETR> '+#13#10
                    +'</PmtId>'+#13#10
                    +'<PmtTpInf> '+#13#10
                    +'<ClrChanl>RTGS</ClrChanl> '+#13#10
                    +'<LclInstrm><Prtry>RTGS-SCCT</Prtry></LclInstrm> '+#13#10
                    +'</PmtTpInf>  '+#13#10
                    +'<IntrBkSttlmAmt Ccy="'+fieldbyname('MF32A_CURR').AsString+'">'+StringReplace( fieldbyname('MF32A_AMOUNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase])+'</IntrBkSttlmAmt> '+#13#10
                    +'<IntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd',fieldbyname('MF32A_DATE').AsDateTime)+'</IntrBkSttlmDt> '+#13#10
                    +'<ChrgBr>DEBT</ChrgBr>'+#13#10
                    +'<InstgAgt> '+#13#10
                    +'<FinInstnId> '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
                    +'<Othr>     '+#13#10
                    +'<Id>'+fieldbyname('MF52_ACCOUNT').AsString+'</Id>   '+#13#10
                    +'<SchmeNm><Prtry>IBAN</Prtry></SchmeNm> '+#13#10
                    +'</Othr>   '+#13#10
                    +'</FinInstnId> '+#13#10
                    +'</InstgAgt> '+#13#10
                    +'<InstdAgt>'+#13#10
                    +'<FinInstnId>  '+#13#10
                    +'<BICFI>'+copy(FieldByName('receiverbic').asstring,0,8)+'</BICFI> '+#13#10
                    +'<Othr>             '+#13#10
                    +'<Id>'+fieldbyname('mf54_account').AsString+'</Id>  '+#13#10
                    +'<SchmeNm><Prtry>IBAN</Prtry></SchmeNm> '+#13#10
                    +'</Othr>     '+#13#10
                    +'</FinInstnId> '+#13#10
                    +'</InstdAgt>   '+#13#10
                    +'<Dbtr>'+#13#10
                    +'<Nm>'+fieldbyname('mf50_bic').AsString+'</Nm> '+#13#10
                    {+'<Id> '+#13#10
                    +'<PrvtId>  '+#13#10
                    +'<Othr> '+#13#10
                    +'<Id>681</Id> '+#13#10
                    +'<SchmeNm> '+#13#10
                    +'<Prtry>CLCD</Prtry> '+#13#10
                    +'</SchmeNm> '+#13#10
                    +'</Othr> '+#13#10
                    +'</PrvtId>'+#13#10
                    +'</Id>  '+#13#10   }
                    +'</Dbtr>  '+#13#10
                    +'<DbtrAcct> '+#13#10
                    +'<Id><IBAN>'+fieldbyname('mf50_account').AsString+'</IBAN></Id> '+#13#10
                    +'</DbtrAcct> '+#13#10
                    +'<DbtrAgt>  '+#13#10
                    +'<FinInstnId>  '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>   '+#13#10
                    +'<Othr>'+#13#10;


                 InputString := fieldbyname('mf50_name$adress').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 FourthLine := Lines[3];
                 thirdline:= Lines[2];
                 fifthline:= Lines[4];
                 senderbankbankcode:=Copy(fifthline, 1, 28);
                 sendebankcode := Copy(FourthLine, 1, 6);
                 senderbankinn:=Copy(FourthLine, 8, 10);
                 senderinn:=Copy(thirdline, 1, 10);
                 finally
                  Lines.Free;
                end;

                    Swmessage:=Swmessage+'<Id>'+sendebankcode+'</Id>   '+#13#10
                    +'<SchmeNm>   '+#13#10
                    +'<Prtry>'+senderbankinn+'</Prtry> '+#13#10
                    +'</SchmeNm> '+#13#10
                    +'</Othr>  '+#13#10
                    +'</FinInstnId> '+#13#10
                    +'</DbtrAgt>   '+#13#10
                    +'<DbtrAgtAcct> '+#13#10
                    +'<Id><IBAN>'+senderbankbankcode+'</IBAN></Id>  '+#13#10
                    +'</DbtrAgtAcct> '+#13#10
                    +' <CdtrAgt> '+#13#10
                    +' <FinInstnId> '+#13#10

                    +'  <BICFI>'+fieldbyname('receiverbic').AsString+'</BICFI>'+#13#10
                    +'  <Othr>'+#13#10;


                      InputString := fieldbyname('mf59_name$adress').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 thirdline:=Lines[2];
                 FourthLine := Lines[3];
                 fifthline:= Lines[4];
                 recinn:=Copy(thirdline, 1, 10);
                 recbankbankcode:=Copy(fifthline, 1, 28);
                 recbankcode := Copy(FourthLine, 1, 6);
                 recbankinn:=Copy(FourthLine, 8, 10);
                 finally
                  Lines.Free;
                end;

                  Swmessage:=Swmessage+'  <Id>'+fieldbyname('rcode').AsString+'</Id> '+#13#10
                    +'<SchmeNm>'+#13#10
                    +'<Prtry>'+recbankinn+'</Prtry> '+#13#10
                     +'</SchmeNm>'+#13#10
                    +' </Othr>  '+#13#10
                     +'</FinInstnId> '+#13#10
                    +' </CdtrAgt>'+#13#10
                    +' <CdtrAgtAcct> '+#13#10
                     +'<Id><IBAN>'+recbankbankcode+'</IBAN></Id>'+#13#10
                     +'</CdtrAgtAcct>'+#13#10
                    +' <Cdtr> '+#13#10
                     +'<Nm>'+fieldbyname('mf59_name').AsString +'</Nm> '+#13#10
                     {+'<Id>'+#13#10
                     +'<OrgId>'+#13#10
                     +'<Othr>'+#13#10
                     +'<Id>234987</Id>'+#13#10
                     +'<SchmeNm><Prtry>CLCD</Prtry></SchmeNm>'+#13#10
                     +'</Othr>'+#13#10
                     +'</OrgId>'+#13#10
                     +'</Id> '+#13#10   }
                     +' </Cdtr> '+#13#10
                     +' <CdtrAcct>  '+#13#10
                     +' <Id><IBAN>'+fieldbyname('mf59_account').AsString+'</IBAN></Id> '+#13#10
                     +' </CdtrAcct>'+#13#10   ;



                     if trim(fieldbyname('MF72').AsString)<>'' then
                     begin
                      Swmessage:= Swmessage+  '<InstrForCdtrAgt>' +#13#10;
                           InputString := fieldbyname('MF72').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                  for I := 0 to Lines.Count-1 do
                  begin
                   recinfo2:=recinfo2  +'<InstrInf>'+lines[i]+'</InstrInf>'+#13#10

                  end;

                 finally
                  Lines.Free;
                end;

               Swmessage:= Swmessage +recinfo2 +'</InstrForCdtrAgt>' +#13#10;
                     end;



                   Swmessage:=Swmessage+'<Tax> '+#13#10
                   //Swmessage +recinfo2 +'</InstrForCdtrAgt>'{+'<Purp> <Prtry>001</Prtry></Purp>'}+#13#10



                   //  +'<Cdtr><TaxId>'+recinn+'</TaxId></Cdtr>'+#13#10
                    +'<Cdtr><TaxId>'+recinn+'</TaxId></Cdtr>  '+#13#10

                     +'<Dbtr><TaxId>'+senderinn+'</TaxId></Dbtr>  '+#13#10
                     +'</Tax>'+#13#10


                     +'<RmtInf>'+#13#10;

                       if trim(fieldbyname('Mf70').AsString)<>'' then
                     begin
                           InputString := fieldbyname('Mf70').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;

                  for I := 0 to Lines.Count-1 do
                  begin
                   recinfo:=recinfo +'<Ustrd>'+lines[i]+'</Ustrd>'+#13#10

                  end;

                 finally
                  Lines.Free;
                end;

                     end;



                     Swmessage:=Swmessage + recinfo+'</RmtInf>'+#13#10
                     +'</CdtTrfTxInf> '+#13#10
                     +'</FIToFICstmrCdtTrf>  '+#13#10
                     +'</Document>'+#13#10
                     +'</Body> '+#13#10
                     +'</DataPDU> '+#13#10;


      end;


      if (v_dataset1.FieldByName('messagetype').AsString='MT102') then
      begin

    sum:= fieldbyname('MF32A_AMOUNT').AsFloat;
    kesr:=frac(sum);




       Swmessage:='<?xml version="1.0" encoding="UTF-8"?> '+#13#10
                   +'<DataPDU xmlns="urn:cma:stp:xsd:stp.1.0">  '+#13#10
                    +'<Body>   '+#13#10
                    +'<AppHdr xmlns="urn:iso:std:iso:20022:tech:xsd:head.001.001.02">   '+#13#10
                    +'<Fr>'+#13#10
                    +'<FIId> '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI> '+#13#10
                    +'</FinInstnId>  '+#13#10
                    +'</FIId> '+#13#10
                    +'</Fr>  '+#13#10
                    +'<To>     '+#13#10
                    +'<FIId>   '+#13#10
                    +'<FinInstnId>   '+#13#10
                    +'<BICFI>'+SWDataModule.sw_settings.fieldbyname('m_bic').asstring+'</BICFI>  '+#13#10
                    +'</FinInstnId>   '+#13#10
                    +'</FIId>    '+#13#10
                    +'</To>'+#13#10
                    +'<BizMsgIdr>'+FieldByName('MF20_REFERENCE').asstring+'</BizMsgIdr>'+#13#10
                    +'<MsgDefIdr>pacs.008.001.10</MsgDefIdr>'+#13#10
                    +'<BizSvc>cba.rtsx.01</BizSvc>'+#13#10

                    +'<CreDt>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDt>'+#13#10
                    +'<Prty>0020</Prty>'+#13#10
                    +'</AppHdr>' +#13#10
                    +'<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pacs.008.001.10">' +#13#10
                    +'<FIToFICstmrCdtTrf> '+#13#10
                    +'<GrpHdr>'+#13#10
                    +' <MsgId>'+FieldByName('MF20_REFERENCE').asstring+'</MsgId> '+#13#10
                    +' <CreDtTm>'+FormatDateTime('yyyy-mm-dd', FieldByName('mf32a_date').AsDateTime)+'T'+FormatDateTime('hh:nn:ss', now)+'+04:00</CreDtTm>'+#13#10
                    +' <BtchBookg>true</BtchBookg>'+#13#10 ;

                      with  SWDataModule.datatemps do
                      begin
                        close;
                        sql.Clear;

                        sql.Add('select * from sw_out_new ase where  mf20_reference='+''''+gridout3.DataSource.DataSet.FieldByName('mf20_reference').AsString+''''+' and L01 in (select max(L01) from sw_out_new where mf20_reference='+''''+gridout3.DataSource.DataSet.FieldByName('mf20_reference').AsString+''''+')');
                        memo1.Text:= SWDataModule.datatemps.SQL.Text;
                        SWDataModule.datatemps.open;
                      end;



                 Swmessage:=Swmessage+   '<NbOfTxs>'+SWDataModule.datatemps.FieldByName('L01').AsString+'</NbOfTxs> '+#13#10
                    +'<TtlIntrBkSttlmAmt Ccy="'+SWDataModule.datatemps.FieldByName('MF32A_CURR').AsString+'">'+StringReplace( SWDataModule.datatemps.fieldbyname('MF32B_AMOUNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase])+'</TtlIntrBkSttlmAmt>'+#13#10
                    +'<IntrBkSttlmDt>'+FormatDateTime('yyyy-mm-dd', SWDataModule.datatemps.FieldByName('mf32a_date').AsDateTime)+'</IntrBkSttlmDt>  '+#13#10
                    +'<SttlmInf><SttlmMtd>CLRG</SttlmMtd></SttlmInf>'+#13#10



                    +'<PmtTpInf> '+#13#10
                    +'<ClrChanl>RTGS</ClrChanl> '+#13#10
                    +'<LclInstrm><Prtry>RTGS-SCCT</Prtry></LclInstrm> '+#13#10
                    +'</PmtTpInf>  '+#13#10


                    +'<InstgAgt> '+#13#10
                    +'<FinInstnId> '+#13#10
                    +'<BICFI>'+copy(FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>  '+#13#10
                    +'<Othr>     '+#13#10
                    +'<Id>'+fieldbyname('MF52_ACCOUNT').AsString+'</Id>   '+#13#10
                    +'<SchmeNm><Prtry>IBAN</Prtry></SchmeNm> '+#13#10
                    +'</Othr>   '+#13#10

                    +'</FinInstnId> '+#13#10
                    +'</InstgAgt> '+#13#10
                    +'<InstdAgt>'+#13#10
                    +'<FinInstnId>  '+#13#10
                    +'<BICFI>'+copy(FieldByName('receiverbic').asstring,0,8)+'</BICFI> '+#13#10
                    +'<Othr>             '+#13#10
                    +'<Id>'+fieldbyname('mf54_account').AsString+'</Id>  '+#13#10
                    +'<SchmeNm><Prtry>IBAN</Prtry></SchmeNm> '+#13#10
                    +'</Othr>     '+#13#10
                    +'</FinInstnId> '+#13#10
                    +'</InstdAgt>   '+#13#10
                    +'</GrpHdr>'+#13#10 ;




                      with  SWDataModule.datatemps do
                      begin
                        close;
                        sql.clear;
                        sql.Add('select * from sw_out_new  where  mf20_reference='+ ''''+gridout3.DataSource.DataSet.FieldByName('mf20_reference').AsString+'''');
                        open;
                      end;

                      for i:= 0 to SWDataModule.datatemps.RecordCount-1 do
                        begin

                        Swmessage1:=Swmessage1+'<CdtTrfTxInf> '+#13#10
                                        +'<PmtId> '+#13#10
                                       +'<InstrId>'+SWDataModule.datatemps.fieldbyname('mf21').AsString+'</InstrId>  '+#13#10
                                       +'<EndToEndId>NOTPROVIDED</EndToEndId>'+#13#10
                                       +'<TxId>'+SWDataModule.datatemps.fieldbyname('mf20_reference').AsString+'//'+SWDataModule.datatemps.fieldbyname('mf21').AsString+'</TxId>' +#13#10
                                    +'</PmtId>' +#13#10
                                    +'<IntrBkSttlmAmt Ccy="'+SWDataModule.datatemps.fieldbyname('MF32A_CURR').AsString+'">'+StringReplace( SWDataModule.datatemps.fieldbyname('MF32A_AMOUNT').AsString, ',', '.',[rfReplaceAll, rfIgnoreCase])+'</IntrBkSttlmAmt> '  +#13#10
                                       +'<ChrgBr>DEBT</ChrgBr>'+#13#10
                                       +'<Dbtr>'+#13#10
                                                                                                           +'<Nm>'+fieldbyname('mf50_bic').AsString+'</Nm> '+#13#10
                                         +'</Dbtr>  '+#13#10
                                      +'<DbtrAcct> '+#13#10
                                      +'<Id><IBAN>'+SWDataModule.datatemps.fieldbyname('mf50_account').AsString+'</IBAN></Id> '+#13#10
                                      +'</DbtrAcct> '+#13#10
                                      +'<DbtrAgt>  '+#13#10
                                      +'<FinInstnId>  '+#13#10
                                      +'<BICFI>'+copy(SWDataModule.datatemps.FieldByName('SENDERBIC').asstring,0,8)+'</BICFI>   '+#13#10
                                      +'<Othr>'+#13#10;

                                      InputString := SWDataModule.datatemps.fieldbyname('mf50_name$adress').AsString;
                                       Lines := TStringList.Create;
                                     try
                                       Lines.Text := InputString;
                                       FourthLine := Lines[3];
                                       thirdline:= Lines[2];
                                       fifthline:= Lines[4];
                                       senderbankbankcode:=Copy(fifthline, 1, 28);
                                       sendebankcode := Copy(FourthLine, 1, 6);
                                       senderbankinn:=Copy(FourthLine, 8, 10);
                                       senderinn:=Copy(thirdline, 1, 10);
                                       finally
                                        Lines.Free;
                                      end;


                    Swmessage1:=Swmessage1+'<Id>'+sendebankcode+'</Id>   '+#13#10
                    +'<SchmeNm>   '+#13#10
                    +'<Prtry>'+senderbankinn+'</Prtry> '+#13#10
                    +'</SchmeNm> '+#13#10
                    +'</Othr>  '+#13#10
                    +'</FinInstnId> '+#13#10
                    +'</DbtrAgt>   '+#13#10
                    +'<DbtrAgtAcct> '+#13#10
                    +'<Id><IBAN>'+senderbankbankcode+'</IBAN></Id>  '+#13#10
                    +'</DbtrAgtAcct> '+#13#10
                    +' <CdtrAgt> '+#13#10
                    +' <FinInstnId> '+#13#10

                    +'  <BICFI>'+fieldbyname('receiverbic').AsString+'</BICFI>'+#13#10
                    +'  <Othr>'+#13#10;


                      InputString := SWDataModule.datatemps.fieldbyname('mf59_name$adress').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                 thirdline:=Lines[2];
                 FourthLine := Lines[3];
                 fifthline:= Lines[4];
                 recinn:=Copy(FourthLine, 1, 10);
                 recbankbankcode:=Copy(fifthline, 1, 28);
                 recbankcode := Copy(FourthLine, 1, 6);
                 recbankinn:=Copy(FourthLine, 8, 10);
                 finally
                  Lines.Free;
                end;


                  Swmessage1:=Swmessage1+'  <Id>'+SWDataModule.datatemps.fieldbyname('rcode').AsString+'</Id> '+#13#10
                    +'<SchmeNm>'+#13#10
                    +'<Prtry>'+recbankinn+'</Prtry> '+#13#10
                     +'</SchmeNm>'+#13#10
                    +' </Othr>  '+#13#10
                     +'</FinInstnId> '+#13#10
                    +' </CdtrAgt>'+#13#10
                    +' <CdtrAgtAcct> '+#13#10
                     +'<Id><IBAN>'+recbankbankcode+'</IBAN></Id>'+#13#10
                     +'</CdtrAgtAcct>'+#13#10

                     +' <Cdtr> '+#13#10
                     +'<Nm>'+SWDataModule.datatemps.fieldbyname('mf59_name').AsString +'</Nm> '+#13#10
                     {+'<Id>'+#13#10
                     +'<OrgId>'+#13#10
                     +'<Othr>'+#13#10
                     +'<Id>234987</Id>'+#13#10
                     +'<SchmeNm><Prtry>CLCD</Prtry></SchmeNm>'+#13#10
                     +'</Othr>'+#13#10
                     +'</OrgId>'+#13#10
                     +'</Id> '+#13#10   }
                     +' </Cdtr> '+#13#10

                     +' <CdtrAcct>  '+#13#10
                     +' <Id><IBAN>'+SWDataModule.datatemps.fieldbyname('mf59_account').AsString+'</IBAN></Id> '+#13#10
                     +' </CdtrAcct>'+#13#10;

                    {  if trim(SWDataModule.datatemps.fieldbyname('MF72').AsString)<>'' then
                     begin
                           InputString := fieldbyname('MF72').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;
                  for I := 0 to Lines.Count do
                  begin
                   recinfo2:=recinfo2+'<InstrForCdtrAgt>'+#13#10
                                        +'<InstrInf>'+lines[i]+'</InstrInf>'+#13#10
                                        +'</InstrForCdtrAgt>'+#13#10
                  end;

                 finally
                  Lines.Free;
                end;

                     end;

                               }

                   Swmessage1:=Swmessage1 +recinfo2 +'<Purp> <Prtry>001</Prtry></Purp>'+#13#10
                     +'<Tax> '+#13#10


                     +'<Cdtr><TaxId>'+recinn+'</TaxId></Cdtr>'+#13#10
                     +'<Dbtr><TaxId>'+senderinn+'</TaxId></Dbtr>  '+#13#10
                     +'</Tax>'+#13#10
                     +'<RmtInf>'+#13#10;

                       if trim(SWDataModule.datatemps.fieldbyname('Mf70').AsString)<>'' then
                     begin
                           InputString := fieldbyname('Mf70').AsString;
                 Lines := TStringList.Create;
               try
                 Lines.Text := InputString;

                  for Ij := 0 to Lines.Count-1 do
                  begin
                   recinfo:=recinfo +'<Ustrd>'+lines[Ij]+'</Ustrd>'+#13#10

                  end;

                 finally
                  Lines.Free;
                end;

                     end;

                     Swmessage1:=Swmessage1 + recinfo+'</RmtInf>'+#13#10
                     +'</CdtTrfTxInf> '+#13#10;
                          SWDataModule.datatemps.Next;

     end;





                      Swmessage:=Swmessage+Swmessage1+'</FIToFICstmrCdtTrf>  '+#13#10
                     +'</Document>'+#13#10
                     +'</Body> '+#13#10
                     +'</DataPDU> '+#13#10;

      end;


     Writeln(output,swmessage);



//------------end body file----------------

   CloseFile(output);

   info:='Fayl yaradılıb!';
   SwDataModule.sw_in_insert.CallProcedure('sw_out_CreateFile',[FieldByName('id').asinteger,info,1]);
    SWDataModule.swmammount.Refresh;
   end;  //with dataset1 do
  end;

end;
 end
 else
 begin
 info:='Təsdiq olunmamış əməliyyat var!';
 SwDataModule.sw_in_insert.CallProcedure('sw_out_CreateFile',[GRIDOUT2.DataSource.DataSet.FieldByName('id').asinteger,info,0]);
 end;
      //--------------------------------------------end create file


      //DeleteTransaction(TransactionID);
     // SWDataModule.sw_in_insert.CallProcedure('sw_in_delete',[TransactionID]);
      WillRefresh :=True;

    SWDataModule.swmammount.Refresh;

            {
    try
      if copyfileacrossnetwork(filename,'\\192.168.1.187\c$\Swift\out\'+nameaa)then  //NBcBAnk
             // showmessage('ooerrr');
     except on    E:  Exception       do
         begin
         // showmessage('KECMEDI');
        end;
    end;      }
    end;
  finally
   if WillRefresh then
   begin
 SWDataModule.swmammount.Refresh;
 edit2.Text:='Bu gün göndəriləcək ümumi məbləğ = '+floattostr(SWDataModule.swmammount.FieldByName('summ').AsFloat)+' AZN';



 SWDataModule.sw_out_2.Open;
 SWDataModule.sw_out_2.Refresh;
 SWDataModule.sw_out3.Open;
 SWDataModule.sw_out3.Refresh;



   end;
    //ActionRefreshExecute(Sender);
  end;
   SWDataModule.swmammount.Refresh;
  sboapiDataModule.SBSession.Commit;

end;
