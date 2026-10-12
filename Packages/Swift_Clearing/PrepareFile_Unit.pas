unit PrepareFile_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, CurrencyEdit, Grids, DBGrids, Db,
  OracleData,sboapiDataModuleImpl, ToolWin, Oracle,FileCtrl;

type
  TPrepareFile_Form = class(TForm)
    ProgressBar1: TProgressBar;
    But_cancel: TBitBtn;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    GridMT102: TDBGrid;
    Panel7: TPanel;
    Panel1: TPanel;
    Edit_sender: TEdit;
    Panel4: TPanel;
    Edit_receiver: TEdit;
    Panel8: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Edit_reference: TEdit;
    Panel9: TPanel;
    Panel3: TPanel;
    Edit_count: TEdit;
    Panel5: TPanel;
    CurrencyEdit1: TCurrencyEdit;
    Panel11: TPanel;
    Edit1: TEdit;
    ToSend: TOracleDataSet;
    NoSend: TOracleDataSet;
    NoSend_DataSource: TDataSource;
    ToSend_DataSource: TDataSource;
    ToolBar1: TToolBar;
    All_to_Nosend: TSpeedButton;
    But_noSend: TSpeedButton;
    All_to_send: TSpeedButton;
    But_tosend: TSpeedButton;
    ToolButton1: TToolButton;
    DBGrid1: TDBGrid;
    NoSendID: TFloatField;
    NoSendF_ID: TFloatField;
    NoSendOPERCODE: TStringField;
    NoSendACC_ID: TFloatField;
    NoSendCLIENT_NAME: TStringField;
    NoSendCLIENT_CODE: TStringField;
    NoSendTRANS_REF: TStringField;
    NoSendAMOUNT: TFloatField;
    NoSendVAL_ACC: TIntegerField;
    NoSendTRANSDATE: TDateTimeField;
    NoSendSEND: TIntegerField;
    NoSendSTATUS: TIntegerField;
    NoSendACC_NO: TStringField;
    NoSendVAL_NAME: TStringField;
    ToSendID: TFloatField;
    ToSendF_ID: TFloatField;
    ToSendOPERCODE: TStringField;
    ToSendACC_ID: TFloatField;
    ToSendCLIENT_NAME: TStringField;
    ToSendCLIENT_CODE: TStringField;
    ToSendTRANS_REF: TStringField;
    ToSendAMOUNT: TFloatField;
    ToSendVAL_ACC: TIntegerField;
    ToSendTRANSDATE: TDateTimeField;
    ToSendSEND: TIntegerField;
    ToSendSTATUS: TIntegerField;
    ToSendACC_NO: TStringField;
    ToSendVAL_NAME: TStringField;
    Convert_pack: TOraclePackage;
    MT102: TOracleDataSet;
    Messages: TOracleDataSet;
    ForAll: TOracleDataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure But_tosendClick(Sender: TObject);
    procedure But_noSendClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure All_to_sendClick(Sender: TObject);
    procedure All_to_NosendClick(Sender: TObject);
    procedure CreateFileForHOx;
    procedure But_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    XMLFile : TextFile;
  end;

var
  PrepareFile_Form: TPrepareFile_Form;

implementation

uses Payment_Det, Data_Unit, Swift_Unit;

{$R *.DFM}
{--------------------------------------------------------------------------}
{------------------CREATE  FILE (HOX)--------------------------------------}
{--------------------------------------------------------------------------}
Procedure TPrepareFile_Form.CreateFileForHOx;
   var
   i,j,mess_count:  Integer;
   STmessage,FileName : String;
   sum_amount,sum_all_amount : Real;
