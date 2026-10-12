unit DmCalculationimpl;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TDmCalculation = class(TDataModule)
    ImageList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCalculation: TDmCalculation;

implementation

{$R *.dfm}
uses  CommanParametrs,sboapiDataModuleImpl;

end.
