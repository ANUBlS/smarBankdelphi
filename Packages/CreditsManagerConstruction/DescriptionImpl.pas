unit DescriptionImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls;

type
  TDescription = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Description: TDescription;

implementation

uses DatModConstructionImpl;


{$R *.dfm}

procedure TDescription.Button1Click(Sender: TObject);
begin
Description.Close;
end;

end.
