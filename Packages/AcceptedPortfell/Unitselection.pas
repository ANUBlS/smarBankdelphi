unit Unitselection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls;

type
  TSelectionUnit = class(TForm)
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectionUnit: TSelectionUnit;

implementation

uses Accepted_portfel_TLB, mainUnit, PaymentreportUnit;

{$R *.dfm}

procedure TSelectionUnit.RadioGroup1Click(Sender: TObject);
begin
if RadioGroup1.ItemIndex=1 then
begin




Payreport:=TPayreport.create(self);
  Payreport.ShowModal;
  SelectionUnit.Close;


end;
if RadioGroup1.ItemIndex=0 then
begin
try


  Payreport:=TPayreport.create(self);
Screen.Cursor := crSQLWait;
  Payreport.Button3Click(self);
  SelectionUnit.Close;
  finally
    Screen.Cursor := crDefault;
      Payreport.Close;
    SelectionUnit.Close;
end;

end;



if RadioGroup1.ItemIndex=2 then
begin
try


  Payreport:=TPayreport.create(self);
Screen.Cursor := crSQLWait;
  Payreport.Button4Click(self);
  SelectionUnit.Close;
  finally
    Screen.Cursor := crDefault;
      Payreport.Close;
    SelectionUnit.Close;
end;

end;



if RadioGroup1.ItemIndex=3 then
begin
try


  Payreport:=TPayreport.create(self);
Screen.Cursor := crSQLWait;
  Payreport.Button5Click(self);
  SelectionUnit.Close;
  finally
    Screen.Cursor := crDefault;
      Payreport.Close;
    SelectionUnit.Close;
end;

end;

end;

end.
