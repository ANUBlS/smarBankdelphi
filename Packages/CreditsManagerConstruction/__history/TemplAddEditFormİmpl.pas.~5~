unit TemplAddEditFormİmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Mask, DBCtrls, Buttons;

type
  TTempAddEditForm = class(TForm)
    SBOpenDlg: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Button2: TButton;
    DBEdit3: TDBEdit;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    Button3: TButton;
    procedure SBOpenDlgClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TempAddEditForm: TTempAddEditForm;

implementation

  uses DatModConstructionImpl, BookMarkAddEditFormImpl, BookMarkSetupFormImpl;

{$R *.dfm}

procedure TTempAddEditForm.Button2Click(Sender: TObject);
begin
    with DatModConstruction.Templates do
          Cancel;
          ModalResult := mrCancel;
end;

procedure TTempAddEditForm.Button3Click(Sender: TObject);
begin
DBEdit3.Text:='0' ;
      if (DBEdit1.Text<>'') and (DBEdit2.Text<>'')  then
      begin
        with DatModConstruction.Templates do
             Post;
             ModalResult := mrOk;
             Refresh;
      end  else
      begin
        if DBEdit1.Text='' then  ShowMessage('Şablonun adı daxil edilməyib');
        if DBEdit2.Text='' then  ShowMessage('Şablon faylı daxil edilməyib');
        with DatModConstruction.Templates do
             Cancel;
      end;

end;

procedure TTempAddEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DatModConstruction.Templates.Close;
DatModConstruction.Templates.Open;
end;

procedure TTempAddEditForm.SBOpenDlgClick(Sender: TObject);
begin
if BookMarkSetupForm.OpenDlg.Execute then
   DatModConstruction.Templates.FieldByName('Path').AsString :=BookMarkSetupForm.OpenDlg.FileName;
end;

end.
