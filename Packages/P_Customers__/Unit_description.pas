unit Unit_description;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls;

type
  TForm_description = class(TForm)
    XFPanel1: TXFPanel;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    Memo1: TMemo;
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

uses P_Datamod_Unit;

{$R *.dfm}

procedure TForm_description.XFButton1Click(Sender: TObject);
var
 v_custid:integer;
 v_id_quality:integer;
 v_description:string;
 id:integer;
begin
  //showmessage(inttostr(CO_DataMod.ods_custID_quality.FieldByName('id').AsInteger));

 v_description:=Memo1.Text;
 v_custid:=p_DataModule.p_CustomersID.AsInteger;
 v_id_quality:=p_DataModule.ods_custID_quality.FieldByName('id').AsInteger;

  p_DataModule.ods_custID_quality.refresh;

p_DataModule.phys_fs_customers.CallProcedure('upd_custid_quality_descriptin',
     [v_custid,
      v_id_quality,
      v_description ]);
 // id:= CO_DataMod.customers.FieldByName('quality_id').AsInteger ;

 p_DataModule.ods_custID_quality.Locate('id',v_id_quality, []);
     Form_description.Close

end;

procedure TForm_description.XFButton2Click(Sender: TObject);
begin
Form_description.Close
end;

end.
