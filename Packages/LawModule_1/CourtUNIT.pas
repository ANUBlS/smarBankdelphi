unit CourtUNIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask, DB, OracleData;

type
  TCourtFrm = class(TForm)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBRichEdit1: TDBRichEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBRichEdit2: TDBRichEdit;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    Maincrpt_one: TOracleDataSet;
    Maincrpt_oneID: TFloatField;
    Maincrpt_oneCOURT_AMMOUNT: TWideStringField;
    Maincrpt_oneCOURT_STATUS: TWideStringField;
    Maincrpt_oneCOURT_DATE_NUM: TWideStringField;
    Maincrpt_oneCOURT_NAME: TWideStringField;
    Maincrpt_oneCOURT_ACCEPTED_AMMOUNT: TWideStringField;
    Maincrpt_oneCOURT_DESC: TWideStringField;
    Maincrpt_oneCOURT_MANAGE: TWideStringField;
    Maincrpt_oneCOURT_LASTSTAT: TWideStringField;
    Maincrpt_oneCOURT_MEASURE: TWideStringField;
    Maincrpt_oneCOURT_REPLACE: TWideStringField;
    Maincrpt_oneREPLACEMENT_COUNT: TWideStringField;
    Maincrpt_oneINVESTIGATION_ORG: TWideStringField;
    Maincrpt_oneINFOS: TWideStringField;
    Maincrpt_onePROPERTY: TWideStringField;
    Maincrpt_onePROP_DESC: TWideStringField;
    Maincrpt_onePROP_ADDRESS: TWideStringField;
    Maincrpt_onePORP_PASSPORT: TWideStringField;
    Maincrpt_onePROP_PRICE: TWideStringField;
    Maincrpt_onePROP_INFO: TWideMemoField;
    Data_main_one: TDataSource;
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CourtFrm: TCourtFrm;

implementation



{$R *.dfm}

procedure TCourtFrm.Button1Click(Sender: TObject);
begin
                      {
Maincrpt_one.Insert;
Maincrpt_one.FieldByName('id').AsFloat:=  maincrprt.FieldByName('prtid').AsFloat;    }
end;

procedure TCourtFrm.Button2Click(Sender: TObject);
begin
Data_main_one.Edit;
end;

procedure TCourtFrm.Button3Click(Sender: TObject);
begin
close;
end;

procedure TCourtFrm.Button4Click(Sender: TObject);
begin
     Maincrpt_one.Edit;
  //   Maincrpt_one.FieldByName('id').AsFloat:=  maincrprt.FieldByName('prtid').AsFloat;
     Maincrpt_one.FieldByName('COURT_AMMOUNT').AsString:=DBEdit1.Text;
     Maincrpt_one.FieldByName('COURT_STATUS').AsString:=            DBEdit2.Text;
     Maincrpt_one.FieldByName('COURT_LASTSTAT').AsString:=         DBEdit3.Text;
     Maincrpt_one.FieldByName('COURT_NAME').AsString:= DBEdit4.Text;
     Maincrpt_one.FieldByName('COURT_DATE_NUM').AsString:=DBEdit5.Text;
     Maincrpt_one.FieldByName('COURT_MEASURE').AsString:=DBmemo1.Text;
     Maincrpt_one.FieldByName('COURT_REPLACE').AsString:=DBEdit7.Text;
     Maincrpt_one.FieldByName('REPLACEMENT_COUNT').AsString:=DBEdit8.Text;
     Maincrpt_one.FieldByName('INVESTIGATION_ORG').AsString:= DBEdit9.Text;
     Maincrpt_one.FieldByName('COURT_DESC').AsString:=DBRichEdit1.Text;
     Maincrpt_one.FieldByName('INFOS').AsString:= DBRichEdit2.Text;
     Maincrpt_one.FieldByName('COURT_MANAGE').AsString:= DBedit6.Text;
     Maincrpt_one.FieldByName('court_accepted_ammount').AsString:= DBEdit10.Text;
     Maincrpt_one.Post;
end;

procedure TCourtFrm.FormShow(Sender: TObject);
begin
Maincrpt_one.Close;
Maincrpt_one.SetVariable('prts',2);
Maincrpt_one.Open;

end;

end.
