unit Unittrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormtrid = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Label1: TLabel;
    edit_name: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edit_acc: TEdit;
    Label3: TLabel;
    edit_swft: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Formtrid: TFormtrid;
  in_out:integer;
implementation

uses TransactionPropertiesImpl, TransactionDataModuleUnit;

{$R *.dfm}

procedure TFormtrid.Button1Click(Sender: TObject);

begin
    TransactionDataModule.OP_MMX.CallProcedure('up_mmx_transfers',[ TransactionDataModule.TransactionsID.AsInteger,
                                                                   in_out,
                                                                   edit_acc.Text,
                                                                   edit_name.Text,
                                                                   edit_swft.Text
                                                                    ]);

   Formtrid.Close;
end;


procedure TFormtrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit_acc.Clear ;
edit_name.Clear;
edit_swft.Clear ;
end;

procedure TFormtrid.FormShow(Sender: TObject);

begin
if  TransactionEditForm.DBLC_MMX_Transmode.KeyValue='1002' then
    begin
    in_out:=2;
    Formtrid.Caption:='Alan tərəf'
    end
  else
  begin
    in_out:=1;
    Formtrid.Caption:='Göndərən tərəf'
  end;
end;

end.
