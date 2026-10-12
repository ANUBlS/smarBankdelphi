unit UProceses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, Buttons;

type
  TfmProceses = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    XFGroupBox1: TXFGroupBox;
    cbPolNum: TXFCheckBox;
    cbAccounts: TXFCheckBox;
    cbTransactions: TXFCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        CID : Integer;
    StrIntend,StrIntend1,str:String;
  end;

var
  fmProceses: TfmProceses;

implementation

uses ComObj,CommanParametrs,DMMKPolicyImpl,sboapiDataModuleImpl,SBTranslateProc;

{$R *.dfm}




procedure TfmProceses.BitBtn1Click(Sender: TObject);
begin
 { if cbTransactions.Checked=true then
  begin
   if cbAccounts.Enabled=true  and cbAccounts.Checked=false then
     showmessage('Diqqət! Bu müqvilə ücun hesablar açılmayıb, Əməliyyat keçmədi!');
     exit;

  end; }


    with DMMKPolicy, ODSReport, OPMKKASCO do begin
      ODSReport.SetVariable('CID', CID);
      Open;
    //showmessage(inttostr(CID));
    //exit;
     //try
        CallBooleanFunction('buildpolice', [CID,
                                            cbPolNum.Checked,
                                            cbAccounts.Checked,
                                            cbTransactions.Checked]);
      //except
       //// on E : EOracleError do begin
        //   ShowMessage(E.Message);
        //  Abort;
       // end;
      //end;
      MessageDlg('Əməliyyat keçirildi.', mtInformation, [mbOK], 0);
      Close;
    end;
    ModalResult := mrOk
end;

procedure TfmProceses.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TfmProceses.FormCreate(Sender: TObject);
begin

 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfmProceses.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=vk_escape then close;

end;

procedure TfmProceses.FormShow(Sender: TObject);

var
  i1,i2 :integer;
begin
cid:=contactid;
i2:=0;
i1:=0;
      with DMMKPolicy, OPCOMMON do begin

        i1:=CallIntegerFunction('get_polis_num',[CID]);
        if i1=1 then
        begin
        cbPolNum.Enabled:=false;
        //ENum.Enabled:=false;
         end;

         i2:=CallIntegerFunction('get_acc_id',[CID]);
        if i2=1 then
        begin
        //showmessage(inttostr(CID));
        //showmessage(inttostr(i2));
          cbAccounts.Enabled:=false;
        end;
     end;
     if cbAccounts.Enabled=True then

       cbTransactions.Enabled:=false
       else
       cbTransactions.Enabled:=true;
     //end;
end;




end.
