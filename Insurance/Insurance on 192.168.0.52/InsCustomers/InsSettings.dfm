object fmSettings: TfmSettings
  Left = 278
  Top = 110
  Width = 515
  Height = 513
  BorderStyle = bsSizeToolWin
  Caption = 'Sazlama'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 507
    Height = 456
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Тарифляр'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 291
        Width = 499
        Height = 137
        Align = alBottom
        TabOrder = 0
        object DBNavigator7: TDBNavigator
          Left = 256
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSTariffs
          TabOrder = 0
        end
        object DBGrid7: TDBGrid
          Left = 256
          Top = 40
          Width = 241
          Height = 89
          DataSource = InsDataMod.DSTariffs
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'AMMOUNT'
              Title.Alignment = taRightJustify
              Title.Caption = 'Тариф'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 117
              Visible = True
            end>
        end
        object DBNavigator4: TDBNavigator
          Left = 8
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSFranshiza
          TabOrder = 2
        end
        object DBGrid4: TDBGrid
          Left = 8
          Top = 40
          Width = 241
          Height = 89
          DataSource = InsDataMod.DSFranshiza
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'AMMOUNT'
              Title.Alignment = taRightJustify
              Title.Caption = 'Франшиза'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 123
              Visible = True
            end>
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 145
        Width = 499
        Height = 146
        Align = alClient
        TabOrder = 1
        object DBNavigator3: TDBNavigator
          Left = 256
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSMonths
          TabOrder = 0
        end
        object DBGrid3: TDBGrid
          Left = 256
          Top = 40
          Width = 241
          Height = 97
          DataSource = InsDataMod.DSMonths
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COUNT'
              Title.Alignment = taRightJustify
              Title.Caption = 'Айлар'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 119
              Visible = True
            end>
        end
        object DBNavigator6: TDBNavigator
          Left = 8
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSRelDates
          TabOrder = 2
        end
        object DBGrid6: TDBGrid
          Left = 8
          Top = 39
          Width = 241
          Height = 97
          DataSource = InsDataMod.DSRelDates
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'BEGINDATE'
              Title.Caption = 'Башланьыж тарих'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDDATE'
              Title.Caption = 'Сон тарих'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 499
        Height = 145
        Align = alTop
        Caption = 'Банклар'
        TabOrder = 2
        object DBGrid5: TDBGrid
          Left = 256
          Top = 40
          Width = 241
          Height = 97
          DataSource = InsDataMod.DSTarifStates
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'States'
              Title.Caption = 'Истещсалчы юлкя'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 215
              Visible = True
            end>
        end
        object DBNavigator5: TDBNavigator
          Left = 256
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSTarifStates
          TabOrder = 1
        end
        object DBNavigator8: TDBNavigator
          Left = 8
          Top = 16
          Width = 240
          Height = 25
          DataSource = InsDataMod.DSBankm
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          TabOrder = 2
        end
        object DBGrid8: TDBGrid
          Left = 8
          Top = 40
          Width = 241
          Height = 97
          DataSource = InsDataMod.DSBankm
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Банклар'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 220
              Visible = True
            end>
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Баланс щесаблары'
      object Splitter1: TSplitter
        Left = 0
        Top = 209
        Width = 499
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 499
        Height = 209
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 25
          Width = 499
          Height = 184
          Align = alClient
          DataSource = InsDataMod.DSAcc_types
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Щесаб адлары'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 435
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 499
          Height = 25
          DataSource = InsDataMod.DSAcc_types
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 212
        Width = 499
        Height = 216
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 25
          Width = 499
          Height = 191
          Align = alClient
          DataSource = InsDataMod.DSBal_cn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clWhite
              Expanded = False
              FieldName = 'BAL_CN'
              Title.Caption = 'Баланс щесаблары'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 441
              Visible = True
            end>
        end
        object DBNavigator2: TDBNavigator
          Left = 0
          Top = 0
          Width = 499
          Height = 25
          DataSource = InsDataMod.DSBal_cn
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Ялавяляр'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 499
        Height = 169
        Align = alTop
        Caption = 'Polis'
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 8
          Top = 16
          Width = 201
          Height = 17
          Caption = 'Полислярин чапдан сонра баьланмасы'
          TabOrder = 0
          OnClick = CheckBox1Click
          OnKeyPress = CheckBox1KeyPress
          OnKeyUp = CheckBox1KeyUp
        end
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 176
        Width = 499
        Height = 252
        Align = alBottom
        Caption = 'Полислярин сазланмасы'
        TabOrder = 1
        object GridPSettings: TDBGrid
          Left = 2
          Top = 24
          Width = 495
          Height = 193
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Сыьорта нювц'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindow
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNTS'
              Title.Caption = 'Сыра сайы'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindow
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMAT'
              Title.Caption = 'Format'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindow
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREFIX'
              Title.Caption = 'Prefiks'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindow
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 45
              Visible = True
            end>
        end
        object DBNavigator9: TDBNavigator
          Left = 4
          Top = 220
          Width = 400
          Height = 25
          DataSource = InsDataMod.DSPolicyNums
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 456
    Width = 507
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 350
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 430
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
