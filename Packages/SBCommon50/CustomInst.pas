unit CustomInst;

interface

uses Classes, SBAxCommon50_TLB, Dialogs;

type
  TCustomInstance = class(TComponent, IInstance)
  private
    FActive: Boolean;
    FBeforeOpen: TNotifyEvent;
    FAfterOpen: TNotifyEvent;
    FBeforeClose: TNotifyEvent;
    FAfterClose: TNotifyEvent;
    FOpening: Boolean;
    FClosing: Boolean;
    procedure CallEventHandler(EventHandler: TNotifyEvent);
    procedure SetActive(Value: Boolean);
  protected
    function  Get_Active: WordBool; safecall;
    procedure Set_Active(Value: WordBool); safecall;
    procedure DoOpen; dynamic; abstract;
    procedure DoClose; dynamic; abstract;
  public
    procedure Open; safecall;
    procedure Close; safecall;
    property Opening: Boolean read FOpening;
    property Closing: Boolean read FClosing;
  published
    property Active: Boolean read FActive write SetActive;
    property BeforeOpen: TNotifyEvent read FBeforeOpen write FBeforeOpen;
    property AfterOpen: TNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforeClose: TNotifyEvent read FBeforeClose write FBeforeClose;
    property AfterClose: TNotifyEvent read FAfterClose write FAfterClose;
  end;

  {The only difference from TCustomInstance is that
   TSubCustomInstance has no abstract methods}
  TSubCustomInstance = class(TCustomInstance)
  protected
    procedure DoOpen; override;
    procedure DoClose; override;
  end;

implementation

procedure TCustomInstance.Open;
begin
  if not Active then
  begin
    FOpening := True;
    try
      CallEventHandler(FBeforeOpen);
      DoOpen;
      FActive := True;
    finally
      FOpening := False;
    end;
    CallEventHandler(FAfterOpen);
  end;
end;

procedure TCustomInstance.Close;
begin

  if Active then
  begin
    FClosing := True;
    try
      CallEventHandler(FBeforeClose);

      //DoClose;    Closed by Hesen R. 26.07.2010
      FActive := False;
    finally
      CallEventHandler(FAfterClose);
    end;
  end;
end;

procedure TCustomInstance.CallEventHandler(EventHandler: TNotifyEvent);
begin
  if Assigned(@EventHandler) then
    EventHandler(Self);
end;

function  TCustomInstance.Get_Active: WordBool;
begin
  Result := Active;
end;

procedure TCustomInstance.Set_Active(Value: WordBool);
begin
  Active := Value;
end;

procedure TCustomInstance.SetActive(Value: Boolean);
begin
  if Value then
    Open
  else
    Close;
end;

  {TSubCustomInstance}

procedure TSubCustomInstance.DoOpen;
begin
end;

procedure TSubCustomInstance.DoClose;
begin
end;

end.
