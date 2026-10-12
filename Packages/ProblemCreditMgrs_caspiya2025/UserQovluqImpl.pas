unit UserQovluqImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XFSCtrls, ExtCtrls, Buttons;

type
  TFrmUserQovluq = class(TForm)
    XFPanel6: TXFPanel;
    CheckBonus: TXFCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUserQovluq: TFrmUserQovluq;

implementation

uses PrCmDMImpl;

{$R *.dfm}

procedure TFrmUserQovluq.BitBtn1Click(Sender: TObject);

var pstatus:integer;
begin

  if CheckBonus.Checked then  pstatus:=1
                        else  pstatus:=0;

  PrCmDM.PrPackage.CallProcedure('admin_add',['userid_', PrCmDM.CourtAdmin.FieldByName('ID').AsInteger,
                                  'qrupid_',  PrCmDM.AdminGroups.FieldByName('ID').AsInteger,
                                  'username_',PrCmDM.CourtAdmin.FieldByName('NAME').AsString,
                                  'qrupname_',PrCmDM.AdminGroups.FieldByName('NAME').AsString,
                                  'pstatus_',pstatus
                                  ]);
  PrCmDM.AdminIn.Refresh;
  FrmUserQovluq.Close;
end;

procedure TFrmUserQovluq.BitBtn2Click(Sender: TObject);
begin
close
end;

procedure TFrmUserQovluq.FormShow(Sender: TObject);
begin
  IF CheckBonus.Checked THEN CheckBonus.Checked:=False;
end;

end.
