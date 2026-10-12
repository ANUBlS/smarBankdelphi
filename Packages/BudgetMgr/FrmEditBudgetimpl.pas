unit FrmEditBudgetimpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Grids, DBGridEh, Mask, DBCtrlsEh, NLSLocalizer,
  ExtCtrls, DBCtrls, DBGridEhGrouping, GridsEh;

type
  TFrmeditBudget = class(TForm)
    Button2: TButton;
    Panel1: TPanel;
    combobox: TComboBox;
    EditName: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmeditBudget: TFrmeditBudget;

implementation

uses Dmbudgetimpl,sboapiDataModuleImpl,SBTranslateProc ;
{$R *.DFM}

procedure TFrmeditBudget.FormCreate(Sender: TObject);
begin
combobox.itemindex:=0;
 SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFrmeditBudget.SpeedButton1Click(Sender: TObject);
begin
with DMBudget do begin

     case combobox.ItemIndex of
        0:status :=0;
        1:status :=1;
     end;

       AddArt.post;
       ArticlesDST.Refresh;
       AddArt.RefreshRecord;
       AddArt.edit;
      
    end;

end;

procedure TFrmeditBudget.Button2Click(Sender: TObject);
begin
close
end;

procedure TFrmeditBudget.FormShow(Sender: TObject);
begin
combobox.ItemIndex:=DMBudget.AddArt.FieldByName('status').asinteger
end;

end.
