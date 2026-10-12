unit OrderPropertyPage;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, ComServ, ComObj, StdVcl, AxCtrls;

type
  TPropertyPage1 = class(TPropertyPage)
    Label1: TLabel;
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
  Class_PropertyPage1: TGUID = '{3455079B-AB6A-4F58-AA50-01C2B1845398}';

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

initialization
  TActiveXPropertyPageFactory.Create(
    ComServer,
    TPropertyPage1,
    Class_PropertyPage1);
end.
