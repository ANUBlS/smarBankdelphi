unit ActivitiesFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrlsEh, NLSLocalizer;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Localizer: TNLSLocalizer;
    DBEditEh1: TDBEditEh;
    Button1: TButton;
    Button2: TButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses uUsrGroupDMImpl;

{$R *.DFM}

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize := False;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   with UsrGrDataMod, DataSetActivities do
   begin
     Post;
     Refresh;
   end;
 Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
close
end;

end.
