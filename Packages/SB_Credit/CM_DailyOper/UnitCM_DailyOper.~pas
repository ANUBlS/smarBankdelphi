unit UnitCM_DailyOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, CheckLst, ExtCtrls, ComCtrls, CMExcelExport;

type
  TFormDailyOper = class(TForm)
    ChBoxFilial: TCheckListBox;
    ExcelExporter: TCMExcelExport;
    Panel1: TPanel;
    ChBoxSelectAll: TCheckBox;
    BtnOK: TButton;
    BtnExcel: TButton;
    DTPickerPayDate: TDateTimePicker;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label2: TLabel;
    Label1: TLabel;
    CMExcelExport1: TCMExcelExport;
    excelehtiyat: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure ChBoxSelectAllClick(Sender: TObject);
    procedure checkvalutaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure excelehtiyatClick(Sender: TObject);
  private
    { Private declarations }
    procedure filialyaz;
  public
    { Public declarations }
  end;
  
var
  FormDailyOper: TFormDailyOper;
    filialStr: string;
     procedure InitPlugin(s:string);export;
     implementation

  uses CommonDecls,systemstate, UnitDataModDailyOper;
{$R *.DFM}
 procedure InitPlugin(s:string);export;
begin
   FormDailyOper.ShowModal;
end;
exports
     InitPlugin;
 procedure TFormDailyOper.filialyaz;
  var
  i : integer;
 begin
  filialStr:='';
   for i:=0 to DataModDailyOper.ODS_FILIAL.RecordCount-1 do
        begin
           if ChBoxFilial.Checked[i] =true then
             if filialStr='' then
             filialStr:=''''+ChBoxFilial.Items[i]+'''' else
          filialStr:=filialStr+','+''''+ChBoxFilial.Items[i]+'''';
             end ;
 end;

procedure TFormDailyOper.FormCreate(Sender: TObject);

   var
      i: integer;
begin
DataModDailyOper:=TDataModDailyOper.Create(self);
      DataModDailyOper.ODS_Valuta.First;
     for i:=0 to DataModDailyOper.ODS_Valuta.RecordCount-1 do
       begin
        ComboBox1.Items.Add(DataModDailyOper.ODS_Valuta.fieldbyname('val_name').AsString);
        DataModDailyOper.ODS_Valuta.Next;
       end;
       ComboBox1.ItemIndex:=0;
    DataModDailyOper.ODS_FILIAL.First;
  for i:=0 to DataModDailyOper.ODS_FILIAL.RecordCount-1 do
   begin
    ChBoxFilial.Items.Add(DataModDailyOper.ODS_FILIAL.fieldbyname('name').AsString);
    ChBoxFilial.Checked[i]:=True;
    ChBoxSelectAll.Checked:=True;
   DataModDailyOper.ODS_FILIAL.Next;
     end;
DTPickerPayDate.Date:=DataModDailyOper.odstime.fieldbyname('tek_dat').AsDateTime;
    end;

procedure TFormDailyOper.BtnOKClick(Sender: TObject);
  var
   
   valutaStr: string;
   tarix :TDateTime;
begin
   filialyaz;
         if ComboBox1.ItemIndex=0 then
         with DataModDailyOper.ODS_CMACTIVE do begin
   Close;
   tarix := TRUNC(DTPickerPayDate.Date);
   SetVariable('v_PayDate',tarix);
   SetVariable('k_givendate',tarix);
   SetVariable('h_date',tarix);
   SQL[20]:= ' and f.name in ('+ filialStr+') ';
   SQL[21] := '';
   Open;
  end
   else
    with DataModDailyOper.ODS_CMACTIVE do begin
    valutaStr:=ComboBox1.Text;
   close;
   tarix := TRUNC(DTPickerPayDate.Date);
   SetVariable('v_PayDate',tarix);
   SetVariable('k_givendate',tarix);
   SetVariable('h_date',tarix);
   SQL[20]:= ' and f.name in ('+ filialStr+') ';
   SQL[21]:= ' and j.val_name='''+valutaStr+''' ';
   Open;
  end;
    end;

procedure TFormDailyOper.BtnExcelClick(Sender: TObject);
begin
 BtnExcel.Cursor:=crSQLWait;
 Application.ProcessMessages;
 BtnOK.Click;
 with ExcelExporter do
  begin
   if not Connected then Connect;
    ExportDataset(DataModDailyOper.ODS_CMACTIVE,'Customers',true);
    Disconnect;
  end;
  BtnExcel.Cursor:=crDefault;
end;

procedure TFormDailyOper.ChBoxSelectAllClick(Sender: TObject);
 var
  i :integer;
begin
    if ChBoxSelectAll.Checked=true then
    for i:=0 to ChBoxFilial.Items.Count-1 do
    ChBoxFilial.Checked[i]:=True else
     for i:=0 to ChBoxFilial.Items.Count-1 do
    ChBoxFilial.Checked[i]:=False;
end;

procedure TFormDailyOper.checkvalutaClick(Sender: TObject);
 //var
   //i : integer;
begin
 //for i:=0 to ChBoxValuta.Items.Count-1 do
  //begin
   //if checkvaluta.Checked=true then
    //ChBoxValuta.Checked[i]:=True else
    //ChBoxValuta.Checked[i]:=False;
  //end;
end;

procedure TFormDailyOper.Button1Click(Sender: TObject);
 var
   i :integer;
begin
  ComboBox1.ItemIndex:=0;
  DTPickerPayDate.Date:=DataModDailyOper.odstime.fieldbyname('tek_dat').AsDateTime;
  for i:=0 to DataModDailyOper.ODS_FILIAL.RecordCount-1 do
   begin
    ChBoxFilial.Checked[i]:=True;
    ChBoxSelectAll.Checked:=True;
     end;
  FormDailyOper.close;
end;

procedure TFormDailyOper.excelehtiyatClick(Sender: TObject);
 var
  tarix :TDate;
  //filialstr : string;
  valutastr : string;
begin
 filialyaz;
 if ComboBox1.ItemIndex=0 then
         with DataModDailyOper.ODS_CMACTIV_EHTIYAT do begin
   Close;
   tarix := TRUNC(DTPickerPayDate.Date);
   SetVariable('v_PayDate',tarix);
   SetVariable('k_givendate',tarix);
   SetVariable('h_date',tarix);
   SQL[20]:= ' and f.name in ('+ filialStr+') ';
   Open;
  end
   else
    with DataModDailyOper.ODS_CMACTIV_EHTIYAT do begin
    valutaStr:=ComboBox1.Text;
   close;
   tarix := TRUNC(DTPickerPayDate.Date);
   SetVariable('v_PayDate',tarix);
   SetVariable('k_givendate',tarix);
   SetVariable('h_date',tarix);
   SQL[20]:= ' and f.name in ('+ filialStr+') ';
   SQL[21]:= ' and j.val_name='''+valutaStr+''' ';
   Open;
  end;
    

 with ExcelExporter do
  begin
   if not Connected then Connect;
    ExportDataset(DataModDailyOper.ODS_CMACTIV_EHTIYAT,'Customers',true);
    Disconnect;
end;
end;

initialization
   FormDailyOper := TFormDailyOper.Create(CommonApplication);

end.
