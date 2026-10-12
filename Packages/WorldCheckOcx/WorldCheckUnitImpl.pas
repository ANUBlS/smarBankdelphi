unit Unit1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, World_Check_TLB;

type
  TWorldCheckOcx = class(TActiveForm)
  private
    { Private declarations }
    FEvents: IWorldCheckOcxEvents;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TWorldCheckOcx }

procedure TWorldCheckOcx.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_WorldCheckOcxPage); }
end;

procedure TWorldCheckOcx.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IWorldCheckOcxEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TWorldCheckOcx.Initialize;
begin
  inherited Initialize;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TWorldCheckOcx,
    Class_WorldCheckOcx,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
