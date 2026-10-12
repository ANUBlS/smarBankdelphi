unit P_CO_ST_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TP_CO_ST = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Chck2: TRadioButton;
    Chck1: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  P_CO_ST: TP_CO_ST;

implementation

uses p_CO_Statement_Unit;

{$R *.DFM}

procedure TP_CO_ST.Button1Click(Sender: TObject);
begin
  P_CO_Statement_Form := TP_CO_Statement_Form.Create(self);
  P_CO_Statement_Form.Showmodal;
end;

procedure TP_CO_ST.FormActivate(Sender: TObject);
begin
  Chck1.checked := true;
end;

end.
