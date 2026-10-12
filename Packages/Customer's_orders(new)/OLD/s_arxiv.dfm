object send_arxiv: Tsend_arxiv
  Left = 332
  Top = 151
  Width = 231
  Height = 194
  Caption = 'Arxive gonderme'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 223
    Height = 167
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 221
      Height = 52
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 23
        Top = 16
        Width = 167
        Height = 13
        Caption = 'јрхив€ эюнд€рил€н с€р€нжамын'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 46
        Top = 31
        Width = 104
        Height = 13
        Caption = ' тарихини дахил един!'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 56
      Width = 221
      Height = 44
      Align = alBottom
      TabOrder = 1
      object closedate: TDateTimePicker
        Left = 35
        Top = 15
        Width = 157
        Height = 21
        CalAlignment = dtaLeft
        Date = 38716.9766529745
        Time = 38716.9766529745
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 100
      Width = 221
      Height = 66
      Align = alBottom
      TabOrder = 2
      object Button1: TButton
        Left = 72
        Top = 24
        Width = 75
        Height = 25
        Caption = '√€бул'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
end
