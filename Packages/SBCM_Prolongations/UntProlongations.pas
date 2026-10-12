unit UntProlongations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, DBCGrids, Grids, DBGrids, ImgList,
  ToolWin, ComCtrls;

type
  TFrmProlongation = class(TForm)
    Panel1: TPanel;
    GroupBoxAboutContract: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    StaticText2: TStaticText;
    GroupBox4: TGroupBox;
    StaticText4: TStaticText;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    ProlongationGrid: TDBGrid;
    GroupBox7: TGroupBox;
    StaticText7: TStaticText;
    DBEdit7: TDBEdit;
    GroupBox6: TGroupBox;
    StaticText6: TStaticText;
    DBEdit6: TDBEdit;
    BtnClose: TButton;
    Panel5: TPanel;
    MainToolBar: TToolBar;
    ImageList: TImageList;
    TBAddProlongation: TToolButton;
    TBDelLastProlongation: TToolButton;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    DTPNewDate: TDateTimePicker;
    GroupBox3: TGroupBox;
    DTPProlongationDate: TDateTimePicker;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TBAddProlongationClick(Sender: TObject);
    procedure TBDelLastProlongationClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    FContractID :LongInt;
    { Public declarations }
  end;

var
  FrmProlongation: TFrmProlongation;

implementation

uses  StoredProgramsUnit,SBCMMainDataModule,  UntProlongationDataModule;

{$R *.DFM}

procedure TFrmProlongation.FormShow(Sender: TObject);
begin
   with  DataModuleProlongation.Prolongations  do
   begin
     if  Active then Close;
     SetVariable('ContractID',FContractID);
     Open;
   end;
   DTPNewDate.DateTime :=GetBankDate;
   DTPProlongationDate.DateTime :=GetBankDate;
end;

procedure TFrmProlongation.FormCreate(Sender: TObject);
begin
   DataModuleProlongation :=TDataModuleProlongation.Create(Self);
   Caption := 'Prolongation for contract ¹ ' + MainDataModule.Contracts.FieldByName('ContractNo').AsString;
end;

procedure TFrmProlongation.TBAddProlongationClick(Sender: TObject);
var
  ProlongationDate ,DelayedDate :TDateTime;
begin
 Screen.Cursor :=crSQLWait;
 try
  ProlongationDate :=Trunc(DTPProlongationDate.DateTime);
  DelayedDate :=Trunc(DTPNewDate.DateTime);
  with   DataModuleProlongation.ProlongationPackage do
    CallProcedure('AddProlongation',[
             FContractID
            ,ProlongationDate
            ,DelayedDate
            ]);
   DataModuleProlongation.Prolongations.Refresh;         
  finally
    Screen.Cursor :=crDefault;
  end;
end;

procedure TFrmProlongation.TBDelLastProlongationClick(Sender: TObject);
begin
  if MessageDlg('Are You Sure You Want '+#13+'Delete Last Prolongation'
                ,mtConfirmation
                ,MBYESNOCANCEL
                ,0
               ) <> mrYes
                   then  Abort;
  Screen.Cursor :=crSQLWait;
  try
    with  DataModuleProlongation.ProlongationPackage do
      CallProcedure('DelLastProlongation',[
                    FContractID
                   ]);
    DataModuleProlongation.Prolongations.Refresh;
   finally
     Screen.Cursor :=crDefault;
   end;
end;

procedure TFrmProlongation.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key =  #27  then
    BtnClose.Click
end;

end.
