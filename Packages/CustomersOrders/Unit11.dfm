object Send_arxiv: TSend_arxiv
  Left = 306
  Top = 180
  Width = 213
  Height = 201
  Caption = 'Arxive gonderme'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 4
    Top = 0
    Width = 197
    Height = 65
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 170
      Height = 13
      Caption = 'arxive gonderilen serencamin '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 48
      Top = 32
      Width = 104
      Height = 13
      Caption = 'tarixini daxil edin !'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 64
    Width = 197
    Height = 49
    TabOrder = 1
    object DateTimePicker1: TDateTimePicker
      Left = 24
      Top = 16
      Width = 153
      Height = 21
      CalAlignment = dtaLeft
      Date = 39520.1395321528
      Time = 39520.1395321528
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 112
    Width = 197
    Height = 49
    TabOrder = 2
    object Button1: TButton
      Left = 56
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Qebul'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
