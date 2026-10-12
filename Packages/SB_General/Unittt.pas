unit Unittt;

interface

uses
  SysUtils, Classes,Forms;

type
  TDat = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dat: TDat;
  dd:integer;
implementation

uses Unitcc, Unit2;

{$R *.dfm}

 procedure InitPlugin(s:string;custid :string;accid:string='0' );export;
begin

   if s='smsunit' then   begin
      dd:=1;
   end;
end;


   exports
     InitPlugin;



procedure TDat.DataModuleCreate(Sender: TObject);
begin
Form1:=tForm1.Create(self);
Form2:=tForm2.Create(self);
end;

initialization
 dat := Tdat.Create(Application);;



end.
