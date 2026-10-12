unit Unit_description;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls;

type
  TForm_description = class(TForm)
    XFPanel1: TXFPanel;
    Memo1: TMemo;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_description: TForm_description;

implementation

uses UnitDataModPCustService;

{$R *.dfm}

procedure TForm_description.XFButton1Click(Sender: TObject);
var
 v_custid:integer;
 v_id_quality:integer;
 v_description:string;
begin

 v_description:=Memo1.Text;
 v_custid:=DataModPCustService.ODS_CUSTOMERS_PHYS_FSid.AsInteger;
 v_id_quality:=DataModPCustService.ods_custID_quality.FieldByName('id').AsInteger;

DataModPCustService.PG_PCustService.CallProcedure('upd_custid_quality_descriptin',
     [v_custid,v_id_quality,v_description ]);
     Form_description.Close
end;

procedure TForm_description.XFButton2Click(Sender: TObject);
begin
Form_description.Close
end;

end.
