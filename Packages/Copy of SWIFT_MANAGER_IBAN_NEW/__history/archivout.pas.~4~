unit archivout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, StdCtrls, SearchEdit, Grids, DBGrids, ORACLEDATA,
  ComCtrls;

type
  Tarchive_out = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Gridin: TDBGrid;
    Button2: TButton;
    Button1: TButton;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    SearchEdit3: TSearchEdit;
    SearchEdit4: TSearchEdit;
    swImageList2: TImageList;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure GridinDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GridinTitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  archive_out: Tarchive_out;

implementation

uses Unit2, qrp1, qrp5,SBTranslateproc,sboapidatamoduleimpl;

{$R *.DFM}
  const
  Notcreate =1;
  Created =2;
  Commited =5;
  Problemed =8;
  Problemed2 =7;
  new=10;
  edits=11;
procedure Tarchive_out.FormActivate(Sender: TObject);
 var

dat11:Tdatetime;
dat22:Tdatetime;

begin
     //OracleDataSet1.Session:=sboapidatamodule.sbsession;
//
DateTimePicker1.DateTime:=date;
DateTimePicker2.DateTime:=date;
//  SWDataModule.out_archive.close;
// dat11:=integer(trunc(DateTimePicker1.datetime));
// dat22:=integer(trunc(DateTimePicker2.datetime));
// SWDataModule.out_archive.SetVariable('dat1', dat11);
// SWDataModule.out_archive.SetVariable('dat2' , dat22);
// SWDataModule.out_archive.open;
end;

procedure Tarchive_out.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure Tarchive_out.Button2Click(Sender: TObject);
 var

dat11:Tdatetime;
dat22:Tdatetime;

begin

  SWDataModule.out_archive.close;
 dat11:=integer(trunc(DateTimePicker1.datetime));
 dat22:=integer(trunc(DateTimePicker2.datetime));
 SWDataModule.out_archive.SetVariable('dat1', dat11);
 SWDataModule.out_archive.SetVariable('dat2' , dat22);
 SWDataModule.out_archive.open;
end;

procedure Tarchive_out.GridinDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ImageIndex: Integer;

begin
//SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT_CREATEDVIEW']);
 ImageIndex := -1;
  with Sender as TDBGrid do
  begin
    if DataSource.DataSet.RecordCount <> 0 then
    begin
      case DataSource.DataSet.FieldByName('STATUS').AsInteger of
     notcreate :
        ImageIndex := 25;
      created :
        ImageIndex := 4;
      commited :
        ImageIndex := 5;
      7:
        ImageIndex :=16;
      20:
        ImageIndex :=10;
      15:
        ImageIndex :=7;
      10:
        ImageIndex :=44;
      8:
        ImageIndex :=16;
      else
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        swImageList2.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True)
      else
        DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

    //if (DataSource.DataSet.FieldByName('id').asinteger<>722) and (DataCol  =2)  then

     //(
    //Column.Font.Color:=clred
         // else
          //Column.Font.Color:=clblack ;
        //DefaultDrawColumnCell(Rect, DataCol, Column, State);
    //DefaultDrawColumnCell


  end;
end;

procedure Tarchive_out.GridinTitleClick(Column: TColumn);
var
   TitleName :string;
   SortPosition: word;
begin
 SortPosition :=100;
 //OrderedTitle :=Column.FieldName; //H.R. 24.06.2008
 if (gridin.DataSource.DataSet.IsEmpty) or (Column.FieldName = EmptyStr) then Exit;
 Screen.Cursor :=crHourGlass;
 TitleName :=Column.FieldName;
 with TOracleDataSet(Gridin.DataSource.DataSet) do
  try
  
   SortPosition :=SQL.Add('ORDER BY '+ TitleName);
   Refresh;
  finally
   SQL[SortPosition] :=EmptyStr;
   Screen.Cursor :=crDefault;
  end;
end;

procedure Tarchive_out.Button1Click(Sender: TObject);

var
a:string;
begin

a:= gridin.DataSource.DataSet.fieldbyname('MF20').asstring+' '+
gridin.DataSource.DataSet.fieldbyname('MF20_REFERENCE').asstring+#13+#13
+gridin.DataSource.DataSet.fieldbyname('M23B').asstring+' '+gridin.DataSource.DataSet.fieldbyname('mf23b').asstring
+#13+#13+gridin.DataSource.DataSet.fieldbyname('M32A').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF32A_DATE').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF32A_CURR').asstring+gridin.DataSource.DataSet.fieldbyname('MF32A_AMOUNT').asstring
+#13+#13+gridin.DataSource.DataSet.fieldbyname('M50').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF50_ACCOUNT').asstring
+#13+gridin.DataSource.DataSet.fieldbyname('MF50_NAME$ADRESS').asstring
+#13+#13+gridin.DataSource.DataSet.fieldbyname('M59').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF59_ACCOUNT').asstring
+#13+gridin.DataSource.DataSet.fieldbyname('MF59_NAME$ADRESS').asstring
+#13+#13+gridin.DataSource.DataSet.fieldbyname('M70').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF70').asstring
+#13+gridin.DataSource.DataSet.fieldbyname('M72').asstring+' '+gridin.DataSource.DataSet.fieldbyname('MF72').asstring;



 if not assigned(QuickReport5) then
 QuickReport5:=TQuickReport5.Create(application);
 QuickReport5.qrrichtext1.lines.Text:=a;
 //\ShowMessage(a);
 QuickReport5.Preview;
end;

end.
