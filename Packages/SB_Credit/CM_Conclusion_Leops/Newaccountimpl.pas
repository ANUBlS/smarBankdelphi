unit Newaccountimpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, StdCtrls, Buttons, DBCtrls, DBGrids, CheckLst,  DBLookupEh,
  Evanescence;

type
  TNewaccount = class(TForm)
    BitBtn1: TBitBtn;
    XDBGrid1: TXDBGrid;
    BitBtn2: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Newaccount: TNewaccount;

implementation

{$R *.dfm}
uses DataModuleConclusion,ConclusionMainUnitImpl;
procedure TNewaccount.BitBtn1Click(Sender: TObject);
resourcestring
   rscracc ='Seçilmiş hesablar yaradılacaq Əminsiniz ?';
  var i :integer;
  fild :string;
begin
  if MessageDlg(
            rscracc,
            mtConfirmation ,
            [mbYes,mbNo],
            0
  ) = mrYes then
  begin
   DataModuleConcl.OracleDataSet1.post;
    with DataModuleConcl,OracleDataSet2 do begin
    IUPackage.CallProcedure('open_accno',[]);
   if Active then
       close;
        SetVariable('custid',Customer.FieldByName('ID').Asinteger);
      Open;
    end;


    with DataModuleConcl,ods_newaccount  do
     begin
     close;
     SetVariable('custid',Customer.FieldByName('ID').Asinteger);
     open;
     end;

 //   with ConclusionForm do begin
 close;
  //  end;
end;
  end;

procedure TNewaccount.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TNewaccount.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;


end.
