unit ErizeImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, DB, OracleData, ImgList, Menus;

type
  TERizeFrm = class(TForm)
    Panel1: TPanel;
    Erize: TOracleDataSet;
    DataSur: TDataSource;
    ErizeID: TFloatField;
    ErizeCURRENCY: TFloatField;
    ErizeBOOROWERID: TFloatField;
    ErizeCREDITLINEAMOUNT: TFloatField;
    ErizeANNUALYINTERESTRATE: TFloatField;
    ErizeINITIALAMOUNT: TFloatField;
    ErizeANNUALYOVERDUERATE: TFloatField;
    ErizeANNUALYPENALTYRATE: TFloatField;
    ErizeDATEOFCONCLUSION: TDateTimeField;
    ErizeDUEDATEFIRSTCONTRACT: TDateTimeField;
    ErizeDUEDATELASTCONTRACT: TDateTimeField;
    ErizeNUMBEROFCREDIT: TWideStringField;
    ErizePURPOSEOFCREDIT: TWideStringField;
    ErizeUSRGROUP: TFloatField;
    ErizeBRANCHID: TFloatField;
    ErizeUSID: TFloatField;
    ErizeSTATUS: TFloatField;
    ErizeCUSTOMERTYPE: TFloatField;
    ErizeCREDITTYPE: TFloatField;
    ErizePERSONALTYPE: TFloatField;
    ErizeSTOPCALCDATE: TDateTimeField;
    ErizeREST: TFloatField;
    ErizeINTERESTREST: TFloatField;
    ErizeDUEREST: TFloatField;
    ErizeDUEINTERESTREST: TFloatField;
    ErizePENALTYREST: TFloatField;
    ErizeRESERVEID: TFloatField;
    ErizeDUERESERVEID: TFloatField;
    ErizeOBLIGATION: TFloatField;
    ErizePLEDGEPRICE: TFloatField;
    ErizePLEDGEID: TFloatField;
    ErizeCONTRACTACCNO: TWideStringField;
    ErizeINTERESTACCNO: TWideStringField;
    ErizeDUELOANACCNO: TWideStringField;
    ErizeLOANACCNO: TWideStringField;
    ErizeBOOROWERREST: TFloatField;
    ErizeVAL_NAME: TWideStringField;
    ErizeNAME: TWideStringField;
    MainGrid: TDBGridEh;
    StatusImages: TImageList;
    PopupMenu1: TPopupMenu;
    Seilmirizlri1: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MainGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Seilmirizlri1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ERizeFrm: TERizeFrm;

implementation
uses   CommonDecls, CMOracleAPIDataModuleImpl  , Protokolimpl;
{$R *.dfm}

procedure TERizeFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false
end;

procedure TERizeFrm.FormCreate(Sender: TObject);
begin
Erize.Open  ;
    CommonApplication := Application;
    CommonDBGrid := MainGrid;
    CommonScreen := Screen;
end;

procedure TERizeFrm.FormDestroy(Sender: TObject);
begin
Erize.close
end;

procedure TERizeFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_ESCAPE then
  begin
    Close;
    Key := #0;
  end;

end;

procedure TERizeFrm.MainGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
    ImageIndex :Integer;
begin

  with Sender as TDBGridEh do
  begin
    if DataSource.DataSet.RecordCount > 0 then
    begin
  // showmessage( IntToStr(MainDataModule.SeqDataSet.FieldByName('seqno').AsInteger));
      ImageIndex := DataSource.DataSet.FieldByName('STATUS').AsInteger;
      if  (DataCol =4) then
      StatusImages.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
      DefaultDrawColumnCell(Rect, DataCol, Column, State);

    end;
  end;

end;

procedure TERizeFrm.Seilmirizlri1Click(Sender: TObject);
begin
mainform.showmodal
end;

end.
