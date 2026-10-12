unit UnitRate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
    ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls;

type
  TFormRate = class(TForm)
    PanelMain: TPanel;
    DBGridRate: TDBGrid;
    BtnOk: TBitBtn;
    Panel2: TPanel;
    DTP_Rate_Date: TDateTimePicker;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure  SetExchangeRate;
  procedure  SetExchangeRemainder(v_exno:integer);
  procedure InsertExchangeRate;
  end;

var
  FormRate: TFormRate;

implementation

{$R *.DFM}
           uses UnitDateExch,sboapiDataModuleImpl, SBTranslateProc,Unit_ExchangeMGR;


procedure TFormRate.InsertExchangeRate;
var i:integer;
    dat:TDateTime;
begin
  try
    Screen.Cursor:=crSQLWait;
      with DataModExch do
      begin
        if ODSExchRate.RecordCount>0 then
        begin
          ODSExchRatearchive.Close;
          ODSExchRatearchive.SetVariable('dat',Integer(Trunc(DTP_Rate_Date.Date)));
          ODSExchRatearchive.Open;
          ODSExchRateDelete.Close;
          ODSExchRateDelete.SetVariable('dat',Integer(Trunc(DTP_Rate_Date.Date)));
          ODSExchRateDelete.Open;
          ODSExchRateDelete.Session.Commit;
        end;
        ODSRateInsert.First;
        for i:=1 to ODSRateInsert.RecordCount do
        begin
          ODSExchRate.Insert;
          ODSExchRate.FieldByName('val_id').AsInteger:=ODSRateInsert.FieldByName('val_id').AsInteger;
          ODSExchRate.FieldByName('val_name').AsString:=ODSRateInsert.FieldByName('val_name').AsString;
          ODSExchRate.FieldByName('val_full_name').AsString:=ODSRateInsert.FieldByName('val_full_name').AsString;
          ODSExchRate.FieldByName('val_purchase_course').AsFloat:=ODSRateInsert.FieldByName('val_purchase_course').AsFloat;
          ODSExchRate.FieldByName('val_selling_course').AsFloat:=ODSRateInsert.FieldByName('val_selling_course').AsFloat;
          ODSExchRate.FieldByName('val_nb_course').AsFloat:=ODSRateInsert.FieldByName('val_nb_course').AsFloat;
          ODSExchRate.FieldByName('dat').AsDateTime:=Integer(Trunc(DTP_Rate_Date.Date));
          ODSExchRate.FieldByName('Tim').AsDateTime:=ODSRateInsert.FieldByName('TIM').AsDateTime;
          ODSExchRate.Post;
          ODSRateInsert.Next;
        end;
        ODSExchRate.Refresh;
      end;
   finally
     Screen.Cursor:=crDefault;
  end;
end;

procedure TFormRate.BtnOkClick(Sender: TObject);
var
    exid,i:integer;
    dat:TDateTime;
begin
 try
   Screen.Cursor:=crSQLWait;
      with DataModExch do
      begin
        ODSExRemainderInsert.First;
        for i:=1 to ODSExRemainderInsert.RecordCount do
        begin
          ODSExRemainder.Insert;
          ODSExRemainder.FieldByName('val_id').AsInteger:=ODSExRemainderInsert.FieldByName('val_kod').AsInteger;
          ODSExRemainder.FieldByName('ex_id').AsInteger:=ODSExRemainderInsert.FieldByName('ex_id').AsInteger;
          ODSExRemainder.FieldByName('dat').AsDateTime:=Integer(Trunc(DTP_Rate_Date.Date));
          ODSExRemainder.FieldByName('ftpe_ostat').AsFloat:=ODSExRemainderInsert.FieldByName('ftpe_ostat').AsFloat;
          ODSExRemainder.FieldByName('pefr_ostat').AsFloat:=ODSExRemainderInsert.FieldByName('pefr_ostat').AsFloat;
          ODSExRemainder.FieldByName('first_ostat').AsFloat:=ODSExRemainderInsert.FieldByName('first_ostat').AsFloat;
          ODSExRemainder.FieldByName('current_ostat').AsFloat:=ODSExRemainderInsert.FieldByName('current_ostat').AsFloat;
          ODSExRemainder.FieldByName('purchase_turn').AsFloat:=ODSExRemainderInsert.FieldByName('purchase_turn').AsFloat;
          ODSExRemainder.FieldByName('selling_turn').AsFloat:=ODSExRemainderInsert.FieldByName('selling_turn').AsFloat;
          ODSExRemainder.FieldByName('Tim').AsDateTime:=ODSExRemainderInsert.FieldByName('TIM').AsDateTime;
          ODSExRemainder.Post;
          ODSExRemainderInsert.Next;
        end;
        ODSExRemainder.Refresh;
        ODSExchRateOther.Refresh;
      end;
     finally
       Screen.Cursor:=crDefault;
     end;
