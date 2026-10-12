unit ExpUnitImpl;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, Buttons,
  CMCurrencyEdit, SearchEdit,CurrencyToHR_Azeri_Impl,CMHintBox,
  DBCtrlsEh, ToolWin, ImgList, Grids, DBGrids,DB;

type
  TExpFormDestination = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);


  private
     function GetValue: String;
    { Private declarations }
  public
     property Value: String read GetValue;
    { Public declarations }
  end;


var
   ExpFormDestination: TExpFormDestination;

implementation

uses ExpressManagerImpl,ExpDataModuleUnit,LDialogs, ExpCustomersTypeUnit,
 sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

function TExpFormDestination.GetValue: String;
begin
  Result := ExpDataModule.Expdescription.FieldByName('description').AsString;
end;

procedure TExpFormDestination.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TExpFormDestination.DBGrid1DblClick(Sender: TObject);
begin
  if not (DBGrid1.DataSource.State in [dsInsert, dsEdit]) then
  ModalResult :=mrOk;
end;

procedure TExpFormDestination.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Ord(Key) = VK_RETURN then
  ModalResult :=mrOk
  else
  if Key = VK_ESCAPE then
  Close;
end;

end.


