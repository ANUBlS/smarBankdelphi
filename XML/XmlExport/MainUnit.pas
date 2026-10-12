unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, StdCtrls, Buttons, ExtCtrls, DB,
  TntStdCtrls, Grids, DBGrids;

type
  EFieldNotFoud=class(Exception);
  EEmptyTable=class(Exception);

  PField = ^TField;

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miClose: TMenuItem;
    miSpecimen: TMenuItem;
    miSettings: TMenuItem;
    miBankInfo: TMenuItem;
    N1: TMenuItem;
    miDecoding: TMenuItem;
    N2: TMenuItem;
    miSwitch: TMenuItem;
    miSpecimenSettings: TMenuItem;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    EditSource: TEdit;
    SBOpen: TSpeedButton;
    EditDest: TEdit;
    SBSave: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    bntExport: TButton;
    OpenDlg: TOpenDialog;
    SaveDlg: TSaveDialog;
    GroupBox1: TGroupBox;
    JobProgress: TProgressBar;
    ButtonAbort: TButton;
    TntMemoLog: TTntMemo;
    LogMemo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure miBankInfoClick(Sender: TObject);
    procedure miSpecimenSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miSwitchClick(Sender: TObject);
    procedure miDecodingClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure bntExportClick(Sender: TObject);
    procedure SBOpenClick(Sender: TObject);
    procedure SBSaveClick(Sender: TObject);
    procedure ButtonAbortClick(Sender: TObject);
  private
    FSettingsPath : String;
    FReportDate : TDate;
    { Private declarations }
  public
    property SettingsPath : String read FSettingsPath write FSettingsPath;
    property ReportDate : TDate read FReportDate write FReportDate;
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses BankInfoImpl, SpecimenSettingsImpl, ReportDateImpl,
  UnicodeSettingsImpl, DateUtils, DataModuleImpl, DBTables;

{$R *.dfm}

var
  SourceBuffer: PChar;
  UnusableGrops : Set Of Byte;
  AbortPressed : Boolean;

procedure TMainForm.FormCreate(Sender: TObject);

  function Get_SettingsPath : String;
  const
    SDBDir = 'DB';
  begin
    Result := ExtractFilePath(Application.ExeName);
    Result := Result + SDBDir;
  end;

begin
  SettingsPath := Get_SettingsPath;
  AbortPressed := False;  
end;

procedure TMainForm.miBankInfoClick(Sender: TObject);
begin
  BankInfoForm.ShowModal
end;

procedure TMainForm.miSpecimenSettingsClick(Sender: TObject);
begin
  SpecimenForm.ShowModal
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if ReportDateForm.ShowModal = mrOk then
    ReportDate := ReportDateForm.FReportDate
  else
    Application.Terminate;
end;

procedure TMainForm.miSwitchClick(Sender: TObject);
begin
  if ReportDateForm.ShowModal = mrOk then
    ReportDate := ReportDateForm.FReportDate
end;

procedure TMainForm.miDecodingClick(Sender: TObject);
begin
  DecodingForm.ShowModal
end;