end;

procedure TFormRate.FormActivate(Sender: TObject);
begin
 SetExchangeRate;
end;

procedure TFormRate.SetExchangeRate;
var dat    :TDateTime;
    FTime  :TDateTime;
    sysdate:TDateTime;
begin
  DTP_Rate_Date.Date:=Date;
  DTP_Rate_Date.Time:=Time;
  FTime:=DTP_Rate_Date.DateTime;
  dat:=Integer(Trunc(DTP_Rate_Date.DateTime));
  sysdate:=Integer(Trunc(DataModExch.SBOPDate.CallDateFunction('get_date',[])));
  with DataModExch.ODSRateInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select operkurs.val_kod val_id,(select val_name from avalute where valute=operkurs.val_kod)  val_name,'
                    +'(select valu_name from avalute where valute=operkurs.val_kod) val_full_name,'
                    +'operkurs.buy_rate  val_purchase_course, operkurs.sell_rate val_selling_course,operkurs.ostat val_nb_course,'
                    +':dat as dat,'
                    +':Tim as Tim'
                    +' from operkurs where operkurs.val_kod<>0 and dat=:dat');
      SetVariable('dat',Dat);
      SetVariable('Tim',FTime);
      Open;
    end;
  end;

procedure  TFormRate.SetExchangeRemainder(v_exno:integer);
var dat    :TDateTime;
    FTime  :TDateTime;
    sysdate:TDateTime;
