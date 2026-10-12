unit BookMarkAddEditFormImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, DBCtrls, Mask, DBCtrlsEh, DBLookupEh, dblookup;

type
  TBookMarkAddEditForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEdit3: TDBEdit;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    Button3: TButton;
    Button1: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookMarkAddEditForm: TBookMarkAddEditForm;

implementation

uses  DatModConstructionImpl;

{$R *.dfm}

procedure TBookMarkAddEditForm.Button1Click(Sender: TObject);
begin
 with DatModConstruction.Bookmarks do
begin
        Cancel;
        ModalResult := mrCancel;
end;
end;

procedure TBookMarkAddEditForm.Button3Click(Sender: TObject);
resourcestring
     BookmarkNameEmptyMsg='Ѕукмаркын ады  даxил eдилм€йиб';
     descriptionNameEmptyMsg='“€йинаты  даxил eдилм€йиб';
   begin

     if  (DBLookupComboboxEh1.Text<>'') and (DBEdit3.Text<>'') then
     begin
       with DatModConstruction.Bookmarks do
            Post;
            ModalResult := mrOk;
     end else
     begin
       if DBLookupComboboxEh1.Text='' then Showmessage('“€йинаты  даxил eдилм€йиб');
       if DBEdit3.Text='' then Showmessage('Ѕукмаркын ады  даxил eдилм€йиб');
       with DatModConstruction.Bookmarks do
            Cancel;
    end;
end;

end.
