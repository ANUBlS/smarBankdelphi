unit InfarmatoinImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TFrmInfarmatoin = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RG: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInfarmatoin: TFrmInfarmatoin;

implementation
 uses InterestsCalcUnit, IntCalcDataModImpl,CommonDecls  ;
{$R *.DFM}


procedure LoadPlugin(PluginName :String;PluginParam :String);
var PluginHandle :THandle;
    exportproc : procedure(s:String);
begin
   PluginHandle := LoadPackage(ExtractFilePath(Application.ExeName)+PluginName);
    
   if PluginHandle > 0 then
   begin
      @exportproc := GetProcAddress(PluginHandle,'InitPlugin');
      exportproc(PluginParam);
   end;  end;

procedure TFrmInfarmatoin.BitBtn1Click(Sender: TObject);
begin
 if rg.ItemIndex = 0 then
 begin
  DefineCalcDatMod.CM_CREDITS.CallProcedure('EnabledInterestCalc',[Get_SelectedCrdID]);
  LoadPlugin('CM_IntPlaceOB.bpl','');

  end;
  if rg.ItemIndex = 1 then
  begin
  DefineCalcDatMod.CM_CREDITS.CallProcedure('EnabledInterestCalc',[Get_SelectedCrdID,1]);
 // showmessage('sdsdsd') ;
  end;
  close;
end;

procedure TFrmInfarmatoin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

procedure TFrmInfarmatoin.BitBtn2Click(Sender: TObject);
begin
close
end;

end.
