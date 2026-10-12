unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,comobj,ldialogs;

type
  TFconfirm = class(TForm)
    Image1: TImage;
    btnyes: TButton;
    btnNo: TButton;
    lblinfo: TLabel;
    procedure btnyesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;


var
  Fconfirm: TFconfirm;


implementation

uses ZamirImpl1,unit1;

{$R *.DFM}

procedure TFconfirm.btnyesClick(Sender: TObject);
begin
with SDHesabat do
 begin
 case confirm of
  1:begin

    Application.ProcessMessages;


     try
      with oradatcell do
       Begin
          Close;
          Sql.Clear;
          Sql.Text:='Select s.rowid,s.* from operation_balances s where BookId='+oradatbook.fieldbyname('schema').AsString;
          Open;
          First;
         while  recordcount>0 do
           Delete;
           Next;
       end;
     except showmessage('error: 602');
     end;
      try
         with oradatSheet do
          Begin
            Close;
            Sql.Clear;
            Sql.Text:='Select s.rowid,s.* from operations s where BookId='+oradatbook.fieldbyname('schema').AsString;
            Open;
            First;
              while recordcount>0 do
                 Delete;
                 Next;

       end;
       except showmessage('error: 620');
        end;
             oradatbook.Delete;
             dbgrid1.OnCellClick(dbgrid1.columns[1]);
     end;


  2: begin
        
         try
           oradatcell.Delete;
         except
              exit;
         end;
     end;

  end;

end;
                Close;
end;

end.
