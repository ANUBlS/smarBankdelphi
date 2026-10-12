unit UnitProc_type;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls;

type
  TFormBussProc_type = class(TForm)
    XFPanel1: TXFPanel;
    XFRadioGroup1: TXFRadioGroup;
    procedure XFRadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBussProc_type: TFormBussProc_type;

implementation

uses UnitDataBussProc;

{$R *.dfm}

procedure TFormBussProc_type.XFRadioGroup1Click(Sender: TObject);
begin
   case XFRadioGroup1.ItemIndex of
    0:begin
       with DataModule_bussProc.ODS_BussProc do
       begin
       close;
        SetVariable('custtype',' in 1');
       open;
        end
             end;
   1:begin
      with DataModule_bussProc.ODS_BussProc do
       begin
       close;
        SetVariable('custtype',' in 2');
       open;
    end;

   end;
      end;
end;

end.