procedure TMainForm.miCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.bntExportClick(Sender: TObject);

  procedure WriteString(Stream: TFileStream; S : String);
  begin
    TntMemoLog.Lines.Add(UTF8Decode(S));
    StrPCopy(SourceBuffer, S);
    Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
  end;

  procedure WriteFileBegin(Stream: TFileStream);
  var
    BankID , BankName ,ReportingDate : WideString;
    ABankInfo : TBankInfo;
  begin
    ABankInfo := BankInfoForm.Get_BankInfo;
    BankID := ABankInfo.BankID;
    BankName := ABankInfo.BankName;

    ReportingDate := FormatDateTime('dd/mm/yyyy',MainForm.ReportDate);

    WriteString(Stream, '<?xml version="1.0" encoding="UTF-8" ?> ');
    WriteString(Stream, '<CreditInfo>');

    WriteString(Stream,'<Header>');
    WriteString(Stream,'<BankID>');
    WriteString(Stream,UTF8Encode(BankID));
    WriteString(Stream,'</BankID>');
    WriteString(Stream,'<BankName>');
    WriteString(Stream,UTF8Encode(BankName));
    WriteString(Stream,'</BankName>');
    WriteString(Stream,'<ReportingDate>');
    WriteString(Stream,ReportingDate);
    WriteString(Stream,'</ReportingDate>');
    WriteString(Stream,'</Header>');
    WriteString(Stream,'<Credits>');

  end;

  procedure WriteFileEnd(Stream: TFileStream);
  begin
    WriteString(Stream,'</Credits>');
    WriteString(Stream, '</CreditInfo>');
  end;

  procedure WriteData(Stream : TFileStream; Field : TField);

    function GetFieldStr(Field: TField): WideString;
    begin  {#,##0.00}
      if not Field.IsNull then
      case Field.DataType of
        ftBoolean:          Result := UpperCase(Field.AsString);
        ftDate ,ftDateTime: Result    := FormatDateTime('dd/mm/yyyy', Field.AsDateTime);
        ftString :          Result := Field.AsString;
        else
          Result := Field.AsString;
      end // case
      else
        Result := '';
    end;

    procedure GetSpecimenSettings(FieldName : String;
      var TagFirst, TagLast, TagPrefix, TagSuffix : String;
      var FieldGroup : Byte;
      var CanContainUTF8 : Boolean;
      var ParentGroup : Integer
      );
    begin
      with DataModuleMain.TagSettings do
      begin
        if Locate('FieldName',FieldName,[loCaseInsensitive]) then
        begin
          TagFirst := FieldByName('TagFirst').AsString;
          TagLast  := FieldByName('TagLast').AsString;
          TagPrefix := FieldByName('TagPrefix').AsString;
          TagSuffix := FieldByName('TagSuffix').AsString;
          FieldGroup:= FieldByName('FieldGroup').AsInteger;
          CanContainUTF8 := FieldByName('AlphaField').AsBoolean;
          ParentGroup := FieldByName('ParentGroup').AsInteger
        end else
          raise EFieldNotFoud.Create('TagSettings Table : Field Not Found!');
      end;
    end;

    function GetInvCharEquivalent(InvCharCode : Word) : Word;
    begin
      with DataModuleMain.UnicodeSettings do
      if Locate('InvalidCharCode', InvCharCode ,[]) then
        Result := FieldByName('ValidCharCode').AsInteger
      else
        Result := InvCharCode;
    end;

    function CorrectString(Str : WideString; DoCorrect : Boolean) : WideString;
    var
      P : Integer;
      WCharCount : Integer;
      Temp : WideString;
    begin
      if DoCorrect then
      begin
        Temp := Str;
        WCharCount := Length(Temp);
        for P := 1 to WCharCount do
          Temp[P] := WideChar(GetInvCharEquivalent(ORD(Temp[P])));
        Result := Temp
      end else
      Result := Str
    end;

  var

    S, FieldValue : WideString;
    TagFirst, TagLast, TagPrefix, TagSuffix : String;
    CanContainUTF8  : Boolean;
    ParentGroup : Integer;
    FieldGroup : Byte;
    AAnsiStr : String;

  begin

    S := '';

    GetSpecimenSettings(
      Field.FieldName,
      TagFirst,
      TagLast,
      TagPrefix,
      TagSuffix,
      FieldGroup,
      CanContainUTF8,
      ParentGroup
    );

    if (FieldGroup in UnusableGrops) or (ParentGroup in UnusableGrops) then
    begin
      if    (TagSuffix <> '')
        and (not (ParentGroup in UnusableGrops)) then
      WriteString(Stream,TagSuffix);
      // This is not usable group but we must close opened tag of parent group


      Exit; // Do not EXPORT this field group
    end;

    FieldValue := GetFieldStr(Field);

    if (FieldValue = '') then
    begin


      if (TagPrefix<>'')
        and (not (ParentGroup in UnusableGrops))
        and (ParentGroup <> -1)
        then
      WriteString(Stream,TagPrefix);

      if (TagSuffix<>'')
        and (not (ParentGroup in UnusableGrops))
        and ((ParentGroup <> -1))
        then
      WriteString(Stream,TagSuffix);

      if (ParentGroup=-2) then
        WriteString(Stream,TagFirst+TagLast);

      if (FieldGroup <> 0) and (ParentGroup<>0) and (ParentGroup<>-2) then
        UnusableGrops := UnusableGrops + [FieldGroup];

      Exit // This Group can not be EXPORTED

    end;


{*    if ((FieldValue = '') and (TagPrefix<>'')) or (ParentGroup in UnusableGrops) then
    begin
      if FieldGroup <> 0 then
        UnusableGrops := UnusableGrops + [FieldGroup];

      LogMemo.Lines.Add(Field.FieldName+'Exit2');

      Exit // This Group can not be EXPORTED
    end;
*}
    S := TagPrefix + TagFirst + CorrectString(FieldValue,CanContainUTF8) + TagLast + TagSuffix;
    AAnsiStr := UTF8Encode(S);

    //Writting Data To Stream

    WriteString(Stream,AAnsiStr);

  end;

  procedure WriteRowsPrefix(Stream : TFileStream);
  begin
    WriteString(Stream,'<Credit>');
  end;

  procedure WriteRowsSuffix(Stream : TFileStream);
  begin
    WriteString(Stream,'</Credit>');
  end;

var
  Stream : TFileStream;
  DBaseName, DFileName : String;
  P : Integer;
  FieldsList : TList;
  AFieldName : String;

begin
  ButtonAbort.Enabled := True;
  // Enable Abort Button
  DBaseName := ExtractFileDir(EditSource.Text);
  DFileName := ExtractFileName(EditSource.Text);
  Stream := TFileStream.Create(EditDest.Text, fmCreate);
  FieldsList := TList.Create;
  SourceBuffer := StrAlloc(1024);
  UnusableGrops := [];
  //Screen.Cursor := crHourGlass;

  try
    with DataModuleMain.EXPORT do
    begin
      DatabaseName := DBaseName;
      TableName := DFileName;
      Active := True;

      if RecordCount < 0 then
        raise EEmptyTable.Create(Format('"%s" is EMPTY!',[EditSource.Text]));

      // Build Sort Field List
      DataModuleMain.TagSettings__.Active := True;

      DataModuleMain.TagSettings__.First;

      while not DataModuleMain.TagSettings__.EOF do
      begin
        // This field can be exported
        if DataModuleMain.TagSettings__.FieldByName('UseField').AsBoolean then
        begin
          AFieldName := DataModuleMain.TagSettings__.FieldByName('FieldName').AsString;
          FieldsList.Add(Pointer(Fields.FindField(AFieldName)));
        end;
        DataModuleMain.TagSettings__.NEXT;
      end;

      DataModuleMain.TagSettings__.Close;

      // Begin Creating XML file
      First;  // Why? I dont know!

      with JobProgress do
      begin
        Position := 0;
        Max := RecordCount;
      end;

      // Write File Header
      WriteFileBegin(Stream);

      repeat

        WriteRowsPrefix(Stream);

        for P := 0 to FieldsList.Count - 1 do
          WriteData(Stream,FieldsList[P]);

        WriteRowsSuffix(Stream);

        UnusableGrops := [];

        NEXT;// Never Forgot it !

        JobProgress.Position := RecNo;

        Application.ProcessMessages;

      until EOF or (AbortPressed);

    end;

    // Write File Footer
    WriteFileEnd(Stream);

    MessageDlg('Datafile successful exported',mtInformation,[mbOk],0);

  finally

    //Screen.Cursor := crDefault;
    FieldsList.Free;
    Stream.Free;
    StrDispose(SourceBuffer);
    AbortPressed := False;
    JobProgress.Position := 0;
    ButtonAbort.Enabled := False;
  end;
end;

procedure TMainForm.SBOpenClick(Sender: TObject);
begin
  with OpenDlg do
  if Execute then
    EditSource.Text := FileName;
  bntExport.Enabled := (EditSource.Text <> '') and (EditDest.Text <> '')
end;

procedure TMainForm.SBSaveClick(Sender: TObject);
begin
  with SaveDlg do
  if Execute then
    EditDest.Text := FileName;
  bntExport.Enabled := (EditSource.Text <> '') and (EditDest.Text <> '')
end;

procedure TMainForm.ButtonAbortClick(Sender: TObject);
begin
  if MessageDlg('Sure want stop process?',mtConfirmation,mbOKCancel,0) = mrOk then
    AbortPressed := True;
end;

end.
