unit CO_BookmarkAddEditunt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, NLSLocalizer, ActnList, DBCtrls, Mask, DBCtrlsEh, DBLookupEh;

type
  TCO_BookmarkAddEditForm = class(TForm)
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    NLSLocalizer1: TNLSLocalizer;
    Button1: TButton;
    Button2: TButton;
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CO_BookmarkAddEditForm: TCO_BookmarkAddEditForm;

implementation
uses CO_datamod_impl;

{$R *.DFM}

procedure TCO_BookmarkAddEditForm.ActnAcceptExecute(Sender: TObject);
resourcestring
     BookmarkNameEmptyMsg='Ѕукмаркын ады  даxил eдилм€йиб';
     descriptionNameEmptyMsg='“€йинаты  даxил eдилм€йиб';
   begin

     if  (DBLookupComboboxEh1.Text<>'') and (DBEdit3.Text<>'') then
     begin
       with CO_DataMod.Bookmarks do
            Post;
            ModalResult := mrOk;
     end else
     begin
       if DBLookupComboboxEh1.Text='' then Showmessage('“€йинаты  даxил eдилм€йиб');
       if DBEdit3.Text='' then Showmessage('Ѕукмаркын ады  даxил eдилм€йиб');
       with CO_DataMod.Bookmarks do
            Cancel;
    end;


end;

procedure TCO_BookmarkAddEditForm.ActnRejectExecute(Sender: TObject);
 begin
   with CO_DataMod.Bookmarks do
        Cancel;
        ModalResult := mrCancel;
 end;

end.
