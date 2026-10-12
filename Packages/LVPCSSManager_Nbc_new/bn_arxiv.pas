unit bn_arxiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data_Unit, ExtCtrls, Grids, DBGrids, ImgList, StdCtrls, SearchEdit, Db, OracleData, Oracle,
  ComCtrls, bnrepform, Menus;

type
  TArxiv = class(TForm)
    DBGrid1: TDBGrid;
    ImageList: TImageList;
    ImageListFilial: TImageList;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button2: TButton;
    SearchEdit1: TSearchEdit;
    SearchEdit2: TSearchEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SearchEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure SearchEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Arxiv: TArxiv;
    SearchOptions : TSearchRecordOptions;
  SearchField : string;

implementation

{$R *.dfm}

procedure TArxiv.Button2Click(Sender: TObject);
begin

try

   begin
  // ShowMessage(datetostr(DateTimePicker1.DateTime));
 //     ShowMessage(datetostr(DateTimePicker2.DateTime));
with datamod.Bn_arxiv do
  begin
      CloseAll;
      SetVariable('dat1',Trunc(DateTimePicker1.DateTime));
      SetVariable('dat2',Trunc(DateTimePicker2.DateTime));
      open;

  end;
  //ShowMessage(datamod.Bn_arxiv.SQL.Text);

     end;
 except
on e:Exception do
    ShowMessage(e.Message);

end;

end;

procedure TArxiv.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
 var
  ImageIndex,ImageIndexFilial: Integer;
  begin
  ImageIndex:=-1;
  with (Sender as TDBGrid) do
  begin
    if (Sender as TDBGrid).DataSource.DataSet.RecordCount <> 0 then
    begin
      case (Sender as TDBGrid).DataSource.DataSet.FieldByName('Status').AsInteger of
      msDefault:
        ImageIndex := 3;
      msCommit:
        ImageIndex := 10;
      msReject:
        ImageIndex := 4;
      msFileCreated:
        ImageIndex := 5;
        msReturn:
          ImageIndex := 16;
      end;
      if (DataCol = 1) and (ImageIndex <> -1) then
        ImageList.Draw(Canvas, Rect.Left, Rect.Top, ImageIndex, True);
    end;
  end;


end;

procedure TArxiv.DBGrid1TitleClick(Column: TColumn);

var
   TitleName :string;
   SortPosition: word;
begin
 if Column.Field.Calculated then Exit;
  Screen.Cursor := crSQLWait;
  TitleName :=Column.FieldName;
  try
   with DataMod.Bn_arxiv do
    begin
    close;
    sql[6]:='order by '+TitleName;
     //Refresh;
     open;
    end;
  finally
   Screen.Cursor := crDefault;
  end;
end;

procedure TArxiv.N1Click(Sender: TObject);
var str,str2:string;
begin
Formrep:=Tformrep.Create(self);


 Formrep.QRLabel10.Caption:=DataMod.Bn_arxiv.FieldByName('sendcode').AsString+'/'+DataMod.Bn_arxiv.FieldByName('senderinn').AsString;
 Formrep.QRLabel11.Caption:=DataMod.Bn_arxiv.FieldByName('receivercode').AsString+'/'+DataMod.Bn_arxiv.FieldByName('receiverinn').AsString;




   datamod.DataTemp.Close;
   datamod.DataTemp.SQL.Clear;
   datamod.DataTemp.SQL.Add('Select * from bn_opcodes where code =  '+DataMod.Bn_arxiv.FieldByName('classcode').AsString);
   datamod.DataTemp.Open;


   Formrep.QRMemo1.Lines[0]:='';
   Formrep.QRMemo3.Lines[0]:='';

   str:=   DataMod.Bn_arxiv.FieldByName('add_bdgcode').AsString ;
   str2:=  DataMod.Bn_arxiv.FieldByName('add_servicenumber').AsString;

   //ShowMessage(Copy(str2, Pos('/', str2) - 1, Length(str)));

 Formrep.QRMemo1.Lines[0]:= 'Büdcə səviyyə kodu - '+ Copy(str, 0 ,Pos('/', str) - 1);
 Formrep.QRMemo1.Lines[1]:= Copy(str, Pos('/', str) + 1, Length(str));
 Formrep.QRMemo1.Lines[2]:= 'Büdcə təsnifatı - '+ Copy(str2, 0 ,Pos('/', str2) - 1);
 Formrep.QRMemo1.Lines[3]:= Copy(str2, Pos('/', str2) + 1, Length(str2));

 Formrep.QRMemo3.Lines[0]:= DataMod.Bn_arxiv.FieldByName('add_bdgcodenumber').AsString;
 Formrep.QRMemo3.Lines[1]:= DataMod.Bn_arxiv.FieldByName('add_date').AsString;
 Formrep.QRMemo3.Lines[2]:= DataMod.Bn_arxiv.FieldByName('ADD_REFERANCE').AsString;



 Formrep.QuickRep1.Preview;

end;

procedure TArxiv.SearchEdit1KeyPress(Sender: TObject; var Key: Char);
begin
try     begin
 if Key = #13  then
 begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField :='ID';


    with  TOracleDataSet(DataMod.Bn_arxiv) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then

    if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlansın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then

    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;
  //DataMod.Bn_arxiv.Locate('ID',Bn_arxiv.,[]);
 end;
 end;
 except
on e:Exception do
    ShowMessage(e.Message);

end;

end;

procedure TArxiv.SearchEdit2KeyPress(Sender: TObject; var Key: Char);
begin

try
     begin


 if Key = #13  then
 begin
  SearchOptions := [srIgnoreCase ,srPartialMatch ];

  with Sender as TEdit  do
  begin
    SearchField :='referance';


    with  TOracleDataSet(DataMod.Bn_arxiv) do
    if  not SearchRecord(
                  SearchField
                 ,Text
                 ,SearchOptions + [srFromCurrent , srForward ]
                 ) then

    if MessageDlg(
              'Axtarış sona çatdı.'+#13+'Əvvəldən başlansın?'
             ,mtInformation
             ,[mbNo , mbYes]
             ,0
             ) = mrYes  then

    if not SearchRecord(
                 SearchField
                ,Text
                ,SearchOptions + [ srFromBeginning ]
                )  then
    MessageDlg('Yazı tapılmadı!',mtInformation,[mbOK],0);
  end;
 end;





     end;
        except
on e:Exception do
    ShowMessage(e.Message);
end;
end;

end.
