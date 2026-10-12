unit Uninfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Gauges, ExtCtrls;

type
  Tfrminfo = class(TForm)
    lbtext: TLabel;
    Timer1: TTimer;
    gcprog: TGauge;
    Bevel1: TBevel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 frminfo : Tfrminfo;

implementation

{$R *.DFM}

procedure Tfrminfo.Timer1Timer(Sender: TObject);
 var X:Variant;
begin
 with gcprog do
 begin
      Progress:=Progress+2;
   if Progress=MaxValue Then
   Begin
     MaxValue:=0;
     x:=Forecolor;
     ForeColor:=BackColor;
     BackColor:=X;
     MaxValue:=100;
   End;{if end}
 end;{with end}
 refresh;
end;

procedure Tfrminfo.FormShow(Sender: TObject);
begin
//    Timer1.Enabled:=true;
    gcprog.MaxValue:=100;
end;

end.
