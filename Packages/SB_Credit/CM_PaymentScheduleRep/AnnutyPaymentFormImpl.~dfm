object AnnutyForm: TAnnutyForm
  Left = 250
  Top = 184
  Width = 201
  Height = 298
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 193
    Height = 231
    Align = alTop
    Caption = 'Юдямянин шяртляри'
    TabOrder = 0
    object RGAnnuty: TRadioGroup
      Left = 2
      Top = 24
      Width = 189
      Height = 58
      Align = alTop
      Caption = 'Юдямя планынын типи'
      ItemIndex = 0
      Items.Strings = (
        '"Ануитет" гайдада'
        'Бярабяр щиссялярля')
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 82
      Width = 189
      Height = 37
      Align = alTop
      Caption = 'Илк юдямя тарихи'
      TabOrder = 2
      object DTPStartDate: TDateTimePicker
        Left = 2
        Top = 12
        Width = 111
        Height = 21
        CalAlignment = dtaLeft
        Date = 38201.7163403935
        Time = 38201.7163403935
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 119
      Width = 189
      Height = 37
      Align = alTop
      Caption = 'Мябляь'
      TabOrder = 3
      object AmountEdit: TCMCurrencyEdit
        Left = 2
        Top = 13
        Width = 159
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
    object GroupBox5: TGroupBox
      Left = 2
      Top = 156
      Width = 189
      Height = 36
      Align = alTop
      Caption = 'Юдямя периоду '
      TabOrder = 4
      object CmbBoxPeriodRate: TComboBox
        Left = 2
        Top = 12
        Width = 182
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'АЙЛЫГ'
          'РЦБЛЦК'
          'ЙАРЫМ-ИЛЛИК'
          'ИЛЛИК')
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 189
      Height = 9
      Align = alTop
      BorderStyle = bsSingle
      Color = clNavy
      TabOrder = 0
    end
    object GroupBox6: TGroupBox
      Left = 2
      Top = 192
      Width = 189
      Height = 36
      Align = alTop
      Caption = 'Периодларын сайы'
      TabOrder = 5
      object NPeriodsEdit: TEdit
        Left = 2
        Top = 12
        Width = 87
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object Button2: TButton
    Left = 16
    Top = 240
    Width = 75
    Height = 25
    Action = ActnApply
    TabOrder = 1
  end
  object Button3: TButton
    Left = 104
    Top = 240
    Width = 75
    Height = 25
    Action = ActnCancel
    TabOrder = 2
  end
  object NLSLocalizer1: TNLSLocalizer
    Caption = 'Юдямя гайдасы'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 152
    Top = 48
  end
  object ActionList1: TActionList
    Left = 152
    Top = 80
    object ActnApply: TAction
      Caption = 'Гябул'
      OnExecute = ActnApplyExecute
    end
    object ActnCancel: TAction
      Caption = 'Имтина'
      OnExecute = ActnCancelExecute
    end
  end
end
