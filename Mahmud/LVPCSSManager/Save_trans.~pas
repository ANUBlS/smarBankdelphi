unit Save_trans;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, Grids, DBGrids,sboapiDataModuleImpl;

type
  TSaxlanilma = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    OracleDataSet1: TOracleDataSet;
    DataSource1: TDataSource;
    OracleDataSet2: TOracleDataSet;
    DataSource2: TDataSource;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1F_ID: TFloatField;
    OracleDataSet1OPERCODE: TStringField;
    OracleDataSet1ACC_ID: TFloatField;
    OracleDataSet1CLIENT_NAME: TStringField;
    OracleDataSet1CLIENT_CODE: TStringField;
    OracleDataSet1TRANS_REF: TStringField;
    OracleDataSet1AMOUNT: TFloatField;
    OracleDataSet1VAL_ACC: TIntegerField;
    OracleDataSet1TRANSDATE: TDateTimeField;
    OracleDataSet1SEND: TIntegerField;
    OracleDataSet1STATUS: TIntegerField;
    OracleDataSet1FILIAL: TFloatField;
    OracleDataSet1TRANSACTION_ID: TFloatField;
    OracleDataSet1CLIENT_INN: TStringField;
    OracleDataSet1USERID: TFloatField;
    OracleDataSet1FUSERID: TStringField;
    OracleDataSet1VUSERID: TStringField;
    OracleDataSet1AUSERID: TStringField;
    OracleDataSet1SDATE: TDateTimeField;
    OracleDataSet1USERNAME: TStringField;
    OracleDataSet1ACC_NO: TStringField;
    OracleDataSet1NAME: TStringField;
    OracleDataSet1VAL_NAME: TStringField;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Saxlanilma: TSaxlanilma;

implementation

uses LVPCSSImpl,Data_Unit;

{$R *.DFM}

procedure TSaxlanilma.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex,ImageIndexFilial: Integer;
begin
  ImageIndex:=-1;
  with (Sender as TDBGrid) do
  begin
    if (Sender as TDBGrid).DataSource.DataSet.RecordCount <> 0 then
    begin
      case (Sender as TDBGrid).DataSource.DataSet.FieldByName('Status').AsInteger of
      msDefault:
        ImageIndex := 3;
      msCommit:
        ImageIndex := 10;
      msReject:
        ImageIndex := 4;
      msFileCreated:
        ImageIndex := 5;
      msVerifikator:
        ImageIndex :=18;
      msFVerifikator:
        ImageIndex :=17;
      msAvtorizator:
        ImageIndex :=19;
      msReturnBack:
        ImageIndex :=16;    
      end;
      if (DataCol = 2) and (ImageIndex <> -1) then
       LVPCSSForm.ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);

      {view filial}
      if ((Sender as TDBGrid)= DBGrid1)
         then
      begin
        case (Sender as TDBGrid).DataSource.DataSet.FieldByName('FILIAL').AsInteger of
              MsHeadOffice:  ImageIndexFilial := -1;
              else
                  ImageIndexFilial := 0;
        end;
        if (DataCol = 1) and (ImageIndex <> -1) then
           LVPCSSForm.ImageListFilial.Draw(Canvas, Rect.Left, Rect.Top, ImageIndexFilial, True);
      end;
    end;
  end;



end;

procedure TSaxlanilma.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex,ImageIndexFilial: Integer;
begin
  ImageIndex:=-1;
  with (Sender as TDBGrid) do
  begin
    if (Sender as TDBGrid).DataSource.DataSet.RecordCount <> 0 then
    begin
      case (Sender as TDBGrid).DataSource.DataSet.FieldByName('Status').AsInteger of
      msDefault:
        ImageIndex := 3;
      msCommit:
        ImageIndex := 10;
      msReject:
        ImageIndex := 4;
      msFileCreated:
        ImageIndex := 5;
      msVerifikator:
        ImageIndex :=18;
      msFVerifikator:
        ImageIndex :=17;
      msAvtorizator:
        ImageIndex :=19;
      msReturnBack:
        ImageIndex :=16;    
      end;
      if (DataCol = 2) and (ImageIndex <> -1) then
        LVPCSSForm.ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);

      {view filial}
      if ((Sender as TDBGrid)=DBGrid1)
           then
      begin
        case (Sender as TDBGrid).DataSource.DataSet.FieldByName('FILIAL').AsInteger of
              MsHeadOffice:  ImageIndexFilial := -1;
              else
                  ImageIndexFilial := 0;
        end;
        if (DataCol = 1) and (ImageIndex <> -1) then
            LVPCSSForm.ImageListFilial.Draw(Canvas, Rect.Left, Rect.Top, ImageIndexFilial, True);
      end;
    end;
  end;


end;


end.
