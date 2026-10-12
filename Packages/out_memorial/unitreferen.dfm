object formreference: Tformreference
  Left = 192
  Top = 133
  Caption = 'formreference'
  ClientHeight = 291
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 5
      Top = 8
      Width = 240
      Height = 25
      DataSource = memorial_DataModule.DataSrcRefer
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 295
    Height = 250
    Align = alClient
    Caption = 'Bu balans hesablar'#305'ndan istifad'#601' etm'#601
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 16
      Width = 291
      Height = 232
      Align = alClient
      DataSource = memorial_DataModule.DataSrcRefer
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'BALANCE'
          Title.Caption = 'Balans hesab'#305
          Width = 111
          Visible = True
        end>
    end
  end
end
