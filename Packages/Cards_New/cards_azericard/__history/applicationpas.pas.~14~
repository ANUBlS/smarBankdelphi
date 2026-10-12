unit applicationpas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, ActnList,FileCtrl,oracledata,
  ComCtrls, ImgList, CMExcelExport, Menus;

type
  TApplications = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ActionList1: TActionList;
    simplefile: TAction;
    FileListBox1: TFileListBox;
    DateTimePicker1: TDateTimePicker;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ImageList1: TImageList;
    CMExcelExport1: TCMExcelExport;
    PopupMenu1: TPopupMenu;
    selectall1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure simplefileExecute(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure selectall1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Applications: TApplications;

implementation

uses Unit18,SBTranslateProc,sboapiDataModuleIMpl;

{$R *.DFM}


function sysday:String;
 var t:TDate;
 begin
  case DayOfWeek(date) of
  2,3,4,5:Result:=formatdatetime('YYYYMMDD',date);
  6:begin t:=date+3;Result:=formatdatetime('YYYYMMDD',t);end;
  7:begin t:=date+2;Result:=formatdatetime('YYYYMMDD',t);end;
  1:begin t:=date+1;Result:=formatdatetime('YYYYMMDD',t);end;
  end;
 end;

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

procedure TApplications.Button1Click(Sender: TObject);


begin

DataMod_CARDS.urgent.Close;
DataMod_CARDS.urgent.SetVariable('dat1',integer(trunc(DateTimePicker1.DateTime)));
DataMod_CARDS.urgent.open;
DataMod_CARDS.simple.Close;
DataMod_CARDS.simple.SetVariable('dat1',integer(trunc(DateTimePicker1.DateTime)));
DataMod_CARDS.simple.open;
end;

procedure TApplications.simplefileExecute(Sender: TObject);
var rowcount,nom,i,j:integer;
    filename,filename_,fheader,ffuter,STmessage,rownum,paspst,clientip,all,flname:string;
    fbool:boolean;
    f,bankid:textfile;

begin




         // AssignFile(F,'C:/azcard/out/test1.txt');
   //Rewrite(F);

      //if DataMod_CARDS.UMUMI.FieldByName('messtype').AsInteger = 1 then
     // begin


      for i:=1 to 999 do
   begin
      all:='_';
      for j:=length(inttostr(i)) to 1 do all:=all+'0';
        filename:='C:\AZCARD\OUT'+'\a'+'BOA'+all+inttostr(i)+'.'+when2Str(whenday);

       if not DirectoryExists(filename) then begin MkDir(filename); FBool:=true; end;
  // FileListBox1.Directory:=filename;
  // FileListBox1.Update;

      filename_:=filename+'\a'+'BOA'+all+inttostr(i)+'.'+when2Str(whenday);
      if FBool then begin NOM:=i; break;end;
   end;
       AssignFile(F,Filename_);
   Rewrite(F);

   fheader:='';
   all:=inttostr(nom);
   for j:=length(all) to 1 do all:='0'+all;
   //if ButtonUrg.Down then
   //fheader:='FH000001APPLICAT  11 '+bankid+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'09'+all+bankid+'  CCDN'
   //else
   fheader:='FH000001APPLICAT  11 '+'BOA'+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'00'+all+'BOA'+'  CCDN';
   for j:=1 to 1398 do fheader:=fheader+' ';
   fheader:=fheader+'*';Writeln(f,fheader);






      STmessage:='';
      {}
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      rownum:=IntToStr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      STmessage:=STmessage+rownum+'1103'+'                    '+FormatDateTime('YYYYMMDD',date);
      {}
      paspst:=DataMod_CARDS.UMUMI.fieldbyname('Passport').AsString;
      for j:=length(paspst) to 31 do paspst:=paspst+' ';
      STmessage:=STmessage+paspst;
      {}
      if DataMod_CARDS.UMUMI.FieldByName('resident').AsString = 'RESIDENT' then clientip:='PR' else clientip:='PNR';
      for j:=length(clientip) to 5 do clientip:=clientip+' ';
      STmessage:=STmessage+clientip;
      {}
      flname:=DataMod_CARDS .UMUMI.fieldbyname('Fname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      flname:=DataMod_CARDS.UMUMI.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      for j:=153 to 280 do STmessage:=STmessage+ ' ';
      {}
      flname:=DataMod_CARDS.UMUMI.fieldbyname('Fname').AsString+' '+DataMod_CARDS.UMUMI.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('security').AsString;
      for j:=length(all) to 19 do all:=all+' ';
      STmessage := STmessage + All+'       ';
      {LANGUAGE CODE POSITION=340 LENGTH=3}
      all :=DataMod_CARDS.UMUMI.FieldByName('LANG_CODE').AsString;
      for j:=length(all) to 2 do all:=all+' ';
      STmessage :=STmessage+all;
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('reference').AsString;
      //Insert(copy(rownum,0,2),all,length(all)+1);
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=375 to 422 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+DataMod_CARDS.UMUMI.fieldbyname('country').AsString;
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('city').AsString;
      for j:=length(all) to 14 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('workphone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('homephone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all+'                ';
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('address').AsString;
      for j:=length(all) to 47 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=525 to 668 do STmessage:=STmessage+' ';
      {}
      all:=FormatDateTime('YYYYMMDD',date); //DataMod_CARDS.UMUMI.fieldbyname('birthday').AsDateTime);
      for j:=length(all) to 7 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=677 to 740 do STmessage:=STmessage+' ';
      {}
      DataMod_CARDS.UMUMI1.Active:=false;
      DataMod_CARDS.UMUMI1.SQL.Clear;
      DataMod_CARDS.UMUMI1.SQL.Add('Select * from CARD_CARDTYPE where (name ='''+DataMod_CARDS.UMUMI.fieldbyname('cardtype').AsString+''')and(currency = '''+DataMod_CARDS.UMUMI.fieldbyname('currency').AsString+''')');
      DataMod_CARDS.UMUMI1.Active:=true;
      all:='';
      all:=DataMod_CARDS.UMUMI1.fieldbyname('code').AsString;
      {}
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all+'                        ';
      {}
      all:=DataMod_CARDS.UMUMI.fieldbyname('rbsnumber').AsString;
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=821 to 852 do STmessage:=STmessage+' ';
      {}
      clientip:=DataMod_CARDS.UMUMI1.fieldbyname('SCHEME').AsString+'  ';
      STmessage:=STmessage+clientip;
      {}
      STmessage:=STmessage+DataMod_CARDS.UMUMI1.fieldbyname('service').AsString;
      if Length(DataMod_CARDS.UMUMI1.fieldbyname('service').AsString)=3 then
       STmessage:=STmessage+' '+'Y';
      if Length(DataMod_CARDS.UMUMI1.fieldbyname('service').AsString)=4 then
       STmessage:=STmessage+'Y';
      {}
      all:='';
      if DataMod_CARDS.UMUMI.FieldByName('currency').AsString = 'AZN' then all:='944' else
      if DataMod_CARDS.UMUMI.FieldByName('currency').AsString = 'USD' then all:='840' else
      if DataMod_CARDS.UMUMI.FieldByName('currency').AsString = 'EUR' then all:='978';
      STmessage:=STmessage+all;
      {}
      all:='';
      all:=DataMod_CARDS.UMUMI.fieldbyname('credit_lim').AsString;
      for j:=length(all) to 12 do all:='0'+all;
      STmessage:=STmessage+all+'00'+'        C';
      {}
      //STmessage:=STmessage+FormatDateTime('YYMM',MaskEditExpry.Date);
      STmessage:=STmessage+FormatDateTime('YYMM',DataMod_CARDS.UMUMI.fieldbyname('Expiry').AsDateTime);
      {}
      all:='';
      all:=DataMod_CARDS.UMUMI.fieldbyname('embossname').AsString;
      for j:=length(all)  to 25 do all:=all+' ';
      STmessage:=STmessage+all;
      {}

            for j:=923 to 1456 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+'*';
      Writeln(F,STmessage);

     // end;

      // for j:=874 to 943 do STmessage:=STmessage+' ';
    //  STmessage:=STmessage+DataMod_CARDS.UMUMI.fieldbyname('company').AsString;
    //  for j:=943 to 1451 do STmessage:=STmessage+' ';
      {}
      //STmessage:=STmessage+'*';
      //Writeln(F,STmessage);
      // closefile(f);

     //  ShowMessage('Fayl Yarandi');

      //end;
     //end;

        ffuter:='';
   all:='';
   rowcount:=0;
   Reset(f);
   while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
   Append(f);
   ffuter:='FT';
   all:=inttostr(rowcount+1 );
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   all:=inttostr(rowcount-1);
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   for j:=1 to 1437 do ffuter:=ffuter+' ';
   ffuter:=ffuter+'*';
   Writeln(f,ffuter);
   CloseFile(f);
   ShowMessage('Fayl Yarandi');


end;


//----------------------------
   procedure cr_file2(DSet :TOracleDataSet; DBG :TDBGrid; urg :integer);
 var F :TextFile;
     rowcount,nom,i,j,k:integer;
     filename,fheader,ffuter,STmessage,rownum,paspst,clientip,all,flname:string;
     F_BOOL :boolean;
     V_cardnum,P_FNAME,P_LNAME,P_EMBOSSNAME,v_filialcode,bankid : string;

 begin

  DataMod_CARDS.settings.open;
 bankid:=DataMod_CARDS.settings.fieldbyname('BANKID').AsString;

 //ShowMessage(bankid);
  k :=0;
  F_BOOL :=FALSE;
  {CONTROL MESSAGES}
  while (k<DBG.SelectedRows.Count) do
  begin
   DSet.GotoBookmark(pointer(DBG.SelectedRows.Items[k]));
   k:=k+1;
   if (DSet.FieldByName('MessType').AsInteger in [5] ) and (DSet.FieldByName('status').AsInteger in [1,3])  then
      F_BOOL:=true;
  end;
  if not F_BOOL then exit;
  k:=0;

   if not DirectoryExists('C:\AZCARD\OUT') then MkDir('C:\AZCARD\OUT');
   if not DirectoryExists('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)) then MkDir('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE));
   Applications.FileListBox1.Directory:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE);
   Applications.FileListBox1.Update;
   nom:=0;
   {find file}
   if Urg=1 then
   begin
   for i:=1 to 99 do
   begin
      all:='';
      for j:=length(inttostr(i)) to 1 do all:='0'+all;
      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+'9'+all+inttostr(i)+'.'+when2Str(whenday);
      if not(FileExists(filename)) then begin NOM:=i; break;end;
   end;
   end else
   if Urg<>1 then
   begin
   for i:=1 to 999 do
   begin
      all:='';
      for j:=length(inttostr(i)) to 2 do all:='_'+all;
     if i>9 then

      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+all+inttostr(i)+'.'+when2Str(whenday)

      else
      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+'_'+'0'+inttostr(i)+'.'+when2Str(whenday);

      if not(FileExists(filename)) then begin NOM:=i; break;end;
   end;
   end;
  // if PanelFrDbase.Visible then  filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\'+FileListBoxCP.Items[FileListBoxCP.itemindex];
   AssignFile(F,Filename);
   Rewrite(F);
    {File header}
   fheader:='';
   all:=inttostr(nom);
   for j:=length(all) to 1 do all:='0'+all;

    if Urg=1 then
   fheader:='FH000001APPLICAT  11 '+bankid+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'09'+all+bankid+'  RCDN'
   else
   fheader:='FH000001APPLICAT  11 '+bankid+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'00'+all+bankid+'  RCDN';
   for j:=1 to 1396 do fheader:=fheader+' ';
   fheader:=fheader+'*';Writeln(f,fheader);




  while (k<DBG.SelectedRows.Count) do
  begin
   DSet.GotoBookmark(pointer(DBG.SelectedRows.Items[k]));
   k:=k+1;
   if not(DSet.FieldByName('MessType').AsInteger in [5]) then continue;
    //  break;
   //--------------------------------------------------------------------//
   {File message}
   STmessage:='';
            {credit limit*********************************************************************************}

       if (DSet.FieldByName('messtype').AsInteger = 5) and (DSet.FieldByName('status').AsInteger=1) then
       begin
       STmessage:='';
       {}
       rowcount:=0;
       Reset(f);
       while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
       Append(f);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'0300'+'                    '+FormatDateTime('YYYYMMDD',date);
       {}
       for j:=51 to 788 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=copy(DSet.fieldbyname('rbsnumber').AsString,1,length(DSet.fieldbyname('rbsnumber').AsString));
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=821 to 865 do STmessage:=STmessage+' ';
       {}
       all:='';


              DataMod_CARDS.fcur.close;
       DataMod_CARDS.FCUR.SetVariable('CUR',copy(DSet.FieldByName('currency').AsString,1,3));
       DataMod_CARDS.FCUR.Open;

        all:=DataMod_CARDS.FCUR.Fieldbyname('INTID').asstring;



       STmessage:=STmessage+all;
       {}
       all:='';
       all:=floattostr(DSet.FieldByName('credit_lim').Asfloat)+'00';
       for j:=length(all) to 14 do all:='0'+all;
       STmessage:=STmessage+all;
       {}
       for j:=884 to 1451 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,STmessage);
        DataMod_CARDS.mainpacket.CallProcedure('donecredit',[DSet.fieldbyname('id').AsInteger]);
      // Datamod.UMUMI.Next;

        end ;

  end;
  {FILE FUTER}
   ffuter:='';
   all:='';
   rowcount:=0;
   Reset(f);
   while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
   Append(f);
   ffuter:='FT';
   all:=inttostr(rowcount+1 );
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   all:=inttostr(rowcount-1);
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   for j:=1 to 1437 do ffuter:=ffuter+' ';
   ffuter:=ffuter+'*';
   Writeln(f,ffuter);
  close(F);
   end;


//----------------------------





 procedure cr_file1(DSet :TOracleDataSet; DBG :TDBGrid; urg :integer);
 var F :TextFile;
     rowcount,nom,i,j,k:integer;
     filename,fheader,ffuter,STmessage,rownum,paspst,clientip,all,flname:string;
     F_BOOL :boolean;
     V_cardnum,P_FNAME,P_LNAME,P_EMBOSSNAME,v_filialcode,bankid : string;

 begin

  DataMod_CARDS.settings.open;
 bankid:=DataMod_CARDS.settings.fieldbyname('BANKID').AsString;

 //ShowMessage(bankid);
  k :=0;
  F_BOOL :=FALSE;
  {CONTROL MESSAGES}
  while (k<DBG.SelectedRows.Count) do
  begin
   DSet.GotoBookmark(pointer(DBG.SelectedRows.Items[k]));
   k:=k+1;
   if (DSet.FieldByName('MessType').AsInteger in [1,2,3,4,6,7,11,12,13,35] ) and (DSet.FieldByName('status').AsInteger in [1,3])  then
      F_BOOL:=true;
  end;
  if not F_BOOL then exit;
  k:=0;

   if not DirectoryExists('C:\AZCARD\OUT') then MkDir('C:\AZCARD\OUT');
   if not DirectoryExists('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)) then MkDir('C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE));
   Applications.FileListBox1.Directory:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE);
   Applications.FileListBox1.Update;
   nom:=0;
   {find file}
   if Urg=1 then
   begin
   for i:=1 to 99 do
   begin
      all:='';
      for j:=length(inttostr(i)) to 1 do all:='0'+all;
      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+'9'+all+inttostr(i)+'.'+when2Str(whenday);
      if not(FileExists(filename)) then begin NOM:=i; break;end;
   end;
   end else
   if Urg<>1 then
   begin
   for i:=1 to 999 do
   begin
      all:='';
      for j:=length(inttostr(i)) to 2 do all:='_'+all;
      if i>9 then

      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+all+inttostr(i)+'.'+when2Str(whenday)

      else
      filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\a'+bankid+'_'+'0'+inttostr(i)+'.'+when2Str(whenday);

      if not(FileExists(filename)) then begin NOM:=i; break;end;
   end;
   end;
  // if PanelFrDbase.Visible then  filename:='C:\AZCARD\OUT\'+FormatDateTime('DDMMYY',DATE)+'\'+FileListBoxCP.Items[FileListBoxCP.itemindex];
   AssignFile(F,Filename);
   Rewrite(F);
    {File header}
   fheader:='';
   all:=inttostr(nom);
   for j:=length(all) to 1 do all:='0'+all;

     if Urg=1 then
   fheader:='FH000001APPLICAT  11 '+bankid+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'09'+all+bankid+'  CCDN'
   else
   fheader:='FH000001APPLICAT  11 '+bankid+'  '+FormatDateTime('yyyymmdd',date)+FormatDateTime('hhmmss',time)+'00'+all+bankid+'  CCDN';
   for j:=1 to 1396 do fheader:=fheader+' ';
   fheader:=fheader+'*';Writeln(f,fheader);

    




  while (k<DBG.SelectedRows.Count) do
  begin
   DSet.GotoBookmark(pointer(DBG.SelectedRows.Items[k]));
   k:=k+1;
   if not(DSet.FieldByName('MessType').AsInteger in [1,2,3,4,6,7,11,12,13,35]) then continue;
    //  break;
   //--------------------------------------------------------------------//
   {File message}
   STmessage:='';
{NEW CARD 01**********************************************************************}
      if (DSet.FieldByName('messtype').AsInteger = 1) and (DSet.FieldByName('status').AsInteger=1) then
      begin

      STmessage:='';
      {}
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      rownum:=IntToStr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      STmessage:=STmessage+rownum+'1103'+'                    '+FormatDateTime('YYYYMMDD',date);
      {}
      paspst:=DSet.fieldbyname('Passport').AsString;
      for j:=length(paspst) to 31 do paspst:=paspst+' ';
      STmessage:=STmessage+paspst;
      {}
      if DSet.FieldByName('resident').AsString <> 'NONRESIDENT' then clientip:='PR' else clientip:='PNR';
      for j:=length(clientip) to 5 do clientip:=clientip+' ';
      STmessage:=STmessage+clientip;
      {}
      flname:=DSet.fieldbyname('Fname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      flname:=DSet.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      for j:=153 to 280 do STmessage:=STmessage+ ' ';
      {}
      flname:=DSet.fieldbyname('Fname').AsString+' '+DSet.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      all:=DSet.fieldbyname('security').AsString;
      for j:=length(all) to 19 do all:=all+' ';
      STmessage := STmessage + All+'       ';
      {LANGUAGE CODE POSITION=340 LENGTH=3}
      all :=DSet.FieldByName('LANG_CODE').AsString;
      for j:=length(all) to 2 do all:=all+' ';
      STmessage :=STmessage+all;
      {}
      all:=DSet.fieldbyname('reference').AsString;
      //Insert(copy(rownum,0,2),all,length(all)+1);
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=375 to 422 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+DSet.fieldbyname('country').AsString;
      {}
      all:=DSet.fieldbyname('city').AsString;
      for j:=length(all) to 14 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('workphone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('homephone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all+'          ';
      {}
      DataMod_CARDS.fkod.Close;
      DataMod_CARDS.fkod.SetVariable('KOD',DSet.FIELDBYNAME('FILIAL').ASINTEGER);
      DataMod_CARDS.fkod.Open;

      all := DataMod_CARDS.fkod.fieldbyname('kods').Asstring;
      for j:=length(all) to 5 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('address').AsString;
      for j:=length(all) to 47 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=525 to 668 do STmessage:=STmessage+' ';
      {}
      all:=FormatDateTime('YYYYMMDD', StrToDate(DSet.fieldbyname('birthday').AsString));
      for j:=length(all) to 7 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=677 to 740 do STmessage:=STmessage+' ';
      {}
      DataMod_CARDS.umumi1.Active:=false;
      DataMod_CARDS.umumi1.SQL.Clear;
      DataMod_CARDS.umumi1.SQL.Add('Select * from card_cardtype where (NAME ='''+DSet.fieldbyname('cardtype').AsString+''')and(currency = '''+DSet.fieldbyname('currency').AsString+''')');
      DataMod_CARDS.umumi1.Active:=true;
     // showmessage(Datamod.ODSGeneral1.SQL.Text);
    //  showmessage(inttostr(Datamod.ODSGeneral1.RecordCount));
      all:='';
      all:=bankid+DataMod_CARDS.umumi1.fieldbyname('code').AsString;
      {}
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all+'                        ';
      {}
      all:=DSet.fieldbyname('rbsnumber').AsString;
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=821 to 852 do STmessage:=STmessage+' ';
      {}
     // showmessage(Datamod.ODSGeneral1.fieldbyname('SCHEME').AsString);
      clientip:=DataMod_CARDS.umumi1.fieldbyname('SCHEME').AsString+'  ';
      STmessage:=STmessage+clientip;
      {}
      STmessage:=STmessage+copy(bankid,2,2)+DataMod_CARDS.umumi1.fieldbyname('service').AsString;
      if Length(DataMod_CARDS.umumi1.fieldbyname('service').AsString)=3 then
       STmessage:=STmessage+' '+'Y';
      if Length(DataMod_CARDS.umumi1.fieldbyname('service').AsString)=4 then
       STmessage:=STmessage+'Y';
      {}
      all:='';

      {
      if copy(DSet.FieldByName('currency').AsString,1,3) = 'AZN' then all:='944' else
      if copy(DSet.FieldByName('currency').AsString,1,3) = 'USD' then all:='840' else
      if copy(DSet.FieldByName('currency').AsString,1,3) = 'EUR' then all:='978';
       }

       DataMod_CARDS.fcur.close;
       DataMod_CARDS.FCUR.SetVariable('CUR',copy(DSet.FieldByName('currency').AsString,1,3));
       DataMod_CARDS.FCUR.Open;

        all:=DataMod_CARDS.FCUR.Fieldbyname('INTID').asstring;

      STmessage:=STmessage+all;
      {}
      all:='';
      all:=DSet.fieldbyname('credit_lim').AsString;
      for j:=length(all) to 12 do all:='0'+all;
      STmessage:=STmessage+all+'00'+'        C';
      {}
      //STmessage:=STmessage+FormatDateTime('YYMM',MaskEditExpry.Date);
      STmessage:=STmessage+FormatDateTime('YYMM',DSet.fieldbyname('Expiry').AsDateTime);
      {}
      all:='';
      all:=DSet.fieldbyname('embossname').AsString;
      for j:=length(all)  to 25 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:='';
      all:=copy(DSet.fieldbyname('company').AsString,1,22);
      for j:=length(all)  to 31 do all:=all+' ';
      STmessage:=STmessage+UpperCase(all);
      {}
      for j:=955 to 1451 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+'*';
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('donenewcard',[DSet.fieldbyname('id').AsInteger ,copy(filename,length(filename)-11,12) ]);
      end

{SUB CARD 02**********************************************************************}
      else
      if (DSet.FieldByName('messtype').AsInteger = 2) and (DSet.FieldByName('status').AsInteger=1)  then
      begin

      STmessage:='';
      {}
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f); end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      rownum:=IntToStr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      STmessage:=STmessage+rownum+'1203'+'                    '+FormatDateTime('YYYYMMDD',date);
      {}
      paspst:=DSet.fieldbyname('Passport').AsString;
      for j:=length(paspst) to 31 do paspst:=paspst+' ';
      STmessage:=STmessage+paspst;
      {}
      if DSet.FieldByName('resident').AsString = 'RESIDENT' then clientip:='PR' else clientip:='PNR';
      for j:=length(clientip) to 5 do clientip:=clientip+' ';
      STmessage:=STmessage+clientip;
      {}
      flname:=DSet.fieldbyname('Fname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      flname:=DSet.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      for j:=153 to 280 do STmessage:=STmessage+ ' ';
      {}
      flname:=DSet.fieldbyname('Fname').AsString+' '+DSet.fieldbyname('Lname').AsString;
      for j:=length(flname) to 31 do flname:=flname+' ';
      STmessage:=STmessage+flname;
      {}
      all:=DSet.fieldbyname('security').AsString;
      for j:=length(all) to 19 do all:=all+' ';
      STmessage := STmessage + All+'       ';
      {LANGUAGE CODE POSITION=340 LENGTH=3}
      all :=DSet.FieldByName('LANG_CODE').AsString;
      for j:=length(all) to 2 do all:=all+' ';
      STmessage :=STmessage+all;
      {}
      all:=DSet.fieldbyname('reference').AsString;
      //Insert(copy(rownum,0,2),all,length(all)+1);
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=375 to 422 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+DSet.fieldbyname('country').AsString;
      {}
      all:=DSet.fieldbyname('city').AsString;
      for j:=length(all) to 14 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('workphone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('homephone').AsString;
      for j:=length(all) to 9 do all:=all+' ';
      STmessage:=STmessage+all+'          ';
      {}

      //-----------------filial
                DataMod_CARDS.fkod.Close;
      DataMod_CARDS.fkod.SetVariable('KOD',DSet.FIELDBYNAME('FILIAL').ASINTEGER);
      DataMod_CARDS.fkod.Open;

      all := DataMod_CARDS.fkod.fieldbyname('kods').Asstring;
      //------------------------


     // all :='55555';   //DataMod.OPCardProcedures.CallStringFunction('get_filialcode',[DSet.fieldbyname('id').AsInteger,2]);
      for j:=length(all) to 5 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      all:=DSet.fieldbyname('address').AsString;
      for j:=length(all) to 47 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=525 to 668 do STmessage:=STmessage+' ';
      {}
      all:=FormatDateTime('YYYYMMDD',StrToDate(DSet.fieldbyname('birthday').AsString));//copy(Datamod.UMUMI.fieldbyname('birthday').AsString,0,4)+copy(Datamod.UMUMI.fieldbyname('birthday').AsString,6,2)+copy(Datamod.UMUMI.fieldbyname('birthday').AsString,8,2);
      for j:=length(all) to 7 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=677 to 740 do STmessage:=STmessage+' ';
      {}
      DataMod_CARDS.umumi1.Active:=false;
      DataMod_CARDS.umumi1.SQL.Clear;
      DataMod_CARDS.umumi1.SQL.Add('Select * from card_cardtype where (name ='''+DSet.fieldbyname('cardtype').AsString+''')and(currency = '''+DSet.fieldbyname('currency').AsString+''')');
      DataMod_CARDS.umumi1.Active:=true;
      all:='';
      all:=bankid+DataMod_CARDS.umumi1.fieldbyname('code').AsString;
      {}
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=765 to 820 do STmessage:=STmessage+' ';
      {}
      all:='';
      all:=DSet.fieldbyname('MAINCARD').AsString;
      for j:=length(all) to 31 do all:=all+' ';
      STmessage:=STmessage+all+'      ';
      {}
      STmessage:=STmessage+copy(bankid,2,2)+DataMod_CARDS.umumi1.fieldbyname('service').AsString;
      if Length(DataMod_CARDS.umumi1.fieldbyname('service').AsString)=3 then
       STmessage:=STmessage+' '+'N';
      if Length(DataMod_CARDS.umumi1.fieldbyname('service').AsString)=4 then
       STmessage:=STmessage+'N';
      {}
      all:='';
      //if copy(DSet.FieldByName('currency').AsString,1,3 )= 'AZN' then all:='944' else
      //if copy(DSet.FieldByName('currency').AsString,1,3 )= 'USD' then all:='840' else
      //if copy(DSet.FieldByName('currency').AsString,1,3 )= 'EUR' then all:='978';

      DataMod_CARDS.fcur.close;
       DataMod_CARDS.FCUR.SetVariable('CUR',copy(DSet.FieldByName('currency').AsString,1,3));
       DataMod_CARDS.FCUR.Open;

        all:=DataMod_CARDS.FCUR.Fieldbyname('INTID').asstring;



      STmessage:=STmessage+all;
      {}
      for j:=869 to 891 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+'C';
      all:=FormatDateTime('YYMM',strtodate(DSet.fieldbyname('expiry').AsString));
      for j:=length(all)  to 3 do all:=all+' ';
      STmessage:=STmessage+all;
      all:='';
      all:=DSet.fieldbyname('embossname').AsString;
      for j:=length(all)  to 25 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      {}
      all:='';
      all:=copy(DSet.fieldbyname('company').AsString,1,22);
      for j:=length(all)  to 31 do all:=all+' ';
      STmessage:=STmessage+UpperCase(all);
      {}
      for j:=955 to 1451 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+'*';
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('donesupcard',[DSet.fieldbyname('id').AsInteger]);
      end
        else
//PROLONGATION 03 -----------------------------------------------------------------//
      if (DSet.FieldByName('messtype').AsInteger = 3) and (DSet.FieldByName('status').AsInteger=1)  then
      begin
      {}
      STmessage:='';
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      {}
      rownum:=inttostr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      {}
      STmessage:=STmessage+rownum+DSet.fieldbyname('withp').AsString+'                    '+FormatDateTime('yyyymmdd',date);
      {}
     // showmessage(STmessage);
      for j:=51 to 764 do STmessage:=STmessage+' ';
      {}
      all:=DSet.fieldbyname('cardnumber').AsString;
      //ShowMessage(all);
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=789 to 892 do STmessage:=STmessage+' ';
      {}
      STmessage:=STmessage+FormatDateTime('yymm',DSet.fieldbyname('expiry').AsDateTime); //copy(Datamod.UMUMI.fieldbyname('expiry').AsString,0,2)+copy(Datamod.UMUMI.fieldbyname('expiry').AsString,4,2);
      {}
      for j:=897 to 1451 do STmessage:=STmessage+' ';
      STmessage:=STmessage+'*';
      {}
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('doneprolongation',[DSet.fieldbyname('id').AsInteger]);
     // Datamod.CardPackage.CallProcedure('SETEXPIRYDATE',[Datamod.UMUMI.fieldbyname('expiry').AsdateTime, Datamod.UMUMI.fieldbyname('cardnumber').AsString]);
      end {if MessType=3 Prolongation}
       




      {REPLACE***********************************************************************}
      else
      if (DSet.FieldByName('messtype').AsInteger = 4) and (DSet.FieldByName('status').AsInteger=1) then
      begin
      {}
      STmessage:='';
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      {}
      rownum:=inttostr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      {}
      STmessage:=STmessage+rownum+DSet.fieldbyname('withp').AsString+'                    '+FormatDateTime('yyyymmdd',date);
      {}
      for j:=51 to 764 do STmessage:=STmessage+' ';
      {}
      all:=DSet.fieldbyname('cardnumber').AsString;
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=789 to 1451 do STmessage:=STmessage+' ';
      STmessage:=STmessage+'*';
      {}
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('donereplace',[DSet.fieldbyname('id').AsInteger]);
      end


            {credit limit*********************************************************************************}
            else
       if (DSet.FieldByName('messtype').AsInteger = 5) and (DSet.FieldByName('status').AsInteger=1) then
       begin
       STmessage:='';
       {}
       rowcount:=0;
       Reset(f);
       while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
       Append(f);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'0300'+'                    '+FormatDateTime('YYYYMMDD',date);
       {}
       for j:=51 to 788 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=copy(DSet.fieldbyname('rbsnumber').AsString,1,length(DSet.fieldbyname('rbsnumber').AsString));
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=821 to 865 do STmessage:=STmessage+' ';
       {}
       all:='';
      // if DSet.FieldByName('currency').AsString='AZN' then all:='944'
      // else
      // if DSet.FieldByName('currency').AsString='USD' then all:='840'
      // else
      // if DSet.FieldByName('currency').AsString='EUR' then all:='978';

              DataMod_CARDS.fcur.close;
       DataMod_CARDS.FCUR.SetVariable('CUR',copy(DSet.FieldByName('currency').AsString,1,3));
       DataMod_CARDS.FCUR.Open;

        all:=DataMod_CARDS.FCUR.Fieldbyname('INTID').asstring;



       STmessage:=STmessage+all;
       {}
       all:='';
       all:=floattostr(DSet.FieldByName('credit_lim').Asfloat)+'00';
       for j:=length(all) to 14 do all:='0'+all;
       STmessage:=STmessage+all;
       {}
       for j:=884 to 1451 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,STmessage);
        DataMod_CARDS.mainpacket.CallProcedure('donecredit',[DSet.fieldbyname('id').AsInteger]);
      // Datamod.UMUMI.Next;

        end





      //------------------------------------------------------------------------------------------------






     {PIN ATTEMPTS CLEAR-------------------------------------------------------------------------------------------------------}
      else
      if (DSet.FieldByName('messtype').AsInteger = 12) and (DSet.FieldByName('status').AsInteger=1) then
      begin
      {}
      STmessage:='';
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      {}
      rownum:=inttostr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      STmessage:=STmessage+rownum;
      {}
      STmessage:=STmessage+'0400'+'                    '+FormatDateTime('yyyymmdd',date);
      {}
      for j:=51 to 764 do STmessage:=STmessage+' ';
      {}
      all:=DSet.fieldbyname('cardnumber').AsString;
      for j:=length(all) to 23 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=789 to 1451 do STmessage:=STmessage+' ';
      STmessage:=STmessage+'*';
      {}
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('doneattempsclear',[DSet.fieldbyname('id').AsInteger]);
      end
    else

    {STATUS CHANGE 06} //***************************************************************************************
    if (DSet.FieldByName('messtype').AsInteger = 6) and (DSet.FieldByName('status').AsInteger=1) then
    begin
       {FILE MESSAGE}
       STmessage:='';
       {}
       rowcount:=0;
       Reset(F);
       while not eof(F) do begin rowcount:=rowcount+1;Readln(F);end;
       Append(F);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'0300'+'                    '+FormatDateTime('YYYYMMDD',date);
       {}
       for j:=51 to 764 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=DSet.fieldbyname('cardnumber').AsString;
       for j:=length(all) to 23 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=789 to 1058 do STmessage:=STmessage+' ';
       {}
       all:='';
       if DSet.FieldByName('cardstatus').AsString = 'PickUp-04' then all:='04' else
       if DSet.FieldByName('cardstatus').AsString = 'PickUp L-41' then all:='41' else
       if DSet.FieldByName('cardstatus').AsString = 'PickUp S-43' then all:='43' else
       if DSet.FieldByName('cardstatus').AsString = 'CARD OK' then all:='00' else
       if DSet.FieldByName('cardstatus').AsString = 'Card Do Not Honor -05' then all:='05' else
       if DSet.FieldByName('CardStatus').AsString = 'Z-Decline-57' then all:='57';
       STmessage:=STmessage+all;
       {}
       for j:=1061 to 1451 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,Stmessage);
       {}
       DataMod_CARDS.mainpacket.CallProcedure('donestatuschange',[DSet.fieldbyname('id').AsInteger ]);
    end
   else

   {RBSNUMBER CHANGE 11} //************************************************************************
   if (DSet.FieldByName('messtype').AsInteger = 11) and (DSet.FieldByName('status').AsInteger=1) then
   begin
       {FILE MESSAGE}
       STmessage:='';
       {}
       rowcount:=0;
       Reset(f);
       while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
       Append(f);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'0300'+'                    '+FormatDateTime('YYYYMMDD',date);
       {}
       for j:=51 to 764 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=DSet.fieldbyname('cardnumber').AsString;
       for j:=length(all) to 23 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       all:='';
       all:=DSet.fieldbyname('rbsclose').AsString;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       for j:=821 to 1451 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,Stmessage);
       DataMod_CARDS.mainpacket.CallProcedure('donerbsnumberchange',[DSet.fieldbyname('id').AsInteger]);
   end
  else

   {CONTRACT CLOSE }//*******************************************************************************
    if (DSet.FieldByName('messtype').AsInteger = 7) and (DSet.FieldByName('status').AsInteger=1) then
    begin
       {FILE MESSAGE}
       STmessage:='';
       {}
       rowcount:=0;
       Reset(f);
       while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
       Append(f);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'0300'+'                    '+FormatDateTime('yyyymmdd',Date);
       {}
       for j:=51 to 764 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=DSet.fieldbyname('cardnumber').AsString;
       for j:=length(all) to 23 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       all:='';
       all:=DataMod_CARDS.settings.fieldbyname('ACCOUNTCLOSECODE').asstring;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=821 to 883 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+sysday;
       {}
       for j:=892 to 1451 do STmessage:=STmessage+' ';
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,Stmessage);
       DataMod_CARDS.mainpacket.CallProcedure('contractclose',[DSet.fieldbyname('id').AsInteger ]);
    end
       else

          {SECURITY CHANGE-------------------------------------------------------------------------------------------------------}

      if (DSet.FieldByName('messtype').AsInteger = 13) and (DSet.FieldByName('status').AsInteger=1) then
      begin
      {}


      STmessage:='';
      rowcount:=0;
      Reset(f);
      while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
      Append(f);
      rownum:=IntToStr(rowcount+1);
      for j:=length(rownum) to 5 do rownum:='0'+rownum;
      STmessage:='RD' + rownum;
      {}
      rownum:=inttostr(rowcount);
      for j:=length(rownum) to 9 do rownum:=rownum+' ';
      STmessage:=STmessage+rownum;
      {}


      STmessage:=STmessage+'2000'+'                    '+FormatDateTime('yyyymmdd',date);

      {}
       all:='';
       all:=DSet.fieldbyname('cardnumber').AsString;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}

      {}
      for j:=83 to 312 do STmessage:=STmessage+' ';
      {}
      all:=DSet.fieldbyname('SECURITY').AsString;
      for j:=length(all) to 19 do all:=all+' ';
      STmessage:=STmessage+all;
      {}
      for j:=333 to 1451 do STmessage:=STmessage+' ';
      STmessage:=STmessage+'*';
      {}
      Writeln(F,STmessage);
      DataMod_CARDS.mainpacket.CallProcedure('DONESECURE',[DSet.fieldbyname('id').AsInteger]);
      end





     {CARDNAME CHANGE} //************************************************************************
      else
      if (DSet.FieldByName('messtype').AsInteger = 35) and (DSet.FieldByName('status').AsInteger=1) then
      begin
       V_cardnum:=DSet.FieldByName('cardnumber').AsString;
       P_FNAME:=trim(DSet.FieldByName('FNAME').AsString);
       P_LNAME:=trim(DSet.FieldByName('LNAME').AsString);
       P_EMBOSSNAME:=trim(DSet.FieldByName('EMBOSSNAME').AsString);

//       Datamod.CardPackage.CallProcedure('CARDNAME_CHANGE',[V_cardnum,P_FNAME,P_LNAME]);

       {FILE MESSAGE}
       STmessage:='';
       {}
       rowcount:=0;
       Reset(f);
       while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
       Append(f);
       rownum:=IntToStr(rowcount+1);
       for j:=length(rownum) to 5 do rownum:='0'+rownum;
       STmessage:='RD' + rownum;
       {}
       rownum:=IntToStr(rowcount);
       for j:=length(rownum) to 9 do rownum:=rownum+' ';
       STmessage:=STmessage+rownum+'2300'+'                    '+FormatDateTime('yyyymmdd',Date);
       {}
     {L-chin  for j:=51 to 764 do STmessage:=STmessage+' ';}
       {}
       all:='';
       all:=DSet.fieldbyname('CARDNUMBER').AsString;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all+'      ';
       {}
       all:='';
       all:=P_FNAME;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       all:='';
       all:=P_LNAME;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=153 to 280 do STmessage:=STmessage+' ';
       {--------------------}
       all:='';
       all:=P_FNAME+' '+P_LNAME;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=313 to 764 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=DSet.fieldbyname('cardnumber').AsString;
       for j:=length(all) to 23 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=789 to 896 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=P_EMBOSSNAME;
       for j:=length(all) to 25 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=923 to 1251 do STmessage:=STmessage+' ';
       {}
       all:='';
       all:=P_FNAME+' '+P_LNAME;
       for j:=length(all) to 31 do all:=all+' ';
       STmessage:=STmessage+all;
       {}
       for j:=1284 to 1451 do STmessage:=STmessage+' ';
       {--------------------}
       {}
       STmessage:=STmessage+'*';
       {}
       Writeln(F,Stmessage);
       DataMod_CARDS.mainpacket.CallProcedure('cardnamechange',[DSet.fieldbyname('id').AsInteger ]);
      end;


   //--------------------------------------------------------------------//
  end;
  {FILE FUTER}
   ffuter:='';
   all:='';
   rowcount:=0;
   Reset(f);
   while not eof(f) do begin rowcount:=rowcount+1;Readln(f);end;
   Append(f);
   ffuter:='FT';
   all:=inttostr(rowcount+1 );
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   all:=inttostr(rowcount-1);
   for i:=length(all) to 5 do all:='0'+all;
   ffuter:=ffuter+all;
   for j:=1 to 1437 do ffuter:=ffuter+' ';
   ffuter:=ffuter+'*';
   Writeln(f,ffuter);
  close(F);
   end;




procedure TApplications.Button5Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['cardcreatefilenr']);

if MessageDlg('Fayl yaratmaq istəyirsiniz?',mtConfirmation,[mbyes,mbno],0)=mryes then
begin

 //if dbgrid2.Focused then
 //begin
 // if dbgrid2.SelectedRows.Count=0 then exit;
 //if DataMod_CARDS.simple.FieldByName('messtype').AsInteger=5 then
cr_file2(DataMod_CARDS.simple,DBGrid2,0);

//else
cr_file1(DataMod_CARDS.simple,DBGrid2,0);
 DataMod_CARDS.simple.Refresh;
  showmessage('Fayl yaradıldı!');

//end;
end;
//simplefile.Execute;
end;

procedure TApplications.Button2Click(Sender: TObject);

begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['cardcreatefilenr']);

if MessageDlg('Fayl yaratmaq istəyirsiniz?',mtConfirmation,[mbyes,mbno],0)=mryes then
begin

 //if dbgrid2.Focused then
 //begin
 // if dbgrid2.SelectedRows.Count=0 then exit;
//if DataMod_CARDS.urgent.FieldByName('messtype').AsInteger=5 then
cr_file2(DataMod_CARDS.urgent,DBGrid1,1);

//else
cr_file1(DataMod_CARDS.urgent,DBGrid1,1);
 DataMod_CARDS.urgent.Refresh;
  showmessage('Fayl yaradıldı!');

//end;
end;
//simplefile.Execute;
end;
procedure TApplications.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TApplications.FormShow(Sender: TObject);
begin

DateTimePicker1.DateTime:=date;
DataMod_CARDS.urgent.Close;
DataMod_CARDS.urgent.SetVariable('dat1',integer(trunc(DateTimePicker1.DateTime)));
DataMod_CARDS.simple.Close;
DataMod_CARDS.simple.SetVariable('dat1',integer(trunc(DateTimePicker1.DateTime)));
DataMod_CARDS.urgent.open;
DataMod_CARDS.simple.open;
Button6.Click;
Button7.Click;
end;

procedure TApplications.Button3Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_excel1']);
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.urgent,'Application',true);
  CMExcelExport1.Disconnect;

end;

procedure TApplications.Button4Click(Sender: TObject);
begin
DataMod_CARDS.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['card_excel2']);

  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.simple,'Application',true);
  CMExcelExport1.Disconnect;
end;

procedure TApplications.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;

begin

 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of

      1:
        ImageIndex :=25;
      2:
        ImageIndex :=3 ;
      3:
        ImageIndex :=26;

      4:
        ImageIndex:=13;  

      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;




  end;
end;

procedure TApplications.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;

begin

 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of

      1:
        ImageIndex :=25;
      2:
        ImageIndex :=3 ;
      3:
        ImageIndex :=26;

      4:
        ImageIndex:=13;  

      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;




  end;
end;

procedure TApplications.selectall1Click(Sender: TObject);
begin
 with dbgrid1, SelectedRows, DataSource.DataSet do
  begin
    DisableControls;
    try
      First;
      while not Eof do
       begin
        CurrentRowSelected := True;
        Next;
       end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TApplications.MenuItem1Click(Sender: TObject);
begin
 with dbgrid2, SelectedRows, DataSource.DataSet do
  begin
    DisableControls;
    try
      First;
      while not Eof do
       begin
        CurrentRowSelected := True;
        Next;
       end;
    finally
      EnableControls;
    end;
  end;   
end;

procedure TApplications.DBGrid1TitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (DBGrid1.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(DBGrid1.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure TApplications.DBGrid2TitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (DBGrid2.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(DBGrid2.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure TApplications.Button6Click(Sender: TObject);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 //if (DBGrid1.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :='STATUS';
 with TOracleDataSet(DBGrid1.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure TApplications.Button7Click(Sender: TObject);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 //if (DBGrid2.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :='STATUS';
 with TOracleDataSet(DBGrid2.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

end.
