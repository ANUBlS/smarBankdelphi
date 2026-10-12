unit Unitsalary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, ToolWin, ImgList, CMExcelExport, Menus,
  OleServer, Excel97,oracledata,LDialogs;

type
  TSalary = class(TForm)
    PopupMenu3: TPopupMenu;
    EXCEL2: TMenuItem;
    PopupMenu2: TPopupMenu;
    EXCEL1: TMenuItem;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    CMExcelExport1: TCMExcelExport;
    ImageList1: TImageList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    isertbtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton2: TToolButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    OpenDialogCards: TOpenDialog;
    ExcelApplication1: TExcelApplication;
    procedure FormActivate(Sender: TObject);
    procedure isertbtnClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure EXCEL1Click(Sender: TObject);
    procedure EXCEL2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure N11DrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Salary: TSalary;

implementation

uses Unit18;

{$R *.DFM}

procedure TSalary.FormActivate(Sender: TObject);
begin
DataMod_CARDS.salarybase.Open;
DataMod_CARDS.salarybase2.Open;
end;

procedure TSalary.isertbtnClick(Sender: TObject);
const
    c_info = '%d record is imported!';
var
   V,Sheet,Sheets  :Variant;
   cell,row,i,j    :Integer;
begin
  if OpenDialogCards.Execute then begin
//**********************


  DataMod_CARDS.salarybase.Open;
  V:=ExcelApplication1.Application;
  ExcelApplication1.Connect;
  V.Workbooks.Open( OpenDialogCards.FileName);
  Sheet := V.Workbooks[1].Worksheets['CARDS'];
  Sheets := V.Sheets;

  DataMod_CARDS.salarybase.First;
  //for j:=10 to RecCount do
  j:=10;
  repeat
   //begin
   cell :=2;
   DataMod_CARDS.salarybase.Insert ;
    for i:=0  to DataMod_CARDS.salarybase.FieldCount-4 do
     begin
      Application.ProcessMessages;
      
      DataMod_CARDS.salarybase.Fields[i].AsString :=Sheet.cells[j,cell];
      cell:=cell+1;
     end;
    DataMod_CARDS.salarybase.Post;
    DataMod_CARDS.salarybase.Next;
    j:=j+1;
  until Sheet.cells[j,1].Text = '';
//   end;
  V :=null;
  Application.ProcessMessages;
  ExcelApplication1.Quit;
  ExcelApplication1.Disconnect;
  Application.ProcessMessages;
  DataMod_CARDS.salarybase.session.Commit;
  ShowMessage(Format(c_info, [j-10]));
//**********************
  end; {if OpenDialogCards.Execute}

  DataMod_CARDS.salarybase.Refresh;
  DataMod_CARDS.salarybase2.Refresh;
  end;


procedure TSalary.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ImageIndex: Integer;

begin

 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of

      1:
        ImageIndex :=25;
      2:
        ImageIndex :=3 ;
      3:
        ImageIndex :=26;

      4:
        ImageIndex:=13;  

      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;




  end;
end;

procedure TSalary.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  ImageIndex: Integer;

begin

 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of

      1:
        ImageIndex :=25;
      2:
        ImageIndex :=3 ;
      3:
        ImageIndex :=26;

      4:
        ImageIndex:=13;  

      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList1.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;




  end;
end;

procedure TSalary.DBGrid1TitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (DBGrid1.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(DBGrid1.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure TSalary.DBGrid2TitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (DBGrid2.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(DBGrid2.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure TSalary.N11Click(Sender: TObject);
begin
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.salarybase,'salary',true);
  CMExcelExport1.Disconnect;
end;

procedure TSalary.N12Click(Sender: TObject);
begin
  if not CMExcelExport1.Connected then CMExcelExport1.Connect;
  CMExcelExport1.ExportDataset(DataMod_CARDS.salarybase2,'salary',true);
  CMExcelExport1.Disconnect;
end;

procedure TSalary.EXCEL1Click(Sender: TObject);
begin
N11.Click;
end;

procedure TSalary.EXCEL2Click(Sender: TObject);
begin
N12.Click;
end;

procedure TSalary.ToolButton2Click(Sender: TObject);
begin
DataMod_CARDS.mainpacket.CallProcedure('delete_salary',[]);
DataMod_CARDS.salarybase.Refresh;
DataMod_CARDS.salarybase2.Refresh;
end;

procedure TSalary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DataMod_CARDS.mainpacket.CallProcedure('delete_salary',[]);
DataMod_CARDS.salarybase.Refresh;
DataMod_CARDS.salarybase2.Refresh;
end;

procedure TSalary.ToolButton1Click(Sender: TObject);
begin
if MessageDlg('ямялиййатлары тясдиг етмяк истяйирсинизми?',mtinformation,[mbyes,mbno],0)=mryes
then
DataMod_CARDS.mainpacket.CallProcedure('transaction_salary',[]);
DataMod_CARDS.salarybase.refresh;
DataMod_CARDS.salarybase2.refresh;
end;

procedure TSalary.N11DrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; Selected: Boolean);
var
  LineBottom: Integer;
  SText: String;
  Bar: TRect;
 begin
  with ACanvas, Sender as TMenuItem do
  begin
    with ACanvas.Font do
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


end.
