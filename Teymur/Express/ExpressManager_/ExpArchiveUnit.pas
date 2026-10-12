unit ExpArchiveUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Grids, DBGrids, ToolWin, ImgList, StdCtrls, Buttons,
  DBCtrls, CMCurrencyEdit, Menus, XDBGrids;

type
  TExpArchiveForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Button1: TButton;
    CMCurrencyEdit1: TCMCurrencyEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ImageList2: TImageList;
    Panel4: TPanel;
    XDBGrid1: TXDBGrid;
    procedure ToolButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure XDBGrid1TitleClick(Column: TXColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpArchiveForm: TExpArchiveForm;

implementation
uses ExpDataModuleUnit, OrderPrintXUnit, ExpUnitImpl;
var bdate:Tdatetime;
    edate:Tdatetime;
{$R *.DFM}

procedure TExpArchiveForm.ToolButton2Click(Sender: TObject);
begin
  Panel1.Visible:=not Panel1.Visible;
end;

procedure TExpArchiveForm.SpeedButton1Click(Sender: TObject);
begin
  Panel1.Visible:=false;
end;

procedure TExpArchiveForm.ToolButton1Click(Sender: TObject);
begin
  with ExpDataModule,ExpBatchsArchiveDataSet do
  begin
    close;
    SetVariable('bdate',bdate);
    SetVariable('edate',edate);
    open;
  end;
end;

procedure TExpArchiveForm.DateTimePicker1Change(Sender: TObject);
begin
  bdate:=trunc(DateTimePicker1.DateTime);
  edate:=trunc(DateTimePicker2.DateTime);
end;


procedure TExpArchiveForm.Button1Click(Sender: TObject);
begin
  if (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) then
  begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='Filial='+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString;
      Filtered:=true;
    end;
  end;
  if (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) then
  begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString;
      Filtered:=true;
    end;
  end;
  if (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) then
  begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString;
      Filtered:=true;
    end;
  end;

  if (CMCurrencyEdit1.Value>0) and(CheckBox4.Checked) then
  begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='Amount='+CurrToStr(CMCurrencyEdit1.Value);
      Filtered:=true;
    end;
  end;
{-----------------------------------------------------------------------------------------------------------------------------------------------}
   if (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial='+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')';
      Filtered:=true;
    end;
  end;

   if (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial='+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')';
      Filtered:=true;
    end;
  end;

  if  (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (CMCurrencyEdit1.Value>0)and(CheckBox4.Checked)         then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial='+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;
{-----------------------------------------------------------------------------------------------------------------------------------------------}

  if  (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')';
      Filtered:=true;
    end;
  end;

   if (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) and
      (CMCurrencyEdit1.Value>0)        and(CheckBox4.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;
{-----------------------------------------------------------------------------------------------------------------------------------------------------}
  if  (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) and
      (CMCurrencyEdit1.Value>0)        and(CheckBox4.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;

{-------------------------------------------------------------------------------------------------------------------------------------------------------}
  if  (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial='+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')';
      Filtered:=true;
    end;
  end;

 if   (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) and
      (CMCurrencyEdit1.Value>0)        and(CheckBox4.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial= '+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;

 if   (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) and
      (CMCurrencyEdit1.Value>0)        and(CheckBox4.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;
{-------------------------------------------------------------------------------------------------------------------------------------------------------}

 if   (DBLookupComboBox1.KeyValue<>-1) and(CheckBox1.Checked) and
      (DBLookupComboBox2.KeyValue<>-1) and(CheckBox2.Checked) and
      (DBLookupComboBox3.KeyValue<>-1) and(CheckBox3.Checked) and
      (CMCurrencyEdit1.Value>0)        and(CheckBox4.Checked) then
   begin
    with ExpDataModule,ExpBatchsArchiveDataSet do
    begin
      Filtered:=False;
      Filter:='(Filial= '+DBLookupComboBox1.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(BFilial='+DBLookupComboBox2.ListSource.DataSet.fieldbyname('id').AsString+')'+
              '(Val_Cod='+DBLookupComboBox3.ListSource.DataSet.fieldbyname('VALUTE').AsString+')'+
              '(Amount='+CurrToStr(CMCurrencyEdit1.Value)+')';
      Filtered:=true;
    end;
  end;

end;

procedure TExpArchiveForm.N1Click(Sender: TObject);
begin
  IF NOT Assigned(QuickReportXOrder) THEN
  QuickReportXOrder:=TQuickReportXOrder.Create(APPLICATION);
(* ------------------------------------------------------------------------Elave1---------------------------------------------------------------------*)
   with QuickReportXOrder,ExpDataModule do
   begin
     {QRLabel3.Caption :=ExpBatchsArchiveDataSetVFILIALNAME.AsString;
     QRLabel7.Caption :=ExpBatchsArchiveDataSetRECDATE.AsString;
     QRLabel11.Caption:=ExpBatchsArchiveDataSetFILIALNAME.AsString;
     QRLabel13.Caption:=ExpBatchsArchiveDataSetVFILIALNAME.AsString;
     QRLabel15.Caption:=ExpBatchsArchiveDataSetAMOUNT.AsString;
     QRLabel17.Caption:=ExpFormAdd.mani(ExpBatchsArchiveDataSetAMOUNT.AsVariant);
     QRLabel19.Caption:=Repair.CallFloatFunction('Exp_comissionoperation',[ExpTypeDataSetid.asinteger,ExpBatchsArchiveDataSetAMOUNT.Asfloat]);
     QRLabel22.Caption:=ExpBatchsArchiveDataSetCUSTSEND.AsString;
     QRLabel24.Caption:=ExpBatchsArchiveDataSetPASSPER.AsString+ExpBatchsArchiveDataSetPASPNUM.AsString;
     QRLabel26.Caption:=ExpBatchsArchiveDataSetPASPPLACE.AsString;
     QRLabel28.Caption:=ExpBatchsArchiveDataSetPASPDATE.AsString;
     QRLabel31.Caption:=ExpBatchsArchiveDataSetCUSTREC.AsString;
     QRLabel70.Caption:=ExpBatchsArchiveDataSetVPASSPER.AsString+ExpBatchsArchiveDataSetVPASPNUM.AsString;
     QRLabel71.Caption:=ExpBatchsArchiveDataSetVPASPPLACE.AsString;
     QRLabel72.Caption:=ExpBatchsArchiveDataSetVPASPDATE.AsString;   }


(* ------------------------------------------------------------------------Elave2---------------------------------------------------------------------*)
    { QRLabel36.Caption:=ExpBatchsArchiveDataSetVFILIALNAME.AsString;
     QRLabel40.Caption:=ExpBatchsArchiveDataSetRECDATE.AsString;
     QRLabel44.Caption:=ExpBatchsArchiveDataSetFILIALNAME.AsString;
     QRLabel46.Caption:=ExpBatchsArchiveDataSetVFILIALNAME.AsString;
     QRLabel48.Caption:=ExpBatchsArchiveDataSetAMOUNT.AsString;
     QRLabel50.Caption:=ExpFormAdd.mani(ExpBatchsArchiveDataSetAMOUNT.AsVariant);
     QRLabel52.Caption:=Repair.CallFloatFunction('Exp_comissionoperation',[ExpTypeDataSetid.asinteger,ExpBatchsArchiveDataSetAMOUNT.Asfloat]);
     QRLabel55.Caption:=ExpBatchsArchiveDataSetCUSTSEND.AsString;
     QRLabel57.Caption:=ExpBatchsArchiveDataSetPASSPER.AsString+ExpBatchsArchiveDataSetPASPNUM.AsString;
     QRLabel59.Caption:=ExpBatchsArchiveDataSetPASPPLACE.AsString;
     QRLabel61.Caption:=ExpBatchsArchiveDataSetPASPDATE.AsString;
     QRLabel64.Caption:=ExpBatchsArchiveDataSetCUSTREC.AsString;
     QRLabel76.Caption:=ExpBatchsArchiveDataSetVPASSPER.AsString+ExpBatchsArchiveDataSetVPASPNUM.AsString;
     QRLabel77.Caption:=ExpBatchsArchiveDataSetVPASPPLACE.AsString;
     QRLabel78.Caption:=ExpBatchsArchiveDataSetVPASPDATE.AsString; }


    Preview;

end;

end;

procedure TExpArchiveForm.FormCreate(Sender: TObject);
begin
  bdate:=date;
  edate:=date;
end;

procedure TExpArchiveForm.XDBGrid1TitleClick(Column: TXColumn);
begin
  with ExpDataModule,ExpBatchsDataSet do
  begin
    Close;
    if Column.Title.MarkerIndex=2 then SetVariable('title',Column.FieldName+' '+'ASC')
    else SetVariable('title',Column.FieldName+' '+'DESC');
    open;
  end;
end;

end.
