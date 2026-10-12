unit XForm;  

{
  =========
  XForm 1.0 beta 3 (1999-09-09) for Delphi 4
  =========

  TXForm is TForm descendant with several useful enhacenments  - docking and
  moving and showing related events.

  XFormExpert register this form and all of its new properties to IDE so you
  can create new form in File|New and edit properties in Object Inspector.
  Or simply add XForm to uses clause and redefine your form class like
  TMyForm = class(TXForm).

  Many thanks to GExperts' Code Librarian.

  Freeware.

  Copyright © Roman Stedronsky 1999, Roman.Stedronsky@seznam.cz

  All rights reserved. You may use this software in an application
  without fee or royalty, provided this copyright notice remains intact.

  properties:

    property Docking: boolean;			dock window to screen/form edge
    property DockType: TDockType;		where to dock (desktop & owner form)
    property DockBorder: integer;		docking sensitivity
    property Desktop: TRect			working area withou TaskBar

  events:

    property OnMoving: TOnMovingEvent;		before move
    property OnMove: TOnMoveEvent;		after move
    property OnDock: TOnDockEvent;		after dock
    property OnMinimize: TOnMinimizeEvent;	after minimize
    property OnMaximize: TOnMaximizeEvent;	after maximize
    property OnRestore: TOnRestoreEvent;	after restore

  methods:

    procedure UpdateDesktop;			updates desktop edges
    						use when screen size changed
}

interface

uses Forms, Windows, Messages, Classes;

type
  TWMMoving = record
    Msg: Cardinal;
    Side: Longint;
    Coord: PRect;
    Unused: longint;
  end;

  TMovingSide = (msLeft, msRight, msTop, msTopLeft, msTopRight, msBottom, msBottomLeft, msBottomRight);
  TDockTo = (dtDesktopTop, dtDesktopBottom, dtDesktopLeft, dtDesktopRight,
    dtOwnerTop, dtOwnerBottom, dtOwnerLeft, dtOwnerRight);
  TDockType = set of TDockTo;

  TOnMovingEvent = procedure(Side: TMovingSide; Coord: TRect) of object;
  TOnMoveEvent = procedure of object;
  TOnDockEvent = procedure(DockTo: TDockType) of object;
  TOnMinimizeEvent = procedure of object;
  TOnMaximizeEvent = procedure of object;
  TOnRestoreEvent = procedure of object;

  TXForm = class(TForm)
  private
    FDocked: boolean;
    FDockBorder: integer;
    FDockType: TDockType;
    FOnMoving: TOnMovingEvent;
    FOnMove: TOnMoveEvent;
    FOnDock: TOnDockEvent;
    FOnMaximize: TOnMaximizeEvent;
    FOnMinimize: TOnMinimizeEvent;
    FOnRestore: TOnRestoreEvent;
    FDockedTo: TDockType;
  protected
    FDesktop: TRect;
    procedure WMMoving(var Message: TWMMoving); message WM_MOVING;
    procedure WMMove(var Message: TWMMove); message WM_MOVE;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  public
    constructor Create(AOwner: TComponent); override;
    procedure UpdateDesktop;
    property Desktop: TRect read FDesktop;
  published
    property Docking: boolean read FDocked write FDocked default true;
    property DockType: TDockType read FDockType write FDockType default [dtDesktopTop..dtOwnerTop, dtOwnerLeft];
    property DockBorder: integer read FDockBorder write FDockBorder default 20;
    property OnMoving: TOnMovingEvent read FOnMoving write FOnMoving;
    property OnMove: TOnMoveEvent read FOnMove write FOnMove;
    property OnDock: TOnDockEvent read FOnDock write FOnDock;
    property OnMinimize: TOnMinimizeEvent read FOnMinimize write FOnMinimize;
    property OnMaximize: TOnMaximizeEvent read FOnMaximize write FOnMaximize;
    property OnRestore: TOnRestoreEvent read FOnRestore write FOnRestore;
  end;

implementation

uses
  DsgnIntf;

constructor TXForm.Create(AOwner: TComponent);
begin
  FDocked := true;
  FDockBorder := 20;
  FDockType := [dtDesktopTop..dtOwnerTop, dtOwnerLeft];
  inherited Create(AOwner);
  UpdateDesktop;
end;

procedure TXForm.UpdateDesktop;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @FDesktop, 0);
end;

procedure TXForm.WMMoving(var Message: TWMMoving);
var
  OrigWidth, OrigHeight: integer;
