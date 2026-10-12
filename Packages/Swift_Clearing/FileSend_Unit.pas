unit FileSend_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons,sboapiDataModuleImpl, Db, OracleData,FileCtrl,shellapi,
  ExtCtrls, ComCtrls;

type
  TSendFileForm = class(TForm)
    DBGrid1: TDBGrid;
    But_cancel: TBitBtn;
    Mt150: TOracleDataSet;
    Mt150_DataSource: TDataSource;
    ForCheck: TOracleDataSet;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    procedure But_cancelClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RefDate;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SendFileForm: TSendFileForm;

implementation

{$R *.DFM}
procedure TSendFileForm.RefDate;
var
  Dtst,dtEnd:TDateTime;
begin
  Dtst:=trunc(DateTimePicker1.DateTime);
  dtEnd:=trunc(DateTimePicker2.DateTime);
  Mt150.Close;
  Mt150.SetVariable('BeginDate',Dtst);
  Mt150.SetVariable('EndDate',dtEnd);
  Mt150.Open;

end;

procedure TSendFileForm.But_cancelClick(Sender: TObject);
begin
 close;
end;

procedure TSendFileForm.DBGrid1DblClick(Sender: TObject);
begin
   if Mt150.RecordCount = 0 then exit;
   ForCheck.Open;
//   ShowMessage(ForCheck.fieldbyname('hox_out_dir').AsString+'\'+Mt150.fieldbyname('user_reference').AsString+'.xml');
   if FileExists(ForCheck.fieldbyname('hox_out_dir').AsString+'\'+Mt150.fieldbyname('user_reference').AsString+'.xml') then
//   WinExec(pchar(ForCheck.fieldbyname('hox_out_dir').AsString+'\'+Mt150.fieldbyname('user_reference').AsString+'.xml'),sw_SHOWnormal);
   ShellExecute(Application.Handle,'open',pchar(ForCheck.fieldbyname('hox_out_dir').AsString+'\'+Mt150.fieldbyname('user_reference').AsString+'.xml'),0,0,SW_SHOW);
end;

procedure TSendFileForm.BitBtn1Click(Sender: TObject);
begin
RefDate;
end;

end.
