unit Form1_BalCnImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, XDBGrids, ExtCtrls, XFSCtrls;

type
  TFormBalCn1 = class(TForm)
    XFPanel1: TXFPanel;
    XFPanel2: TXFPanel;
    XFPanel3: TXFPanel;
    XDBGrid1: TXDBGrid;
    Edit1: TEdit;
    XDBGrid2: TXDBGrid;
    Edit2: TEdit;
    XDBGrid3: TXDBGrid;
    Edit3: TEdit;
    XFButton1: TXFButton;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure XDBGrid3DblClick(Sender: TObject);
    procedure XFButton1Click(Sender: TObject);
  private
    { Private declarations }
     function get_param(param :string):integer;
  public
    { Public declarations }
  end;

var
  FormBalCn1: TFormBalCn1;

x: integer;
implementation

{$R *.dfm}
 uses OpenAccdataImpl, OpenAccountImpl;


 function TFormBalCn1.get_param(param :string):integer;
begin
try
 strtoint(param);
 result:=1;

except
 result:=0;
end;

end;






procedure TFormBalCn1.XDBGrid3DblClick(Sender: TObject);
begin
//if OpenAccount.XFButton1.Visible=true then


OpenAccount.DBLookupComboboxEh6.ListSource:=DataAcc.Dsrc_bal_spr3;
DataAcc.ODS_Bal_spr3.open;
 with DataAcc, ODS_Bal_spr3 do
  begin
    // showmessage(edit4.text)   ;
    if RecordCount <> 0 then
    begin
      OpenAccount.Edit2.Text := FieldByName('bal_cn').AsString;
      OpenAccount.DBLookupComboboxEh6.Text := FieldByName('balname').AsString;



        end;


  end;

FormBalCn1.Close;
end;

procedure TFormBalCn1.XFButton1Click(Sender: TObject);
begin
OpenAccount.DBLookupComboboxEh6.ListSource:=DataAcc.Dsrc_bal_spr3;
DataAcc.ODS_Bal_spr3.open;
 with DataAcc, ODS_Bal_spr3 do
  begin
    // showmessage(edit4.text)   ;
    if RecordCount <> 0 then
    begin
      OpenAccount.Edit2.Text := FieldByName('bal_cn').AsString;
      OpenAccount.DBLookupComboboxEh6.Text := FieldByName('balname').AsString;

     end;
    end;

FormBalCn1.Close;
end;

procedure TFormBalCn1.Edit1Change(Sender: TObject);
begin

 x:=0;
 edit2.Text:=edit1.Text;
 with   DataAcc.ODS_bal_spr_parts1 do
      begin
      if Edit1.Text <> '' then
      begin
      close;
      SQL[2]:='';
      SQL[2] := SQL[2] + 'and nvl(upper(( part||'' ''||partname)),0) like upper (''%' +
      Edit1.Text + '%'')';

      open;
      end;
if edit1.Text ='' then
begin

DataAcc.ODS_bal_spr_parts1.Close;
DataAcc.ODS_bal_spr_groups1.Close;
DataAcc.ODS_bal_spr3.Close;
//edit6.Clear;
//edit5.Clear;
exit;
end ;



end;
end;

procedure TFormBalCn1.Edit2Change(Sender: TObject);
begin
edit3.Text:=edit2.Text;
if   (get_param(Edit2.Text)=1)or(edit2.Text='') then begin
edit2.MaxLength:=3;
if  (Length(edit2.Text)>2)and (edit1.text='') then
begin
 edit1.text:=Copy(edit2.Text ,1,2);
 x:=1;
end;
      if(Length(edit2.Text)>2)and (edit1.text<>'') then
      if Copy(edit1.Text ,1,2)=Copy(edit2.Text ,1,2) then
      begin

    with DataAcc.ODS_bal_spr_groups1 do
      begin
      close;
      SQL[2]:='';
      SQL[2] := ' and grp= ' + Edit2.Text;
      open;
      end;
      end
      else
       DataAcc.ODS_bal_spr_groups1.Close;

    if (edit2.Text='')and (Edit1.Text <>'') then
     with DataAcc.ODS_bal_spr_parts1 do
      begin
      close;
      SQL[2]:='';
      SQL[2] := ' and part=' + Edit1.Text  ;
      open;
      end;
       if (x=1)and (edit2.Text='') then
      begin
       edit1.Text:=''  ;
       DataAcc.ODS_bal_spr_parts1.Close;
      end;
 end;

 if get_param(Edit2.Text)=0 then
 begin
 edit2.MaxLength:=0;
  with   DataAcc.ODS_bal_spr_groups1 do
      begin
   if Edit2.Text <> '' then
      begin
      close;
      SQL[2]:='';
      SQL[2] := ' and nvl(upper((grpname)),0) like upper (''%' + Edit2.Text + '%'')'   ;
      open;
      end;
 end;
 if DataAcc.ODS_bal_spr_groups1.RecordCount=1 then
 edit2.Text:=inttostr(DataAcc.ODS_bal_spr_groups1.FieldByName('grp').AsInteger);

 end;
end;

procedure TFormBalCn1.Edit3Change(Sender: TObject);
begin
if(Length(edit3.Text)>2)and (edit1.text='')and (edit2.text='')then
 begin
 edit1.text:=Copy(edit3.Text ,1,2);
 edit2.text:=Copy(edit3.Text ,1,2);
 x:=1;
end;

if (Length(edit3.Text)>3)and (edit1.text<>'') and (edit2.text<>'')then
      if (Copy(edit3.Text ,1,2)=Copy(edit1.Text ,1,2))and
         (Copy(edit3.Text ,1,3)=Copy(edit2.Text ,1,3))
      then
      begin
  with   DataAcc.ODS_bal_spr3 do
      begin
      if Edit3.Text <> '' then
      begin
      close;
      SQL[2]:='';
      if get_param(Edit3.Text)=0 then

      SQL[2] := ' and nvl(upper((balname)),0) like upper (''%' +
      Edit3.Text + '%'')'
      else
       SQL[2] := ' and bal_cn=' + Edit3.Text  ;
      open;
      end;
      end;
      end
   else
    begin

    DataAcc.ODS_bal_spr3.Close;
   // edit5.Clear;
     end;
     if edit3.Text='' then

      with DataAcc.ODS_bal_spr_groups1 do
      begin
      close;
      SQL[2]:='';
      if get_param(Edit2.Text)=0 then

      SQL[2] := ' and nvl(upper((grpname)),0) like upper (''%' +
      Edit2.Text + '%'')'
      else
       SQL[2] := ' and grp='+ Edit2.Text  ;
      open;
      end;
     { if edit5.Text='' then
      OpenAccount_DataModule.ODS_bal_spr1.Close;
           }
      if (x=1)and (edit3.Text='') then
      begin
       edit1.Text:=''  ;
       edit2.Text:=''  ;
       DataAcc.ODS_bal_spr_parts1.Close;
       DataAcc.ODS_bal_spr_groups1.Close;
      end;
end;

procedure TFormBalCn1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//edit1.clear;
//edit2.Clear;
//edit3.Clear;
DataAcc.ODS_bal_spr_parts1.Close;
DataAcc.ODS_bal_spr_groups1.Close;


//OpenAccount.XFButton1.Visible:=false;
end;

end.
