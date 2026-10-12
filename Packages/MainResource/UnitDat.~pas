unit UnitDat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,Oracle;

type
  TFormDat = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DTPBegin: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    ButtonOk: TButton;
    RadioGExcel: TRadioGroup;
    procedure ButtonOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public

  procedure ShowSheet;
  procedure DestroySheet;
  procedure CreateSheet;
  procedure ColumnHeader(i,k:integer; status :string);
  procedure ExcelFormat(status :string);
  procedure ExportToExcel(status :string);
  procedure ExportDataTable;
    { Public declarations }
  end;

var
  FormDat: TFormDat;
       Exl,Sheet :Variant;
         f_status :string;
implementation

{$R *.DFM}
        uses ComObj, ComServ,MainResourceImpl,UnitData, UnitFilter;

procedure TFormDat.DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except
  end;
end;

procedure TFormDat.ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
  end;
end;


procedure TFormDat.CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;

procedure TFormDat.ExportDataTable;
var
First_Date :TDateTime;
Last_Date  :TDateTime;
BStrParam  :string;
begin


     First_Date:=Integer(Trunc(FormDat.DTPBegin.DateTime));
     Last_Date:=Integer(Trunc(FormDat.DTPEnd.DateTime));




       with DataModWares do
        begin
  BStrParam:=SB_MAIN_RESOURCE.CallStringFunction('get_view_turn_sql',[First_Date,Last_Date]);
          with  ODSGroupXLS do
           begin
             Close;
              Filtered:=false;
              Filter:=ODSGroups.Filter;
              Filtered:=true;
             Open;
             First;
           end;

            with  ODSWaresXLS do
             begin
                Close;
                   SQL.Clear;
                   DeclareVariable('groups_id',otInteger);
                   SQL.Add(BStrParam);
                   Filtered:=false;
                   Filter:=ODSWares.Filter;
                   Filtered:=true;
                Open;
              end;

       end;

end;


Procedure TFormDat.ExcelFormat(status :string);
begin
      if status='NB' then begin

     Sheet.Range['A1:A60000'].ColumnWidth:=4;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=4;
     Sheet.Range['D1:D60000'].ColumnWidth:=12;

     Sheet.Range['E1:E60000'].ColumnWidth:=13;
     Sheet.Range['F1:F60000'].ColumnWidth:=13;
     Sheet.Range['G1:G60000'].ColumnWidth:=13;
     Sheet.Range['H1:H60000'].ColumnWidth:=13;

     Sheet.Range['E1:E60000'].NumberFormat:='#,##0.00';
     Sheet.Range['F1:F60000'].NumberFormat:='#,##0.00';
     Sheet.Range['G1:G60000'].NumberFormat:='#,##0.00';
     Sheet.Range['H1:H60000'].NumberFormat:='#,##0.00';

      end;

     if status='NL' then begin
     Sheet.Range['A1:A60000'].ColumnWidth:=4;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=4;
     Sheet.Range['D1:D60000'].ColumnWidth:=12;

     Sheet.Range['E1:E60000'].ColumnWidth:=13;
     Sheet.Range['F1:F60000'].ColumnWidth:=13;
     Sheet.Range['G1:G60000'].ColumnWidth:=13;
     Sheet.Range['H1:H60000'].ColumnWidth:=13;

     Sheet.Range['E1:E60000'].NumberFormat:='#,##0.00';
     Sheet.Range['F1:F60000'].NumberFormat:='#,##0.00';
     Sheet.Range['G1:G60000'].NumberFormat:='#,##0.00';
     Sheet.Range['H1:H60000'].NumberFormat:='#,##0.00';
      end;

      if status='Both' then begin
     Sheet.Range['A1:A60000'].ColumnWidth:=4;
     Sheet.Range['B1:B60000'].ColumnWidth:=15;
     Sheet.Range['C1:C60000'].ColumnWidth:=4;
     Sheet.Range['D1:D60000'].ColumnWidth:=12;

     Sheet.Range['E1:E60000'].ColumnWidth:=13;
     Sheet.Range['F1:F60000'].ColumnWidth:=13;
     Sheet.Range['G1:G60000'].ColumnWidth:=13;
     Sheet.Range['H1:H60000'].ColumnWidth:=13;
     Sheet.Range['I1:I60000'].ColumnWidth:=4;
     Sheet.Range['J1:J60000'].ColumnWidth:=13;
     Sheet.Range['K1:K60000'].ColumnWidth:=13;
     Sheet.Range['L1:L60000'].ColumnWidth:=13;
     Sheet.Range['M1:M60000'].ColumnWidth:=13;


     Sheet.Range['E1:E60000'].NumberFormat:='#,##0.00';
     Sheet.Range['F1:F60000'].NumberFormat:='#,##0.00';
     Sheet.Range['G1:G60000'].NumberFormat:='#,##0.00';
     Sheet.Range['H1:H60000'].NumberFormat:='#,##0.00';

     Sheet.Range['J1:J60000'].NumberFormat:='#,##0.00';
     Sheet.Range['K1:K60000'].NumberFormat:='#,##0.00';
     Sheet.Range['L1:L60000'].NumberFormat:='#,##0.00';
     Sheet.Range['M1:M60000'].NumberFormat:='#,##0.00';

      end;


