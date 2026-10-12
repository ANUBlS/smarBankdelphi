object FrmPercents: TFrmPercents
  Left = 337
  Top = 173
  ActiveControl = FloatablePercentsEdit
  BorderStyle = bsDialog
  Caption = 'FrmPercents'
  ClientHeight = 272
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 199
    Height = 233
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '&Фаизляр'
      object PercentsList: TListBox
        Left = 0
        Top = 57
        Width = 191
        Height = 148
        Align = alClient
        ItemHeight = 13
        PopupMenu = PopupMenu
        TabOrder = 0
        OnContextPopup = PercentsListContextPopup
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 191
        Height = 57
        Align = alTop
        TabOrder = 1
        object SBNew: TSpeedButton
          Left = 164
          Top = 30
          Width = 24
          Height = 23
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888888888888888888888888888873333333333338887BB3B33B3B3
            B38887B3B3B13B3B3388873B3B9913B3B38887B3B399973B3388873B397B9973
            B38887B397BBB997338887FFFFFFFF91BB8888FBBBBB88891888888FFFF88888
            9188888888888888898888888888888888988888888888888888}
          OnClick = SBNewClick
        end
        object FloatablePercentsEdit: TEdit
          Left = 109
          Top = 31
          Width = 52
          Height = 21
          TabOrder = 0
          Text = '0.00'
          OnKeyPress = FloatablePercentsEditKeyPress
        end
        object DTPCurrentDate: TDateTimePicker
          Left = 6
          Top = 31
          Width = 91
          Height = 21
          CalAlignment = dtaLeft
          Date = 37532.8246503125
          Time = 37532.8246503125
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object StaticText1: TStaticText
          Left = 6
          Top = 11
          Width = 91
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Тарих'
          TabOrder = 2
        end
        object StaticText2: TStaticText
          Left = 109
          Top = 11
          Width = 50
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = 'Фаиз (%ля)'
          TabOrder = 3
        end
      end
    end
  end
  object BtnClose: TButton
    Left = 110
    Top = 240
    Width = 75
    Height = 25
    Caption = '&Чыхмаг'
    ModalResult = 1
    TabOrder = 1
  end
  object PopupMenu: TPopupMenu
    Left = 12
    Top = 88
    object miDelete: TMenuItem
      Caption = '&Pozmaq'
      OnClick = miDeleteClick
    end
    object miNone: TMenuItem
      Caption = '-'
    end
    object miClear: TMenuItem
      Caption = 'P&ozmaq (Hamisni)'
      OnClick = miClearClick
    end
  end
end
