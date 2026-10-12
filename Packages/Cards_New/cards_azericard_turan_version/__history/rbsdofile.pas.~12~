unit rbsdofile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, Grids, DBGrids,OracleData, StdCtrls, FileCtrl, ToolWin,
  Buttons, ExtCtrls,SBTranslateProc,sboapiDataModuleImpl, CMExcelExport;

type
  Trbsdo = class(TForm)
    Panel1: TPanel;
    RefwithSel: TSpeedButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    isertbtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    rbsdoRich: TRichEdit;
    FileListrbsbox: TFileListBox;
    DBGrid1: TDBGrid;
    Animate1: TAnimate;
    ImageList1: TImageList;
    RichEdit1: TRichEdit;
    CMExcelExport1: TCMExcelExport;
    procedure ToolButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure isertbtnClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rbsdo: Trbsdo;

implementation

uses Unit18;

{$R *.dfm}

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

procedure Trbsdo.DBGrid1TitleClick(Column: TColumn);
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

procedure Trbsdo.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Trbsdo.isertbtnClick(Sender: TObject);
var i,j,rowcount:integer;
    STmessage,all,names,st:string;
    f:textfile;
    v_dir:string;
     Test :real;
     SysSim :string;
     ROLLUP, CURRENCY, TOTAL_TYPE, TOTAL_AMOUNT, ISDEBET,report,report_type,
     funds,funds_type,report_code,total_code,funds_code,proc_date,report_date,
     TOTAL_TYPE2, TOTAL_AMOUNT2, ISDEBET2,TOTAL_TYPE3, TOTAL_AMOUNT3,
      ISDEBET3,TOTAL_TYPE4, TOTAL_AMOUNT4, ISDEBET4:string;
     File_Count,k, MSGCount, selst, selstF :integer;
begin
Animate1.Visible:=True;
Animate1.Active:=True;
Animate1.Play(0,0,1);

