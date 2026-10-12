unit MKSUnderTable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, HintBox, OleCtnrs, Buttons,DB, ExtCtrls;

type
  TfmUndertable = class(TForm)
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    OleContainer1: TOleContainer;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    hbError: THintBox;
    DBEdit1: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure OleContainer1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenContainer(Show : Boolean = True);
  end;

var
  fmUndertable: TfmUndertable;

implementation

uses MKSuggestionImpl,sboapiDataModuleimpl,SBTranslateProc;

{$R *.DFM}

procedure TfmUndertable.BitBtn3Click(Sender: TObject);
begin
    with OleContainer1 do
    DoVerb(ovPrimary);
end;

procedure TfmUndertable.RadioButton1Click(Sender: TObject);
begin
    with fmMKSuggestion, ODSTemplates do begin
    if State in [dsEdit, dsInsert] then Cancel;
    ODSTemplates.Edit;
    FormShow(Sender);
  end;
end;

procedure TfmUndertable.RadioButton2Click(Sender: TObject);
begin
    with fmMKSuggestion do
     ODSTemplates.Insert;
    FormShow(Sender);
end;

procedure TfmUndertable.FormCreate(Sender: TObject);
begin
    DBEdit1.DataSource := fmMKSuggestion.DSTemplates;
    DBEdit1.DataField := 'NAME';
    with fmMKSuggestion, ODSTemplates do
    if IsEmpty then RadioButton2.Checked := True
       else Edit;
       SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);

end;

procedure TfmUndertable.Panel1DblClick(Sender: TObject);
begin
    with fmMKSuggestion, ODSTemplates do
    if State = dsEdit then hbError.ShowMessage('edit') else hbError.ShowMessage('Insert');
end;

procedure TfmUndertable.BitBtn1Click(Sender: TObject);
var
  buf : TStream;
begin
  try
   Screen.Cursor := crHourGlass;                                                                                
   buf := TMemoryStream.Create;
   with fmMKSuggestion, ODSTemplates do
   begin
      if FieldByName('NAME').asString = '' then
      begin
         hbError.ShowMessage('Yeni şablonun adını daxil edin!');
         Screen.Cursor := crDefault;
         DBEdit1.SetFocus;
         Abort;
      end;
      OleContainer1.SaveToStream(Buf);
      TBlobField(FieldByName('TEMPLATE')).LoadFromStream(buf);
      Post;
      RefreshRecord;
   end;
  finally
   Screen.Cursor := crDefault;
   buf.Free;
  end;

  ModalResult := mrOk;
end;

procedure TfmUndertable.BitBtn2Click(Sender: TObject);
begin
     with fmMKSuggestion, ODSTemplates do
     Cancel;
end;

procedure TfmUndertable.OleContainer1Exit(Sender: TObject);
begin
    with OleContainer1 do
    Close //DoVerb(ovDiscardUndoState);
end;

procedure TfmUndertable.FormShow(Sender: TObject);
begin
     OpenContainer;
end;

procedure TfmUndertable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if OleContainer1.State in [osLoaded] then
    OleContainer1.Close;
end;

procedure TfmUndertable.OpenContainer(Show: Boolean);
var
  buf : TStream;
  FWordApl : Variant;
begin

  with fmMKSuggestion, ODSTemplates do
   if State in [dsEdit] then
   begin
      Buf := TMemoryStream.Create;
      TBlobField( FieldByName('TEMPLATE')).SaveToStream(Buf);
      Buf.Position := 0;
      OleContainer1.LoadFromStream(Buf);
   end
   else
     OleContainer1.CreateObject('Word.Document', False);  

   if Show then
   OleContainer1.DoVerb(ovShow);

end;

end.
