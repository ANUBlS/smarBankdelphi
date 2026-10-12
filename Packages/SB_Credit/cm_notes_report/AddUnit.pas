unit AddUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Oracle;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    OraclePackage1: TOraclePackage;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   v_ststus :integer;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
    uses MainUnit;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
OraclePackage1.CallProcedure
                           ('Addcm_notes_report',
                           ['v_creditid',creditid,
                            'v_par1' , memo1.Text,
                            'v_status',0]);
       mainform.OracleDataSet1.refresh;
        memo1.Clear;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 memo1.Clear;

end;

end.
