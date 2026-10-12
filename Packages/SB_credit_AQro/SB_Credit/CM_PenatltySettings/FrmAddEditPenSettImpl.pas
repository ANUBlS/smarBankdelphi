unit FrmAddEditPenSettImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DBCtrls;

type
  TFrmAddEditPenSett = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    CBBranch: TDBLookupComboBox;
    CBACCounts: TDBLookupComboboxEh;
    Button1: TButton;
    Button2: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddEditPenSett: TFrmAddEditPenSett;

implementation

{$R *.DFM}

uses DMPenaltySettImpl;

procedure TFrmAddEditPenSett.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False
end;

procedure TFrmAddEditPenSett.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE Then close;
end;

procedure TFrmAddEditPenSett.Button1Click(Sender: TObject);
begin
   with DMPenaltySett,PenaltySettings do
        Post;
    Close    
end;

procedure TFrmAddEditPenSett.Button2Click(Sender: TObject);
begin
   with DMPenaltySett,PenaltySettings do
        Cancel;
         Close;
end;

procedure TFrmAddEditPenSett.FormShow(Sender: TObject);
begin
 {   with DMPenaltySett do
    begin
         with Branches do
             CBBranch.KeyField := FieldByName('ID').AsInteger;

          with Accounts do
             CBACCounts.KeyField := FieldByName('ID').ASInteger;   
    end; }

end;

end.