end;

Procedure TFormDat.ColumnHeader(i,k:integer; status :string);

begin
      if status='NB' then begin

          Sheet.Cells[i+k+1,1]:='ID';
          Sheet.Cells[i+k+1,1].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2]:='¬€саитин ады';
          Sheet.Cells[i+k+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3].Value:='‘аиз';
          Sheet.Cells[i+k+1,3].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:='Inv. тарихи';
          Sheet.Cells[i+k+1,4].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,5]:='»лкин д€й€ри';
          Sheet.Cells[i+k+1,5].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:='√алыг д€й€ри';
          Sheet.Cells[i+k+1,6].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:='јмортизасийа';
          Sheet.Cells[i+k+1,7].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8]:='…ыь. аморт';
          Sheet.Cells[i+k+1,8].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,8].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,9]:='јморт.тарихи';
          Sheet.Cells[i+k+1,9].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,9].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,10]:='Inventar є';
          Sheet.Cells[i+k+1,10].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,10].Font.Color:=clBlue;

      end;

      if status='NL' then begin

          Sheet.Cells[i+k+1,1]:='ID';
          Sheet.Cells[i+k+1,1].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2]:='ID';
          Sheet.Cells[i+k+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3].Value:='‘аиз';
          Sheet.Cells[i+k+1,3].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:='Invent тар.';
          Sheet.Cells[i+k+1,4].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,5]:='»лин.€вв.д€й.';
          Sheet.Cells[i+k+1,5].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:='√алыг д€й€ри';
          Sheet.Cells[i+k+1,6].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:='јмортизасийа';
          Sheet.Cells[i+k+1,7].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8]:='…ыь. аморт';
          Sheet.Cells[i+k+1,8].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,8].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,9]:='Amort. тарixi';
          Sheet.Cells[i+k+1,9].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,9].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,10]:='Inventar є';
          Sheet.Cells[i+k+1,10].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,10].Font.Color:=clBlue;
      end;
      if status='Both' then begin
          Sheet.Cells[i+k+1,1]:='ID';
          Sheet.Cells[i+k+1,1].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,1].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,2]:='¬€саитин ады';
          Sheet.Cells[i+k+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,2].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,3].Value:='‘аиз';
          Sheet.Cells[i+k+1,3].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,3].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,4]:='Inv. тарихи';
          Sheet.Cells[i+k+1,4].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,4].Font.Color:=clBlue;


          Sheet.Cells[i+k+1,5]:='»лкин д€й€ри';
          Sheet.Cells[i+k+1,5].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,5].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,6]:='√алыг д€й€ри';
          Sheet.Cells[i+k+1,6].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,6].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,7]:='јмортизасийа';
          Sheet.Cells[i+k+1,7].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,7].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,8]:='…ыь. аморт';
          Sheet.Cells[i+k+1,8].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,8].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,9].Value:='‘аиз ¬ерэи';
          Sheet.Cells[i+k+1,9].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,9].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,10]:='»лин.€вв.д€й.';
          Sheet.Cells[i+k+1,10].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,10].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,11]:='√алыг д€й€ри';
          Sheet.Cells[i+k+1,11].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,11].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,12]:='јмортизасийа';
          Sheet.Cells[i+k+1,12].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,12].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,13]:='…ыь. аморт';
          Sheet.Cells[i+k+1,13].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,13].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,14]:='јморт.тарихи';
          Sheet.Cells[i+k+1,14].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,14].Font.Color:=clBlue;

          Sheet.Cells[i+k+1,15]:='Inventar є';
          Sheet.Cells[i+k+1,15].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+1,15].Font.Color:=clBlue;
      end;


