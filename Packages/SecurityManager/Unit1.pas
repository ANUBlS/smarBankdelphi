unit Unit1;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, ComServ, ComObj, StdVcl, AxCtrls, Dialogs;

type
  TPropertyPage1 = class(TPropertyPage)
    procedure PropertyPageCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure UpdatePropertyPage; override;
    procedure UpdateObject; override;
  end;

const
  Class_PropertyPage1: TGUID = '{4C89519B-C290-492B-BCA1-949288D04BA9}';

implementation

{$R *.DFM}

procedure TPropertyPage1.UpdatePropertyPage;
begin
  { Update your controls from OleObject }
end;

procedure TPropertyPage1.UpdateObject;
begin
  { Update OleObject from your controls }
end;

procedure TPropertyPage1.PropertyPageCreate(Sender: TObject);
begin
  ShowMessage('OnCreate');
end;

initialization
  TActiveXPropertyPageFactory.Create(
    ComServer,
    TPropertyPage1,
    Class_PropertyPage1);
end.
 