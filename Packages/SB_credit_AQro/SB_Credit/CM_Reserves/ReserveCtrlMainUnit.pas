unit ReserveCtrlMainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, NLSDialogs,
  NLSLocalizer, StdCtrls;

type
  TReserveContMainForm = class(TForm)
    NLSLocalizer1: TNLSLocalizer;
    StartButton: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReserveContMainForm: TReserveContMainForm;

procedure InitPlugin(S : String); export;
  
implementation

uses ReserveContDataModule, CommonDecls, ReserveProgressFormImpl;

{$R *.DFM}

procedure TReserveContMainForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False
end;

procedure TReserveContMainForm.FormCreate(Sender: TObject);
begin
  ReserveContDataMod := TReserveContDataMod.Create(Self);
  ProgressForm := TProgressForm.Create(Self);
end;

procedure InitPlugin(S : String); export;
begin
  ReserveContMainForm.ShowModal;
end;

procedure TReserveContMainForm.StartButtonClick(Sender: TObject);

  procedure CorrectSingleRow(CrdID : Integer; Num : String);
  begin
    with ReserveContDataMod.CM_RESERVE_CONTR do
    try
      CallProcedure('CorrectReserve',[
        'p_CreditID' , CrdID
      ]);
    except
      on  E : EXCEPTION  do
        LogError(Num + ' -- ' + E.Message);
    end;
  end;
  
resourcestring
  CAN_I_DO_IT = 'Йенидян гиймятляндирим?';
  SDone = 'Йенидян гиймятляндирмя битди !'; 

var
  R : Integer;

begin

  if MessageDlg(CAN_I_DO_IT
           , mtConfirmation
           , [mbYes,mbNo]
           , 0) <> mrYes
  then     EXIT;

  with ReserveContDataMod.CreditsInfo do
  begin
    if Active then
      Refresh
    else
      Open;

    R := RecordCount;

    if R <= 0 then    EXIT;

    with ProgressForm.ProgressShower do
    begin
      Position := 0;
      Max := R;
      Step := 1;
    end;
    
    ProgressForm.Show;
    
    ProgressForm.Update;
    Self.Update;
    
    FIRST;

    while not EOF do
    begin
    
      CorrectSingleRow(FieldByName('ID').AsInteger, FieldByName('NUMBEROFCREDIT').AsString);

      ProgressForm.ProgressShower.Position := RecNo + 1;

      NEXT;
      
    end;

    CloseAll;
    
  end;

  ProgressForm.Close;

  ShowMessage(SDone);
end;

exports
  InitPlugin;
  
procedure TReserveContMainForm.FormDestroy(Sender: TObject);
begin
  ReserveContDataMod.Free;
  ProgressForm.Free;
end;

initialization
  ReserveContMainForm := TReserveContMainForm.Create(CommonApplication);

end.
