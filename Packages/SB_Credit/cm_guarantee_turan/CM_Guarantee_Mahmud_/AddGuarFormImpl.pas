unit AddGuarFormImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, Evanescence, Buttons;

type
  TAddGuarForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LookFilGrp: TEvanescence;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddGuarForm: TAddGuarForm;

implementation
 uses DmImpl,CommonDecls, GuaranteImpl;
{$R *.dfm}

procedure TAddGuarForm.FormShow(Sender: TObject);
var
i:integer;
begin
 for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 3112 then begin
      (Components[i] as TEvanescence).Open;
      (Components[i] as TEvanescence).CheckAll;
    end;
end;

procedure TAddGuarForm.SpeedButton1Click(Sender: TObject);
var
i: Integer  ;
begin
   with GurDm,LookFilGrp do
   begin
     for i:= 0 to Items.Count-1 do
       begin
            if Checked[i] then
            //   showmessage(Items[i]);
             Guarante.CallProcedure('Upd_girov', [Items[i],Get_SelectedCrdID ]);
       end;
        GurOracleData.Refresh;

        RefreshList;
  LogInformation('Girov -'+Get_SelectedCrdNo+'- Nömrəli kreditlə əlaqələndirildi' );
end;
close;
FrmGuarante.close;
end;

procedure TAddGuarForm.SpeedButton2Click(Sender: TObject);
begin
close
end;

end.
