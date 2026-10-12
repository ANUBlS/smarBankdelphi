unit adm_AdvGrantAddEditForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CurrencyEdit, ExtCtrls;

type
  TfrmAddEditAdvGrants = class(TForm)
    edGrantName: TEdit;
    edErrorMessage: TEdit;
    edDescription: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnMB: TPanel;
    CheckBox1: TCheckBox;
    CurrencyEdit1: TCurrencyEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    NewRecord: Boolean;
  end;

var
  frmAddEditAdvGrants: TfrmAddEditAdvGrants;

implementation

uses AdministrationDataModule;

{$R *.DFM}

procedure TfrmAddEditAdvGrants.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddEditAdvGrants.Button1Click(Sender: TObject);
var
  IntVal: Integer;
begin
try
  with AdministrationData do
    if NewRecord then begin
      if CheckBox1.Checked then
        pcADM.CallProcedure('addnewadvancedgrantwithborder',[
           ModeditdataMODID.AsVariant //moduleid
          ,edGrantName.Text
          ,edErrorMessage.Text
          ,edDescription.Text
          ,currencyedit1.Value
          ])
       else     
        IntVal:= pcADM.CallIntegerFunction('addnewadvancedgrant',[
           ModeditdataMODID.AsVariant //moduleid
          ,edGrantName.Text
          ,edErrorMessage.Text
          ,edDescription.Text
          ])
    end else begin      
        pcADM.CallProcedure('editadvancedgrant',[
           ModAdvancedGrantsDataID.AsVariant
          ,ModeditdataMODID.AsVariant //moduleid
          ,edGrantName.Text
          ,edErrorMessage.Text
          ,edDescription.Text
          ]);
        if CheckBox1.Checked then
          pcADM.CallProcedure('editmoneyborder',[
            ModAdvancedGrantsDataID.AsVariant
           ,CurrencyEdit1.Value
          ])
        else            
          pcADM.CallProcedure('delmoneyborder',[
            ModAdvancedGrantsDataID.AsVariant
          ]);
    end;
    close;
except
  showmessage('Error');
end;
end;

end.
