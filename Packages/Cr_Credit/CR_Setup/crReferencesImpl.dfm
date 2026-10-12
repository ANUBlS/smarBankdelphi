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
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 395
    object CmbBoxValue: TComboBox
      Left = 5
      Top = 9
      Width = 283
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 307
      Top = 6
      Width = 81
      Height = 27
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
    ExplicitTop = 479
  end
  object TV: TTreeView
    Left = 0
    Top = 40
    Width = 367
    Height = 412
    Align = alClient
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnChange = TVChange
    ExplicitWidth = 395
    ExplicitHeight = 439
  end
  object Refers: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, parentid, iname, description, integervalue, charvalue' +
        ','
      '       availablevalues'
      '  FROM cr_references'
      'order by id')
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 176
    object RefersID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object RefersPARENTID: TFloatField
      FieldName = 'PARENTID'
      Required = True
    end
    object RefersINAME: TStringField
      FieldName = 'INAME'
      Required = True
      Size = 32
    end
    object RefersDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object RefersINTEGERVALUE: TFloatField
      FieldName = 'INTEGERVALUE'
    end
    object RefersCHARVALUE: TStringField
      FieldName = 'CHARVALUE'
      Size = 8
    end
    object RefersAVAILABLEVALUES: TStringField
      FieldName = 'AVAILABLEVALUES'
      Size = 64
    end
  end
  object Temp: TOracleDataSet
    SQL.Strings = (
      
        'SELECT id, parentid, iname, description, integervalue, charvalue' +
        ','
      '       availablevalues'
      '  FROM cr_references'
      'where ParentID=:AParentID'
      '')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A00410050004100520045004E00540049004400
      050000000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 256
    Top = 128
  end
  object Localizer: TNLSLocalizer
    Caption = #193#224#237#234#251#237' '#241#229#247#232#236#235#255#287#232
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 152
    Top = 208
  end
  object SetupPackage: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'CR_SETUP'
    ParameterMode = pmNamed
    Cursor = crHourGlass
    Left = 72
    Top = 88
  end
  object ActionLst: TActionList
    Left = 120
    Top = 224
    object SaveActn: TAction
      Caption = '&'#196#255#233#232#248
      OnExecute = SaveActnExecute
      OnUpdate = SaveActnUpdate
    end
  end
end
