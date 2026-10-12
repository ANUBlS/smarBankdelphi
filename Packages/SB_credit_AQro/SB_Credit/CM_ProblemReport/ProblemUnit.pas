unit ProblemUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList,  StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ExtCtrls,
   OleServer, ImgList, Buttons, variants,{Outlook8,} WordXP, DBGridEh,ComObj;

type
  TProblemForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    ActionList1: TActionList;
    ActinPrint: TAction;
    ActnClose: TAction;
    WordApplication: TWordApplication;
    WordDocument: TWordDocument;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ImageList1: TImageList;
    procedure ActnCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActinPrintExecute(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private


  public
  TemplID,PCreditid:Integer;
  FTemplatePath:Olevariant;

    { Public declarations }
  end;

var
  ProblemForm: TProblemForm;

implementation
  uses  ProblemDataModImplUnit, CommonDecls,CurrencyToHR_Problem_Impl;
{$R *.DFM}

  procedure TProblemForm.ActnCloseExecute(Sender: TObject);
  begin
    Close;
  end;

  procedure TProblemForm.FormCreate(Sender: TObject);


  begin
     ProblemDataModule := TProblemDataModule.Create(Self);

  end;

  procedure TProblemForm.FormDestroy(Sender: TObject);
  begin

    ProblemDataModule.TemplatesDataSet.CloseAll;
    ProblemDataModule.BookmarksDataSet.CloseAll;
    ProblemDataModule.CreditInfoDataSet.CloseAll;
    ProblemDataModule.Free;

  end;

procedure TProblemForm.ActinPrintExecute(Sender: TObject);
var
  WordApp, WordDoc, BmRange: OleVariant;
  i: Integer;
  oBookMarkName, tFieldName, ValueText: string;

    girov,ammount :real;
    girovv, yazidat, valname,yaz: string;
    dat :integer;

begin
  // 1. ?????????, ?????????? ?? ????
 // FTemplatePath := ProblemDataModule.TemplatesDataSet.FieldByName('Path').AsString;
 // TemplID := ProblemDataModule.TemplatesDataSet.FieldByName('ID').AsInteger;

     ProblemDataModule.BookmarksDataSet.SetVariable('templid',TemplID);
     ProblemDataModule.BookmarksDataSet.Open;
     ProblemDataModule.yazi.SetVariable('id', PCreditid);
     ProblemDataModule.yazi.open;
     ammount :=ProblemDataModule.yazi.FieldByName('CREDITLINEAMOUNT').asfloat;
     dat:=ProblemDataModule.yazi.FieldByName('per').asinteger;
     girov:=ProblemDataModule.yazi.FieldByName('pledgeprice').asfloat;
     valname:=ProblemDataModule.yazi.FieldByName('VALU_NAME').asstring;
     yaz:=CurrencyToHR_Azeri(ammount,0,[0],valname);
     yazidat:=CurrencyToHR_Azeri(dat,0,[0],'ay');
     girovv:=CurrencyToHR_Azeri(girov,0,[0],'Az?rbaycan manatý');
     ProblemDataModule.CreditInfoDataSet.Close;
     ProblemDataModule.CreditInfoDataSet.SetVariable('crid', PCreditid);
     ProblemDataModule.CreditInfoDataSet.SetVariable('man', yaz);
     ProblemDataModule.CreditInfoDataSet.SetVariable('dat', yazidat);
     ProblemDataModule.CreditInfoDataSet.SetVariable('gir', girovv);
     ProblemDataModule.CreditInfoDataSet.Open;

  if not FileExists(FTemplatePath) then
  begin
    ShowMessage('Fayýl tapýlmadý: ' + FTemplatePath);
    Exit;
  end;

  // 2. ??????? ?????? Word
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;

  // 3. ????????? ??????
  WordDoc := WordApp.Documents.Open(FTemplatePath);

  try
    // 4. ???? ?? ???? ?????????
    for i := 1 to WordDoc.Bookmarks.Count do
    begin
      oBookMarkName := WordDoc.Bookmarks.Item(i).Name;

      // 5. ???? FIELDNAME ??? ????????
      ProblemDataModule.ReplaceDataSet.Close;
      ProblemDataModule.ReplaceDataSet.SetVariable('tid', TemplID);
      ProblemDataModule.ReplaceDataSet.SetVariable('bname', oBookMarkName);
      ProblemDataModule.ReplaceDataSet.Open;

      // ???????? ?? ????????? — ??? ???????? ? []
      ValueText := '[' + oBookMarkName + ']';

      if not ProblemDataModule.ReplaceDataSet.IsEmpty then
      begin
        tFieldName := ProblemDataModule.ReplaceDataSet.FieldByName('FIELDNAME').AsString;
        tFieldName := UpperCase(Trim(tFieldName)); // ???????? ? ???????? ????????

        if not ProblemDataModule.CreditInfoDataSet.Active then
          ProblemDataModule.CreditInfoDataSet.Open;

        if (not ProblemDataModule.CreditInfoDataSet.IsEmpty) and
           (ProblemDataModule.CreditInfoDataSet.FindField(tFieldName) <> nil) then
        begin
          ValueText := ProblemDataModule.CreditInfoDataSet.FieldByName(tFieldName).AsString;
        end
        else
        begin
          ShowMessage('Sah? tapýlmadý v? ya boþdur: ' + tFieldName);
        end;
      end;

      // 6. ????????? ????? ? ????????
      BmRange := WordDoc.Bookmarks.Item(oBookMarkName).Range;
      BmRange.Text := ValueText;

      // 7. ??????? ???? ???? ??? ??????
      if ValueText = '[' + oBookMarkName + ']' then
        BmRange.Font.Color := wdColorRed
      else
        BmRange.Font.Color := wdColorAutomatic;

      // 8. ??????????????? ????????
      WordDoc.Bookmarks.Add(oBookMarkName, BmRange);
    end;

    ShowMessage('Þablon açýldý v? bütün bukmarklar yerl?þdirildi.');
  except
    on E: Exception do
      ShowMessage('X?ta: ' + E.Message);
  end;
end;
 procedure TProblemForm.FormCanResize(Sender: TObject; var NewWidth,
                                     NewHeight: Integer; var Resize: Boolean);
  begin
      Resize := False;
  end;

  procedure TProblemForm.FormKeyPress(Sender: TObject; var Key: Char);
  begin
    if ORD(Key) = VK_ESCAPE then
    Close;
  end;

end.



