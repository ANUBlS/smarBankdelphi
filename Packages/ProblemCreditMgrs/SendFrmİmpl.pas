unit SendFrmİmpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Buttons, Mask, DBCtrlsEh, DBLookupEh,DB;

type
  TSendFrm = class(TForm)
    Label1: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private

    { Private declarations }
     function ExcuseMeUser(Question : String) : Boolean;
  public
    { Public declarations }
  end;

var
  SendFrm: TSendFrm;

implementation
 uses PrCmDMImpl,ProblemCreditManagers;
{$R *.dfm}
 function TSendFrm.ExcuseMeUser(Question : String) : Boolean;
begin
  Result :=
    MessageDlg(
      Question
     ,mtConfirmation
     ,[mbYes,mbNo]
     ,0
     ) = mrYes;
end;
procedure TSendFrm.BitBtn1Click(Sender: TObject);
resourcestring
  rsConfirmForOne = '%s  - № li kredit  %s. Əminsiniz?';
  rsConfirmForAll = '%d - sayda kredit dosyesi %s. Əminsiniz?';
  rsCalcPercent   = 'göndəriləcək';
  cs_CommitInformation = 'Ümumi əməliyyatlar: %d'+#13+'Göndərildi';
  var
   i,id,TrCount,CommitedCount:integer;
   IDs:WideString;

begin
  IDs :='';
  TrCount :=0;
 if DBLookupComboboxEh2.text='' then
   begin
   ShowMessage('Gondərəcəyiniz yeri seçin!');
   exit;
   end;
 With ProblemCreditMgr.MainGrid.SelectedRows, PrCmDM,IntCache do
 begin
   if Count = 0 then
   begin
     IDs:=FieldByName('ID').AsString;
   end
   else
   begin
     DisableControls;
     try
     for i :=0 to Count -1 do
     begin
       inc(TrCount);
       GotoBookmark(TBookmark(Items[i]));
       IDs :=IDs + ',' + FieldByName('ID').AsString;
     end;
   System.Delete(IDs, 1, 1);
   finally
    EnableControls;
   end;
  end;

      if not
        ExcuseMeUser(
              Format(rsConfirmForAll,[TrCount,rsCalcPercent])
              ) then   Exit;

  with PrCmDM.PrPackage do
  begin
    CallProcedure('add_folder',[
    'p_id', IDs ,
    'p_qovidsender', FieldByName('qovid').AsInteger,
    'p_qovidreciver',DBLookupComboboxEh2.KeyValue
    ]);
   end;
     ExcuseMeUser(Format(cs_CommitInformation, [CommitedCount]));
     Refresh;
     Locate('id', id, []);
    end;
     SendFrm.Close;
end;

procedure TSendFrm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false
end;

end.
