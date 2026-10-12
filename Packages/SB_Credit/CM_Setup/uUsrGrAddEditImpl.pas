unit uUsrGrAddEditImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,Dialogs,
   ComCtrls, StdCtrls, Mask, DBCtrlsEh,DB, Buttons, DBGridEh, DBLookupEh, DBCtrls;

type
  TUsrGrAddEditForm = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEditEh1: TDBEditEh;
    Label2: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditEh2: TDBEditEh;
    DBEdit1: TDBEdit;
    DBEditEh3: TDBEditEh;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsrGrAddEditForm: TUsrGrAddEditForm;

implementation

uses CommonDecls, uUsrGrCatImpl, uUsrGroupDMImpl;

{$R *.DFM}

procedure TUsrGrAddEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
    ModalResult := mrCancel
end;

procedure TUsrGrAddEditForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;


procedure TUsrGrAddEditForm.SpeedButton1Click(Sender: TObject);
var
id :integer;
begin
   with UsrGrDataMod, UserGroupsDataSet do
   begin
     Post;
 if edit_insert=true then
  begin
    Refresh;
    Last;
    end;
 if edit_insert=false then
     begin
     id:=UsrGrDataMod.UserGroupsDataSetID.AsInteger;
     Locate('ID',ID,[]);
     end;

       end;

 Close;
end;

procedure TUsrGrAddEditForm.SpeedButton2Click(Sender: TObject);
begin
  with UsrGrDataMod, UserGroupsDataSet do
   begin
     Cancel;
     Refresh;
   end;
Close;
end;

end.
