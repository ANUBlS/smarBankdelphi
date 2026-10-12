unit InsSettings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, DBViewComboBox, Mask, DBCtrls, ExtCtrls, DB,
  Grids, DBGrids;

const
    caPost = mrOk;
    caCancel = mrCancel;

type
  TfmSettings = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Splitter1: TSplitter;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid5: TDBGrid;
    DBNavigator5: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    DBNavigator7: TDBNavigator;
    DBGrid7: TDBGrid;
    DBNavigator4: TDBNavigator;
    DBGrid4: TDBGrid;
    DBNavigator6: TDBNavigator;
    DBGrid6: TDBGrid;
    DBNavigator8: TDBNavigator;
    DBGrid8: TDBGrid;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox5: TGroupBox;
    GridPSettings: TDBGrid;
    DBNavigator9: TDBNavigator;
    Panel4: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    Panel5: TPanel;
    DBGrid9: TDBGrid;
    Panel6: TPanel;
    CheckBox2: TCheckBox;
    TabSheet4: TTabSheet;
    GroupBox6: TGroupBox;
    DBGrid10: TDBGrid;
    DBNavigator10: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet3Show(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveAndCloseDataset(sender : TDataSet; cAction : Integer);
  end;

var
  fmSettings: TfmSettings;

implementation

uses InsDataModule;

{$R *.DFM}

procedure TfmSettings.SaveAndCloseDataset(sender : TDataSet; cAction : Integer);
begin
   if (sender.State = dsEdit) then
    case cAction of
     caPost : sender.Post;
     caCancel : sender.Cancel;
    end; 
   Sender.Close;
end;


procedure TfmSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);

  procedure CloseLinkedTables(CName : TWinControl; cAction : Integer);
  var i : Integer;
  begin
    with CName do
      for i := 0 to ControlCount -1 do begin
        if (Controls[i] is TCustomControl) then
          CloseLinkedTables(Controls[i] as TCustomControl, cAction);

        if (Controls[i] is TDBgrid) then
         if (Controls[i] as TDBgrid).tag = 0 then
          SaveAndCloseDataset((Controls[i] as TDBgrid).DataSource.DataSet, cAction);

    end
  end;

begin
  with InsDataMod do begin
    CloseLinkedTables(TabSheet1, ModalResult);
    CloseLinkedTables(TabSheet2, ModalResult);
    CloseLinkedTables(TabSheet3, ModalResult);
  end;

end;

procedure TfmSettings.TabSheet3Show(Sender: TObject);
begin
 with InsDataMod do
  CheckBox1.Checked := OPCOMMON.CallIntegerFunction('disablepolicies', []);
end;

procedure TfmSettings.CheckBox1Click(Sender: TObject);
begin
 with InsDataMod do
  OPCOMMON.CallIntegerFunction('disablepolicies', [Integer(CheckBox1.Checked)]);
end;

procedure TfmSettings.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
  CheckBox1Click(Sender);
end;

procedure TfmSettings.CheckBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckBox1Click(Sender);
end;

procedure TfmSettings.CheckBox2Click(Sender: TObject);
begin
  with InsDataMod do
    ODSInsurances.Filtered := CheckBox2.Checked;
end;

end.
