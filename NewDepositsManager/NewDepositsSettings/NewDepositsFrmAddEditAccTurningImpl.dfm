object NewDepositsFrmAddEditAccTurning: TNewDepositsFrmAddEditAccTurning
  Left = 0
  Top = 0
  ClientHeight = 164
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 164
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitHeight = 263
    object XFPanel2: TXFPanel
      Left = 2
      Top = 120
      Width = 374
      Height = 41
      Align = alTop
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvLowered
      TabOrder = 0
      object XFButton1: TXFButton
        Left = 202
        Top = 6
        Width = 75
        Height = 25
        Caption = #1043#1103#1073#1091#1083
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = XFButton1Click
      end
      object XFButton2: TXFButton
        Left = 278
        Top = 6
        Width = 75
        Height = 25
        Caption = #1048#1084#1090#1080#1085#1072
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = XFButton2Click
      end
    end
    object XFPanel3: TXFPanel
      Left = 2
      Top = 79
      Width = 374
      Height = 41
      Align = alTop
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvLowered
      TabOrder = 1
      object XFPanel10: TXFPanel
        Left = 2
        Top = 2
        Width = 96
        Height = 33
        Align = alLeft
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvLowered
        TabOrder = 0
        object XFStaticText3: TXFStaticText
          Left = 2
          Top = 2
          Width = 88
          Height = 25
          Align = alClient
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = sbsSunken
          Caption = 'Hesab No'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object XFPanel11: TXFPanel
        Left = 99
        Top = 2
        Width = 269
        Height = 33
        Align = alRight
        BevelInner = bvRaised
        BevelKind = bkTile
        BevelOuter = bvLowered
        TabOrder = 1
        object XFButton: TXFSpeedButton
          Left = 238
          Top = 3
          Width = 23
          Height = 23
          OnClick = XFButtonClick
        end
        object EditAccno: TEdit
          Left = 2
          Top = 2
          Width = 233
          Height = 25
          Align = alLeft
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
    end
    object XFPanel4: TXFPanel
      Left = 2
      Top = 40
      Width = 374
      Height = 39
      Align = alTop
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvLowered
      TabOrder = 2
      object XFPanel8: TXFPanel
        Left = 2
        Top = 2
        Width = 96
        Height = 31
        Align = alLeft
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvLowered
        TabOrder = 0
        object XFStaticText2: TXFStaticText
          Left = 2
          Top = 2
          Width = 88
          Height = 23
          Align = alClient
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = sbsSunken
          Caption = 'Hesab'#305'n qrupu'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object XFPanel9: TXFPanel
        Left = 99
        Top = 2
        Width = 269
        Height = 31
        Align = alRight
        BevelInner = bvRaised
        BevelKind = bkTile
        BevelOuter = bvLowered
        TabOrder = 1
        object EditMoveName: TEdit
          Left = 2
          Top = 2
          Width = 261
          Height = 23
          Align = alLeft
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
    end
    object XFPanel5: TXFPanel
      Left = 2
      Top = 2
      Width = 374
      Height = 38
      Align = alTop
      BevelInner = bvSpace
      BevelKind = bkSoft
      BevelOuter = bvLowered
      TabOrder = 3
      object XFPanel6: TXFPanel
        Left = 2
        Top = 2
        Width = 96
        Height = 30
        Align = alLeft
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvLowered
        TabOrder = 0
        object XFStaticText1: TXFStaticText
          Left = 2
          Top = 2
          Width = 88
          Height = 22
          Align = alClient
          BevelInner = bvSpace
          BevelKind = bkFlat
          BorderStyle = sbsSunken
          Caption = 'M'#252#351't'#601'rinin tipi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDefault
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object XFPanel7: TXFPanel
        Left = 99
        Top = 2
        Width = 269
        Height = 30
        Align = alRight
        BevelInner = bvRaised
        BevelKind = bkFlat
        BevelOuter = bvLowered
        TabOrder = 1
        object DBCustType: TDBLookupComboBox
          Left = 2
          Top = 2
          Width = 261
          Height = 21
          KeyField = 'ID'
          ListField = 'CATEGORY'
          ListSource = CategoriesNewDatSrc
          TabOrder = 0
          OnClick = DBCustTypeClick
        end
      end
    end
  end
  object Categories: TOracleDataSet
    SQL.Strings = (
      'select * from dm_categories')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000005000000040000004900440001000000000010000000430041005400
      450047004F005200590001000000000016000000430055005300540041005400
      450047004F005200590001000000000016000000520045005A00430041005400
      450047004F005200590001000000000016000000560041004C00430041005400
      450047004F0052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 24
    Top = 180
    object CategoriesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CategoriesCATEGORY: TWideStringField
      FieldName = 'CATEGORY'
      Size = 128
    end
    object CategoriesCUSTATEGORY: TFloatField
      FieldName = 'CUSTATEGORY'
    end
    object CategoriesREZCATEGORY: TFloatField
      FieldName = 'REZCATEGORY'
    end
    object CategoriesVALCATEGORY: TFloatField
      FieldName = 'VALCATEGORY'
    end
  end
  object CategoriesNewDatSrc: TDataSource
    DataSet = Categories
    Left = 128
    Top = 180
  end
  object MoveNames: TOracleDataSet
    SQL.Strings = (
      'select * from dm_movie_names'
      'where typeid=:typeid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A00540059005000450049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000C000000540059005000
      450049004400010000000000080000004E0041004D0045000100000000001600
      00004400450053004300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 232
    Top = 184
    object MoveNamesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object MoveNamesTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object MoveNamesNAME: TWideStringField
      FieldName = 'NAME'
      Size = 256
    end
    object MoveNamesDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 512
    end
  end
  object MoveNamesDatSrc: TDataSource
    Left = 312
    Top = 184
  end
end
