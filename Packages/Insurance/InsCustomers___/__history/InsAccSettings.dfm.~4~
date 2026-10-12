object fmAccSettings: TfmAccSettings
  Left = 277
  Top = 289
  BorderStyle = bsDialog
  Caption = 'Hesablarin sazlanmasi'
  ClientHeight = 173
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 363
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnDblClick = Panel1DblClick
    DesignSize = (
      363
      32)
    object BitBtn1: TBitBtn
      Left = 181
      Top = 4
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 276
      Top = 4
      Width = 80
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 363
    Height = 141
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1065#1077#1089#1072#1073#1083#1072#1088
      object Label1: TLabel
        Left = 2
        Top = 9
        Width = 65
        Height = 14
        Caption = #1046#1072#1088#1080' '#1097#1077#1089#1072#1073
      end
      object Label2: TLabel
        Left = 3
        Top = 60
        Width = 74
        Height = 14
        Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 80
        Top = 33
        Width = 274
        Height = 22
        DataField = 'CURRACC_ID'
        DataSource = InsDataMod.DSContracts
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = InsDataMod.DSCurrAccList
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 80
        Top = 86
        Width = 274
        Height = 22
        DataField = 'LOANACC_ID'
        DataSource = InsDataMod.DSContracts
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = InsDataMod.DSLoanAccLists
        TabOrder = 1
        OnClick = DBLookupComboBox1Click
      end
      object SearchCombo1: TSearchCombo
        Left = 80
        Top = 6
        Width = 274
        Height = 22
        Style = csDropDown
        TabOrder = 2
        OnClick = SearchCombo1Click
        OnKeyPress = SearchCombo1KeyPress
        DataSource = InsDataMod.DSCurrAccList
        ViewField = 'acc_no'
        DefaultStringUse = False
        DefaultStringColor = clWindowText
      end
      object SearchCombo2: TSearchCombo
        Left = 80
        Top = 59
        Width = 274
        Height = 22
        Style = csDropDown
        TabOrder = 3
        OnClick = SearchCombo2Click
        OnKeyPress = SearchCombo1KeyPress
        DataSource = InsDataMod.DSLoanAccLists
        ViewField = 'acc_no'
        DefaultStringUse = False
        DefaultStringColor = clWindowText
      end
    end
  end
end