DataMod_CARDS.mainpacket.CallProcedure('delete_rbsdofile',[]);




         for i:=0 to FileListrbsbox.Items.Count-1 do
   begin
    Application.ProcessMessages;
    MSGCount:=0;

    if (uppercase(copy(FileListrbsbox.Items[i],0,5)) <> 'RBSDO') then Continue;
    File_Count:=File_Count+1;
    if CheckFileExt(FileListrbsbox.Directory+FileListrbsbox.items[i])=false then continue;

     AssignFile(F,'C:\AZCARD\IN\'+FileListrbsbox.Items[i]);
      Reset(F);
      rowcount:=0;
      while not eof(f) do
      begin
        rowcount:=rowcount+1;
        Readln(F,Stmessage);
      end;
      STmessage:='';
      Reset(f);




  // rbsdoRich.Lines.Add('FILE NAME            :< '+FileListrbsbox.items[i]+' >   '+'Message count: '+inttostr(RowCount-14));
                 k:=11;
                 //  RichEdit1.Lines.LoadFromFile(FileListrbsbox.items[i]);

           for j:=1 to rowcount-14 do
      begin
          Application.ProcessMessages;
          Readln(F,Stmessage);

          if j = 1 then Continue;

        //  rbsdoRich.Lines.Add('         ');
         // rbsdoRich.Lines.Add('---------------------------------------------------------------------------------');
 if (trim(copy(RichEdit1.Lines[k+j],72,18))<>'') then    begin
              if trim(copy(RichEdit1.Lines[k+j],215,3))<>'---' then    begin
                if  trim(copy(RichEdit1.Lines[k+j],274,3))<>'Cou'  then  begin
         // rbsdoRich.Lines.Add('Merchant name           :'+trim(copy(RichEdit1.Lines[k+j],3,26)));
         // rbsdoRich.Lines.Add('CardNumber              :'+trim(copy(RichEdit1.Lines[k+j],30,20)));
        //  rbsdoRich.Lines.Add('Transactine Date/Time   :'+trim(copy(RichEdit1.Lines[k+j],50,14)));
       //   rbsdoRich.Lines.Add('Trans condition         :'+trim(copy(RichEdit1.Lines[k+j],166,24)));
        //  rbsdoRich.Lines.Add('A-Code                  :'+trim(copy(RichEdit1.Lines[k+j],65,6)));
       //   rbsdoRich.Lines.Add('Transaction amount      :'+trim(copy(RichEdit1.Lines[k+j],72,18))+' '+ trim(copy(RichEdit1.Lines[k+j],215,3)));
       //   rbsdoRich.Lines.Add('Transaction Fee         :'+trim(copy(RichEdit1.Lines[k+j],239,10))+' '+ trim(copy(RichEdit1.Lines[k+j],215,3)));
       //   rbsdoRich.Lines.Add('AC FEE                  :'+trim(copy(RichEdit1.Lines[k+j],249,7)));
        //  rbsdoRich.Lines.Add('Merchant Contract       :'+trim(copy(RichEdit1.Lines[k+j],91,31)));
//          rbsdoRich.Lines.Add('MCC                     :'+trim(copy(RichEdit1.Lines[k+j],122,4)));
//          rbsdoRich.Lines.Add('Device                  :'+trim(copy(RichEdit1.Lines[k+j],127,10)));
//          rbsdoRich.Lines.Add('CycleN                  :'+trim(copy(RichEdit1.Lines[k+j],138,8)));
//          rbsdoRich.Lines.Add('Reference               :'+trim(copy(RichEdit1.Lines[k+j],146,12)));
//          rbsdoRich.Lines.Add('Member                  :'+trim(copy(RichEdit1.Lines[k+j],159,6)));
//          rbsdoRich.Lines.Add('Acq Ref Number          :'+trim(copy(RichEdit1.Lines[k+j],191,23)));
        //  rbsdoRich.Lines.Add('Account curr            :'+trim(copy(RichEdit1.Lines[k+j],215,3)));


       //   rbsdoRich.Lines.Add('Due date                :'+trim(copy(RichEdit1.Lines[k+j],256,9)));
      //    rbsdoRich.Lines.Add('Country                 :'+trim(copy(RichEdit1.Lines[k+j],274,100)));




        DataMod_CARDS.mainpacket.CallProcedure('rbsdofile_insert',[
                     FileListrbsbox.items[i],
                     trim(copy(RichEdit1.Lines[k+j],30,20)),
                     '',
                     trim(copy(RichEdit1.Lines[k+j],50,14)),
                     StrToFloat(StringReplace(trim(copy(RichEdit1.Lines[k+j],72,18) ),',','',[rfReplaceAll, rfIgnoreCase])),
                     trim(copy(RichEdit1.Lines[k+j],65,6)),
                     trim(copy(RichEdit1.Lines[k+j],91,31)),
                     trim(copy(RichEdit1.Lines[k+j],3,26)),
                     trim(copy(RichEdit1.Lines[k+j],122,4)),
                     trim(copy(RichEdit1.Lines[k+j],127,10)),
                     trim(copy(RichEdit1.Lines[k+j],138,8)),
                     trim(copy(RichEdit1.Lines[k+j],146,12)),
                     trim(copy(RichEdit1.Lines[k+j],159,6)),
                     trim(copy(RichEdit1.Lines[k+j],166,24)),
                     trim(copy(RichEdit1.Lines[k+j],191,23)),
                     trim(copy(RichEdit1.Lines[k+j],215,3)),
                     StrToFloat(StringReplace(trim(copy(RichEdit1.Lines[k+j],72,18) ),',','',[rfReplaceAll, rfIgnoreCase])) ,
                     StrToFloat(trim(copy(RichEdit1.Lines[k+j],239,10))),
                     StrToFloat(trim(copy(RichEdit1.Lines[k+j],249,7))),
                     trim(copy(RichEdit1.Lines[k+j],256,9)),
                     '0',
                     trim(copy(RichEdit1.Lines[k+j],274,100)) ]);




                end;
              end;
             end;
      end;




    Animate1.active:=False;
   Animate1.Visible:=False;
   Animate1.Stop;
      DataMod_CARDS.mainpacket.CallProcedure('rbsdoarxiv',[FileListrbsbox.Items[i]]);
   MessageDlg('All messages are sent in base!',mtInformation,[mbOK],0);
      CloseFile(f);

   end;

    DataMod_CARDS.mainpacket.CallProcedure('rbsdopart',[]);
    DataMod_CARDS.rbsdofile.Open;

end;

procedure Trbsdo.ToolButton3Click(Sender: TObject);

var F :TextFile;
     Test :real;
     SysSim, Stmessage :string;
     ROLLUP, CURRENCY, TOTAL_TYPE, TOTAL_AMOUNT, ISDEBET,report,report_type,
     funds,funds_type,report_code,total_code,funds_code,proc_date,report_date,
     TOTAL_TYPE2, TOTAL_AMOUNT2, ISDEBET2,TOTAL_TYPE3, TOTAL_AMOUNT3,
      ISDEBET3,TOTAL_TYPE4, TOTAL_AMOUNT4, ISDEBET4,v_dir:string;
     File_Count, i,j,k, MSGCount, RowCount, selst, selstF :integer;
begin

  v_dir:= GetCurrentDir;


      DataMod_CARDS.rbsdofile.close;
   rbsdoRich.Lines.Clear;
   //CTPanelCount.Caption:='0';
   if not DirectoryExists('C:\AZCARD\IN') then MkDir('C:\AZCARD\IN');
   FileListrbsbox.Directory:='C:\AZCARD\IN';
   FileListrbsbox.Update;
   if FileListrbsbox.Items.Count = 0 then exit;
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   //Extract_PGP_Zip('C*.0*','C*.1*','C*.2*','C*.3*');
   {******************* AZERCARD PGP ZIP OPEN ***********************}
   FileListrbsbox.Mask:='*.*';
   FileListrbsbox.Update;
   test:=122 / 10;
   if pos('.',floattostr(test))>0 then syssim:='.' else
   if pos(',',floattostr(test))>0 then syssim:=',';

   for i:=0 to FileListrbsbox.Items.Count-1 do
   begin
    Application.ProcessMessages;
    MSGCount:=0;

    if (uppercase(copy(FileListrbsbox.Items[i],0,5)) <> 'RBSDO') then Continue;
    File_Count:=File_Count+1;
    if CheckFileExt(FileListrbsbox.Directory+FileListrbsbox.items[i])=false then continue;

     AssignFile(F,'C:\AZCARD\IN\'+FileListrbsbox.Items[i]);
      Reset(F);
      rowcount:=0;
      while not eof(f) do
      begin
        rowcount:=rowcount+1;
        Readln(F,Stmessage);
      end;
      STmessage:='';
      Reset(f);




   rbsdoRich.Lines.Add('FILE NAME            :< '+FileListrbsbox.items[i]+' >   '+'Message count: '+inttostr(RowCount-14));
                 k:=11;
                   RichEdit1.Lines.LoadFromFile(FileListrbsbox.items[i]);

           for j:=1 to rowcount-14 do
      begin
          Application.ProcessMessages;
          Readln(F,Stmessage);

          if j = 1 then Continue;

            if (trim(copy(RichEdit1.Lines[k+j],72,18))<>'') then    begin
              if trim(copy(RichEdit1.Lines[k+j],215,3))<>'---' then    begin
                if  trim(copy(RichEdit1.Lines[k+j],274,3))<>'Cou'  then  begin



          rbsdoRich.Lines.Add('         ');
          rbsdoRich.Lines.Add('---------------------------------------------------------------------------------');


          rbsdoRich.Lines.Add('Merchant name           :'+trim(copy(RichEdit1.Lines[k+j],3,26)));
          rbsdoRich.Lines.Add('CardNumber              :'+trim(copy(RichEdit1.Lines[k+j],30,20)));
          rbsdoRich.Lines.Add('Transactine Date/Time   :'+trim(copy(RichEdit1.Lines[k+j],50,14)));
          rbsdoRich.Lines.Add('Trans condition         :'+trim(copy(RichEdit1.Lines[k+j],166,24)));
          rbsdoRich.Lines.Add('A-Code                  :'+trim(copy(RichEdit1.Lines[k+j],65,6)));
          rbsdoRich.Lines.Add('Transaction amount      :'+StringReplace(trim(copy(RichEdit1.Lines[k+j],72,18) ),',','',[rfReplaceAll, rfIgnoreCase])+' '+ trim(copy(RichEdit1.Lines[k+j],215,3)));
          rbsdoRich.Lines.Add('Transaction Fee         :'+trim(copy(RichEdit1.Lines[k+j],239,10))+' '+ trim(copy(RichEdit1.Lines[k+j],215,3)));
          rbsdoRich.Lines.Add('AC FEE                  :'+trim(copy(RichEdit1.Lines[k+j],249,7)));
        //  rbsdoRich.Lines.Add('Merchant Contract       :'+trim(copy(RichEdit1.Lines[k+j],91,31)));
//          rbsdoRich.Lines.Add('MCC                     :'+trim(copy(RichEdit1.Lines[k+j],122,4)));
//          rbsdoRich.Lines.Add('Device                  :'+trim(copy(RichEdit1.Lines[k+j],127,10)));
//          rbsdoRich.Lines.Add('CycleN                  :'+trim(copy(RichEdit1.Lines[k+j],138,8)));
//          rbsdoRich.Lines.Add('Reference               :'+trim(copy(RichEdit1.Lines[k+j],146,12)));
//          rbsdoRich.Lines.Add('Member                  :'+trim(copy(RichEdit1.Lines[k+j],159,6)));
//          rbsdoRich.Lines.Add('Acq Ref Number          :'+trim(copy(RichEdit1.Lines[k+j],191,23)));
        //  rbsdoRich.Lines.Add('Account curr            :'+trim(copy(RichEdit1.Lines[k+j],215,3)));


          rbsdoRich.Lines.Add('Due date                :'+trim(copy(RichEdit1.Lines[k+j],256,9)));
          rbsdoRich.Lines.Add('Country                 :'+trim(copy(RichEdit1.Lines[k+j],274,100)));



//          rbsdoRich.Lines.Add('Merchant name           :'+trim(copy(Stmessage,3,26)));
//          rbsdoRich.Lines.Add('CardNumber              :'+trim(copy(Stmessage,30,20)));
//          rbsdoRich.Lines.Add('Transactine Date/Time   :'+trim(copy(Stmessage,50,14)));
//          rbsdoRich.Lines.Add('A-Code                  :'+trim(copy(Stmessage,65,6)));
//          rbsdoRich.Lines.Add('Transaction amount      :'+trim(copy(Stmessage,72,18)));



                end;
              end;
            end;


      end;

      rbsdoRich.SelStart:=rbsdoRich.FindText('FILE NAME',selstF,LENGTH(rbsdoRich.Text),[stMatchCase]);
      rbsdoRich.SelLength:=38;
      rbsdoRich.SelAttributes.Color:=clred;
      selstF:=rbsdoRich.FindText('FILE NAME',selstF,LENGTH(rbsdoRich.Text),[stMatchCase])+1;
      rbsdoRich.SelLength:=-1;
      rbsdoRich.SelStart:=rbsdoRich.FindText('Message count:',selst,LENGTH(rbsdoRich.Text),[stMatchCase]);
      rbsdoRich.SelLength:=18;
      rbsdoRich.SelAttributes.Color:=clBlue;
      rbsdoRich.SelAttributes.Style:=[];
      selst:=rbsdoRich.FindText('Message count:',selst,LENGTH(rbsdoRich.Text),[stMatchCase])+1;
      rbsdoRich.SelLength:=-1;
      rbsdoRich.SelStart:=0;
      CloseFile(f);


   end;



end;

procedure Trbsdo.ToolButton7Click(Sender: TObject);
begin
if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.rbsdofile,'RBSDOFILES',true);
  CMExcelExport1.Disconnect;
end;

end.
