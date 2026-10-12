unit Azipsnew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unitdatamod, StdCtrls, SearchEdit, ComCtrls, DBCtrls;

type
  TAzipsn = class(TForm)
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    amount: TEdit;
    SearchEdit1: TDBLookupComboBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo2: TMemo;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    OF70_RichEdit: TRichEdit;
    OF72_RichEdit: TRichEdit;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    referens: TEdit;
    mf23b: TEdit;
    val: TEdit;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Edit5: TEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    reciverbic: TSearchEdit;
    SearchCombo2: TComboBox;
    Button2: TButton;
    Button3: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Azipsn: TAzipsn;

implementation

{$R *.dfm}

end.
