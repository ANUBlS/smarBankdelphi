object FormSearchCustName: TFormSearchCustName
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'M'#252#351't'#601'rinin axtar'#305#351#305
  ClientHeight = 414
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 898
    Height = 375
    Align = alClient
    Color = clWhite
    DataSource = DSSendDataName
    DrawingStyle = gdsGradient
    GradientEndColor = clMedGray
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'LASTNAME'
        Title.Alignment = taCenter
        Title.Caption = 'Soyad'#305
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Ad'#305
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SONAME'
        Title.Alignment = taCenter
        Title.Caption = 'Atas'#305'n'#305'n ad'#305
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASSPIN'
        Title.Alignment = taCenter
        Title.Caption = 'Pinkod'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASSER'
        Title.Alignment = taCenter
        Title.Caption = 'Seriya'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PASPNUM'
        Title.Alignment = taCenter
        Title.Caption = 'N'#246'mr'#601
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_TYPE_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'rinin tipi'
        Width = 150
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 375
    Width = 898
    Height = 39
    Align = alBottom
    TabOrder = 1
    object EditLastName: TEdit
      Left = 4
      Top = 7
      Width = 150
      Height = 21
      TabOrder = 0
      Visible = False
      OnExit = EditLastNameExit
      OnKeyPress = EditLastNameKeyPress
    end
    object EditName: TEdit
      Left = 154
      Top = 7
      Width = 150
      Height = 21
      TabOrder = 1
      Visible = False
      OnExit = EditLastNameExit
      OnKeyPress = EditLastNameKeyPress
    end
    object EditSoName: TEdit
      Left = 304
      Top = 7
      Width = 150
      Height = 21
      TabOrder = 2
      Visible = False
      OnExit = EditLastNameExit
      OnKeyPress = EditLastNameKeyPress
    end
    object EditPasspin: TEdit
      Left = 454
      Top = 7
      Width = 150
      Height = 21
      TabOrder = 3
      Visible = False
      OnExit = EditLastNameExit
      OnKeyPress = EditLastNameKeyPress
    end
    object Button1: TButton
      Left = 816
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 4
      OnClick = Button1Click
      OnKeyPress = EditLastNameKeyPress
    end
    object EditPaspnum: TEdit
      Left = 605
      Top = 7
      Width = 150
      Height = 21
      TabOrder = 5
      Visible = False
      OnExit = EditLastNameExit
      OnKeyPress = EditLastNameKeyPress
    end
  end
  object SendDataSetName: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM EXP_CUSTSEND'
      'where id=-1'
      ''
      ''
      ''
      ''
      ''
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000002D00000004000000490044000100000000001000000044004F004300
      5F0054005900500045000100000000000E000000500041005300530050004900
      4E000100000000000C0000005000410053005300450052000100000000000E00
      000050004100530050004E0055004D0001000000000014000000420049005200
      5400480050004C00410043004500010000000000120000005000410053005000
      50004C0041004300450001000000000010000000500041005300500044004100
      5400450001000000000014000000500041005300530045005800500049005200
      45000100000000001600000043004900540049005A0045004E00530048004900
      50000100000000001800000043004900540049005A0045004E00530048004900
      500032000100000000001800000043004900540049005A0045004E0053004800
      490050003300010000000000100000004C004100530054004E0041004D004500
      0100000000000C00000053004F004E0041004D00450001000000000008000000
      4E0041004D0045000100000000000600000049004E004E000100000000000600
      000053004500580001000000000014000000460041004D005F00530054004100
      5400550053000100000000001400000041004400520053005F00530054004100
      5400450001000000000016000000420049005200540048005F00530054004100
      5400450001000000000010000000420049005200540048004400410059000100
      000000001600000044004F0043005F0043004F0055004E005400520059000100
      000000000800000043004900540059000100000000000E000000520045004700
      5F005A00490050000100000000000E0000004100440044005200450053005300
      0100000000000E000000500048004F004E0045005F004D000100000000000E00
      0000500048004F004E0045005F0048000100000000000C00000045005F004D00
      410049004C00010000000000140000004E004500520045005A00490044004500
      4E0054000100000000001200000043005500530054005F005400590050004500
      0100000000001C00000043005500530054005F0054005900500045005F004E00
      41004D0045000100000000001000000043005500530054004E0041004D004500
      0100000000001400000057004F0052004B005F0050004C004100430045000100
      000000001C00000057004F0052004B005F0041004400520053005F0053005000
      450043000100000000001200000057004F0052004B005F0043004E0054005200
      0100000000001200000057004F0052004B005F00430049005400590001000000
      00001400000057004F0052004B005F0053005400410054004500010000000000
      1000000057004F0052004B005F005A0049005000010000000000160000005700
      4F0052004B005F004100440052004500530053000100000000001E0000005700
      4F0052004B005F00500048004F004E0045005F00530050004500430001000000
      00001E00000057004F0052004B005F005000480043004F004E00540054005900
      500045000100000000001A00000057004F0052004B005F00500048004F005000
      50005200450046000100000000001400000057004F0052004B005F0050004800
      4F004E0045000100000000001400000057004F0052004B005F00500048004500
      580054000100000000001600000057004F0052004B005F005000480043004F00
      44004500010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 120
    Top = 136
    object SendDataSetNameID: TIntegerField
      FieldName = 'ID'
    end
    object SendDataSetNameDOC_TYPE: TFloatField
      FieldName = 'DOC_TYPE'
    end
    object SendDataSetNamePASSPIN: TWideStringField
      FieldName = 'PASSPIN'
      Size = 40
    end
    object SendDataSetNamePASSER: TWideStringField
      FieldName = 'PASSER'
      Size = 120
    end
    object SendDataSetNamePASPNUM: TWideStringField
      FieldName = 'PASPNUM'
      Size = 120
    end
    object SendDataSetNameBIRTHPLACE: TWideStringField
      FieldName = 'BIRTHPLACE'
      Size = 120
    end
    object SendDataSetNamePASPPLACE: TWideStringField
      FieldName = 'PASPPLACE'
      Size = 400
    end
    object SendDataSetNamePASPDATE: TDateTimeField
      FieldName = 'PASPDATE'
    end
    object SendDataSetNamePASSEXPIRE: TDateTimeField
      FieldName = 'PASSEXPIRE'
    end
    object SendDataSetNameCITIZENSHIP: TFloatField
      FieldName = 'CITIZENSHIP'
    end
    object SendDataSetNameCITIZENSHIP2: TFloatField
      FieldName = 'CITIZENSHIP2'
    end
    object SendDataSetNameCITIZENSHIP3: TFloatField
      FieldName = 'CITIZENSHIP3'
    end
    object SendDataSetNameLASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Size = 120
    end
    object SendDataSetNameSONAME: TWideStringField
      FieldName = 'SONAME'
      Size = 120
    end
    object SendDataSetNameNAME: TWideStringField
      FieldName = 'NAME'
      Size = 120
    end
    object SendDataSetNameCUSTNAME: TWideStringField
      FieldName = 'CUSTNAME'
      Size = 360
    end
    object SendDataSetNameINN: TWideStringField
      FieldName = 'INN'
      Size = 80
    end
    object SendDataSetNameSEX: TFloatField
      FieldName = 'SEX'
    end
    object SendDataSetNameFAM_STATUS: TFloatField
      FieldName = 'FAM_STATUS'
    end
    object SendDataSetNameADRS_STATE: TWideStringField
      FieldName = 'ADRS_STATE'
      Size = 120
    end
    object SendDataSetNameBIRTH_STATE: TWideStringField
      FieldName = 'BIRTH_STATE'
      Size = 120
    end
    object SendDataSetNameBIRTHDAY: TDateTimeField
      FieldName = 'BIRTHDAY'
    end
    object SendDataSetNameDOC_COUNTRY: TWideStringField
      FieldName = 'DOC_COUNTRY'
      Size = 160
    end
    object SendDataSetNameCITY: TWideStringField
      FieldName = 'CITY'
      Size = 960
    end
    object SendDataSetNameADDRESS: TWideStringField
      FieldName = 'ADDRESS'
      Size = 1600
    end
    object SendDataSetNameREG_ZIP: TWideStringField
      FieldName = 'REG_ZIP'
      Size = 160
    end
    object SendDataSetNamePHONE_M: TWideStringField
      FieldName = 'PHONE_M'
      Size = 480
    end
    object SendDataSetNamePHONE_H: TWideStringField
      FieldName = 'PHONE_H'
      Size = 120
    end
    object SendDataSetNameE_MAIL: TWideStringField
      FieldName = 'E_MAIL'
      Size = 120
    end
    object SendDataSetNameNEREZIDENT: TFloatField
      FieldName = 'NEREZIDENT'
    end
    object SendDataSetNameCUST_TYPE: TIntegerField
      FieldName = 'CUST_TYPE'
    end
    object SendDataSetNameCUST_TYPE_NAME: TWideStringField
      FieldName = 'CUST_TYPE_NAME'
      Size = 200
    end
    object SendDataSetNameWORK_PLACE: TWideStringField
      FieldName = 'WORK_PLACE'
      Size = 200
    end
    object SendDataSetNameWORK_ADRS_SPEC: TFloatField
      FieldName = 'WORK_ADRS_SPEC'
    end
    object SendDataSetNameWORK_CNTR: TFloatField
      FieldName = 'WORK_CNTR'
    end
    object SendDataSetNameWORK_CITY: TFloatField
      FieldName = 'WORK_CITY'
    end
    object SendDataSetNameWORK_STATE: TWideStringField
      FieldName = 'WORK_STATE'
      Size = 240
    end
    object SendDataSetNameWORK_ZIP: TWideStringField
      FieldName = 'WORK_ZIP'
      Size = 40
    end
    object SendDataSetNameWORK_ADRESS: TWideStringField
      FieldName = 'WORK_ADRESS'
      Size = 200
    end
    object SendDataSetNameWORK_PHONE_SPEC: TFloatField
      FieldName = 'WORK_PHONE_SPEC'
    end
    object SendDataSetNameWORK_PHCONTTYPE: TFloatField
      FieldName = 'WORK_PHCONTTYPE'
    end
    object SendDataSetNameWORK_PHOPPREF: TWideStringField
      FieldName = 'WORK_PHOPPREF'
      Size = 32
    end
    object SendDataSetNameWORK_PHONE: TWideStringField
      FieldName = 'WORK_PHONE'
      Size = 40
    end
    object SendDataSetNameWORK_PHEXT: TWideStringField
      FieldName = 'WORK_PHEXT'
      Size = 32
    end
    object SendDataSetNameWORK_PHCODE: TWideStringField
      FieldName = 'WORK_PHCODE'
      Size = 32
    end
  end
  object DSSendDataName: TDataSource
    DataSet = SendDataSetName
    Left = 224
    Top = 136
  end
end