begin
  DTP_Rate_Date.Date:=Date;
  DTP_Rate_Date.Time:=Time;
  FTime:=DTP_Rate_Date.DateTime;
  dat:=Integer(Trunc(DTP_Rate_Date.DateTime));
  sysdate:=Integer(Trunc(DataModExch.SBOPDate.CallDateFunction('get_date',[])));

  if  sysdate=dat then
  begin
    with DataModExch.ODSExRemainderInsert do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT   t.val_kod,'
            +'(SELECT   NVL (SUM (ammount), 0) FROM provdoc'
            +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
            +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)) ftpe_ostat,'
            +'NVL((SELECT  SUM(ammount) FROM provdoc'
            +' WHERE kredit = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
            +' AND   debt = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)),0) pefr_ostat,'
            +'abs(tp.ostat) first_ostat,'
            +'0 purchase_turn,'
            +'0 selling_turn,'
            +'(NVL (ABS (l.ostat), 0)'
            +'-(SELECT NVL (SUM (ammount), 0) FROM provdoc'
            +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
            +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod))'
            +'+ (SELECT   NVL (SUM (ammount), 0) FROM provdoc'
            +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
            +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod))) current_ostat,'
            +':ex_id as ex_id,'
            +':dat AS dat,'
            +':tim AS tim'
            +' FROM temprate t,tenostat l,tempost tp WHERE  l.acc_id=(SELECT selling_acc_id from ex_accounts WHERE ex_id=:ex_id AND val_id=t.val_kod)'
            +'AND l.acc_id=tp.acc_id '
            +'AND t.val_kod <> 0'
            +'  UNION  '
            +'SELECT   t.val_kod,'
            +'(SELECT   NVL (SUM (ammount), 0)FROM provdoc'
            +' WHERE debt = (SELECT MAX (purchase_acc_id) FROM ex_accounts WHERE ex_id=:ex_id)'
            +' AND   kredit=(SELECT MAX (cash_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id)) ftpe_ostat,'
            +'NVL((SELECT  SUM(ammount) FROM provdoc'
            +' WHERE kredit = (select purchase_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
            +' AND  debt = (SELECT  MAX (cash_acc_id) from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)),0) pefr_ostat,'
            +'abs(tp.ostat) first_ostat,'
            +'0 purchase_turn,'
            +'0 selling_turn,'
            +'(NVL (ABS (l.ostat), 0)'
            +'- (SELECT   NVL (SUM (ammount), 0)FROM provdoc'
            +' WHERE   debt = (SELECT MAX (purchase_acc_id) FROM ex_accounts WHERE ex_id=:ex_id)'
            +' AND     kredit=(SELECT MAX (cash_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id))'
            +'+ (SELECT   NVL (SUM (ammount), 0)FROM provdoc'
            +' WHERE debt = (SELECT MAX (cash_acc_id ) FROM ex_accounts WHERE ex_id=:ex_id)'
            +' AND   kredit=(SELECT MAX (purchase_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id))) current_ostat,'
            +':ex_id as ex_id,'
            +':dat AS dat,'
            +':tim AS tim'
            +' FROM temprate t,tenostat l,tempost tp WHERE  l.acc_id=(select max(purchase_acc_id) from ex_accounts where ex_id=:ex_id)'
            +'AND l.acc_id=tp.acc_id '
            +'AND t.val_kod =0 ORDER BY  val_kod'
            );
            // ExchangeMGR_X.Memo1.Text:=sql.Text;
            SetVariable('dat',Dat);
            SetVariable('Tim',FTime);
            Open;
    end;
  end;
  if sysdate<dat then
    begin
      with DataModExch.ODSExRemainderInsert do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT   t.val_kod,'
                +'(SELECT   NVL (SUM (ammount), 0) FROM lazytransaction'
                +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   dat = :dat) ftpe_ostat,'
                +'NVL((SELECT  SUM(ammount) FROM lazytransaction'
                +' WHERE kredit = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   debt = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND dat = :dat),0) pefr_ostat,'
                +'( NVL (ABS (l.ostat), 0)'
                +'-(SELECT   NVL (SUM (ammount), 0) FROM  lazytransaction'
                +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND dat = :dat)'
                +'+ (SELECT NVL(SUM(ammount),0)from lazytransaction '
                +' WHERE debt = (select pur_acc_id  from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND kredit = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND dat = :dat)) first_ostat,'
                +'0 purchase_turn,'
                +'0 selling_turn,'
                +'(NVL (ABS (l.ostat), 0)'
                +'-(SELECT NVL (SUM (ammount), 0) FROM lazytransaction'
                +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   dat = :dat)'
                +'+ (SELECT   NVL (SUM (ammount), 0) FROM lazytransaction'
                +' WHERE debt = (select selling_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   kredit = (select pur_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND   dat = :dat)) current_ostat,'
                +':ex_id as ex_id,'
                +':dat AS dat,'
                +':tim AS tim'
                +' FROM temprate t,lazyrest l WHERE  l.acc_id=(SELECT selling_acc_id from ex_accounts WHERE ex_id=:ex_id AND val_id=t.val_kod)'
                +'AND t.val_kod <> 0'
                +'  UNION  '
                +'SELECT   t.val_kod,'
                +'(SELECT   NVL (SUM (ammount), 0)FROM lazytransaction'
                +' WHERE debt = (SELECT MAX (purchase_acc_id) FROM ex_accounts WHERE ex_id=:ex_id)'
                +' AND   kredit=(SELECT MAX (cash_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id)'
                +' AND   dat = :dat) ftpe_ostat,'
                +'NVL((SELECT  SUM(ammount) FROM lazytransaction'
                +' WHERE kredit = (select purchase_acc_id from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND  debt = (SELECT  MAX (cash_acc_id) from ex_accounts where ex_id=:ex_id and val_id=t.val_kod)'
                +' AND dat = :dat),0) pefr_ostat,'
                +'( NVL (ABS (l.ostat), 0)'
                +'-(SELECT   NVL (SUM (ammount), 0) FROM  lazytransaction'
                +' WHERE debt =(select max(purchase_acc_id) from ex_accounts where ex_id=:ex_id)'
                +' AND kredit =(select max(cash_acc_id) from ex_accounts where ex_id=:ex_id)'
                +' AND dat = :dat)'
                +'+(select NVL (SUM (ammount), 0) from lazytransaction'
                +' WHERE debt =(select max(cash_acc_id) from ex_accounts where ex_id=:ex_id)'
                +' AND kredit =(select max(purchase_acc_id) from ex_accounts where ex_id=:ex_id)'
                +' AND dat = :dat) )first_ostat,'
                +'0 purchase_turn,'
                +'0 selling_turn,'
                +'(NVL (ABS (l.ostat), 0)'
                +'- (SELECT   NVL (SUM (ammount), 0)FROM lazytransaction'
                +' WHERE   debt = (SELECT MAX (purchase_acc_id) FROM ex_accounts WHERE ex_id=:ex_id)'
                +' AND     kredit=(SELECT MAX (cash_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id)'
                +' AND     dat = :dat)'
                +'+ (SELECT   NVL (SUM (ammount), 0)FROM lazytransaction'
                +' WHERE debt = (SELECT MAX (cash_acc_id ) FROM ex_accounts WHERE ex_id=:ex_id)'
                +' AND   kredit=(SELECT MAX (purchase_acc_id) FROM   ex_accounts WHERE  ex_id=:ex_id)'
                +' AND   dat = :dat)) current_ostat,'
                +':ex_id as ex_id,'
                +':dat AS dat,'
                +':tim AS tim'
                +' FROM temprate t,lazyrest l WHERE  l.acc_id=(select max(purchase_acc_id) from ex_accounts where ex_id=:ex_id)'
                +'AND t.val_kod =0 ORDER BY  val_kod'
               );

             // ExchangeMGR_X.Memo1.Text:=sql.Text;
         SetVariable('dat',Dat);
         SetVariable('Tim',FTime);
         Open;
      end;
    end

end;

procedure TFormRate.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
