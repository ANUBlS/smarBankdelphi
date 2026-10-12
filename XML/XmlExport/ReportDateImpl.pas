unit ReportDateImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TReportDateForm = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    CBDay: TComboBox;
    CBMonth: TComboBox;
    CBYear: TComboBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FReportDate : TDate;
  end;

var
  ReportDateForm: TReportDateForm;

implementation

{$R *.dfm}

procedure TReportDateForm.FormCreate(Sender: TObject);
var
  Day , Month , Year : Word;
begin
  DecodeDate(Now,Year,Month,Day);
  
  CBYear.ItemIndex := CBYear.Items.IndexOf(IntToStr(Year));

  CBMonth.ItemIndex := Month - 1;
  
  CBDay.ItemIndex := Day - 1;
  
end;

procedure TReportDateForm.btnOKClick(Sender: TObject);
var
  Day , Month , Year : Word;
begin
  Day := StrToInt(CBDay.Text);
  Month := CBMonth.ItemIndex + 1;
  Year := StrToInt(CBYear.Text);
  FReportDate := EncodeDate(Year,Month,Day);
  ModalResult := mrOk;
end;

procedure TReportDateForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    ModalResult := mrCancel
end;

end.
