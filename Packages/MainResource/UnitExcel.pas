unit UnitExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls;

type
  TFormExcel = class(TForm)
    PanelMain: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    SpBtnExcel: TSpeedButton;
    procedure SpBtnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExcel: TFormExcel;
       Exl,Sheet :Variant;


implementation
      uses ComObj,sboapiDataModuleImpl, SBTranslateProc;
{$R *.DFM}

procedure DestroySheet;
begin
  try
   Finalize(Sheet);
   Finalize(Exl);
  except
  end;
end;

procedure ShowSheet;
begin
  try
     Exl.Visible := True;
  except
     DestroySheet;
  end;
end;


procedure CreateSheet;
begin
  try
   Exl := CreateOleObject('Excel.Application');
   Exl.WorkBooks.add;
   Sheet := Exl.Application.Worksheets.Item[1];
  except
  end;
end;

procedure TFormExcel.FormCreate(Sender: TObject);
begin
SBTranslateProc.TranslateAllCompForms(Self,sboapiDataModule.OrPack_SL);
end;

procedure TFormExcel.SpBtnExcelClick(Sender: TObject);
begin
    try
       Screen.Cursor:=crSQLWait;
         CreateSheet;

         ShowSheet;
    finally

        Screen.Cursor:=crDefault;
        DestroySheet;

    end;

end;

end.
