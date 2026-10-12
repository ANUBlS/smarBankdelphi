unit SBBookmarkAddEditunt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NLSLocalizer, ActnList, DBCtrlsEh, DBLookupEh, StdCtrls, Mask, DBCtrls;

type
  TSBBookmarkAddEditForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ActionList1: TActionList;
    ActnAccept: TAction;
    ActnReject: TAction;
    NLSLocalizer1: TNLSLocalizer;
    procedure ActnAcceptExecute(Sender: TObject);
    procedure ActnRejectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SBBookmarkAddEditForm: TSBBookmarkAddEditForm;

implementation

uses SBWRSetupDataModImpl,SBWRBookmarksTuning;

{$R *.DFM}

procedure TSBBookmarkAddEditForm.ActnAcceptExecute(Sender: TObject);
resourcestring
     BookmarkNameEmptyMsg='Ѕукмаркын ады  даxил eдилм€йиб';
     descriptionNameEmptyMsg='“€йинаты  даxил eдилм€йиб';
   begin

     if  (DBLookupComboboxEh1.Text<>'') and (DBEdit3.Text<>'') then
     begin
       with SBWRSetupDataMod.SBWRBookmarksDSet do
            Post;
            ModalResult := mrOk;
     end else
     begin
       if DBLookupComboboxEh1.Text='' then Showmessage('“€йинаты  даxил eдилм€йиб');
       if DBEdit3.Text='' then Showmessage('Ѕукмаркын ады  даxил eдилм€йиб');
       with SBWRSetupDataMod.SBWRBookmarksDSet do
            Cancel;
    end;

   end;

procedure TSBBookmarkAddEditForm.ActnRejectExecute(Sender: TObject);
begin
 with SBWRSetupDataMod.SBWRBookmarksDSet do
        Cancel;
    ModalResult := mrCancel;

end;

procedure TSBBookmarkAddEditForm.FormCreate(Sender: TObject);
begin
  with  SBWRSetupDataMod do
     begin
       SBWRBookmarksDSet.Open;
       SBWRFieldsDSet.Open;
     end;
end;

procedure TSBBookmarkAddEditForm.FormCanResize(Sender: TObject;
  var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TSBBookmarkAddEditForm.FormDestroy(Sender: TObject);
begin
 with  SBWRSetupDataMod do
       begin
         SBWRBookmarksDSet.CloseAll;
         SBWRFieldsDSet.CloseAll;
       end;
end;

procedure TSBBookmarkAddEditForm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin

     if ORD(Key) = VK_ESCAPE then
     ActnRejectExecute(nil);
end;

end.
