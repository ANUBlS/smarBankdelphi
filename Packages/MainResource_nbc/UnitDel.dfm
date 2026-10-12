object FrmDel: TFrmDel
  Left = 410
  Top = 200
  Width = 171
  Height = 244
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 106
    Height = 13
    Caption = 'Силинмя тарихини сеч'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DTPDel: TDateTimePicker
    Left = 16
    Top = 48
    Width = 129
    Height = 21
    CalAlignment = dtaLeft
    Date = 40347.405832963
    Time = 40347.405832963
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object BitDel: TBitBtn
    Left = 32
    Top = 96
    Width = 81
    Height = 25
    Caption = 'Ехжел'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitDelClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000800000FF00FF00FF00FF000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF000080000000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000800000FF00FF00FF00FF000080
      0000FFFFFF000080000000800000008000000080000000800000FFFFFF000080
      00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
      00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF0000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080000000800000008000000080
      0000FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00008000000080000000800000008000000080
      000000800000FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00008000000080
      00000080000000800000FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000080000000800000FF00FF00FF00FF000080
      0000008000000080000000800000008000000080000000800000008000000080
      00000080000000800000008000000080000000800000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 152
    Width = 150
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 48
    Top = 8
    Width = 57
    Height = 33
    DataSource = DataModWares.DSDel
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'WARES_NAME'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WARES_ID'
        Width = 10
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVENTAR_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRST_PRICE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMAINDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALL_AMORT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERCENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_FIRST_PRICE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_REMAINDER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_AMORT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_ALL_AMORT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_PERCENT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSE_FORMAT'
        Title.Caption = 'Баьланма тарихи'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMORT_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_CLOSE_FORMAT'
        Title.Caption = 'В.Баьланма тарихи'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVENTAR_NO'
        Title.Caption = 'Инвентар нъмря'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEL_DATE'
        Visible = True
      end>
  end
  object CMExcelExport1: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = RUSSIAN_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Azl Sans Serif'
    FontTitles.Style = []
    BorderTitles.BackColor = clAqua
    OrientationTitles = 0
    FontData.Charset = RUSSIAN_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Azl Sans Serif'
    FontData.Style = []
    FontSummary.Charset = RUSSIAN_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Azl Sans Serif'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 64
    Top = 136
  end
end
