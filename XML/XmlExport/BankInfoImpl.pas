unit BankInfoImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls;

type

  TBankInfo = record
    BankName : WideString;
    BankID   : WideString;
  end;
    
  TBankInfoForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    TntEditBankID: TTntEdit;
    TntEditBankName: TTntEdit;
    Bevel1: TBevel;
    btnSave: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TntEditBankIDChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    function Get_BankInfo : TBankInfo;
    procedure Set_BankInfo(value : TBankInfo);
  
    { Public declarations }
  end;

var
  BankInfoForm: TBankInfoForm;

implementation

{$R *.dfm}

uses
  IniFiles;

const
  SIniLocation = 'BankInfo.ini';
  SSection = 'BankInfo';
  SBankID  = 'BankID';
  SBankName= 'BankName';

function TBankInfoForm.Get_BankInfo : TBankInfo;
var
  INI : TIniFile;
  BankID , BankName : String;
  Path : String;
begin
  Path := ExtractFilePath(Application.ExeName)+SIniLocation;
  INI := TIniFile.Create(Path);
  with INI do
  try
    BankID := ReadString(SSection, SBankID, '');
    BankName := ReadString(SSection, SBankName, '');
    Result.BankName := Utf8Decode(BankName);
    Result.BankID := Utf8Decode(BankID);
  finally
    Free;
  end;
end;

procedure TBankInfoForm.Set_BankInfo;
var
  INI : TIniFile;
  BankID , BankName : WideString;
  Path : String;
begin
  BankID := value.BankID;
  BankName := value.BankName;
  Path := ExtractFilePath(Application.ExeName)+SIniLocation;
  INI := TIniFile.Create(Path);
  with INI do
  try
    WriteString(SSection, SBankID, UTF8Encode(BankID));
    WriteString(SSection, SBankName, UTF8Encode(BankName));
  finally
    Free;
  end;
end;

procedure TBankInfoForm.FormShow(Sender: TObject);
var
  ABankInfo : TBankInfo;
begin
  ABankInfo := Get_BankInfo;
  TntEditBankID.Text := ABankInfo.BankID;
  TntEditBankName.Text := ABankInfo.BankName;
  btnSave.Enabled := False  
end;

procedure TBankInfoForm.btnSaveClick(Sender: TObject);
var
  ABankInfo : TBankInfo;
begin
  ABankInfo.BankID := TntEditBankID.Text;
  ABankInfo.BankName := TntEditBankName.Text;
  Set_BankInfo(ABankInfo);
  btnSave.Enabled := False
end;

procedure TBankInfoForm.TntEditBankIDChange(Sender: TObject);
begin
  btnSave.Enabled := True
end;

procedure TBankInfoForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btnCancel.Click
end;

end.
