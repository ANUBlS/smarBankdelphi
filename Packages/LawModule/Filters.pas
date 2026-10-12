unit Filters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, XFSCtrls, DBCtrls, ExtCtrls, ImgList, ComCtrls;

type
  TFiltrs = class(TForm)
    ImageList1: TImageList;
    XFPanel1: TXFPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TXFCheckBox;
    XFBitBtn1: TXFBitBtn;
    dateend: TXFCheckBox;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    hasrest: TXFCheckBox;
    closedcheck: TXFCheckBox;
    Memo2: TMemo;
    crtsnded: TXFCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure XFBitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure dateendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure hasrestClick(Sender: TObject);
    procedure closedcheckClick(Sender: TObject);
    procedure crtsndedClick(Sender: TObject);
    procedure ComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Filtrs: TFiltrs;

implementation

uses Datmodule;

var fltfil,fltstat,fltdate,fltclose,fltheadcourt,fltrest,flthead,fltprtrest :string;


{$R *.dfm}

procedure TFiltrs.CheckBox1Click(Sender: TObject);
begin
if  DataMod.filials.RecordCount=1 then
      ShowMessage('user bütün filiallari görə bilmir !!!')
else
    begin


    if CheckBox1.Checked then
    begin
    //DataMod_CARDS.payment.Filtered:=True;
    DataMod.DataSource_filial.DataSet.Open;
    DBLookupComboBox1.Enabled:=True;
    DBLookupComboBox1.KeyValue:=0;
    fltfil:=' and branch =' ;
    end
    else
    begin
      fltfil:='' ;
         //DataMod.DataSource_filial.DataSet.close;
    DBLookupComboBox1.Enabled:=false;
    DBLookupComboBox1.KeyValue:=0;

    end;
    end;
end;

procedure TFiltrs.DateTimePicker1Change(Sender: TObject);
begin
fltdate:=' and DUEDATEFIRSTCONTRACT = '' '+datetostr(DateTimePicker1.DateTime)+'''';

//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';
//fltheadcourt:=' where  cr.id=cor.id  ';
end;

procedure TFiltrs.DBLookupComboBox1CloseUp(Sender: TObject);
begin
fltfil:=' and branch =' +inttostr(DBLookupComboBox1.KeyValue);
//fltheadcourt:=' where  cr.id=cor.id  ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';

end;

procedure TFiltrs.FormShow(Sender: TObject);
begin
memo1.Text:=DataMod.Main_court.SQL.Text;
memo2.Text:=DataMod.Mainscrpt.SQL.Text;
DataMod.Main_court.Close;
DataMod.Main_court.open;
end;

procedure TFiltrs.XFBitBtn1Click(Sender: TObject);
begin
memo1.Text:=DataMod.Main_court.SQL.Text;
memo2.Text:=DataMod.Mainscrpt.SQL.Text;

         if fltrest<>'' then
         begin
            flthead:='';
         end;

         if fltprtrest<>'' then
         begin
            fltheadcourt:='';
         end;

 DataMod.Main_court.Open;

DataMod.Mainscrpt.SQL[20]:='';
DataMod.Mainscrpt.SQL[20] := flthead+fltrest+fltdate+fltclose+fltfil+fltstat;
DataMod.Main_court.SQL[32]:='';

DataMod.Main_court.SQL[32] :=flthead+fltrest+fltdate+fltclose+fltfil+fltstat;

//DataMod.Main_court.SQL[30] :=fltfil;

//DataMod.Mainscrpt.SQL[17] :=fltfil+fltstat;

memo1.Text:=DataMod.Main_court.SQL.Text;
memo2.Text:=DataMod.Mainscrpt.SQL.Text;
DataMod.Mainscrpt.Refresh;
DataMod.Main_court.Refresh;
close;
end;

procedure TFiltrs.crtsndedClick(Sender: TObject);
begin
if crtsnded.Checked then
begin


fltstat:='  and status in (1)';
fltheadcourt:=' where  cr.id=cor.id  ';
flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust  and cr.id=cour.id(+)';


end
else
begin
fltstat:=' and status in (0,1)';
fltheadcourt:=' where  cr.id=cor.id  ';
flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';

end;



end;


procedure TFiltrs.hasrestClick(Sender: TObject);
begin
if hasrest.Checked then
begin

{fltrest:=',customers s,custinfo cv , tenostat t, cm_accounts ss where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and'
+'  cr.id=ss.creditid and t.acc_id=ss.loanaccid and abs(ostat)>0  and cr.id=cour.id(+)';

fltprtrest:=' , tenostat t, cm_accounts ss where  cr.id=cor.id and cr.id=ss.creditid and t.acc_id=ss.loanaccid and abs(ostat)>0';
flthead:=' '  ;
fltheadcourt:=' ';  }
  fltrest:= ' and lstrest>0' ;
end
else
begin
  fltrest:='';
  fltprtrest:='';
{flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';
   fltheadcourt:=' where  cr.id=cor.id  ';   }
end;
end;

procedure TFiltrs.closedcheckClick(Sender: TObject);
begin
if closedcheck.Checked then
begin
//DataMod_CARDS.payment.Filtered:=True;

fltclose:=' and closedate is not null';
//fltheadcourt:=' where  cr.id=cor.id ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';
end
else
begin
  fltclose:='';
//   flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust and cr.id=cour.id(+)';
end;

end;

procedure TFiltrs.ComboBox1CloseUp(Sender: TObject);
begin
 //    ShowMessage(ComboBox1.Items[ComboBox1.ItemIndex]);
if ComboBox1.Items[ComboBox1.ItemIndex]='Bütün hamısı' then
begin

fltstat:='  and status in (0,1,3)';
//fltheadcourt:=' where  cr.id=cor.id  ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust  and cr.id=cour.id(+)';

end;


if ComboBox1.Items[ComboBox1.ItemIndex]='Tədbir görülmüşlər' then
begin

fltstat:='  and status in (1)';
//fltheadcourt:=' where  cr.id=cor.id  ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust  and cr.id=cour.id(+)';

end;


if ComboBox1.Items[ComboBox1.ItemIndex]='Tədbir görülməmişlər' then
begin

fltstat:='  and status in (0)';
//fltheadcourt:=' where  cr.id=cor.id  ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust  and cr.id=cour.id(+)';

end;


if ComboBox1.Items[ComboBox1.ItemIndex]='Tədbir görülə bilməyənlər' then
begin

fltstat:='  and status in (3)';
//fltheadcourt:=' where  cr.id=cor.id  ';
//flthead:='  ,customers s,custinfo cv where s.id=cr.boorowerid and idcust=cr.boorowerid and s.id=cv.idcust  and cr.id=cour.id(+)';

end;

end;

procedure TFiltrs.dateendClick(Sender: TObject);
begin
if dateend.Checked then
begin
//DataMod_CARDS.payment.Filtered:=True;
DateTimePicker1.Enabled:=True;


end
else
begin
fltdate:='';
DataMod.DataSource_filial.DataSet.close;
DateTimePicker1.Enabled:=false;


end;
end;

end.
