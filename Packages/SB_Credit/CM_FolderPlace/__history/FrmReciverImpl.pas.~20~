unit FrmReciverImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls, Buttons, Menus,
  ExtCtrls;

type
  TFrmReciver = class(TForm)
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    stiqet1: TMenuItem;
    mtinaet1: TMenuItem;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure stiqet1Click(Sender: TObject);
    procedure mtinaet1Click(Sender: TObject);
  private
   function ExcuseMeUser(Question : String) : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReciver: TFrmReciver;

implementation

{$R *.dfm}
 uses
 FlReCalculationDataModuleImpl,  ReCalculationMainForm, MehtemeImpl, ImtinaImpl;
procedure TFrmReciver.BitBtn2Click(Sender: TObject);
begin
close
end;
 function TFrmReciver.ExcuseMeUser(Question : String) : Boolean;
begin
  Result :=
    MessageDlg(
      Question
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrYes;
end;
procedure TFrmReciver.mtinaet1Click(Sender: TObject);

begin
   if not Assigned(ImtinaFrm) then
    ImtinaFrm := TImtinaFrm.Create(Self);
    ImtinaFrm.showmodal;
end;

procedure TFrmReciver.stiqet1Click(Sender: TObject);
resourcestring
  rsConfirmForOne = '%s  - № li kredit dosyesi %s. Əminsiniz?';
  rsConfirmForAll = '%d - sayda kredit dosyesi %s. Əminsiniz?';
  rsCalcPercent   = 'təsdiq olunacaq';
  rsAlreadyCalced = '%s - № li kredit üçün hələ hesablanmayıb və ya  təstiq olunub !';
  rsProgressCaption = '                        Faizlər təstiq olunur . gözləyin.   .....';


var
  I : Integer;
  SelectedRowsCnt : Integer;
  CrdID : Integer;
  CrdNo : String;
  CrdStatus : Integer;
  count :integer;

begin
    mehid:=0;

  with DBGridEh1, DataSource.DataSet do
  begin
  if FieldByName('RECIVERIID').AsInteger=4 then
  begin
      MhFrm.showmodal;
      if mehid=0 then
       begin
         ShowMessage('Məhkəməni seçməmisiz!');
         exit;
       end;
    end;

    SelectedRowsCnt := SelectedRows.Count;

    if SelectedRowsCnt > 1 then
    begin

      if not
        ExcuseMeUser(
              Format(rsConfirmForAll,[SelectedRowsCnt,rsCalcPercent])
              ) then  Exit;


      Self.Update;
      for I := 0 to SelectedRowsCnt - 1 do
      begin

        GotoBookmark(Pointer(SelectedRows[I]));

        CrdID := FieldByName('ID').AsInteger;
         with PRDataModule.CalculatorPackage do

    CallProcedure('post_folder',[
    'p_id', CrdID,
    'p_creditid',FieldByName('creditid').AsInteger ,
    'p_qovidreciver',FieldByName('reciveriid').AsInteger  ,
    'p_mehid',mehid

    ]);

       { if CrdStatus in [0,1] then
          AcceptCalcedIntForOne(CrdID, CrdNo)
        else
          LogWarning(Format(rsAlreadyCalced,[CrdNo]));
        }
     //   NewProgressForm.ProgressShower.Position := I + 1;
      end;

    end else
    begin
          CrdNo := FieldByName('NumberOfCredit').AsString;
          if not
         ExcuseMeUser(Format(rsConfirmForOne,[CrdNo,rsCalcPercent]))
         then
              Exit;
      CrdID := FieldByName('ID').AsInteger;
   //   CrdStatus := FieldByName('TrProcessed').AsInteger;
         with PRDataModule.CalculatorPackage do

    CallProcedure('post_folder',[
    'p_id', CrdID,
    'p_creditid',FieldByName('creditid').AsInteger ,
    'p_qovidreciver',FieldByName('reciveriid').AsInteger ,
    'p_mehid',mehid
    ]);


   {   if CrdStatus in [0,1] then
        AcceptCalcedIntForOne(CrdID, CrdNo)
      else
        LogWarning(Format(rsAlreadyCalced,[CrdNo]));
        }
    end;

   end;
   DBGridEh1.DataSource.DataSet.Refresh;
    PRMainForm.CalcGrid.DataSource.DataSet.Refresh;
   close;
  end;
end.
