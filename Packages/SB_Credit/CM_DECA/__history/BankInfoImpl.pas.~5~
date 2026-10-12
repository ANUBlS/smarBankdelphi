unit BankInfoImpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type

  TBankInfo = record
    BankName: WideString;
    BankID: WideString;
  end;

  TFrmBankinfo = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    TntEditBankID: TEdit;
    TntEditBankName: TEdit;
    btnSave: TButton;
    btnCancel: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TntEditBankIDChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Get_BankInfo: TBankInfo;
    procedure Set_BankInfo(value: TBankInfo);
    { Public declarations }
  end;

var
  FrmBankinfo: TFrmBankinfo;

implementation

{$R *.dfm}

uses
  IniFiles;

const
  SIniLocation = 'BankInfo.ini';
  SSection = 'BankInfo';
  SBankID = 'BankID';
  SBankName = 'BankName';

function TFrmBankinfo.Get_BankInfo: TBankInfo;
var
  INI: TIniFile;
  BankID, BankName: String;
  Path: String;
begin
  Path := ExtractFilePath(Application.ExeName) + SIniLocation;
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

procedure TFrmBankinfo.Set_BankInfo;
var
  INI: TIniFile;
  BankID, BankName: WideString;
  Path: String;
begin
  BankID := value.BankID;
  BankName := value.BankName;
  Path := ExtractFilePath(Application.ExeName) + SIniLocation;
  INI := TIniFile.Create(Path);
  with INI do
    try
      WriteString(SSection, SBankID, UTF8Encode(BankID));
      WriteString(SSection, SBankName, UTF8Encode(BankName));
    finally
      Free;
    end;
end;

procedure TFrmBankinfo.TntEditBankIDChange(Sender: TObject);
begin
  btnSave.Enabled := True
end;

procedure TFrmBankinfo.btnSaveClick(Sender: TObject);
var
  ABankInfo: TBankInfo;
begin
  ABankInfo.BankID := TntEditBankID.Text;
  ABankInfo.BankName := TntEditBankName.Text;
  Set_BankInfo(ABankInfo);
  btnSave.Enabled := False

end;

procedure TFrmBankinfo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    btnCancel.Click
end;

procedure TFrmBankinfo.FormShow(Sender: TObject);
var
  ABankInfo: TBankInfo;
begin
  ABankInfo := Get_BankInfo;
  TntEditBankID.Text := ABankInfo.BankID;
  TntEditBankName.Text := ABankInfo.BankName;
  btnSave.Enabled := False

end;

end.