begin
  inherited;
  if Docking and (WindowState = wsNormal) and Visible then
    with Message do
    begin
      FDockedTo := [];
      OrigWidth := Width;
      OrigHeight := Height;
      if Coord.Top < Top then
      begin
      // desktop docking
        if (dtDesktopTop in DockType) and (Coord.Top < (FDesktop.Top + DockBorder)) then
        begin
          Coord.Top := FDesktop.Top;
          FDockedTo := FDockedTo + [dtDesktopTop];
        end;
      // owner top docking
        if (dtOwnerTop in DockType) and (Owner <> nil) and
          (Abs(Coord.Top - TForm(Owner).Top - TForm(Owner).Height) < DockBorder) and
          (Abs(Coord.Left - TForm(Owner).Left) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top + TForm(Owner).Height;
          Coord.Left := TForm(Owner).Left;
          FDockedTo := FDockedTo + [dtOwnerTop];
        end;
      // owner left docking
        if (dtOwnerLeft in DockType) and (Owner <> nil) and
          (Abs(Coord.Left - TForm(Owner).Left - TForm(Owner).Width) < DockBorder) and
          (Abs(Coord.Top - TForm(Owner).Top) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top;
          Coord.Left := TForm(Owner).Left + TForm(Owner).Width;
          FDockedTo := FDockedTo + [dtOwnerLeft];
        end;
      end
      else
      begin
      // desktop bottom docking
        if (dtDesktopBottom in DockType) and (Coord.Bottom > (FDesktop.Bottom - DockBorder)) then
        begin
          Coord.Top := FDesktop.Bottom - Height;
          FDockedTo := FDockedTo + [dtDesktopBottom];
        end;
      // owner bottom docking
        if (dtOwnerBottom in DockType) and (Owner <> nil) and
          (Abs(Coord.Top + Height - TForm(Owner).Top) < DockBorder) and
          (Abs(Coord.Left - TForm(Owner).Left) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top - Height;
          Coord.Left := TForm(Owner).Left;
          FDockedTo := FDockedTo + [dtOwnerBottom];
        end;
      end;
      if Coord.Left < Left then
      begin
      // desktop docking
        if (dtDesktopLeft in DockType) and (Coord.Left < (FDesktop.Left + DockBorder)) then
        begin
          Coord.Left := FDesktop.Left;
          FDockedTo := FDockedTo + [dtDesktopLeft];
        end;
      // owner top docking
        if (dtOwnerTop in DockType) and (Owner <> nil) and
          (Abs(Coord.Left - TForm(Owner).Left) < DockBorder) and
          (Abs(Coord.Top - TForm(Owner).Top - TForm(Owner).Height) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top + TForm(Owner).Height;
          Coord.Left := TForm(Owner).Left;
          FDockedTo := FDockedTo + [dtOwnerTop];
        end;
      // owner left docking
        if (dtOwnerLeft in DockType) and (Owner <> nil) and
          (Abs(Coord.Left - TForm(Owner).Left - TForm(Owner).Width) < DockBorder) and
          (Abs(Coord.Top - TForm(Owner).Top) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top;
          Coord.Left := TForm(Owner).Left + TForm(Owner).Width;
          FDockedTo := FDockedTo + [dtOwnerLeft];
        end;
      end
      else
      begin
      // dekstop top docking
        if (dtDesktopRight in DockType) and (Coord.Right > (FDesktop.Right - DockBorder)) then
        begin
          Coord.Left := FDesktop.Right - Width;
          FDockedTo := FDockedTo + [dtDesktopRight];
        end;
      // owner right docking
        if (dtOwnerRight in DockType) and (Owner <> nil) and
          (Abs(Coord.Top - TForm(Owner).Top) < DockBorder) and
          (Abs(Coord.Right - TForm(Owner).Left) < DockBorder) then
        begin
          Coord.Top := TForm(Owner).Top;
          Coord.Left := TForm(Owner).Left - Width;
          FDockedTo := FDockedTo + [dtOwnerRight];
        end;
      end;
      Coord.Right := Coord.Left + OrigWidth;
      Coord.Bottom := Coord.Top + OrigHeight;
    end;
  if Assigned(FOnMoving) then
    FOnMoving(TMovingSide(Message.Side - WMSZ_LEFT), Message.Coord^);
end;

procedure TXForm.WMSysCommand(var Message: TWMSysCommand);
begin
  inherited;
  case Message.CMDType and $FFF0 of
    SC_MINIMIZE:
      if Assigned(FOnMinimize) then
        FOnMinimize;
    SC_MAXIMIZE:
      if Assigned(FOnMaximize) then
        FOnMaximize;
    SC_RESTORE:
      if Assigned(FOnRestore) then
        FOnRestore;
  end;
end;

procedure TXForm.WMMove(var Message: TWMMove);
begin
  if Assigned(FOnMove) then
    FOnMove();
  if Docking and Assigned(FOnDock) and (FDockedTo <> []) then
  begin
    FOnDock(FDockedTo);
    FDockedTo := [];
  end;
end;

end.

