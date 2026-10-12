unit ResultUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, ExtCtrls, StdCtrls, Mask, DBCtrlsEh, Buttons, DBCtrls;

type
  TResultForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Panel5: TPanel;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    GroupBox5: TGroupBox;
    SpeedButton1: TSpeedButton;
    Editrests: TEdit;
    EditInterest: TEdit;
    EditDueRests: TEdit;
    EditDueInRest: TEdit;
    EditObligation: TEdit;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResultForm: TResultForm;

implementation

uses PortfelDataModImpl;

{$R *.DFM}

procedure TResultForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TResultForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(KEY) = VK_ESCAPE then Close;
end;

procedure TResultForm.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TResultForm.FormCreate(Sender: TObject);
begin
  //Caption := NLSLocalizer1.Caption;
end;

end.
