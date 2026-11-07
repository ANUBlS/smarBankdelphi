{ Verbatim copy of Packages/Cards_New/cards_azericard/UnitDxxx.pas lines 61-379 (unchanged; executed by api/app/pascal.py) }
function CheckFileExt(fname : string) : boolean;
    var i, checkFileExtLen: integer;
        fileExt : String;
begin
      checkFileExtLen:=0;
      fileExt:='';
      fileExt:= trim(ExtractFileExt(fname));
      for i:=0 to length(fileExt) do
        begin
        if fileExt[i] in ['0'..'9','.'] then inc(checkFileExtLen);
        end;
      {check for file extention}
      if checkFileExtLen <> length(fileext) then result:=false else result:=true;
end;

procedure TDxxx.ToolButton3Click(Sender: TObject);

begin
ToolButton2.Click;
end;

procedure TDxxx.ToolButton2Click(Sender: TObject);
var i,k,RowCount,MSGCount,D_File_Count, selst, selstF,y :integer;
    SysSim, StMessage :String;
    Test :Real;
    Institution, Currency, Merchant, Terminal,TranDate, Amount, Fee,tr_type,types,Bank_kode,mercname,autcode :String;
    f:textfile;
    v_dir:string;
begin
v_dir:=GetCurrentDir;
try
   y:=0;
   k:=0;
   ToolBar1.Enabled:=false;
   REDXXX.Lines.Clear;
   D_File_Count:=0;
   //Label2.Caption:=IntToStr(D_File_Count);
   if not DirectoryExists('C:\AZCARD\IN') then begin showmessage('Not found: ''C:\AZCARD\IN'''); exit; end;// MkDir('C:\AZCARD\IN');
   FileListBoxDxxx.Directory:='C:\AZCARD\IN';
   FileListBoxDxxx.Update;
   if FileListBoxDxxx.Items.Count = 0 then exit;
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   //Extract_PGP_Zip('D'+bankname+'_XXX.0*','D'+bankname+'_XXX.1*','D'+bankname+'_XXX.2*','D'+bankname+'_XXX.3*');//'D'+bankname+'_XXX.*'
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   FileListBoxDxxx.Mask:='*.*';
   FileListBoxDxxx.Update;
   Test:=122 / 10;
   if pos('.',FloatToStr(Test))>0 then SysSim:='.' else
   if pos(',',FloatToStr(Test))>0 then SysSim:=',';
   for i:=0 to FileListBoxDxxx.Items.Count-1 do begin
    Application.ProcessMessages;
    MSGCount:=0;
    if (UPPERCASE((copy(FileListBoxDxxx.Items[i],0,8))) <>(UPPERCASE( ('D'+ DataMod_CARDS.settings.FieldByName('bankname').asstring+'_XXX'))))  then Continue;
    D_File_Count:=D_File_Count+1;
   // Label2.Caption:=IntToStr(D_File_Count);
    {check for file extention}
    if CheckFileExt(FileListBoxDxxx.Directory+FileListBoxDxxx.items[i])=false then continue;
    {LINK TO FILE}
    AssignFile(F,'C:\AZCARD\IN\'+FileListBoxDxxx.Items[i]);
    Reset(F);
    k:=k+1;
    RowCount:=0;
    while not eof(f) {((Copy(trim(STmessage),1,15)) = '*** Issuing ***')} do begin
     Readln(F,Stmessage);
     RowCount:=RowCount+1;
     if ((Copy(Trim(STmessage),1,21))='Financial institution')
     //if ((Length(Trim(StMessage)))=120)
       {((Copy(trim(STmessage),1,3)) = '***')
       and ((Copy(trim(STmessage),1,17)) <> '*** Acquiring ***')
       and ((Copy(trim(STmessage),1,15)) <> '*** Issuing ***')}
       then MSGCount:=MSGCount+1;
    end; {while}
    STmessage:='';
    Reset(F);
    {VIEW FILE NAME}
    REDxxx.Lines.Add('FILE NAME            :< '+FileListBoxDxxx.items[i]+' >   ');
    {VIEW FILE MESSAGE}
    while not  eof(f) {((Copy(trim(STmessage),1,15)) = '*** Issuing ***')} do begin
     Application.ProcessMessages;

     Readln(F,Stmessage);
     if (Copy(trim(STmessage),1,15)) = '*** Issuing ***' then y:=1;
     if y=0 then types:='Acquiring';
     if y=1 then types:='Issuing';
         if ((Copy(Trim(STmessage),1,21))='Financial institution') then begin
      Institution:=Trim(copy(trim(STmessage),25,20));
      Bank_kode:=Trim(copy(trim(STmessage),55,6));
      Readln(F, StMessage);
      Currency:=Trim(copy(trim(STmessage),26,5));
      if Currency='AZN' then Currency:='944' else
         if Currency='USD' then Currency:='840' else
            if Currency='EUR' then Currency:='978';
      Readln(F, StMessage);
      Readln(F, StMessage);
  //   if ((Copy(Trim(STmessage),1,9))='Tran Date  ') then begin
      if ((Copy(Trim(STmessage),1,13))='Merchant Name') or ((Copy(Trim(STmessage),1,10))='RBS Number')  then begin
      Readln(F,Stmessage);
      Readln(F,Stmessage);
     while not (Trim(copy(StMessage,44,5))='Total')  do begin
     if not ((length(Trim(StMessage)))=0)  then begin
      TranDate:=Trim(copy(trim(STmessage),102,8));
      Merchant:=Trim(copy(trim(STmessage),1,27));
      Terminal:=Trim(copy(trim(STmessage),28,22));
      mercname:=Trim(copy(trim(StMessage),50,23));
      Amount:=Trim((copy(trim(STmessage),73,14)));
      Fee:=Trim((copy(Trim(STmessage),87,14)));
      autcode:=Trim((copy(trim(StMessage),111,6)));
      Tr_type:=Trim((copy(Trim(STmessage),118,20)));
     with REDXXX.Lines do begin
      Add('INSTITUTION          :'+Institution);
      Add('INSTITUTION Code     :'+Bank_kode);
      Add('CURRENCY             :'+Currency);
      Add('DATE                 :'+TranDate);
      Add('MERCHANT             :'+Merchant);
      Add('AMOUNT               :'+Amount);
      Add('FEE                  :'+Fee);
      Add('TERMINAL             :'+Terminal);
      Add('TR_TYPE              :'+Tr_type);
      Add('AUTH_CODE            :'+autcode);
      Add('MERCH_NAME           :'+mercname);
      Add('TYPE                 :'+types);
      Add('-------------------------------------------------------------------------------');
     end;{with REditDXXX.Lines}
     Readln(F,STMessage);
     end else {if not ((length(Trim(StMessage)))=0)}
     Readln(F,STMessage);
     end;{while not (((Trim(StMessage)))='Total')}
     end;{if ((Copy(Trim(STmessage),1,9))='Tran Date')}
     end;{if ((Copy(Trim(STmessage),1,21))='Financial institution')}
    end;{while not ((Copy(trim(STmessage),1,15)) = '*** Issuing ***')}
      REDxxx.SelStart:=REDxxx.FindText('Message count:',selst,LENGTH(REDxxx.Text),[stMatchCase]);
      REDxxx.SelLength:=18;
      REDxxx.SelAttributes.Color:=clBlue;
      REDxxx.SelAttributes.Style:=[];
      selst:=REDxxx.FindText('Message count:',selst,LENGTH(REDxxx.Text),[stMatchCase])+1;
      REDxxx.SelLength:=-1;
      REDxxx.SelStart:=REDxxx.FindText('FILE NAME',selstF,LENGTH(REDxxx.Text),[stMatchCase]);
      REDxxx.SelLength:=35;
      REDxxx.SelAttributes.Color:=clred;
      selstF:=REDxxx.FindText('FILE NAME',selstF,LENGTH(REDxxx.Text),[stMatchCase])+1;
      REDxxx.SelLength:=-1;
    CloseFile(F);
   end;{for i:=0 to FileListBox1.Items.Count-1}

   //ButtonRefreshClick(Sender);
   finally
    if k=0 then showmessage('There is not file (D_XXX) in the directory ''C:\AZCARD\IN''');
    //  Delete_PGP_Zip;
    ToolBar1.Enabled:=true;
    SendMessage(REDXXX.Handle, EM_LINESCROLL, 0,(-1)*(REDXXX.Lines.Count-1));
    FileListBoxDxxx.Directory:=v_dir;
   end;

end;


procedure TDxxx.isertbtnClick(Sender: TObject);
var i,k,RowCount,MSGCount,D_File_Count, selst, selstF,y :integer;
    SysSim, StMessage :String;
    Test :Real;
    Institution, Currency, Merchant, Terminal,TranDate, Amount, Fee,tr_type,types,Bank_kode,mercname,autcode :String;
    f:textfile;
    v_dir:string;
begin
v_dir:=GetCurrentDir;
DataMod_CARDS.mainpacket.CallProcedure('delete_dxxx',[]);
DataMod_CARDS.dxxx.close;;
DataMod_CARDS.dxxx.open;
DataMod_CARDS.dxxx2.close;
DataMod_CARDS.dxxx2.open;
try
   y:=0;
   k:=0;
   ToolBar1.Enabled:=false;
  // REDXXX.Lines.Clear;
   D_File_Count:=0;
   //Label2.Caption:=IntToStr(D_File_Count);
   if not DirectoryExists('C:\AZCARD\IN') then begin showmessage('Not found: ''C:\AZCARD\IN'''); exit; end;// MkDir('C:\AZCARD\IN');
   FileListBoxDxxx.Directory:='C:\AZCARD\IN';
   FileListBoxDxxx.Update;
   if FileListBoxDxxx.Items.Count = 0 then exit;
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   //Extract_PGP_Zip('D'+bankname+'_XXX.0*','D'+bankname+'_XXX.1*','D'+bankname+'_XXX.2*','D'+bankname+'_XXX.3*');//'D'+bankname+'_XXX.*'
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   FileListBoxDxxx.Mask:='*.*';
   FileListBoxDxxx.Update;
   Test:=122 / 10;
   if pos('.',FloatToStr(Test))>0 then SysSim:='.' else
   if pos(',',FloatToStr(Test))>0 then SysSim:=',';
   for i:=0 to FileListBoxDxxx.Items.Count-1 do begin
    Application.ProcessMessages;
   // MSGCount:=0;
    if (uppercase((copy(FileListBoxDxxx.Items[i],0,8))) <>(uppercase( ('D'+ DataMod_CARDS.settings.FieldByName('bankname').asstring+'_XXX'))))  then Continue;
    D_File_Count:=D_File_Count+1;
   // Label2.Caption:=IntToStr(D_File_Count);
    {check for file extention}
    if CheckFileExt(FileListBoxDxxx.Directory+FileListBoxDxxx.items[i])=false then continue;
    {LINK TO FILE}
    AssignFile(F,'C:\AZCARD\IN\'+FileListBoxDxxx.Items[i]);

    Reset(F);
    k:=k+1;
    RowCount:=0;
    //while not eof(f) {((Copy(trim(STmessage),1,15)) = '*** Issuing ***')} do begin
    // Readln(F,Stmessage);
    // RowCount:=RowCount+1;
    // if ((Copy(Trim(STmessage),1,21))='Financial institution')
     //if ((Length(Trim(StMessage)))=120)
       {((Copy(trim(STmessage),1,3)) = '***')
       and ((Copy(trim(STmessage),1,17)) <> '*** Acquiring ***')
       and ((Copy(trim(STmessage),1,15)) <> '*** Issuing ***')}
     //  then MSGCount:=MSGCount+1;
   // end; {while}
    STmessage:='';
    Reset(F);
    {VIEW FILE NAME}
   // REDxxx.Lines.Add('FILE NAME            :< '+FileListBoxDxxx.items[i]+' >   ');
    {VIEW FILE MESSAGE}
    while not  eof(f) {((Copy(trim(STmessage),1,15)) = '*** Issuing ***')} do begin
     Application.ProcessMessages;

     Readln(F,Stmessage);
     if (Copy(trim(STmessage),1,15)) = '*** Issuing ***' then y:=1;
     if y=0 then types:='Acquiring';
     if y=1 then types:='Issuing';
         if ((Copy(Trim(STmessage),1,21))='Financial institution') then begin
      Institution:=Trim(copy(trim(STmessage),25,29));
      Bank_kode:=Trim(copy(trim(STmessage),55,6));
      Readln(F, StMessage);
      Currency:=Trim(copy(trim(STmessage),26,5));
      if Currency='AZN' then Currency:='944' else
         if Currency='USD' then Currency:='840' else
            if Currency='EUR' then Currency:='978';
      Readln(F, StMessage);
      Readln(F, StMessage);
  //   if ((Copy(Trim(STmessage),1,9))='Tran Date  ') then begin
      if ((Copy(Trim(STmessage),1,13))='Merchant Name') or ((Copy(Trim(STmessage),1,10))='RBS Number')  then begin
      Readln(F,Stmessage);
      Readln(F,Stmessage);
     while not (Trim(copy(StMessage,44,5))='Total')  do begin
     if not ((length(Trim(StMessage)))=0)  then begin
      TranDate:=Trim(copy(trim(STmessage),102,8));
      Merchant:=Trim(copy(trim(STmessage),1,27));
      Terminal:=Trim(copy(trim(STmessage),28,22));
      mercname:=Trim(copy(trim(StMessage),50,23));
      Amount:=Trim((copy(trim(STmessage),73,14)));
      Fee:=Trim((copy(Trim(STmessage),87,14)));
      autcode:=Trim((copy(trim(StMessage),111,6)));
      Tr_type:=Trim((copy(Trim(STmessage),118,20)));


      DataMod_CARDS.mainpacket.CallProcedure('Insert_dxxx',[Institution,
                                                            Currency,
                                                            TranDate,
                                                            Merchant,
                                                            Amount,
                                                            Fee,
                                                            Terminal,

                                                            types,
                                                            Tr_type,
                                                            FileListBoxDxxx.items[i],
                                                            Bank_kode,
                                                            mercname,
                                                            autcode]);




    { with REDXXX.Lines do begin
      Add('INSTITUTION          :'+Institution);
      Add('CURRENCY             :'+Currency);
      Add('DATE                 :'+TranDate);
      Add('MERCHANT             :'+Merchant);
      Add('AMOUNT               :'+Amount);
      Add('FEE                  :'+Fee);
      Add('TERMINAL             :'+Terminal);
      Add('TR_TYPE              :'+Tr_type);
      Add('TYPE                 :'+types);
      Add('-------------------------------------------------------------------------------');
     end;}{with REditDXXX.Lines}




     Readln(F,STMessage);
     end else {if not ((length(Trim(StMessage)))=0)}
     Readln(F,STMessage);
     end;{while not (((Trim(StMessage)))='Total')}
     end;{if ((Copy(Trim(STmessage),1,9))='Tran Date')}
     end;{if ((Copy(Trim(STmessage),1,21))='Financial institution')}
    end;{while not ((Copy(trim(STmessage),1,15)) = '*** Issuing ***')}
     // REDxxx.SelStart:=REDxxx.FindText('Message count:',selst,LENGTH(REDxxx.Text),[stMatchCase]);
     // REDxxx.SelLength:=18;
     // REDxxx.SelAttributes.Color:=clBlue;
     // REDxxx.SelAttributes.Style:=[];
     // selst:=REDxxx.FindText('Message count:',selst,LENGTH(REDxxx.Text),[stMatchCase])+1;
     // REDxxx.SelLength:=-1;
     // REDxxx.SelStart:=REDxxx.FindText('FILE NAME',selstF,LENGTH(REDxxx.Text),[stMatchCase]);
     // REDxxx.SelLength:=35;
     // REDxxx.SelAttributes.Color:=clred;
     // selstF:=REDxxx.FindText('FILE NAME',selstF,LENGTH(REDxxx.Text),[stMatchCase])+1;
     // REDxxx.SelLength:=-1;
    CloseFile(F);
    DataMod_CARDS.mainpacket.CallProcedure('dxxarxiv',[FileListBoxDxxx.Items[i]]);
   end;{for i:=0 to FileListBox1.Items.Count-1}

   //ButtonRefreshClick(Sender);
   finally
    if k=0 then showmessage('There is not file (D_XXX) in the directory ''C:\AZCARD\IN''');
    //  Delete_PGP_Zip;
    ToolBar1.Enabled:=true;
   // SendMessage(REDXXX.Handle, EM_LINESCROLL, 0,(-1)*(REDXXX.Lines.Count-1));
   end;

DataMod_CARDS.dxxx.Refresh;
ShowMessage('All records send to base!');
FileListBoxDxxx.Directory:=v_dir;
end;
