unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, OleServer, ExcelXp, StdCtrls, Buttons, Variants;

type
  TFormDeleted = class(TForm)
    Label1: TLabel;
    DateTimePicker2: TDateTimePicker;
    BitDel: TBitBtn;
    ExcelApplication1: TExcelApplication;
    ProgressBar1: TProgressBar;
    procedure BitDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDeleted: TFormDeleted;

implementation

uses UnitData,sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormDeleted.BitDelClick(Sender: TObject);
var i,j,k,n:integer;
    v:OleVariant;
    sheet:_Worksheet;
    a:Tdatetime;
    sum,sum1,sum2,sum3: real;
begin

  a:= integer(trunc(DateTimePicker2.DateTime)) ;

         with DataModWares.OracleDataSet8 do
       begin
        close;
       SetVariable('ENT',a);
        open;
        end;
  ExcelApplication1.Connect;
  ExcelApplication1.Workbooks.Add(EmptyParam,0);
  // ExcelApplication1.Visible[0]:=true;
     i:=1;
     j:=1;
 // for k:=1 to ExcelApplication1.Worksheets.Count do
  //begin
    sheet:=ExcelApplication1.Worksheets.Item[1] as _Worksheet;
   // ExcelApplication1.Visible[0]:=true;
  sheet.Range['A1:A60000','A1:A60000'].ColumnWidth:=45;
  sheet.Range['B1:B60000','B1:B60000'].ColumnWidth:=10;
  sheet.Range['C1:C60000','C1:C60000'].ColumnWidth:=9;
  sheet.Range['D1:D60000','D1:D60000'].ColumnWidth:=11;
  sheet.Range['E1:E60000','E1:E60000'].ColumnWidth:=10;
  sheet.Range['F1:F60000','F1:F60000'].ColumnWidth:=10;
  sheet.Range['G1:G60000','G1:G60000'].ColumnWidth:=10;
  sheet.Range['H1:H60000','H1:H60000'].ColumnWidth:=10;
  sheet.Range['I1:I60000','I1:I60000'].ColumnWidth:=10;
  sheet.Range['J1:I60000','J1:I60000'].ColumnWidth:=10;

     DataModWares.OracleDataSet7.Open;
     DataModWares.OracleDataSet7.First;
     ProgressBar1.Max:= DataModWares.OracleDataSet7.RecordCount;
  //   ProgressBar1.Max:= DataModWares.OracleDataSet5.RecordCount;
             //DataModWares.OracleDataSet6.Open;


        sheet.Cells.Item[i,4]:=DateTimePicker2.DateTime;
      Sheet.Cells.Item[i,4].Font.Name:='Tahoma';
     Sheet.Cells.Item[i,4].Font.Color:=clblack;
      Sheet.Cells.Item[i,4].Font.bold:=true;
     Sheet.Cells.Item[i,5].Font.Name:='Tahoma';
     Sheet.Cells.Item[i,5].Font.Color:=clblack;
      Sheet.Cells.Item[i,5].Font.bold:=true;
      sheet.Cells.Item[i,5].Font.Size:=13;
     sheet.Cells.Item[i,5]:='  tarixinə hesabat  ' ;

 while not DataModWares.OracleDataSet7.Eof do
  //  for k:=1 to  DataModWares.OracleDataSet5.RecordCount do
     begin
     //ShowMessage(inttostr(DataModWares.OracleDataSet6.RecordCount));
    sheet.Cells.Item[i+1,1]:=DataModWares.OracleDataSet7.fieldbyname('name').AsString;
    sheet.Cells.Item[i+1,1].Font.Name:='Tahoma';
    sheet.Cells.Item[i+1,1].Font.Color:=clred;
 //   sheet.Cells.Item[i,1].Font.bold:=true;
    sheet.Cells.Item[i+1,1].Font.Size:=11;
   // sheet.Range['A1','A100'].Font.Size:=20;
   // ShowMessage((DataModWares.OracleDataSet5.fieldbyname('name').AsString));


          Sheet.Cells.Item[i+2,1]:='Vəsaitin adı';
          Sheet.Cells.Item[i+2,1].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,1].Font.Color:=clBlue;
  //        Sheet.Cells.Item[i+1,1].Font.bold:=true;
          sheet.Cells.Item[i+2,1].Font.Size:=10;
          Sheet.Range['A1','I1'].Borders.Color:=clBlack;
        //  sheet.Cells[1,1].ColumnWidth:=40;

         // sheet.cells.Item
          Sheet.Cells.Item[i+2,2]:='İnventar tarixi';
          Sheet.Cells.Item[i+2,2].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,2].Font.Color:=clBlue;
   //       Sheet.Cells.Item[i+1,2].Font.bold:=true;
          sheet.Cells.Item[i+2,2].Font.Size:=10;

          Sheet.Cells.Item[i+2,3]:='İlkin dəyər';
          Sheet.Cells.Item[i+2,3].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,3].Font.Color:=clBlue;
  //        Sheet.Cells.Item[i+1,3].Font.bold:=true;
          sheet.Cells.Item[i+2,3].Font.Size:=10;

          Sheet.Cells.Item[i+2,4]:='Qalıq dəyər';
          Sheet.Cells.Item[i+2,4].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,4].Font.Color:=clBlue;
  //        Sheet.Cells.Item[i+1,4].Font.bold:=true;
          sheet.Cells.Item[i+2,4].Font.Size:=10;

          Sheet.Cells.Item[i+2,5]:='Yığ. Amort.';
          Sheet.Cells.Item[i+2,5].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,5].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,5].Font.bold:=true;
          sheet.Cells.Item[i+2,5].Font.Size:=10;

          Sheet.Cells.Item[i+2,6]:='Amortizasiya';
          Sheet.Cells.Item[i+2,6].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,6].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,6].Font.bold:=true;
          sheet.Cells.Item[i+2,6].Font.Size:=10;

          Sheet.Cells.Item[i+2,7]:='Maliyyə faizi';
          Sheet.Cells.Item[i+2,7].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,7].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,7].Font.bold:=true;
          sheet.Cells.Item[i+2,7].Font.Size:=10;


          Sheet.Cells.Item[i+2,8]:='İnventar №';
          Sheet.Cells.Item[i+2,8].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,8].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,8].Font.bold:=true;
          sheet.Cells.Item[i+2,8].Font.Size:=10;

          Sheet.Cells.Item[i+2,9]:='Amortizasiya tarixi';
          Sheet.Cells.Item[i+2,9].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,9].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,8].Font.bold:=true;
          sheet.Cells.Item[i+2,9].Font.Size:=10;

          Sheet.Cells.Item[i+2,10]:='Silinmə tarixi';
          Sheet.Cells.Item[i+2,10].Font.Name:='Tahoma';
          Sheet.Cells.Item[i+2,10].Font.Color:=clBlue;
 //         Sheet.Cells.Item[i+1,8].Font.bold:=true;
          sheet.Cells.Item[i+2,10].Font.Size:=10;



    sheet.Cells.Item[i,3].font.color:=clred;
    sheet.Cells.Item[i,4].font.color:=clred;
    sheet.Cells.Item[i,5].font.color:=clred;
    sheet.Cells.Item[i,6].font.color:=clred;
    sum:=0; sum1:=0;sum2:=0;sum3:=0;


    //ShowMessage(IntToStr(DataModWares.OracleDataSet5.fieldbyname('id').AsInteger));


    while not  DataModWares.OracleDataSet8.Eof do
    begin
    j:=i;
      //   ShowMessage(DataModWares.OracleDataSet6.fieldbyname('WARES_NAME').AsString) ;
    sheet.Cells.Item[i+3,1]:=DataModWares.OracleDataSet8.fieldbyname('WARES_NAME').AsString;
    sheet.Cells.Item[i+3,1].Font.Name:='Tahoma';
    sheet.Cells.Item[i+3,2]:=DataModWares.OracleDataSet8.fieldbyname('INVENTAR_DATE').AsString;
    sheet.Cells.Item[i+3,3]:=DataModWares.OracleDataSet8.fieldbyname('FIRST_PRICE').AsString;
    sheet.Cells.Item[i+3,4]:=DataModWares.OracleDataSet8.fieldbyname('REMAINDER').AsString;
    sheet.Cells.Item[i+3,5]:=DataModWares.OracleDataSet8.fieldbyname('ALL_AMORT').AsString;
    sheet.Cells.Item[i+3,6]:=DataModWares.OracleDataSet8.fieldbyname('AMORT').AsString;
    sheet.Cells.Item[i+3,7]:=DataModWares.OracleDataSet8.fieldbyname('PERCENT').AsString;
    sheet.Cells.Item[i+3,8]:=DataModWares.OracleDataSet6.fieldbyname('INVENTAR_NO').AsString;
    sheet.Cells.Item[i+3,9]:=DataModWares.OracleDataSet8.fieldbyname('AMORT_DATE').AsString;
    sheet.Cells.Item[i+3,10]:=DataModWares.OracleDataSet8.fieldbyname('DEL_DATE').AsString;
