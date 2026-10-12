unit Creditİmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, XFSCtrls, DBGridEhGrouping,
  GridsEh;

type
  TCreditFrm = class(TForm)
    MainGrid: TDBGridEh;
    XFPanel1: TXFPanel;
    TimerButton: TXFButton;
    XFButton2: TXFButton;
    XFButton1: TXFButton;
    XFButton5: TXFButton;
    XFButton3: TXFButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure TimerButtonClick(Sender: TObject);
    procedure XFButton4Click(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton5Click(Sender: TObject);
    procedure MainGridDblClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditFrm: TCreditFrm;

implementation

{$R *.dfm}
 uses UnitDataBussProc,cuCommonDecls,SBTranslateProc, sboapiDataModuleImpl;


procedure TCreditFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure LoadPlugin(PluginName :String;PluginParam :String);
var PluginHandle :THandle;
    exportproc : procedure(s:String);
begin
   PluginHandle := LoadPackage(ExtractFilePath(Application.ExeName)+PluginName);

   if PluginHandle > 0 then
   begin
      @exportproc := GetProcAddress(PluginHandle,'InitPlugin');
      exportproc(PluginParam);
   end;
end;

procedure TCreditFrm.FormCreate(Sender: TObject);
begin
    CommonApplication := Application;
    cuCommonDBGrid := MainGrid;
    CommonScreen := Screen;
    SBTranslateProc.TranslateAllCompForms(Self, sboapiDataModule.OrPack_SL);
end;

procedure TCreditFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
if ord(key)=27 then
close;
end;



procedure TCreditFrm.MainGridDblClick(Sender: TObject);
begin
LoadPlugin('CU_Conclusion.bpl','look')
end;

procedure TCreditFrm.TimerButtonClick(Sender: TObject);
begin
 LoadPlugin('CU_Statement.bpl','');
end;

procedure TCreditFrm.XFButton1Click(Sender: TObject);
begin
LoadPlugin('CU_Conclusion.bpl','look')
end;

procedure TCreditFrm.XFButton2Click(Sender: TObject);
begin
 LoadPlugin('CU_Schedule.bpl','Payment');
end;

procedure TCreditFrm.XFButton3Click(Sender: TObject);
begin

 LoadPlugin('CU_Payment.bpl','');

end;

procedure TCreditFrm.XFButton4Click(Sender: TObject);
begin
LoadPlugin('CM_Conclusion.bpl','Insert')
end;

procedure TCreditFrm.XFButton5Click(Sender: TObject);
begin
 LoadPlugin('CU_WReport.bpl','AGREE');
end;

end.
