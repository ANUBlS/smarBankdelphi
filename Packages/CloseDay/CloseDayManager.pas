unit CloseDayManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, OracleData, ImgList;


type
  TQueryArray = array of TOracleDataSet;

type
  TFormCloseDay = class(TForm)
    PanelDay: TPanel;
    CheckBox1: TCheckBox;
    PanelBday: TPanel;
    Button1: TButton;
    Button2: TButton;
    SB_CloseDay: TOracleDataSet;
    ImageListDay: TImageList;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    QueryArray: TQueryArray;
    ImageLeft: Integer;
    ControlButton: Boolean;
    procedure Closeday;
  end;

var
  FormCloseDay: TFormCloseDay;

implementation
uses
     sboapiDataModuleImpl, SBTranslateProc, sbCloseDayFormImpl,
  ControlManagerImpl;


{$R *.dfm}

procedure TFormCloseDay.CloseDay;
var
   Img: TImage;
   LabelIndex: Word;
   PluginLabel: TLabel;
   PluginCheckBox: TCheckBox;
begin
 ImageLeft :=0;
 with SB_CloseDay do
 begin

  CloseAll;
  Open;

  if RecordCount = 0 then
   Raise
    Exception.Create('No pending controls !');

  if not Assigned(QueryArray) then
   SetLength(QueryArray, RecordCount);

   for LabelIndex :=1 to RecordCount do
   begin
     Application.ProcessMessages;

     PluginCheckBox :=TCheckBox.Create(ControlManagerForm);
     PluginCheckBox.Parent :=ControlManagerForm;
     PluginCheckBox.Top :=DefTop * LabelIndex - 2;
     PluginCheckBox.Left :=DefLeft - 20;
     PluginCheckBox.Tag :=LabelIndex;
     PluginCheckBox.Width :=13;
     PluginCheckBox.Checked :=True;
     //PluginCheckBox.OnClick :=Click_;
     PluginCheckBox.Name :='PluginCheckBox' + IntToStr(PluginCheckBox.Tag);
     PanelBday.Top :=PluginCheckBox.Top + 25;
     PanelBday.Width :=Panelday.Width;

     PluginLabel :=TLabel.Create(ControlManagerForm);
     PluginLabel.Parent :=ControlManagerForm;
     PluginLabel.Top :=DefTop * LabelIndex;
     PluginLabel.Left :=DefLeft;
     PluginLabel.Tag :=LabelIndex;
     PluginLabel.Name :='PluginLabel' + IntToStr(PluginLabel.Tag);
     PluginLabel.Font.Style :=[fsUnderline];
     PluginLabel.Caption :=IntToStr(PluginLabel.Tag) + '. ' + FieldByName('Description').AsString;
     if PluginLabel.Width > ImageLeft then
      ImageLeft :=PluginLabel.Width;
     PluginLabel.Hint :=FieldByName('Hint').AsString;
     QueryArray[LabelIndex - 1] :=SB_CloseDay.Create(ControlManagerForm);
     QueryArray[LabelIndex - 1].Session :=SB_CloseDay.Session;
     QueryArray[LabelIndex - 1].SQL.Text :=FieldByName('Query').AsString;
     Next;
   end;

 end;
end;


procedure TFormCloseDay.FormShow(Sender: TObject);
begin
  CloseDay;
end;

end.
