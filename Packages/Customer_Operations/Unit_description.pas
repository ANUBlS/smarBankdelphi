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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_description: TForm_description;

implementation
uses CO_datamod_impl;
{$R *.dfm}

procedure TForm_description.FormShow(Sender: TObject);
begin
Memo1.Text:=CO_DataMod.Ods_cust_id_quality1DESCRIPTION.AsString;
end;

procedure TForm_description.XFButton1Click(Sender: TObject);
var
 v_custid:integer;
 v_id_quality:integer;
 v_description:string;
 id:integer;
begin
  //showmessage(inttostr(CO_DataMod.ods_custID_quality.FieldByName('id').AsInteger));

 v_description:=Memo1.Text;
 v_custid:=CO_DataMod.CustomersID.AsInteger;
 v_id_quality:=CO_DataMod.ods_custID_quality.FieldByName('id').AsInteger;

  CO_DataMod.ods_custID_quality.refresh;

CO_DataMod.SBOP.CallProcedure('upd_custid_quality_descriptin',
     ['v_custid',v_custid,
      'v_idquality' ,v_id_quality,
      'v_description',v_description ]);
 // id:= CO_DataMod.customers.FieldByName('quality_id').AsInteger ;

 CO_DataMod.ods_custID_quality.Locate('id',v_id_quality, []);
     Form_description.Close
end;

procedure TForm_description.XFButton2Click(Sender: TObject);
begin
Form_description.Close
end;

end.
