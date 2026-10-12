object FrmPercen: TFrmPercen
  Left = 0
  Top = 0
  ClientHeight = 587
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 419
    Height = 128
    Align = alTop
    Caption = '  M'#252#351't'#601'rinin tipi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 415
      Height = 111
      Align = alClient
      DataSource = DmRt.SrcPersons
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIPION'
          Title.Caption = 'Kreditin  tipi'
          Width = 275
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 128
    Width = 419
    Height = 144
    Align = alTop
    Caption = '  Kredit m'#601'hsullar'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 415
      Height = 127
      Align = alClient
      DataSource = DmRt.SrcPersonLink
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          ReadOnly = True
          Title.Caption = 'M'#601'hsulun ad'#305' '
          Width = 292
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 272
    Width = 419
    Height = 144
    Align = alTop
    Caption = '  Valyutalar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 415
      Height = 127
      Align = alClient
      DataSource = DmRt.DSrcMeh
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'VALUTE'
          ReadOnly = True
          Title.Caption = '$'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALU_NAME'
          Title.Caption = 'Ad'#305
          Width = 262
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 416
    Width = 419
    Height = 170
    Align = alTop
    Caption = '  M'#601'bl'#601#287#601' g'#246'r'#601' % l'#601'rin sazlan'#305'lmas'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 15
      Width = 415
      Height = 128
      Align = alClient
      DataSource = DmRt.DsrcPercent
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      TitleLinesCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'BPER'
          Title.Alignment = taCenter
          Title.Caption = 'Ba'#351'lan'#287#305'c   m'#601'bl'#601#287
          Visible = True
          Width = 84
        end
        item
          Expanded = False
          FieldName = 'EPER'
          Title.Alignment = taCenter
          Title.Caption = 'Son m'#601'bl'#601#287
          Visible = True
          Width = 67
        end
        item
          Expanded = False
          FieldName = 'FAIZ'
          Title.Alignment = taCenter
          Title.Caption = 'Fiaz d'#601'r'#601'c'#601'si'
          Visible = True
          Width = 76
        end
        item
          Expanded = False
          FieldName = 'GECFAIZ'
          Title.Alignment = taCenter
          Title.Caption = 'Gecikm'#601' faizi'
          Visible = True
          Width = 78
        end
        item
          Expanded = False
          FieldName = 'PENYA'
          Title.Alignment = taCenter
          Title.Caption = 'C'#601'rim'#601' faizi'
          Visible = True
          Width = 69
        end>
    end
    object XDBNavigator1: TXDBNavigator
      Left = 2
      Top = 143
      Width = 415
      Height = 25
      DataSource = DmRt.DsrcPercent
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alBottom
      TabOrder = 1
    end
  end
end
