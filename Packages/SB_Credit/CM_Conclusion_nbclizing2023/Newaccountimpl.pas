unit Newaccountimpl;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, StdCtrls, Buttons, DBCtrls, DBGrids, CheckLst,  DBLookupEh,
  Evanescence;

type
  TNewaccount = class(TForm)
    XDBGrid1: TXDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Newaccount: TNewaccount;

implementation

uses DataModuleConclusion, ConclusionMainUnitImpl;

{$R *.dfm}

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

with DataModuleConcl.OracleDataSet2  do
begin
  first;
    while not EOF do
    begin
    with ConclusionForm do
    for I := 0 to ComponentCount-1 do
     begin

      if (Components[i].ClassType = TDBLookupComboboxEh) then
      if (Components[i] as TDBLookupComboboxEh).Name= FieldByName('iname').asstring then
      begin
         (components[i] as TDBLookupComboboxEh).ListSource.DataSet.Refresh;
         fild:=FieldByName('FILNAME').asstring;
         (components[i] as TDBLookupComboboxEh).DataSource.DataSet.FieldByName(fild).asinteger:=FieldByName('acc_id').asinteger;
      end;
      end;

     Next;
   end ;
end;

 //   with ConclusionForm do begin
 close;
  //  end;
end;
end;

procedure TNewaccount.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TNewaccount.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

end.
