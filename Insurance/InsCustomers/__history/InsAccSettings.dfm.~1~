object fmAccSettings: TfmAccSettings
  Left = 384
  Top = 397
  BorderStyle = bsDialog
  Caption = 'Hesablarin sazlanmasi'
  ClientHeight = 161
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 131
    Width = 337
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnDblClick = Panel1DblClick
    object BitBtn1: TBitBtn
      Left = 168
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 256
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 337
    Height = 131
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'ўесаблар'
      object Label1: TLabel
        Left = 2
        Top = 8
        Width = 50
        Height = 13
        Caption = '∆ари щесаб'
      end
      object Label2: TLabel
        Left = 3
        Top = 56
        Width = 64
        Height = 13
        Caption = '—суда щесабы'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 74
        Top = 31
        Width = 255
        Height = 21
        DataField = 'CURRACC_ID'
        DataSource = InsDataMod.DSContracts
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = InsDataMod.DSCurrAccList
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 74
        Top = 80
        Width = 255
        Height = 21
        DataField = 'LOANACC_ID'
        DataSource = InsDataMod.DSContracts
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = InsDataMod.DSLoanAccLists
        TabOrder = 1
        OnClick = DBLookupComboBox1Click
      end
      object SearchCombo1: TSearchCombo
        Left = 74
        Top = 6
        Width = 255
        Height = 21
        Style = csDropDown
        ItemHeight = 13
        TabOrder = 2
        OnClick = SearchCombo1Click
        OnKeyPress = SearchCombo1KeyPress
        DataSource = InsDataMod.DSCurrAccList
        ViewField = 'acc_no'
        DefaultStringUse = False
        DefaultStringColor = clWindowText
      end
      object SearchCombo2: TSearchCombo
        Left = 74
        Top = 55
        Width = 255
        Height = 21
        Style = csDropDown
        ItemHeight = 13
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
