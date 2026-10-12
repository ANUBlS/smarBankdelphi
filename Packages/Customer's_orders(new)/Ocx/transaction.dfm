object Emeliyyat: TEmeliyyat
  Left = 297
  Top = 470
  BorderStyle = bsDialog
  Caption = 'Emeliyyat'
  ClientHeight = 107
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 657
    Height = 103
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 15
      Width = 185
      Height = 42
      Caption = 'Debet'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object SearchEdit1: TSearchEdit
        Left = 8
        Top = 16
        Width = 161
        Height = 21
        TabOrder = 0
        OnChange = SearchEdit1Change
        DataSource = DataModCustOrders.account_
        SearchField = 'acc_no'
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 24
        Width = 65
        Height = 21
        DataField = 'ID'
        DataSource = DataModCustOrders.account_
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 194
      Top = 15
      Width = 189
      Height = 42
      Caption = 'Kredit'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object SearchEdit2: TSearchEdit
        Left = 8
        Top = 16
        Width = 169
        Height = 21
        TabOrder = 0
        OnChange = SearchEdit2Change
        DataSource = DataModCustOrders.Acc_
        SearchField = 'acc_no'
      end
      object DBEdit2: TDBEdit
        Left = 120
        Top = 24
        Width = 57
        Height = 21
        DataField = 'ID'
        DataSource = DataModCustOrders.Acc_
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
    end
    object GroupBox4: TGroupBox
      Left = 384
      Top = 16
      Width = 151
      Height = 43
      Caption = 'ћ€бл€ь'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object total: TEdit
        Left = 8
        Top = 14
        Width = 135
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 544
      Top = 18
      Width = 105
      Height = 79
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 4
        Top = 9
        Width = 93
        Height = 28
        Caption = '√€бул'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Button1: TButton
        Left = 8
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object GroupBox6: TGroupBox
      Left = 8
      Top = 57
      Width = 529
      Height = 43
      Caption = 'ям€лиййатын т€йинаты'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object proper_edit: TEdit
        Left = 7
        Top = 13
        Width = 514
        Height = 21
        TabOrder = 0
      end
    end
  end
end
