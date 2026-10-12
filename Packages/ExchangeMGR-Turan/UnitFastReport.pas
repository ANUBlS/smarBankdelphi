unit UnitFastReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxPreview, frxDBSet,UnitDateExch,sboapiDataModuleImpl, DB,
  OracleData,frxCross,frxExportXLS, frxExportRTF, frxExportBIFF, fs_synmemo;

type
  TFormFastReport = class(TForm)
    frxReport1: TfrxReport;
    frxPreview1: TfrxPreview;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFastReport: TFormFastReport;

implementation

{$R *.dfm}

end.
