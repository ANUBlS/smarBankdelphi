object FormDat: TFormDat
  Left = 492
  Top = 194
  BorderStyle = bsDialog
  Caption = 'FormDat'
  ClientHeight = 218
  ClientWidth = 156
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 156
    Height = 218
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 82
      Height = 13
      Caption = 'јмортизасийа тарихи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DTPBegin: TDateTimePicker
      Left = 8
      Top = 24
      Width = 137
      Height = 21
      CalAlignment = dtaLeft
      Date = 38917.8112130787
      Time = 38917.8112130787
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DTPEnd: TDateTimePicker
      Left = 8
      Top = 48
      Width = 137
      Height = 21
      CalAlignment = dtaLeft
      Date = 38917.8113236574
      Time = 38917.8113236574
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object ButtonOk: TButton
      Left = 8
      Top = 189
      Width = 137
      Height = 25
      Caption = 'Icra et....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonOkClick
    end
    object RadioGExcel: TRadioGroup
      Left = 8
      Top = 72
      Width = 137
      Height = 113
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Maliyy€'
        'Vergi'
        'ў€р икиси')
      ParentFont = False
      TabOrder = 3
    end
  end
end