end;



Procedure TFormDat.ExportToExcel(status :string);
const
f=3;
dd=2;
var
i , j , k ,m  :Integer;

e_First_Price,e_Remainder,e_Amort,e_All_Amort
,e_Tax_First_Price,e_Tax_Remainder,e_Tax_Amort,e_Tax_All_Amort
 :real;


begin
try
Screen.Cursor:=crSQLWait;
    CreateSheet;
    ExportDataTable;


         k:=0;
  with DataModWares do  begin
        if status='NB' then begin

          ExcelFormat('NB');
                  Exl.WorkBooks[1].WorkSheets[1].name := ' Milli Bank ';
        for i:=1 to  ODSGroupXLS.RecordCount do
         begin

          Sheet.Cells[i+k,1]:=' Grup :';
          Sheet.Cells[i+k,1].Font.Bold :=true;
          Sheet.Cells[i+k,2]:=ODSGroupXLS.FieldByName('Name').AsString;
          Sheet.Cells[i+k,2].Font.Bold :=true;
          Sheet.Cells[i+k,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k,2].Font.Color:=clNavy;

               ColumnHeader(i,k,'NB');
                             e_First_Price:=0;
                             e_Remainder:=0;
                             e_All_Amort:=0;
                             e_Amort:=0;

         for j:=1 to ODSWaresXLS.RecordCount do begin

         e_First_Price:=e_First_Price+ODSWaresXLS.FieldByName('First_Price').AsFloat;
         e_Remainder:=e_Remainder+ODSWaresXLS.FieldByName('Remainder').AsFloat;
         e_Amort:=e_Amort+ODSWaresXLS.FieldByName('Amort').AsFloat;
         e_All_Amort:=e_All_Amort+ODSWaresXLS.FieldByName('All_Amort').AsFloat;
          Sheet.Cells[i+k+j+1,1]:=ODSWaresXLS.FieldByName('wares_id').AsFloat;
          Sheet.Cells[i+k+j+1,2]:=ODSWaresXLS.FieldByName('wares_name').AsString;
          Sheet.Cells[i+k+j+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+j+1,3]:=ODSWaresXLS.FieldByName('percent').AsFloat;
          Sheet.Cells[i+k+j+1,4]:=ODSWaresXLS.FieldByName('inventar_date').AsDateTime;
          Sheet.Cells[i+k+j+1,5]:=ODSWaresXLS.FieldByName('first_price').AsFloat;
          Sheet.Cells[i+k+j+1,6]:=ODSWaresXLS.FieldByName('remainder').AsFloat;
          Sheet.Cells[i+k+j+1,7]:=ODSWaresXLS.FieldByName('amort').AsFloat;
          Sheet.Cells[i+k+j+1,8]:=ODSWaresXLS.FieldByName('all_amort').AsFloat;
          Sheet.Cells[i+k+j+1,9]:=ODSWaresXLS.FieldByName('amort_date').AsDateTime;
          Sheet.Cells[i+k+j+1,10]:=ODSWaresXLS.FieldByName('inventar_no').AsString;

             ODSWaresXLS.Next;
            end;

           m:=ODSWaresXLS.RecordCount;
             if DTPBegin.DateTime=DTPEnd.DateTime then begin
               Sheet.Cells[i+k+m+2,5]:=FormatFloat('#,##0.00',e_First_Price);
               Sheet.Cells[i+k+m+2,6]:=FormatFloat('#,##0.00',e_Remainder);
               Sheet.Cells[i+k+m+2,7]:=FormatFloat('#,##0.00',e_Amort);
               Sheet.Cells[i+k+m+2,8]:=FormatFloat('#,##0.00',e_All_Amort);
             end;
            k:=k+m+3;
          ODSGroupXLS.Next;
      end;{for}
  end;  {if}

    if status='NL' then
    begin
              ExcelFormat('NL');
                  Exl.WorkBooks[1].WorkSheets[1].name := ' Vergi ';
        for i:=1 to  ODSGroupXLS.RecordCount do
         begin

          Sheet.Cells[i+k,1]:=' Grup :';
          Sheet.Cells[i+k,1].Font.Bold :=true;
          Sheet.Cells[i+k,2]:=ODSGroupXLS.FieldByName('Name').AsString;
          Sheet.Cells[i+k,2].Font.Bold :=true;
          Sheet.Cells[i+k,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k,2].Font.Color:=clBlue;

             ColumnHeader(i,k,'NL');
                             e_Tax_First_Price:=0;
                             e_Tax_Remainder:=0;
                             e_Tax_All_Amort:=0;
                             e_Tax_Amort:=0;

         for j:=1 to ODSWaresXLS.RecordCount do begin

         e_Tax_First_Price:=e_Tax_First_Price+ODSWaresXLS.FieldByName('tax_First_Price').AsFloat;
         e_Tax_Remainder:=e_Tax_Remainder+ODSWaresXLS.FieldByName('tax_Remainder').AsFloat;
         e_Tax_Amort:=e_Tax_Amort+ODSWaresXLS.FieldByName('tax_Amort').AsFloat;
         e_Tax_All_Amort:=e_Tax_All_Amort+ODSWaresXLS.FieldByName('tax_All_Amort').AsFloat;
         
          Sheet.Cells[i+k+j+1,1]:=ODSWaresXLS.FieldByName('wares_id').AsFloat;
          Sheet.Cells[i+k+j+1,2]:=ODSWaresXLS.FieldByName('wares_name').AsString;
          Sheet.Cells[i+k+j+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+j+1,3]:=ODSWaresXLS.FieldByName('tax_percent').AsFloat;
          Sheet.Cells[i+k+j+1,4]:=ODSWaresXLS.FieldByName('inventar_date').AsDateTime;
          Sheet.Cells[i+k+j+1,5]:=ODSWaresXLS.FieldByName('tax_first_price').AsFloat;
          Sheet.Cells[i+k+j+1,6]:=ODSWaresXLS.FieldByName('tax_remainder').AsFloat;
          Sheet.Cells[i+k+j+1,7]:=ODSWaresXLS.FieldByName('tax_amort').AsFloat;
          Sheet.Cells[i+k+j+1,8]:=ODSWaresXLS.FieldByName('tax_all_amort').AsFloat;
          Sheet.Cells[i+k+j+1,9]:=ODSWaresXLS.FieldByName('amort_date').AsDateTime;
          Sheet.Cells[i+k+j+1,10]:=ODSWaresXLS.FieldByName('inventar_no').AsString;

             ODSWaresXLS.Next;
            end;

           m:=ODSWaresXLS.RecordCount;
            if DTPBegin.DateTime=DTPEnd.DateTime then begin
               Sheet.Cells[i+k+m+2,5]:=FormatFloat('#,##0.00',e_Tax_First_Price);
               Sheet.Cells[i+k+m+2,6]:=FormatFloat('#,##0.00',e_Tax_Remainder);
               Sheet.Cells[i+k+m+2,7]:=FormatFloat('#,##0.00',e_Tax_Amort);
               Sheet.Cells[i+k+m+2,8]:=FormatFloat('#,##0.00',e_Tax_All_Amort);
           end;

            k:=k+m+3;
          ODSGroupXLS.Next;
      end;{for}
    end; {if}

