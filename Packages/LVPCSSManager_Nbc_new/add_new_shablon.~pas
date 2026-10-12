unit add_new_shablon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TAdd_new = class(TForm)
    GroupBox1: TGroupBox;
    Edit_New_Shablon_name: TEdit;
    Button_New_shablon: TButton;
    procedure Button_New_shablonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Add_new: TAdd_new;

implementation
uses Payment_Det, Data_Unit;
{$R *.DFM}

procedure TAdd_new.Button_New_shablonClick(Sender: TObject);
begin

   if Edit_New_Shablon_name.Text<>'' then
   begin
      DataMod.INS.Callprocedure('xs_Beneficiary_shablon_insert',[        insert_shablon[1],
                                                                         insert_shablon[2],
                                                                         insert_shablon[3],
                                                                         insert_shablon[4],
                                                                         insert_shablon[5],
                                                                         insert_shablon[6],
                                                                         insert_shablon[7],
                                                                         insert_shablon[8],
                                                                         insert_shablon[9],
                                                                         insert_shablon[10],
                                                                         insert_shablon[11],
                                                                         insert_shablon[12],
                                                                         insert_shablon[13],
                                                                         insert_shablon[14],
                                                                         insert_shablon[15]
                                                                 ]);


   end else MessageDlg('Melumat duzgun deyil !',mtWarning,[mbok],0)
end;

end.
