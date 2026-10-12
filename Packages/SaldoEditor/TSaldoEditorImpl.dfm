object SaldoEditor_: TSaldoEditor_
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'SaldoEditor_'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 2
      Width = 240
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 240
      Top = 2
      Width = 153
      Height = 22
      CalAlignment = dtaLeft
      Date = 37137.8069513889
      Time = 37137.8069513889
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object ToolButton1: TToolButton
      Left = 393
      Top = 2
      Width = 17
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 410
      Top = 2
      Width = 215
      Height = 22
      AutoSize = False
      Caption = 'Текушший день'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 29
    Width = 688
    Height = 372
    Align = alClient
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'ACC_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ReadOnly = True
        Title.Caption = 'Счет'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Color = 14811135
        Expanded = False
        FieldName = 'VAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Вал.'
        Width = 25
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DAT'
        Title.Caption = 'Дата пос.про.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OSTAT'
        Title.Alignment = taCenter
        Title.Caption = 'Остатка'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OSTAT'
        Title.Alignment = taCenter
        Title.Caption = 'Покрытие(ман)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBR_D'
        Title.Alignment = taCenter
        Title.Caption = 'Оборотка по ДЕБЕТу'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBR_K'
        Title.Alignment = taCenter
        Title.Caption = 'Оборотка по КРЕДИТу'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OBR_D'
        Title.Alignment = taCenter
        Title.Caption = 'Оборотка по ДЕБЕТу (ман)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POK_OBR_K'
        Title.Alignment = taCenter
        Title.Caption = 'Оборотка по КРЕДИТу (ман)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_ID'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 401
    Width = 688
    Height = 52
    Align = alBottom
    Caption = 'Поиск'
    TabOrder = 2
    object Edit1: TEdit
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
end