if status='Both' then begin
                  ExcelFormat('Both');
                  Exl.WorkBooks[1].WorkSheets[1].name := ' Milli Bank ve Vergi ';
        for i:=1 to  ODSGroupXLS.RecordCount do
         begin

          Sheet.Cells[i+k,1]:=' Grup :';
          Sheet.Cells[i+k,1].Font.Bold :=true;
          Sheet.Cells[i+k,2]:=ODSGroupXLS.FieldByName('Name').AsString;
          Sheet.Cells[i+k,2].Font.Bold :=true;
          Sheet.Cells[i+k,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k,2].Font.Color:=clBlue;

                 ColumnHeader(i,k,'Both');
                             e_First_Price:=0;
                             e_Remainder:=0;
                             e_All_Amort:=0;
                             e_Amort:=0;
                             e_Tax_First_Price:=0;
                             e_Tax_Remainder:=0;
                             e_Tax_All_Amort:=0;
                             e_Tax_Amort:=0;

         for j:=1 to ODSWaresXLS.RecordCount do begin

         e_First_Price:=e_First_Price+ODSWaresXLS.FieldByName('First_Price').AsFloat;
         e_Remainder:=e_Remainder+ODSWaresXLS.FieldByName('Remainder').AsFloat;
         e_Amort:=e_Amort+ODSWaresXLS.FieldByName('Amort').AsFloat;
         e_All_Amort:=e_All_Amort+ODSWaresXLS.FieldByName('All_Amort').AsFloat;

         e_Tax_First_Price:=e_Tax_First_Price+ODSWaresXLS.FieldByName('Tax_First_Price').AsFloat;
         e_Tax_Remainder:=e_Tax_Remainder+ODSWaresXLS.FieldByName('Tax_Remainder').AsFloat;
         e_Tax_Amort:=e_Tax_Amort+ODSWaresXLS.FieldByName('Tax_Amort').AsFloat;
         e_Tax_All_Amort:=e_Tax_All_Amort+ODSWaresXLS.FieldByName('Tax_All_Amort').AsFloat;

          Sheet.Cells[i+k+j+1,1]:=ODSWaresXLS.FieldByName('wares_id').AsFloat;
          Sheet.Cells[i+k+j+1,2]:=ODSWaresXLS.FieldByName('wares_name').AsString;
          Sheet.Cells[i+k+j+1,2].Font.Name:='Arial AzLat';
          Sheet.Cells[i+k+j+1,3]:=ODSWaresXLS.FieldByName('percent').AsFloat;
          Sheet.Cells[i+k+j+1,4]:=ODSWaresXLS.FieldByName('inventar_date').AsDateTime;
          Sheet.Cells[i+k+j+1,5]:=ODSWaresXLS.FieldByName('first_price').AsFloat;
          Sheet.Cells[i+k+j+1,6]:=ODSWaresXLS.FieldByName('remainder').AsFloat;
          Sheet.Cells[i+k+j+1,7]:=ODSWaresXLS.FieldByName('amort').AsFloat;
          Sheet.Cells[i+k+j+1,8]:=ODSWaresXLS.FieldByName('all_amort').AsFloat;

          Sheet.Cells[i+k+j+1,9]:=ODSWaresXLS.FieldByName('tax_percent').AsFloat;
          Sheet.Cells[i+k+j+1,10]:=ODSWaresXLS.FieldByName('tax_first_price').AsFloat;
          Sheet.Cells[i+k+j+1,11]:=ODSWaresXLS.FieldByName('tax_remainder').AsFloat;
          Sheet.Cells[i+k+j+1,12]:=ODSWaresXLS.FieldByName('tax_amort').AsFloat;
          Sheet.Cells[i+k+j+1,13]:=ODSWaresXLS.FieldByName('tax_all_amort').AsFloat;
          Sheet.Cells[i+k+j+1,14]:=ODSWaresXLS.FieldByName('amort_date').AsDateTime;
          Sheet.Cells[i+k+j+1,15]:=ODSWaresXLS.FieldByName('inventar_no').AsString;

             ODSWaresXLS.Next;
            end;

           m:=ODSWaresXLS.RecordCount;
             if DTPBegin.DateTime=DTPEnd.DateTime then begin
               Sheet.Cells[i+k+m+2,5]:=FormatFloat('#,##0.00',e_First_Price);
               Sheet.Cells[i+k+m+2,6]:=FormatFloat('#,##0.00',e_Remainder);
               Sheet.Cells[i+k+m+2,7]:=FormatFloat('#,##0.00',e_Amort);
               Sheet.Cells[i+k+m+2,8]:=FormatFloat('#,##0.00',e_All_Amort);

               Sheet.Cells[i+k+m+2,10]:=FormatFloat('#,##0.00',e_Tax_First_Price);
               Sheet.Cells[i+k+m+2,11]:=FormatFloat('#,##0.00',e_Tax_Remainder);
               Sheet.Cells[i+k+m+2,12]:=FormatFloat('#,##0.00',e_Tax_Amort);
               Sheet.Cells[i+k+m+2,13]:=FormatFloat('#,##0.00',e_Tax_All_Amort);
              end;

            k:=k+m+3;
          ODSGroupXLS.Next;
      end;{for}
  end;  {if}






end;{with}

    ShowSheet;
  finally

   Exl.Range['A1:A1'].Select;

   Screen.Cursor := crDefault;
   DestroySheet;
   Close;
  end;


end;

procedure TFormDat.ButtonOkClick(Sender: TObject);
begin

case RadioGExcel.ItemIndex of
0:begin ExportToExcel('NB'); end;

1:begin ExportToExcel('NL'); end;

2:begin ExportToExcel('Both'); end;
end;


end;

procedure TFormDat.FormActivate(Sender: TObject);
begin
DTPBegin.Date:=DataModWares.SB_MAIN_RESOURCE.CallDateFunction('get_date',[]);
DTPEnd.Date:=DataModWares.SB_MAIN_RESOURCE.CallDateFunction('get_date',[]);
end;

end.
