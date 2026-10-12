unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, XFSCtrls, CurrencyEdit, CMCurrencyEdit, DBCtrlsEh, ExtCtrls,
  Mask, DBCtrls;

type
  TForm1 = class(TForm)
    XFPanel1: TXFPanel;
    XFGroupBox3: TXFGroupBox;
    DBEdit3: TDBEdit;
    XFPanel2: TXFPanel;
    StaticText1: TStaticText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    StaticText5: TStaticText;
    DBEditEh1: TDBEditEh;
    Panel7: TPanel;
    StaticText6: TStaticText;
    DBEditEh2: TDBEditEh;
    Panel8: TPanel;
    StaticText7: TStaticText;
    EdMainDebit: TCMCurrencyEdit;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    StaticText2: TStaticText;
    DBEditEh3: TDBEditEh;
    Panel5: TPanel;
    StaticText3: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    Panel6: TPanel;
    StaticText4: TStaticText;
    EdIntDebit: TCMCurrencyEdit;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
 