begin
   ProgressBar1.Position:=0;
   {OPEN DATASET'S}
   ForAll.Close;
   ForAll.SQL.Clear;
   ForAll.SQL.Add('Select hox_out_dir from hoxsw_proper');
   ForAll.Open;
   {}
   MT102.Close;
   MT102.SQL.Clear;
   MT102.SQL.Add('select h.*,a.acc_no,v.val_name from hox102_out h,account a,avalute v where h.acc_id = a.id and v.valute=h.val_acc and(h.send=1)and(h.status=1)');
   MT102.open;
   {}
   sum_all_amount:=0;
   if not DirectoryExists(ForAll.fieldbyname('hox_out_dir').AsString) then begin ShowMessage(ForAll.fieldbyname('hox_out_dir').AsString+' Directory not exists !'); exit;end;
   if Trim(Edit_reference.Text)='' then exit;
   FileName:=ForAll.fieldbyname('hox_out_dir').AsString+'\'+Edit_reference.Text+'.xml';
   ProgressBar1.Show;
   AssignFile(XMLFile,Filename);
   Rewrite(XMLFile);
   {CREATE FILE HEADER}
   Writeln(XMLFile,'<SWIFT_msg_fields>');
   Writeln(XMLFile,' <msg_format>S</msg_format>');
   Writeln(XMLFile,' <msg_sub_format>I</msg_sub_format>');
   Writeln(XMLFile,' <msg_sender>'+Edit_sender.text+'</msg_sender>');
   Writeln(XMLFile,' <msg_receiver>'+Edit_receiver.text+'</msg_receiver>');
   Writeln(XMLFile,' <msg_type>'+edit1.text+'</msg_type>');
   Writeln(XMLFile,' <msg_priority>N</msg_priority>');
   Writeln(XMLFile,' <msg_del_notif_rq>N</msg_del_notif_rq>');
   Writeln(XMLFile,' <msg_user_priority>C099</msg_user_priority>');
   Writeln(XMLFile,' <msg_user_reference>'+Edit_reference.Text+'</msg_user_reference>');
   Writeln(XMLFile,'<block4>');
   {FILE BATCH AND MESSAGE}
   while not MT102.Eof do
   begin
   Application.ProcessMessages;
      Writeln(XMLFile,'<batch>');
      Writeln(XMLFile,'<body>:20:'+mt102.fieldbyname('TRANS_REF').asstring);
      Writeln(XMLFile,':23:'+mt102.fieldbyname('OPERCODE').asstring);
      Writeln(XMLFile,':50K:/'+mt102.fieldbyname('ACC_NO').asstring);
      Writeln(XMLFile,mt102.fieldbyname('CLIENT_NAME').asstring);
      if mt102.fieldbyname('CLIENT_CODE').AsString ='' then
      STmessage:='/'
      else
      STmessage:=mt102.fieldbyname('CLIENT_CODE').AsString;
      Writeln(XMLFile,StMessage);
      STmessage:='';
      {SEL}
      ForAll.Close;
      ForAll.SQL.Clear;
      ForAll.SQL.Add('select c.inn from account a,customers c where (a.kli_ID=c.id)and(a.id='''+MT102.fieldbyname('acc_id').AsString+''')');
      ForAll.Open;
      {}
      Writeln(XMLFile,forall.fieldbyname('INN').asstring);
      {SEL}
      ForAll.Close;
      ForAll.SQL.Clear;
      ForAll.SQL.Add('Select kod_b,krno,inn,swift from bankinfo');
      ForAll.Open;
      STmessage:=ForAll.fieldbyname('SWIFT').AsString;
      {}
      Writeln(XMLFile,forall.fieldbyname('KOD_B').asstring+'/'+forall.fieldbyname('KRNO').asstring+'/'+forall.fieldbyname('INN').asstring);
      {SEL}
      ForAll.Close;
      ForAll.SQL.Clear;
      ForAll.SQL.Add('Select hoxaccount from hoxsw_proper');
      ForAll.Open;
      {}
      Writeln(XMLFile,':52A:/D/'+forall.fieldbyname('HOXACCOUNT').asstring);
      Writeln(XMLFile,Stmessage);
      STmessage:='';
      {OPEN MESSAGES TABE AND CREATE :21:}
      mess_count:=0;
      sum_amount:=0;
      Messages.Close;
      Messages.SQL.Clear;
      Messages.SQL.Add('select m.*, v.val_name from hoxMessage_out m, avalute v where (m.mt102_id='''+MT102.fieldbyname('ID').AsString+''')and (m.val_cod=v.valute)');
      Messages.Open;
      while not messages.eof do
      begin
      Application.ProcessMessages;
      ProgressBar1.Position:=   ProgressBar1.Position+10;
          Writeln(XMLFile,':21:'+messages.fieldbyname('MESS_REFERENCE').asstring);
          Writeln(XMLFile,':32B:'+messages.fieldbyname('VAL_NAME').asstring+formatfloat('0.00',messages.fieldbyname('AMOUNT').asfloat));
          Writeln(XMLFile,':57A:/C/'+messages.fieldbyname('REC_BANK_SUB_ACC').asstring);
          {SEL}
          ForAll.Close;
          ForAll.SQL.Clear;
          ForAll.SQL.Add('Select swift from bankm where id='''+messages.fieldbyname('REC_BANK_ID').AsString+'''');
          ForAll.Open;
          {}
          Writeln(XMLFile,Forall.fieldbyname('SWIFT').asstring);
          Writeln(XMLFile,':59:/'+messages.fieldbyname('CLIENT_ACC_NO').asstring);
          Writeln(XMLFile,messages.fieldbyname('CLIENT_NAME').asstring);
          if Messages.fieldbyname('CLIENT_CODE').AsString ='' then
          STmessage:='/'
          else
          STmessage:=Messages.fieldbyname('CLIENT_CODE').AsString;
          Writeln(XMLFile,StMessage);
          STmessage:='';
          Writeln(XMLFile,messages.fieldbyname('CLIENT_INN').asstring);
          {SEL}
          ForAll.Close;
          ForAll.SQL.Clear;
          ForAll.SQL.Add('Select krno,inn,bankcode from bankm where id='''+messages.fieldbyname('REC_BANK_ID').AsString+'''');
          ForAll.Open;
          {}
          Writeln(XMLFile,forall.fieldbyname('BANKCODE').asstring+'/'+forall.fieldbyname('KRNO').asstring+'/'+forall.fieldbyname('INN').asstring);
          {REMIT INF}
          {1}
          STmessage:=copy(messages.fieldbyname('REMIT_INF').asstring,0,35);
          if trim(STmessage) <> '' then
          Writeln(XMLFile,':70:'+Stmessage);
          {2}
          STmessage:=copy(messages.fieldbyname('REMIT_INF').asstring,35,35);
          if trim(STmessage) <> '' then
          Writeln(XMLFile,Stmessage);
          {3}
          STmessage:=copy(messages.fieldbyname('REMIT_INF').asstring,70,35);
          if trim(STmessage) <> '' then
          Writeln(XMLFile,Stmessage);
          {4}
          STmessage:=copy(messages.fieldbyname('REMIT_INF').asstring,105,35);
          if trim(STmessage) <> '' then
          Writeln(XMLFile,Stmessage);
          {}
          Writeln(XMLFile,':26T:'+messages.fieldbyname('TRANS_COD').asstring);
          {}
          if trim(messages.fieldbyname('ADD_INF').asstring )<>'' then
          Writeln(XMLFile,':77B:'+messages.fieldbyname('ADD_INF').asstring);
      mess_count:=mess_count+1;
      sum_amount:=sum_amount+messages.fieldbyname('AMOUNT').AsFloat;
      Messages.Next;
      end;
   Writeln(XMLFile,':32A:'+formatdatetime('yymmdd',messages.fieldbyname('val_date').AsDateTime)+mt102.fieldbyname('VAL_NAME').asstring+formatfloat('0.00',sum_amount));
   Writeln(XMLFile,':72:/BNF/'+inttostr(mess_count));
   Writeln(XMLFile,'</body>');
   Writeln(XMLFile,'<sign></sign>');
   Writeln(XMLFile,'</batch>');
   sum_all_amount:=sum_all_amount+MT102.fieldbyname('AMOUNT').asfloat;
   MT102.Next;
   end;
   {FILE FOOTER}
   Writeln(XMLFile,'</block4>');
   Writeln(XMLFile,'<msg_num_of_batches>'+inttostr(mt102.recordcount)+'</msg_num_of_batches>');
   Writeln(XMLFile,'<msg_amount>'+formatfloat('0.00',CurrencyEdit1.Value)+'</msg_amount>');
   Writeln(XMLFile,'</SWIFT_msg_fields>');
   CloseFile(XMLFile);
end;




procedure TPrepareFile_Form.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TPrepareFile_Form.SpeedButton1Click(Sender: TObject);
begin
    {NEW REF NUMBER for File}
    Edit_Reference.Text:=inttostr(DataMod.INS.Callintegerfunction('new_file_reference',[]))+formatdatetime('yymmdd',date);
end;

procedure TPrepareFile_Form.But_tosendClick(Sender: TObject);
begin
//   if (DataMod.CHECK_Pack.CallIntegerFunction('CheckForFile',[nosend.fieldbyname('id').asinteger,1]) = 0)or
     if (NoSend.RecordCount = 0)
   then
      begin
        ShowMessage('Testiq olunmus Emeliyyat Bloku yoxdur !');
        exit;
      end;
    Convert_pack.CallProcedure('ToandNo_send',[NoSend.fieldbyname('id').asinteger,1,0]);
    NoSend.Refresh;
    ToSend.Refresh;
    CurrencyEdit1.Value:=Convert_pack.CallFloatFunction('SumofAmount',[]);
    Edit_count.Text:=inttostr(ToSend.RecordCount);
end;

procedure TPrepareFile_Form.But_noSendClick(Sender: TObject);
begin
//   if (DataMod.CHECK_Pack.CallIntegerFunction('CheckForFile',[toSend.fieldbyname('id').asinteger,1]) = 0)or
   if (ToSend.RecordCount = 0) then   exit;
    Convert_pack.CallProcedure('ToandNo_send',[toSend.fieldbyname('id').asinteger,0,0]);
    NoSend.Refresh;
    ToSend.Refresh;
    CurrencyEdit1.Value:=Convert_pack.CallFloatFunction('SumofAmount',[]);
    Edit_count.Text:=inttostr(ToSend.RecordCount);
end;

procedure TPrepareFile_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Convert_pack.CallProcedure('ConvertTonoSend',[]);
   NoSend.Close;
   ToSend.Close;
end;

procedure TPrepareFile_Form.All_to_sendClick(Sender: TObject);
begin
   if NoSend.RecordCount = 0 then begin ShowMessage('Testiq olunmus Emeliyyat Bloku yoxdur !');exit;end ;
   Convert_pack.CallProcedure('ToandNo_send',[NoSend.fieldbyname('id').asinteger,1,1]);
   NoSend.Refresh;
   ToSend.Refresh;
   CurrencyEdit1.Value:=Convert_pack.CallFloatFunction('SumofAmount',[]);
   Edit_count.Text:=inttostr(ToSend.RecordCount);
end;

procedure TPrepareFile_Form.All_to_NosendClick(Sender: TObject);
begin
   if ToSend.RecordCount = 0 then exit;
   Convert_pack.CallProcedure('ToandNo_send',[ToSend.fieldbyname('id').asinteger,0,1]);
   NoSend.Refresh;
   ToSend.Refresh;
   CurrencyEdit1.Value:=Convert_pack.CallFloatFunction('SumofAmount',[]);
   Edit_count.Text:=inttostr(ToSend.RecordCount);
end;

procedure TPrepareFile_Form.But_cancelClick(Sender: TObject);
begin
   CreateFileForHOx;
   if Trim(Edit_reference.Text)='' then begin ShowMessage('Qeydiyyat ¹-si verilmeyib !');exit;end;
   Convert_pack.CallProcedure('INS_MT150',['S',
                                           edit_sender.text,
                                           edit_receiver.text,
                                           Edit1.text,
                                           'N',
                                           'N',
                                           'C099',
                                           date,
                                           edit_reference.text]);

   Edit_reference.Clear;
   Edit_count.Text:='0';
   CurrencyEdit1.Text:='0';
   NoSend.Refresh;
   ToSend.Refresh;

   Swift_Form.RefreshDATA;
   ProgressBar1.Position:=100;
   ProgressBar1.Hide;
end;

end.
