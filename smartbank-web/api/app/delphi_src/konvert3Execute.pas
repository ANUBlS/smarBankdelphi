{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 6480-6652 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.konvert3Execute(Sender: TObject);
var
i,j,z,status,shifr,k,m,struktur,num,num1,num2:integer;
swstring,fli,acount,referens,valu,valyuta,describ,describ2,mt,all,bic,dat,tax,kod,kor,bank_voin:string;
dirold,dirnew,dir:string;
 fl:textfile;

begin  //1
//--  struktur  o FIN   1 PRT
struktur:=0;

SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_KONVERT']);
shifr:=3;
status:=2;
  for i:=0 to sw_out_FileListBox.Items.count-1
   do
  begin//2
   reset(fl,sw_out_FileListBox.Items[i]);
  z:=0;
  while not eof(fl)  do
  begin //3
  z:=z+1;
  Readln(fl,fli);

 // bazaya atmaq
        m:=m+1;
      swstring:=trim(fli);

  //------------Begin FIN file-------------------------------------

     if trim(copy(swstring,1,5))<>'-}{5:' then
     memo3.Lines[z]:=swstring;
     if trim(copy(swstring,1,5))='-}{5:' then
     all:=Memo3.text;

  if trim(copy(swstring,1,3))='{1:'  then      //------DUZELIB
  begin
   mt:= 'MT'+trim(copy(swstring,SWDataModule.settingsINN_MT_READLINE.asInteger,3));
  end;

  if trim(copy(swstring,1,3))='{1:'  then       //-----duzelib
  begin
  bic:= trim(copy(swstring,7,8));
  BIC:=BIC+trim(copy(swstring,16,3));
  end;

     if trim(copy(swstring,1,4))=':20:' then  //---------DUZELIB
   begin
   referens:=trim(copy(swstring,5,20));
   //swstring:=trim(copy(swstring,1,100));
   //referens:=swstring;
   //ShowMessage(referens);
   end;

       if trim(copy(swstring,1,5))=':32A:'  then     //-------DUZELIB
       begin
       dat:=trim(copy((trim(swstring)),6,6));
       valyuta:=trim(copy((trim(swstring)),12,3));
       valu:= trim(copy((trim(swstring)),15,100));
       //ShowMessage(VALU);
       end;

   if trim(copy(swstring,1,4))=':59:' then    //----------DUZELIB
   begin
   num:=z;
   //swstring:=trim(RichEdit1.Lines[j]);
   //swstring:=trim(copy(swstring,6,100));
   acount:=trim(copy(swstring,6,100));
   end;

   if z=num+1 then
   begin
   describ2:=trim(copy((swstring),1,100));
   end;
   if z=num+2 then
   begin
         if pos('/',trim(swstring))<>0
         then
         tax:=copy(trim(swstring),0,pos('/',trim(swstring))-1)
         else
         tax:=trim(swstring);
   end;

   if z=num+3 then
   begin
   kod:=trim(copy((swstring),1,6));
   bank_voin:=trim(copy((swstring),8,10));
   end;
   if z=num+4 then
    kor:=trim(copy((swstring),0,13));

       if (trim(copy(swstring,1,5)) =':50K:') or (trim(copy(swstring,1,5)) =':50A:') or (trim(copy(swstring,1,5)) =':50B:') or (trim(copy(swstring,1,5)) =':50F:') or (trim(copy(swstring,1,5)) =':50C:') or (trim(copy(swstring,1,5)) =':50D:') then
       begin
       num2:=z;
       //describ:= trim(copy((trim(RichEdit1.Lines[j+1])),1,100));
       end;
       if z=num2+1 then
       begin
       describ:= trim(copy((swstring),1,100));
       end;

      if  trim(copy(swstring,1,5))= '-}{5:' then
         begin
         //all:=RichEdit2.Text;
         //RichEdit2.Clear;
         //k:=j-1;
          end;
 //bazaya atmaqin sonu
  end;
   CloseFile(fl);

    if not DirectoryExists(SWDataModule.sw_settings.fieldbyname('path_out').asstring) then
  MkDir(SWDataModule.sw_settings.fieldbyname('path').asstring);
dir:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+FormatDateTime('ddmmyy',date)+'\';
  if not DirectoryExists(dir) then
MkDir(dir);
dirnew:=dir+trim(copy(sw_out_FileListBox.Items[i],1,100));
dirold:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+trim(copy(sw_out_FileListBox.Items[i],1,100));

movefile(pchar(dirold),pchar(dirnew));
//   //---------end prtfile---------------------------------------

   //---------------------------------end FIN file-----------------------

    //ShowMessage(mt);
     // all:=Memo3.Text;
      //ShowMessage(all);


     if mt='MT103' then begin
    SwDataModule.sw_in_insert.CallProcedure( 'insert_in',[  acount,
                                                           referens,
                                                           valu,
                                                           bic,
                                                           valyuta,
                                                           describ,
                                                           describ2,
                                                           status,
                                                           shifr,
                                                           mt,
                                                           all,
                                                           tax,
                                                           kod,
                                                           bank_voin,
                                                           kor]);
                                                           richedit2.Lines.Clear;

        end else
              begin
            SwDataModule.sw_in_insert.CallProcedure( 'insert_in_other',[
                                                           referens,
                                                           bic,
                                                           status,
                                                           shifr,
                                                           mt,
                                                           all]);
                                                           richedit2.Lines.Clear;
         //     end;
            end;
  end; //2
  //end1

  sw_out_FileListBox.refresh;
sw_out_FileListBox.Repaint;
 SWDataModule.sw_in.close;
SWDataModule.sw_in.open;
SWDataModule.sw_in.Refresh;
cheskaccount.execute;
SWDataModule.sw_in.close;
SWDataModule.sw_in.open;

sw_out_FileListBox.Refresh;
end;//1
