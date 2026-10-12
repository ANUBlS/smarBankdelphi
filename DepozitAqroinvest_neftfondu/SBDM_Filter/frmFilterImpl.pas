unit frmFilterImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, NLSLocalizer, ComCtrls,
  CMExcelExport;

type
  TfrmFilter = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    LCBPersons: TDBLookupComboboxEh;
    CBPersons: TCheckBox;
    GroupBox5: TGroupBox;
    LCBValute: TDBLookupComboboxEh;
    CBValute: TCheckBox;
    GroupBox6: TGroupBox;
    LCBFilial: TDBLookupComboboxEh;
    CBFilial: TCheckBox;
    Panel4: TPanel;
    GroupBox8: TGroupBox;
    LCBUsers: TDBLookupComboboxEh;
    CBUsers: TCheckBox;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    LCBCustomer: TDBLookupComboboxEh;
    CBCustomer: TCheckBox;
    GroupBox2: TGroupBox;
    LCBCategories: TDBLookupComboboxEh;
    CBCategories: TCheckBox;
    GroupBox3: TGroupBox;
    LCBDepositTypes: TDBLookupComboboxEh;
    CBDepositTypes: TCheckBox;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    ButtonClose: TButton;
    GroupBox7: TGroupBox;
    GroupBox9: TGroupBox;
    LCBStatus: TComboBox;
    CBStatus: TCheckBox;
    DTPOpenDate: TDateTimePicker;
    DTPCloseDate: TDateTimePicker;
    CBOpendat: TCheckBox;
    Label1: TLabel;
    ButtonExport: TButton;
    EExport: TCMExcelExport;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function BuildFilterString : String;
  public
    { Public declarations }
  end;

var
  frmFilter: TfrmFilter;

  procedure exportproc(S:String);export;
implementation

{$R *.DFM}

uses CommonDeclsImpl,dmFilterImpl;



procedure exportproc(S:String);export;
begin
   frmFilter.ShowModal;
end;

exports
  exportproc;

function TfrmFilter.BuildFilterString : String;

  procedure ConcatFilter(var S: String; const Prefix : String; Checked : Boolean; KeyValue : Variant);
  const
     csFormat = '(%s=%s)';
  var
    Temp : String;   
  begin

    if Checked then
    begin
      Temp := Format(csFormat,[Prefix,Keyvalue]);
      if S = '' then
        S := Temp
      else
        S :=S + 'and ' + Temp;
    end;
    
  end;  // Concat Filter

  procedure  ConcatFilter1(var S: String; var Prefix : String);
  begin
     if (S <> '') and (Prefix <> '') then S := S+' and '+Prefix;
     if (S = '') and (Prefix <> '') then S := Prefix;
  end;

var
  FStatus,FopenDat1,FopenDat2,FopenDat : String;
begin

  Result := '';
  FStatus := '';
  FopenDat1 := '';
  FopenDat2 := '';
  FopenDat := '';
  
  ConcatFilter(Result,'CURRENCY',CBValute.Checked,LCBValute.KeyValue);
  ConcatFilter(Result,'BRANCHID',CBFilial.Checked,LCBFilial.KeyValue);
  ConcatFilter(Result,'PERSONALTYPE',CBPersons.Checked,LCBPersons.KeyValue);
  ConcatFilter(Result,'CLIENTTYPE',CBCategories.Checked,LCBCategories.KeyValue);
  ConcatFilter(Result,'ContractType',CBDepositTypes.Checked,LCBDepositTypes.KeyValue);
  ConcatFilter(Result,'CUSTOMERID',CBCustomer.Checked,LCBCustomer.KeyValue);
  ConcatFilter(Result,'usid',CBUsers.Checked,LCBUsers.KeyValue);

  if CBStatus.Checked then
     Case LCBStatus.ItemIndex of
          0: FStatus := '(status = 1)';
          1: FStatus := '(Status = 0)';
     end;

  if CBOpendat.Checked then
  begin
     FopenDat1 := ' opendate >=  '''+FormatDateTime('dd/MM/yyyy',DTPOpenDate.Date)+'''';
     FopenDat2 := ' opendate <=  '''+FormatDateTime('dd/MM/yyyy',DTPCloseDate.Date)+'''';
     FopenDat := '('+'('+FopenDat1+')'+' and '+'('+FopenDat2+')'+')';
  end;


  ConcatFilter1(Result,FStatus);
  ConcatFilter1(Result,FopenDat);

 // ShowMessage(Result)

end;


procedure TfrmFilter.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   Resize := False;
end;

procedure TfrmFilter.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if ord(Key) = VK_ESCAPE then close;
end;

procedure TfrmFilter.ButtonOkClick(Sender: TObject);
begin

   with CommonGrid,DataSource.DataSet,SelectedRows do
   begin
      Clear;
      Filtered := False;
      Filter := BuildFilterString;
     // ShowMessage(Filter); //
      Filtered := True;
   end;
end;

procedure TfrmFilter.ButtonCancelClick(Sender: TObject);
begin
   with CommonGrid,DataSource.DataSet do
   begin
      Filtered := False;
      Filter := '';
   end;
end;

procedure TfrmFilter.ButtonCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmFilter.ButtonExportClick(Sender: TObject);
begin
   with EExport do
   begin
      CommonGrid.DataSource.DataSet.Last;
      Connect;
      ExportDataset(CommonGrid.DataSource.DataSet,'Depozitler',True);
      Disconnect;
   end;
end;

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
   dmFilter := TdmFilter.Create(Self);
end;

procedure TfrmFilter.FormDestroy(Sender: TObject);
begin
   dmFilter.Free;
end;

procedure TfrmFilter.FormShow(Sender: TObject);
begin
   LCBStatus.ItemIndex := 0;
end;

initialization
   frmFilter := TfrmFilter.Create(CommonApplication);

end.
