unit ReceiveMessDetals_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, SearchEdit, ComCtrls;

type
  TRecMessDet_Form = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel14: TPanel;
    DBEdit10: TDBEdit;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    Panel22: TPanel;
    Panel19: TPanel;
    DBEdit17: TDBEdit;
    Panel21: TPanel;
    DBEdit18: TDBEdit;
    Panel20: TPanel;
    DBEdit16: TDBEdit;
    DBRichEdit1: TDBRichEdit;
    Panel12: TPanel;
    DBRichEdit2: TDBRichEdit;
    Panel16: TPanel;
    DBEdit2: TDBEdit;
    Panel23: TPanel;
    DBEdit6: TDBEdit;
    Panel24: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    DBEdit5: TDBEdit;
    Panel18: TPanel;
    Panel10: TPanel;
    DBEdit7: TDBEdit;
    Panel17: TPanel;
    Panel26: TPanel;
    Panel4: TPanel;
    SearchEdit1: TSearchEdit;
    Panel28: TPanel;
    SearchEdit2: TSearchEdit;
    Panel11: TPanel;
    Panel6: TPanel;
    DBEdit4: TDBEdit;
    Panel15: TPanel;
    DBEdit14: TDBEdit;
    Panel1: TPanel;
    Panel13: TPanel;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecMessDet_Form: TRecMessDet_Form;

implementation
 uses data_unit;
{$R *.DFM}

procedure TRecMessDet_Form.FormShow(Sender: TObject);
begin
  SearchEdit1.Clear;
  SearchEdit2.Clear;
  DBEdit3.Clear;
  DBEdit8.Clear;
  SearchEdit1.SetFocus;
end;

procedure TRecMessDet_Form.Button2Click(Sender: TObject);
begin
   close;
end;

procedure TRecMessDet_Form.Button1Click(Sender: TObject);
begin
if (trim(SearchEdit1.Text)='')or(SearchEdit2.Color=clred) then exit;
case MessageDlg('Emeliyyat #'+DataMod.HoxMessages_IN_view.fieldbyname('id').AsString+' deyisdirilsinmi ?', mtConfirmation,[mbyes,mbno], 0) of
     mryes :begin DataMod.INS.CallProcedure('UPD_HOXMESSAGE_IN',[DataMod.HoxMessages_IN_view.fieldbyname('id').asinteger,
                                               DataMod.Account_data.fieldbyname('id').asinteger,
                                               DataMod.Account_data.fieldbyname('acc_no').asstring
                                                 ]);
            DataMod.Ins.callprocedure('UPD_MESSAGE_IN_ICON',[DataMod.HoxMessages_IN_view.fieldbyname('ID').ASinteger,0]);

            DataMod.HoxMessages_IN_view.Refresh;
            close;
            end;
     mrno :Exit;
end;
end;

end.
