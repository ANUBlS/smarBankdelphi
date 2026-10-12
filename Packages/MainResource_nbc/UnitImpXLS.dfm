object FormImpXLS: TFormImpXLS
  Left = 273
  Top = 150
  Width = 341
  Height = 92
  Caption = 'Import Excel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 65
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelSelRow: TLabel
      Left = 16
      Top = 16
      Width = 47
      Height = 13
      Caption = 'StartRow:'
    end
    object Label1: TLabel
      Left = 16
      Top = 40
      Width = 76
      Height = 13
      Caption = 'Last Amort Date'
    end
    object CBoxStartRow: TComboBox
      Left = 104
      Top = 8
      Width = 89
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15')
    end
    object BitBtnOk: TBitBtn
      Left = 224
      Top = 5
      Width = 105
      Height = 49
      Caption = 'Start Import '
      TabOrder = 1
      OnClick = BitBtnOkClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000016000000140000000100
        040000000000F0000000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555005555555555555555555555005555888888888888888555005599
        9999119999999B5555005559999111199999B555550055553B443333BBBB5555
        5500555554C448888555555555005555ECCCC4488855555555005555ECCCCC44
        8885555555005555ECC4ECC44888555555005555ECC48ECC4488855555005555
        EC4885ECC448885555005555EF48855ECC44888555005555EEC55555ECC44888
        55005555555555555ECC4488550055555555555555ECC4485500555555555555
        555ECC4855005555555555555555EC4555005555555555555555555555005555
        55555555555555555500}
    end
    object DTPLastAmort_date: TDateTimePicker
      Left = 104
      Top = 32
      Width = 89
      Height = 21
      CalAlignment = dtaLeft
      Date = 38989.2463311921
      Time = 38989.2463311921
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 72
    Top = 11
  end
  object OpenDlg: TOpenDialog
    Filter = 'Excel File|*.xls|Any File|*.*'
    Left = 112
    Top = 8
  end
end
