unit Insurance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, XDBGrids, StdCtrls, XFSCtrls, ComCtrls, ExtCtrls, Oracle,
  CMExcelExport, DB, OracleData;

type
  TForminsurance = class(TForm)
    XFPanel1: TXFPanel;
    XFLabel1: TXFLabel;
    TransDate: TDateTimePicker;
    XFButton1: TXFButton;
    XFButton2: TXFButton;
    CBSearch: TComboBox;
    EditSearch: TEdit;
    XFButton3: TXFButton;
    XFPanel2: TXFPanel;
    XDBGrid1: TXDBGrid;
    ods_dat: TOracleDataSet;
    ods_datDAT: TDateTimeField;
    ods_schedule: TOracleDataSet;
    ods_scheduleCREDITID: TFloatField;
    ods_scheduleMUQ: TWideStringField;
    ods_schedulePAYMENTDATE: TDateTimeField;
    ods_scheduleINSURANCE: TFloatField;
    ods_scheduleINSURANCE_ACCNO: TWideStringField;
    ods_scheduleST: TWideStringField;
    ods_scheduleSTATUS: TIntegerField;
    Dsrc_schedule: TDataSource;
    OracleDataSet1: TOracleDataSet;
    OracleDataSet1ID: TFloatField;
    OracleDataSet1ACC_NO: TWideStringField;
    OracleDataSet1ACC: TWideStringField;
    MisExcelExport: TCMExcelExport;
    cm_schedule: TOraclePackage;
    procedure EditSearchChange(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
    procedure XFButton2Click(Sender: TObject);
    procedure XFButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Forminsurance: TForminsurance;

implementation

{$R *.dfm}

procedure TForminsurance.EditSearchChange(Sender: TObject);
  var
   v1: string;
   v2: string;

begin
  if Length(EditSearch.Text)<>0 then
  begin
  v1:= EditSearch.Text;

   if v1='0' then
   begin
     v2:=' and nvl(insurance,0)>0'  ;
      end
     else
     begin
       v2:= ' and insurance like '''+EditSearch.Text+'%''';
     end;

  ods_schedule.Close;
  case CBSearch.ItemIndex of
  0:ods_schedule.SQL[2]:='and creditid like '''+EditSearch.Text+'%''';
  1:ods_schedule.SQL[2]:='and muq like '''+EditSearch.Text+'%''';
  2:ods_schedule.SQL[2]:=v2;
   end;
  ods_schedule.Open;
  end
  else
  begin
  ods_schedule.Close;
  ods_schedule.SQL[2]:='';
  ods_schedule.Open;
  end;

end;

procedure TForminsurance.FormCreate(Sender: TObject);
begin
ods_dat.Open;
end;

procedure TForminsurance.FormShow(Sender: TObject);
    var
    i:integer;
begin
TransDate.DateTime:=ods_dat.FieldByName('dat').AsDateTime;
  CBSearch.Clear;
//for i := 0 to XDBGrid1.Columns.Count-1 do
CBSearch.Items.Add(XDBGrid1.Columns[0].Title.Caption);
 CBSearch.Items.Add(XDBGrid1.Columns[1].Title.Caption);
 CBSearch.Items.Add(XDBGrid1.Columns[3].Title.Caption);
 CBSearch.ItemIndex:=0;

end;

procedure TForminsurance.XFButton1Click(Sender: TObject);
begin
with ods_schedule do
begin
  close;
    sql[2]:='';
    sql[3]:='';
    SetVariable('v_dat',Int(TransDate.DateTime));
  open;

end;
with ods_schedule do
begin

  edit;
  post;

end;
end;

procedure TForminsurance.XFButton2Click(Sender: TObject);
var
   i: Integer;
   count :integer;

    trid:integer;
begin


count:=ods_schedule.RecordCount;
  if MessageDlg(inttostr(count)+'Sayda əməliyyat günün sənədlərinə göndəriləcək ?', mtConfirmation, [mbYes, mbCancel], 0) = mrYes then

         begin
         ods_schedule.First;
     for I := 0 to count-1 do
        begin
     cm_schedule.CallProcedure('Tr_Add',[
                                              ods_scheduleCREDITID.AsInteger,
                                              ods_scheduleMUQ.AsString,
                                              TransDate.DateTime,
                                              ods_scheduleINSURANCE.Value,
                                              ods_scheduleINSURANCE_ACCNO.AsString
                                              ]);


        ods_schedule.Next;
         end;


        with ods_schedule do
             sql[3]:='and status=2';
             ods_schedule.Refresh;
        end;

end;

procedure TForminsurance.XFButton3Click(Sender: TObject);
begin
with MisExcelExport do
  begin
     Connect;
     ExportDataset(ods_schedule,'Sigorta',true,false);
     Disconnect;
  end;

end;

end.
