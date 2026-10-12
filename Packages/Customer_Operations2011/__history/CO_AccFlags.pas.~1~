unit CO_AccFlags;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  TOperationMode = (omInsert, omEdit, omDelete);

const
     cs_add_account = 'add_account';
     cs_upd_account = 'upd_account';
     cs_close_account = 'close_account';
     cs_generateID = 'GenerateID';
     cs_flagexsist = 'FlagExsist';
type
  TAccFlags = class(TForm)
    CLBAccFlags: TCheckListBox;
    ButtonApply: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonApplyClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    function FlagExsist(AccID : Integer;Ch : Char):Boolean;
  public
    { Public declarations }
        FlagMap: String;

  end;

var
  AccFlags: TAccFlags;

implementation

uses CO_datamod_impl;

{$R *.DFM}

function TAccFlags.FlagExsist(AccID : Integer;Ch : Char):Boolean;
begin
   with CO_DataMod.SBUTIL do
    Result :=
     CallBooleanFunction(cs_flagexsist,[
       'AccID', AccID ,
       'FlagChar', ch
     ]);
end;

procedure TAccFlags.FormCreate(Sender: TObject);

var
   Index: Word;
begin
 with CO_Datamod do
 begin
  AccFlags.Refresh;
  AccFlags.First;
  AccFlags.Next;

  while not AccFlags.Eof do
 begin
  Index :=CLBAccFlags.Items.Add(AccFlags.FieldByName('Name').AsString);
//   if AccFlags.OperationMode = omEdit then
    CLBAccFlags.Checked[Index] :=FlagExsist(FlagAccount.FieldByName('ID').AsInteger, AccFlags.FieldByName('Symbol').AsString[1]);
   AccFlags.Next;
  end;

 end;
end;

procedure TAccFlags.ButtonApplyClick(Sender: TObject);

var
   Index, IndexCount: Word;
   Symbol: String;
begin
  FlagMap :='';
  IndexCount :=CLBAccFlags.Items.Count;
  for Index :=0 to IndexCount -1 do
   if CLBAccFlags.Checked[Index] then
   begin
    Symbol :=CLBAccFlags.Items[index];
    FlagMap :=FlagMap + ',' + Symbol[1];
   end;
  Delete(FlagMap, 1, 1);
end;



procedure TAccFlags.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
   ModalResult := mrCancel;
end;

end.
