unit UnitSearchLegalCustName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, OracleData,sboapiDataModuleImpl;

type
  TFormSearchLegalCustName = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    EditName: TEdit;
    EditCust_Type: TEdit;
    Button1: TButton;
    EditID: TEdit;
    procedure EditIDKeyPress(Sender: TObject; var Key: Char);
    procedure EditIDExit(Sender: TObject);
    procedure ActionSearchExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearchLegalCustName: TFormSearchLegalCustName;

implementation

uses UnitSearchCustName, ExpUnitNewImpl,ExpDataModuleUnit;


{$R *.dfm}

procedure TFormSearchLegalCustName.Button1Click(Sender: TObject);
BEGIN
  WITH ExpFormNew DO
  BEGIN
    WITH DBGrid1.DataSource.DataSet DO
    BEGIN
      CASE FieldByName('cust_type').AsInteger of
          0:begin
              RadioGroup1.ItemIndex:=3;
              //EditVoin.Text:=FieldByName('inn').AsString;
            end;
          1:RadioGroup1.ItemIndex:=1;
          2:RadioGroup1.ItemIndex:=2;
          3:begin
              RadioGroup1.ItemIndex:=4;
              //EditVoin.Text:=FieldByName('inn').AsString;
            end;
          4:RadioGroup1.ItemIndex:=0;
       END;
        IF FieldByName('nerezident').AsInteger=1 THEN RadioButton1.Checked :=true
                                                 ELSE RadioButton2.Checked :=true;

        EditPINCodeI.Text            :=FieldByName('passpin').AsString;
        CBoxPassPlaceI.KeyValue      :=FieldByName('doc_type').AsInteger;
        EditSerialI.Text             :=FieldByName('passer').AsString;
        EditPassportI.Text           :=FieldByName('paspnum').AsString;
        {Issue_country.KeyValue      :=FieldByName('doc_country').AsInteger;
        DBCBox_DocTYPE.KeyValue     :=FieldByName('paspplace').AsString;
        DateEdit.Value              :=FieldByName('paspdate').AsVariant;
        DateEdit1.Value             :=FieldByName('passexpire').AsVariant;


        DBCBox_Citizenship.KeyValue  :=FieldByName('citizenship').AsInteger;
        DBCBox_Citizenship2.KeyValue :=FieldByName('citizenship2').AsInteger;
        DBCBox_Citizenship3.KeyValue :=FieldByName('citizenship2').AsInteger;
        EditLastName.Text            :=FieldByName('lastname').AsString;
        EditName.Text                :=FieldByName('name').AsString;
        EditSoname.Text              :=FieldByName('soname').AsString;
        CBoxSex.KeyValue             :=FieldByName('sex').AsString;
        CBoxFamStatus.KeyValue       :=FieldByName('fam_status').AsString;
        BirthPlace.KeyValue          :=FieldByName('birthplace').AsString;
        EditBirthCity.KeyValue       :=FieldByName('birth_state').AsString;
        DateEdit2.Value              :=FieldByName('birthday').AsVariant;

        Adrs_State.KeyValue          :=FieldByName('adrs_state').AsString;
        Adrs_City.KeyValue           :=FieldByName('city').AsString;
        ZipQ.Text                    :=FieldByName('reg_zip').AsString;
        EditMobil.Text               :=FieldByName('phone_m').AsString;
        EditPhone.Text               :=FieldByName('phone_h').AsString;
        EditEmail.Text               :=FieldByName('e_mail').AsString;
        AdressEdit.Text              :=FieldByName('address').AsString;}
    END
  END;
  FormSearchLegalCustName.close;
END;




procedure TFormSearchLegalCustName.EditIDExit(Sender: TObject);
begin
   TEdit(Sender).Text :=EmptyStr;
end;

procedure TFormSearchLegalCustName.EditIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13  then
  FormSearchLegalCustName.ActionSearchExecute(Sender);
end;

procedure TFormSearchLegalCustName.ActionSearchExecute(Sender: TObject);
var
  SearchField : string;
  SearchOptions : TSearchRecordOptions;
  Grid :TDBGrid;
begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField := copy(Name,5,length(Name));
    with  TOracleDataSet(DBGrid1.DataSource.DataSet) do

    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then

    if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlasın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then

    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmayıb!',mtInformation,[mbOK],0);

 end;
end;


end.
