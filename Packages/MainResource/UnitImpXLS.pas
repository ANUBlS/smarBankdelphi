unit UnitImpXLS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, OleServer, ExcelXP, ComCtrls;

type
  TFormImpXLS = class(TForm)
    PanelMain: TPanel;
    CBoxStartRow: TComboBox;
    BitBtnOk: TBitBtn;
    ExcelApp: TExcelApplication;
    OpenDlg: TOpenDialog;
    LabelSelRow: TLabel;
    Label1: TLabel;
    DTPLastAmort_date: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImpXLS: TFormImpXLS;

implementation

uses UnitData, sboapiDataModuleImpl, SBTranslateProc;

{$R *.DFM}

procedure TFormImpXLS.FormCreate(Sender: TObject);
begin
CBoxStartRow.ItemIndex:=0;
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormImpXLS.BitBtnOkClick(Sender: TObject);
const
  StartRow = 3;
  RootCell = 1;
var
    V, Sheet, Sheets  :Variant;
    Row : Integer;
    CellStr : String;

                     v_wares_name        :string ;
                     v_inventar_date     :TDateTime;
                     v_groups_id         :real;
                     v_first_price       :real;
                     v_remainder         :real;
                     v_amort             :real;
                     v_all_amort         :real;
                     v_percent           :real;
                     v_tax_first_price   :real;
                     v_tax_remainder     :real;
                     v_tax_amort         :real;
                     v_tax_all_amort     :real;
                     v_tax_percent       :real;
                     v_amort_date        :TDateTime;

begin


   Row := StartRow;
   V:=ExcelApp.Application;
   ExcelApp.Connect;


    if OpenDlg.Execute then begin
     V.Workbooks.Open(OpenDlg.FileName);
     Sheet := V.Workbooks[1].Worksheets['amort'];
     Sheets := V.Sheets;
     CellStr := Sheet.cells[Row,RootCell];

   while CellStr <> '' do
   begin
       v_amort_date :=Int(DTPLastAmort_date.DateTime);
       v_groups_id :=DataModWares.ODSGroups.fieldbyname('id').asinteger;
       v_wares_name := Sheet.cells[Row,1];
       v_inventar_date:= Int(StrToDateTime(Sheet.cells[Row,2]));
       v_percent := Sheet.cells[Row,3];
       v_first_price := Sheet.cells[Row,4];
       v_all_amort := Sheet.cells[Row,5];
       v_amort :=Sheet.cells[Row,6];;
       v_remainder := Sheet.cells[Row,7];
       v_tax_percent := Sheet.cells[Row,8];
       v_tax_first_price := Sheet.cells[Row,9];
       v_tax_all_amort := Sheet.cells[Row,10];
       v_tax_amort := Sheet.cells[Row,11];
       v_tax_remainder :=  Sheet.cells[Row,12];

          Inc(Row);
       CellStr := Sheet.cells[Row,RootCell];

            DataModWares.SB_MAIN_RESOURCE.CallProcedure('add_wares',[
                                                      v_wares_name,
                                                      v_inventar_date,
                                                      v_groups_id,
                                                      v_first_price,
                                                      v_remainder,
                                                      v_amort,
                                                      v_all_amort,
                                                      v_percent,
                                                      v_tax_first_price,
                                                      v_tax_remainder,
                                                      v_tax_amort,
                                                      v_tax_all_amort,
                                                      v_tax_percent,
                                                      v_amort_date,
                                                      '',
                                                      ''
                                                        ]);


     end;
          end;

     ExcelApp.Quit;
     ExcelApp.Disconnect;



end;

end.
