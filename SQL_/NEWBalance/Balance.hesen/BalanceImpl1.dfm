object BalanceX: TBalanceX
  Left = 192
  Top = 93
  Width = 388
  Height = 359
  Caption = 'BalanceX'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 3
    Top = 0
    Width = 366
    Height = 318
    Caption = 'Баланс щесабаты'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 5
      Top = 12
      Width = 212
      Height = 67
      Caption = 'Тарих'
      TabOrder = 3
      object Label1: TLabel
        Left = 2
        Top = 22
        Width = 66
        Height = 13
        Caption = 'Дюврцн яввяли'
      end
      object Label9: TLabel
        Left = 8
        Top = 44
        Width = 61
        Height = 13
        Caption = 'Дюврцн сону'
      end
      object DateTimePicker1: TDateTimePicker
        Left = 77
        Top = 14
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 36658.8838795139
        Time = 36658.8838795139
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 77
        Top = 38
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 36658.8838795139
        Time = 36658.8838795139
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 79
      Width = 216
      Height = 174
      Caption = 'Сечимляр'
      TabOrder = 4
      object Label3: TLabel
        Left = 5
        Top = 132
        Width = 84
        Height = 13
        Caption = 'Щесабатын формасы'
      end
      object Label4: TLabel
        Left = 5
        Top = 93
        Width = 118
        Height = 13
        Caption = 'Милии валйутада еквивалент'
      end
      object Label5: TLabel
        Left = 5
        Top = 53
        Width = 38
        Height = 13
        Caption = 'Валйута:'
      end
      object Label2: TLabel
        Left = 5
        Top = 14
        Width = 77
        Height = 13
        Caption = 'Баланс щесаблары'
      end
      object ComboBoxForm: TComboBox
        Left = 5
        Top = 147
        Width = 208
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'Галыглар'
        Items.Strings = (
          'Галыглар'
          '// '
          'Дювриййяли'
          'Галыглар (щес.адлары иля)')
      end
      object ComboBoxPok: TComboBox
        Left = 5
        Top = 107
        Width = 208
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'Валйута балансы'
        Items.Strings = (
          'Валйута балансы'
          'Милли валйутада баланс')
      end
      object ComboBoxPlan: TComboBox
        Left = 5
        Top = 28
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = '1 щесаб планы'
        Items.Strings = (
          '1 щесаб планы'
          '2 щесаб планы'
          '3 щесаб планы'
          '4 щесаб планы')
      end
      object ComboBoxAvalute: TComboBox
        Left = 5
        Top = 67
        Width = 206
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Бцтцн валйуталар'
        OnChange = ComboBoxAvaluteChange
        OnClick = ComboBoxAvaluteChange
        Items.Strings = (
          ''
          ''
          ''
          '')
      end
    end
    object GroupBox3: TGroupBox
      Left = 222
      Top = 16
      Width = 139
      Height = 235
      Caption = 'Милли банк'
      TabOrder = 5
      object Label6: TLabel
        Left = 7
        Top = 45
        Width = 18
        Height = 13
        Caption = 'NB:'
      end
      object Label7: TLabel
        Left = 7
        Top = 65
        Width = 17
        Height = 13
        Caption = 'NF:'
      end
      object Label8: TLabel
        Left = 4
        Top = 21
        Width = 127
        Height = 13
        Caption = 'АР МБ цчцн баланс файллары'
      end
      object Button3: TButton
        Left = 17
        Top = 86
        Width = 87
        Height = 23
        Caption = 'Йаратмаг'
        TabOrder = 0
      end
      object Button4: TButton
        Left = 17
        Top = 109
        Width = 87
        Height = 21
        Caption = 'Баьмаг'
        TabOrder = 1
      end
      object Button5: TButton
        Left = 6
        Top = 163
        Width = 114
        Height = 43
        Caption = 'Дискетя йазмаг'
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 5
        Top = 135
        Width = 114
        Height = 21
        TabOrder = 2
        Text = 'A:\'
      end
      object DBEdit1: TDBEdit
        Left = 30
        Top = 37
        Width = 81
        Height = 21
        TabOrder = 4
      end
      object DBEdit2: TDBEdit
        Left = 30
        Top = 58
        Width = 81
        Height = 21
        TabOrder = 5
      end
    end
    object BitBtnAnaliz: TBitBtn
      Left = 123
      Top = 259
      Width = 75
      Height = 25
      Caption = 'Анализ'
      TabOrder = 0
      OnClick = BitBtnAnalizClick
    end
    object BitBtnOk: TBitBtn
      Left = 203
      Top = 259
      Width = 75
      Height = 25
      Caption = 'Ок'
      TabOrder = 1
    end
    object BitBtnClose: TBitBtn
      Left = 283
      Top = 259
      Width = 75
      Height = 25
      Caption = 'Имтина'
      TabOrder = 2
    end
    object ProgressBar1: TProgressBar
      Left = 2
      Top = 300
      Width = 362
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 6
    end
    object Button1: TButton
      Left = 40
      Top = 264
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 7
      OnClick = Button1Click
    end
  end
end
