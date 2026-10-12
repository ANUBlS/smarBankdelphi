unit GirovImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, CMDBSearchEdit, Buttons, CheckLst,
  Evanescence, ExtCtrls, ImgList, NLSLocalizer;

type
  TFrmGirov = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    AddOtherPAPERNO: TEvanescence;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    CMSearchEdit1: TCMSearchEdit;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGirov: TFrmGirov;

implementation

uses guaranteeImpl,CommonDecls, GrovDataModuleImpl;

{$R *.DFM}

procedure TFrmGirov.ToolButton1Click(Sender: TObject);

var
 i: Integer  ;
begin
   with GrovDataMod,AddOtherPAPERNO do
   begin
       for i:= 0 to Items.Count-1 do
       begin
            if Checked[i] then
             CRackage.CallProcedure('add_girov', [  'p_numberofgur',Items[i],
                                                    'p_creditid',Get_SelectedCrdID
                                                  ]);
       end;
        GirovDataSet.Refresh;
        PropDataSet.Refresh;
        RefreshList;

end;
        close;
end;


procedure TFrmGirov.ToolButton2Click(Sender: TObject);
begin
  Panel3.Visible :=not Panel3.Visible;
   ToolButton2.Down := Panel3.Visible;
end;

procedure TFrmGirov.ToolButton3Click(Sender: TObject);
begin
close;
end;

procedure TFrmGirov.SpeedButton1Click(Sender: TObject);

var
a:string;
s: string;
begin
 a:='and numberofcredit=';
 s:=CMSearchEdit1.text;
 if s<>'' then
  with GrovDataMod,PropDataSet do
 begin
  close;
  SQL[10]:=a+''''+s+'''';
 // ShowMessage(a+''''+s+'''');
  open ;

  AddOtherPAPERNO.RefreshList;

 end   ;
 CMSearchEdit1.text:=''  ;
end;


procedure TFrmGirov.SpeedButton2Click(Sender: TObject);
begin
  with GrovDataMod,PropDataSet do
 begin
  close;
  SQL[10]:='';
 // ShowMessage(a+''''+s+'''');
  open ;
 // refresh;
  AddOtherPAPERNO.RefreshList;
  end
end;

procedure TFrmGirov.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(key) = VK_ESCAPE then close
end;

end.
