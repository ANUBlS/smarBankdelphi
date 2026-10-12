object MainReferForm: TMainReferForm
  Left = 233
  Top = 189
  BorderIcons = [biSystemMenu]
  ClientHeight = 471
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 37
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object CmbBoxValue: TComboBox
      Left = 5
      Top = 8
      Width = 262
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 285
      Top = 6
      Width = 75
      Height = 25
      Action = SaveActn
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 452
    Width = 367
    Height = 19
    Panels = <>
  end
  object TV: TTreeView
    Left = 0
    Top = 37
    Width = 367
    Height = 415
    Align = alClient
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnChange = TVChange
  end
  object Refers: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, parentid, iname, description, integervalue, charvalue' +
        ','
      '       availablevalues'
      '  FROM cm_references'
      'order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000007000000040000004900440001000000000010000000500041005200
      45004E005400490044000100000000000A00000049004E0041004D0045000100
      00000000160000004400450053004300520049005000540049004F004E000100
      000000001800000049004E0054004500470045005200560041004C0055004500
      010000000000120000004300480041005200560041004C005500450001000000
      00001E00000041005600410049004C00410042004C004500560041004C005500
      45005300010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 176
    object RefersID: TFloatField
      FieldName = 'ID'
    end
    object RefersPARENTID: TFloatField
      FieldName = 'PARENTID'
    end
    object RefersINAME: TWideStringField
      FieldName = 'INAME'
      Size = 32
    end
    object RefersDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object RefersINTEGERVALUE: TFloatField
      FieldName = 'INTEGERVALUE'
    end
    object RefersCHARVALUE: TWideStringField
      FieldName = 'CHARVALUE'
      Size = 8
    end
    object RefersAVAILABLEVALUES: TWideStringField
      FieldName = 'AVAILABLEVALUES'
      Size = 64
    end
  end
  object Temp: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, parentid, iname, description, integervalue, charvalue' +
        ','
      '       availablevalues'
      '  FROM cm_references'
      'where ParentID=:AParentID'
      '')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 128
  end
  object SetupPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CM_SETUP'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 72
    Top = 88
  end
  object ActionLst: TActionList
    Left = 120
    Top = 224
    object SaveActn: TAction
      Caption = '&'#1044#1103#1081#1080#1096
      OnExecute = SaveActnExecute
      OnUpdate = SaveActnUpdate
    end
  end
end
