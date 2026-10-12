unit UnitViewTurn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls,Oracle, Buttons,DB;

type
  TFormViewTurn = class(TForm)
    GBoxNB: TGroupBox;
    DBGridWaresNB: TDBGridEh;
    DBGridEhGroupNB: TDBGridEh;
    PanelSum: TPanel;
    LabelFirstPrice: TLabel;
    LabelRemainder: TLabel;
    LabelAllAmort: TLabel;
    LabelAmort: TLabel;
    PanelSearch: TPanel;
    LabelS: TLabel;
    Search: TLabel;
    LabelSrchName: TLabel;
    LabelSrchFP: TLabel;
    LabelSrchR: TLabel;
    LabelSrchAA: TLabel;
    LabelSrchA: TLabel;
    EditSrchFP: TEdit;
    EditSrchR: TEdit;
    EditSrchAA: TEdit;
    EditSrchName: TEdit;
    EditSrchA: TEdit;
    PanelCheck: TPanel;
    DTP_Dat: TDateTimePicker;
    BitBtnOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PanelFF: TPanel;
    DBEditFIRST_PRICE: TDBEdit;
    DBEditREMAINDER: TDBEdit;
    DBEditALL_AMORT: TDBEdit;
    DBEditAMORT: TDBEdit;
    DBEditTAX_FIRST_PRICE: TDBEdit;
    DBEditTAX_REMAINDER: TDBEdit;
    DBEditTAX_ALL_AMORT: TDBEdit;
    DBEditTAX_AMORT: TDBEdit;
    TimerB: TTimer;
    TimerA: TTimer;
    BtnExportExcel: TBitBtn;
    procedure BitBtnOkClick(Sender: TObject);
    procedure DBGridEhGroupNBCellClick(Column: TColumnEh);
    procedure  Sum_For_Group_Params(
                         v_amort_date           :TDateTime;
                         v_groups_id            :integer;
                         var v_sum_first_price,
                          v_sum_remainder,
                          v_sum_all_amort,
                          v_sum_amort,
                          v_sum_tax_first_price,
                          v_sum_tax_remainder,
                          v_sum_tax_all_amort,
                          v_sum_tax_amort :real);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEhGroupNBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabelSClick(Sender: TObject);
    procedure TimerBTimer(Sender: TObject);
    procedure TimerATimer(Sender: TObject);
    procedure EditSrchAAChange(Sender: TObject);
    procedure EditSrchFPChange(Sender: TObject);
    procedure BtnExportExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewTurn: TFormViewTurn;

implementation

uses UnitData, UnitExcel;

{$R *.DFM}

    procedure  TFormViewTurn.Sum_For_Group_Params(
                          v_amort_date           :TDateTime;
                          v_groups_id            :integer;
                          var    {out parameters}
                          v_sum_first_price,
                          v_sum_remainder,
                          v_sum_all_amort,
                          v_sum_amort,
                          v_sum_tax_first_price,
                          v_sum_tax_remainder,
                          v_sum_tax_all_amort,
                          v_sum_tax_amort :real
                         );

     begin
              with DataModWares do
              begin

                     SB_MAIN_RESOURCE.CallProcedure('Sum_For_Group_Params',
                                        [
                                        v_amort_date,
                                        v_groups_id,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0
                                        ]
                                        );

                              v_sum_first_price     := SB_MAIN_RESOURCE.GetParameter(2);
                              v_sum_remainder       := SB_MAIN_RESOURCE.GetParameter(3);
                              v_sum_all_amort       := SB_MAIN_RESOURCE.GetParameter(4);
                              v_sum_amort           := SB_MAIN_RESOURCE.GetParameter(5);
                              v_sum_tax_first_price := SB_MAIN_RESOURCE.GetParameter(6);
                              v_sum_tax_remainder   := SB_MAIN_RESOURCE.GetParameter(7);
                              v_sum_tax_all_amort   := SB_MAIN_RESOURCE.GetParameter(8);
                              v_sum_tax_amort       := SB_MAIN_RESOURCE.GetParameter(9);

                end;
     end;



procedure TFormViewTurn.BitBtnOkClick(Sender: TObject);
var
 v_amort_date :TDateTime;
begin
           v_amort_date:= Integer(Trunc(DTP_Dat.DateTime));

        with DataModWares do begin
           ODSViewGroups.Open;
            ODSViewWares.Close;
            ODSViewWares.SetVariable('v_amort_date',v_amort_date);
            ODSViewWares.Open;
        end;


end;

procedure TFormViewTurn.DBGridEhGroupNBCellClick(Column: TColumnEh);
var
 p_amort_date :TDateTime;
begin
   p_amort_date:= Integer(Trunc(DTP_Dat.DateTime));


    with DataModWares.ODSSumViewWares do begin
          Close;
          SetVariable('amort_date',p_amort_date);
          Open;

    end;
end;

procedure TFormViewTurn.FormCreate(Sender: TObject);
var
v_amort_date :TDateTime;
begin
           v_amort_date:= Integer(Trunc(DTP_Dat.DateTime));

        with DataModWares do begin
           ODSViewGroups.Open;
            ODSViewWares.Close;
            ODSViewWares.SetVariable('v_amort_date',v_amort_date);
            ODSViewWares.Open;
        end;

end;

procedure TFormViewTurn.DBGridEhGroupNBKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
 p_amort_date :TDateTime;
begin
   p_amort_date:= Integer(Trunc(DTP_Dat.DateTime));


    with DataModWares.ODSSumViewWares do begin
          Close;
          SetVariable('amort_date',p_amort_date);
          Open;

    end;
end;

procedure TFormViewTurn.LabelSClick(Sender: TObject);
begin
       if LabelS.Caption='<' then
        begin

           TimerA.Enabled:=True;
              TimerB.Enabled:=False;
          end
           else
            begin
           TimerB.Enabled:=True;
            TimerA.Enabled:=False;
          end;
end;

procedure TFormViewTurn.TimerBTimer(Sender: TObject);
begin
         if PanelSearch.Width>16+10 then
        begin
        PanelSearch.Width:=PanelSearch.Width-10;
        Application.ProcessMessages;
        LabelS.Caption:='<';
        end;
end;

procedure TFormViewTurn.TimerATimer(Sender: TObject);
begin
        if PanelSearch.Width<PanelSum.Width-4 then
        begin
        PanelSearch.Width:=PanelSearch.Width+10;
        Application.ProcessMessages;
        LabelS.Caption:='>';
        end;
end;

procedure TFormViewTurn.EditSrchAAChange(Sender: TObject);
begin
  if EditSrchAA.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('all_amort',EditSrchAA.Text,[loCaseInsensitive,loPartialKey]);
                      DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;
end;

procedure TFormViewTurn.EditSrchFPChange(Sender: TObject);
begin
  if EditSrchFP.Text <> '' then
   begin
        with
         DataModWares.ODSWares
          do
           begin
             Locate('first_price',EditSrchFP.Text,[loCaseInsensitive,loPartialKey]);
                      DBGridEhGroupNB.SelectedIndex:=RecNo;
         end;
     end;

end;

procedure TFormViewTurn.BtnExportExcelClick(Sender: TObject);
begin
FormExcel:=TFormExcel.Create(Self);
FormExcel.ShowModal;
end;

end.
