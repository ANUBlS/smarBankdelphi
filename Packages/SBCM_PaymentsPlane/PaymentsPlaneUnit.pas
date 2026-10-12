unit PaymentsPlaneUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Menus, ImgList;

type
  TFrmPaymentPlane = class(TForm)
    PlaneViewer: TDBGrid;
    Panel1: TPanel;
    BtnOk: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ImageList1: TImageList;
    StatusImages: TImageList;
    procedure N1DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PlaneViewerDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    function Plane_Add : Boolean;
    function Plane_Edit : Boolean;
    procedure Plane_Delete;
    { Private declarations }
  public
    FContractID : Integer;
    { Public declarations }
  end;

var
  FrmPaymentPlane: TFrmPaymentPlane;

implementation

uses PaymentsPlaneDataModuleUnit, PlaneAddEditUnit ,StoredProgramsUnit;

{$R *.DFM}


procedure TFrmPaymentPlane.N1DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
begin
  with ACanvas, Sender as TMenuItem do
  begin
    with Font do
    begin
      Charset := DEFAULT_CHARSET;
      Name := 'Azl Sans Serif';
      if Default then
        Style := [fsBold];
    end;
    if Caption = '-' then
    begin
      Pen.Color := clBlack;
      LineBottom := (ARect.Top + (ARect.Bottom - ARect.Top) div 2)-1;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
      inc(LineBottom);
      Pen.Color := clWhite;
      MoveTo(ARect.Left, LineBottom);
      LineTo(ARect.Right, LineBottom);
    end
    else
    begin
      if Selected then
      begin
        Brush.Color := clNavy;
        if Enabled then
          Font.Color := clWhite
        else
          Font.Color := clSilver;
      end
      else
      begin
        Brush.Color := clBtnFace;
        if Enabled then
          Font.Color := clBlack
        else
          Font.Color := clGrayText;
      end;
      Bar := ARect;
      Inc(Bar.Left, 22);
      FillRect(Bar);
      TextOut(ARect.Left+{17}22, ARect.Top+1, Caption);
    end;
    // draw shortcut
    SText := ShortCutToText(ShortCut);
    TextOut(ARect.Right-TextWidth(SText)-7, ARect.Top+1, SText);
    if ImageIndex <> -1 then
      with GetParentMenu do
        if Assigned(Images) then
        begin
          if Checked then
          begin
            Bar.Left := ARect.Left + 1;
            Bar.Right := Bar.Left + 16;
            Bar.Top := ARect.Top + 1;
            Bar.Bottom := Bar.Top + 16;

            ACanvas.Brush.Color := clBtnShadow;
            ACanvas.FrameRect(Bar);

            Inc(Bar.Left, 2);
            Inc(Bar.Right, 2);
            Inc(Bar.Top, 2);
            Inc(Bar.Bottom, 2);

            ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FrameRect(Bar);

            Dec(Bar.Left, 1);
            Dec(Bar.Right, 1);
            Dec(Bar.Top, 1);
            Dec(Bar.Bottom, 1);

            if Selected then
              ACanvas.Brush.Color := clBtnFace
            else
              ACanvas.Brush.Color := clBtnHighlight;
            ACanvas.FillRect(Bar);
          end;

          Images.Draw(ACanvas, ARect.Left, ARect.Top, ImageIndex, Enabled);
        end;
  end;

end;
procedure TFrmPaymentPlane.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27  then
   BtnOk.Click;
end;

procedure TFrmPaymentPlane.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPaymentPlane.FormShow(Sender: TObject);
begin
  with PlaneDataModule do
  begin
    with PaymentsPlaneData do
    begin
      SetVariable('ContractID',FContractID);
      Open;
    end;
  end;
end;

procedure TFrmPaymentPlane.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with PlaneDataModule do
  begin
    with PaymentsPlaneData do
      CloseAll;
  end;
end;

procedure TFrmPaymentPlane.FormCreate(Sender: TObject);
begin
  PlaneDataModule := TPlaneDataModule.Create(Self);
end;

function TFrmPaymentPlane.Plane_Add : Boolean;
begin
  with TPlaneAddEditForm.Create(Self) do
  try
    PlaneGridState := pgsInsert;
    DTPPaymentDate.DateTime := GetBankDate;
    ContractID := FContractID;
    Result := ShowModal = mrOk ;
  finally
    Release ;
  end;
end;

function TFrmPaymentPlane.Plane_Edit : Boolean;
begin
  with TPlaneAddEditForm.Create(Self) do
  try
    PlaneGridState := pgsEdit;
    ContractID := FContractID;
    Result := ShowModal = mrOk ;
  finally
    Release ;
  end;
end;

procedure TFrmPaymentPlane.Plane_Delete;
var
  ID : Integer;
begin
  ID := PlaneDataModule.PaymentsPlaneData.FieldByName('ID').AsInteger;
  with PlaneDataModule.PaymentsPlane do
  CallProcedure('Payments_Plane_Del',[
      ID
      ])
end;

procedure TFrmPaymentPlane.N1Click(Sender: TObject);
begin
  with PlaneDataModule.PaymentsPlaneData do
  try
    Plane_Add;
    Refresh
  finally
  end;
end;

procedure TFrmPaymentPlane.N2Click(Sender: TObject);
begin
  with PlaneDataModule.PaymentsPlaneData do
  try
    Plane_Edit;
    Refresh;
  finally
  end;
end;

procedure TFrmPaymentPlane.N3Click(Sender: TObject);
begin
  if  MessageDlg(
              ' Delete Plane ?'
             ,mtConfirmation
             ,[mbYes , mbNo]
             ,0) = mrYes
  then
  Plane_Delete ;
  PlaneDataModule.PaymentsPlaneData.Refresh;
end;

procedure TFrmPaymentPlane.PlaneViewerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

const
    DataColIndex = 1;

var
    ImageIndex :Integer;

begin

  //ImageIndex :=-1;

  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      if DataSource.DataSet.FieldByName('Paid').AsString = 'P' then
        ImageIndex := 0
      else
        ImageIndex := 1;

      if   (DataCol = DataColIndex)   then
        StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;

end;

end.