//    sheet.Cells.Item[i,j]:=DataModWares.OracleDataSet8.fieldbyname('WARES_NAME').AsString;


      inc(i);
      sum:=sum+DataModWares.OracleDataSet8.fieldbyname('FIRST_PRICE').AsFloat;

      sum1:=sum1+DataModWares.OracleDataSet8.fieldbyname('REMAINDER').AsFloat;
      sum2:=sum2+DataModWares.OracleDataSet8.fieldbyname('ALL_AMORT').AsFloat;
      sum3:=sum3+DataModWares.OracleDataSet8.fieldbyname('AMORT').AsFloat;



      sheet.Cells.Item[i+3,3]:=sum;
      sheet.Cells.Item[i+3,4]:=sum1;
      sheet.Cells.Item[i+3,5]:=sum2;
      sheet.Cells.Item[i+3,6]:=sum3;

    DataModWares.OracleDataSet8.Next;

    end;
    ProgressBar1.StepBy(1);
     inc(i,3);
    DataModWares.OracleDataSet7.Next;


    end;

  ExcelApplication1.Visible[0]:=true;
    ProgressBar1.max:= 0;
    ExcelApplication1.Disconnect;


{  b:=integer(trunc(DateTimePicker2.DateTime));
       with DataModWares.ODSDeleted do
       begin
        close;
       SetVariable('BBDATE',a);
       SetVariable('EEDATE',b);
        open;
        end;
      with CMExcelExport1 do
   begin
      Connect;
      ExportDataset( DataModWares.ODSDeleted,'Deleted',True);
      Disconnect;
   end;
        }
end;

procedure TFormDeleted.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

end.
