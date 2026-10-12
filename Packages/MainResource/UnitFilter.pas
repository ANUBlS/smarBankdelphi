unit UnitFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CheckLst, Oracle,DB,OracleData;

type
  TFormFilter = class(TForm)
    PanelMain: TPanel;
    PanelBottom: TPanel;
    BitBtnOk: TBitBtn;
    GBoxGroupCheck: TGroupBox;
    ChListBoxGr: TCheckListBox;
    BtnExit: TBitBtn;
    ChBoxAll: TCheckBox;
    GBoxKeepengSektor: TGroupBox;
    ChBoxCheckAllSek: TCheckBox;
    ChListBoxSektor: TCheckListBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ChListBoxWares: TCheckListBox;
    ChListBoxUser: TCheckListBox;
    ChBoxWares: TCheckBox;
    ChBoxUser: TCheckBox;

Procedure FillListBox(DataSetList :TOracleDataSet; FieldName :String; ChListBox :TCheckListBox);
Function  FilterStr(ChListBox :TCheckListBox; FilterFieldName :string):string;
Procedure FilteredDataSet(DataSetList :TOracleDataSet; FilteredStr:string);
Procedure ChBoxCheckAll(b :boolean;ChListBox :TCheckListBox);

    procedure BitBtnOkClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure ChBoxAllClick(Sender: TObject);
    procedure ChBoxCheckAllSekClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ChBoxWaresClick(Sender: TObject);
    procedure ChBoxUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FormFilter: TFormFilter;

implementation
                    uses unitdata,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

    function count_comma(Str:string):integer;
     var
      i,t:byte;
    begin
          t:=1;
         for i:=1 to length(Str) do
           if Str[i]=',' then
            t:=t+1;
       if t<>1 then
        t:=t-1;
      Result:=t;
    end;

Function  TFormFilter.FilterStr(ChListBox :TCheckListBox; FilterFieldName :string):string;
var
i:integer;
S:string;
begin
   S:='';
   with ChListBox do
     begin

     for I:=0 to Items.Count-1 do
       begin
        If Checked[I]=true then
        S:=S+'('+''+FilterFieldName+'='''+Items[I]+''') or ';
         ItemIndex:=ItemIndex+1;
       end; {for}
        S:=Copy(S,1,length(S)-4);
     end; {with}
   FilterStr:=S;
end;

procedure TFormFilter.FillListBox(DataSetList :TOracleDataSet; FieldName :String; ChListBox :TCheckListBox);
var
i:integer;
begin
if ChListBox.Items.Text ='' then
 begin
ChListBox.Clear;
  with DataSetList do
    begin
     Open;
      Refresh;
       First;
       for i:=1 to RecordCount do
        begin
          with ChListBox do
          begin
             if FieldByName(FieldName).AsString<>'' then
               Items.Add(FieldByName(FieldName).AsString);
          end;
        Next;
       end; {for}
    end;{with}
   end;
end;

procedure TFormFilter.ChBoxCheckAll(b :boolean;ChListBox :TCheckListBox);
var
i:integer;
begin
     with ChListBox do
      begin
       ItemIndex:=0;
          for i:=0 to Items.Count-1 do
           begin
                 if b=true then
                    Checked[i]:=true
                   else
                    Checked[i]:=false;
                   ItemIndex:=ItemIndex+1;
          end;
        ItemIndex:=0;
   end;
end;

Procedure TFormFilter.FilteredDataSet(DataSetList :TOracleDataSet;FilteredStr:string);
begin
  with DataSetList do
   begin
        Close;
         Filtered:=false;
         Filter:=FilteredStr;
         Filtered:=true;
        Open;
   end;
end;




procedure TFormFilter.BitBtnOkClick(Sender: TObject);

  procedure SFilter(var S: String;  FilterValue : String; Checked : Boolean);
  const
     sFormat = '(%s)';
  var
    Temp : String;
  begin

    if Checked then
    begin
      Temp := Format(sFormat,[FilterValue]);
      if S = '' then
        S := Temp
      else
        S :=S + ' and ' + Temp;
    end;

  end;

var
    filter_keeping_sec :string;
    filter_wares_name  :string;
    filter_user_name   :string;
    bool_keeping_sec   :boolean;
    bool_wares_name    :boolean;
    bool_user_name     :boolean;
    AllFilterWares     :string;
    AllFilterGroup     :string;

begin
 try
  Screen.Cursor:=crSQLWait;
                  AllFilterGroup:=FilterStr(ChListBoxGr,'name');

       filter_keeping_sec:= FilterStr(ChListBoxSektor,'keeping_sec');
       filter_wares_name:=  FilterStr(ChListBoxWares,'wares_name');
       filter_user_name:=   FilterStr(ChListBoxUser,'user_name');
                     if filter_keeping_sec='' then
                       bool_keeping_sec:=false
                      else
                       bool_keeping_sec:=true;

                     if filter_wares_name='' then
                       bool_wares_name:=false
                      else
                       bool_wares_name:=true;

                     if filter_user_name='' then
                       bool_user_name:=false
                      else
                       bool_user_name:=true; 
                   SFilter( AllFilterWares ,filter_keeping_sec ,bool_keeping_sec );
                   SFilter( AllFilterWares ,filter_wares_name  ,bool_wares_name  );
                   SFilter( AllFilterWares ,filter_user_name   ,bool_user_name   );


     with DataModWares do
      begin
       FilteredDataSet(ODSGroups,AllFilterGroup);
       FilteredDataSet(ODSWares,AllFilterWares);
      end;
finally
 Screen.Cursor:=crDefault;
end;


end;

procedure TFormFilter.BtnExitClick(Sender: TObject);
begin
Close;
end;

procedure TFormFilter.ChBoxAllClick(Sender: TObject);
begin
ChBoxCheckAll(ChBoxAll.Checked,ChListBoxGr);
end;

procedure TFormFilter.ChBoxCheckAllSekClick(Sender: TObject);
begin
ChBoxCheckAll(ChBoxCheckAllSek.Checked,ChListBoxSektor);
end;

procedure TFormFilter.FormActivate(Sender: TObject);
begin
 try
  Screen.Cursor:=crSQLWait;
     with DataModWares do
      begin
          FillListBox(ODSFilterGroup,'name',ChListBoxGr);
          FillListBox(ODSFilterWares,'keeping_sec',ChListBoxSektor);
          FillListBox(ODSFilterWares,'wares_name',ChListBoxWares);
          FillListBox(ODSFilterWares,'user_name',ChListBoxUser);
      end;
  finally
      Screen.Cursor:=crDefault;
  end;
end;

procedure TFormFilter.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormFilter.ChBoxWaresClick(Sender: TObject);
begin
ChBoxCheckAll(ChBoxWares.Checked,ChListBoxWares);
end;

procedure TFormFilter.ChBoxUserClick(Sender: TObject);
begin
ChBoxCheckAll(ChBoxUser.Checked,ChListBoxUser);
end;

end.
