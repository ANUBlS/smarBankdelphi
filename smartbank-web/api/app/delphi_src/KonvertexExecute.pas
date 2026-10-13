{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 538-684 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.KonvertexExecute(Sender: TObject);
var
valu:real;
i,j,status,shifr,k,m,struktur,t,num1:integer;
swstring,acount,referens,valyuta,describ,describ2,mt,all,bic,dat,tax,kod,kor,bank_voin,
v_out1,v_out2,v_out3,v_out4:string;
dirold,dirnew,dir,country,voin,sendern,receiver,descript:string;

fl:textfile;

 StrTempl :String;
 StrBuff:string;
 pos1,kk,row:integer;
 Arr : array of array[0..1] of Integer;

begin  //0
//  struktur  1 FIN   0 SWF

{try     begin

struktur:=1;
SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_KONVERT']);
shifr:=3;  status:=2;
  for i:=0 to sw_out_FileListBox.Items.count-1
   do
  begin
  RichEdit1.Lines.LoadFromFile(sw_out_FileListBox.Items[i]);
  swstring:=RichEdit1.Lines[i];
   // ShowMessage(copy(RichEdit1.Lines[0],34,3));
   all:=trim(RichEdit1.Text);
         //ShowMessage(all);
   all := Trim(Copy(all, 1, Pos('}{5:', all)));
  if copy(RichEdit1.Lines[0],34,3)<>'103' then begin  //102 format
    if copy(RichEdit1.Lines[0],34,3)<>'205' then begin
       if copy(RichEdit1.Lines[0],34,3)<>'102' then begin
                      mt:='MT'+copy(RichEdit1.Lines[0],34,3);
                      all:=trim(RichEdit1.Text);
                      all := Trim(Copy(all, 1, Pos('}{5:', all)));
                      referens:= Trim(copy(RichEdit1.Lines[1],5,12)) ;
                      describ:=copy(RichEdit1.Lines[5],5,350)  ;
                      valu:=strtofloat( StringReplace(copy(RichEdit1.Lines[4],15,15), ',', '.', [rfReplaceAll, rfIgnoreCase]));
                      valyuta:='AZN';
                      SwDataModule.sw_in_insert.CallProcedure( 'insert_in_all',[all,mt,referens,valu,describ]);
                      if not DirectoryExists(SWDataModule.sw_settings.fieldbyname('path_out').asstring) then
                      MkDir(SWDataModule.sw_settings.fieldbyname('path').asstring);
                      dir:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+FormatDateTime('ddmmyy',date)+'\';
                      if not DirectoryExists(dir) then
                      MkDir(dir);
                      dirnew:=dir+trim(copy(sw_out_FileListBox.Items[i],1,100));
                      dirold:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+trim(copy(sw_out_FileListBox.Items[i],1,100));
                      movefile(pchar(dirold),pchar(dirnew));
                      RichEdit2.Lines.Add(RichEdit1.Text);
                       end
                        else
                      begin
                       {*****************************************
                        *************  Sabuhi  ******************
                        *************2015.07.23******************
                        ***************************************** }
                    {      konver102.Execute;
                      end;
                      end
                         else
                          begin  //MT205
                          //mt205
valu:=strtofloat( StringReplace(copy(RichEdit1.Lines[3],15,15), ',', '.', [rfReplaceAll, rfIgnoreCase]));
   //  strtofloat(copy(RichEdit1.Lines[3],15,15) );
  //acount:= copy(RichEdit1.Lines[9],6,32) ;
  valyuta:='AZN';
  mt:='MT205';
  referens:=copy(RichEdit1.Lines[1],5,12) ;
  bic:=  copy(RichEdit1.Lines[8],0,12) ;
  sendern:='';
  receiver:='';
  SwDataModule.sw_in_insert.CallProcedure( 'insert_in_other',[acount,referens,bic,status,shifr,mt,all,valu,voin,describ2,Sendern,receiver]);
   if not DirectoryExists(SWDataModule.sw_settings.fieldbyname('path_out').asstring) then
  MkDir(SWDataModule.sw_settings.fieldbyname('path').asstring);
  dir:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+FormatDateTime('ddmmyy',date)+'\';
  if not DirectoryExists(dir) then
 // ShowMessage(dir);
  MkDir(dir);
  dirnew:=dir+trim(copy(sw_out_FileListBox.Items[i],1,100));
  dirold:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+trim(copy(sw_out_FileListBox.Items[i],1,100));
  movefile(pchar(dirold),pchar(dirnew));
   RichEdit2.Lines.Add(RichEdit1.Text);



  END;

  end
  else begin  //mt103


  { all:=trim(RichEdit1.Text);
         //ShowMessage(all);
   all := Trim(Copy(all, 1, Pos('}{5:', all)));
  valu:=strtofloat( StringReplace(copy(RichEdit1.Lines[3],15,15), ',', '.', [rfReplaceAll, rfIgnoreCase]));
   //  strtofloat(copy(RichEdit1.Lines[3],15,15) );
  acount:= copy(RichEdit1.Lines[9],6,32) ;
  valyuta:='AZN';
  mt:='MT103';
  voin:= copy(RichEdit1.Lines[11],0,10)  ;
  describ2:=copy(RichEdit1.Lines[14],5,100)  ;
  referens:=copy(RichEdit1.Lines[1],5,12) ;
  bic:=  copy(RichEdit1.Lines[7],19,20) ;
  sendern:=copy(RichEdit1.Lines[5],0,35);
  receiver:=copy(RichEdit1.Lines[10],0,35);
  //ShowMessage(RichEdit1.Lines[16]);
   if trim(copy(RichEdit1.Lines[16],0,4))=':72:' then
   descript:=copy(RichEdit1.Lines[16],5,35) else
   descript:='' ;

    // all:= StringReplace(all,'copy(RichEdit1.Lines[17],0,1000)','', [rfReplaceAll]);

SwDataModule.sw_in_insert.CallProcedure( 'insert_in_other',[acount,referens,bic,status,shifr,mt,all,valu,voin,describ2,Sendern,receiver,descript]);

   if not DirectoryExists(SWDataModule.sw_settings.fieldbyname('path_out').asstring) then
  MkDir(SWDataModule.sw_settings.fieldbyname('path').asstring);
  dir:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+FormatDateTime('ddmmyy',date)+'\';
    if not DirectoryExists(dir) then
   MkDir(dir);
  dirnew:=dir+trim(copy(sw_out_FileListBox.Items[i],1,100));
  dirold:=SWDataModule.sw_settings.fieldbyname('path').asstring+'\'+trim(copy(sw_out_FileListBox.Items[i],1,100));
  movefile(pchar(dirold),pchar(dirnew));
   RichEdit2.Lines.Add(RichEdit1.Text);

  end;

  end;



end;

//except on e:exception do begin
 // showmessage(E.Message) ;

//end;




end;

     }
end;
