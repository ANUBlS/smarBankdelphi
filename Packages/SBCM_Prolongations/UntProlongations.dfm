object FrmProlongation: TFrmProlongation
  Left = 163
  Top = 161
  ActiveControl = DTPProlongationDate
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Prolongation for contract №'
  ClientHeight = 292
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 84
    Align = alTop
    TabOrder = 0
    object GroupBoxAboutContract: TGroupBox
      Left = 1
      Top = 1
      Width = 541
      Height = 82
      Align = alClient
      Caption = 'Мцгавиля Щаггында'
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 537
        Height = 60
        Align = alTop
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 116
          Top = 1
          Width = 140
          Height = 58
          Align = alLeft
          TabOrder = 0
          object StaticText2: TStaticText
            Left = 2
            Top = 15
            Width = 136
            Height = 17
            Align = alTop
            BorderStyle = sbsSunken
            Caption = '        Щесабын Ады'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 3
            Top = 34
            Width = 134
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CONTRACTACCNO'
            DataSource = MainDataModule.DataSrcContracts
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 1
          Top = 1
          Width = 115
          Height = 58
          Align = alLeft
          TabOrder = 1
          object StaticText4: TStaticText
            Left = 2
            Top = 15
            Width = 111
            Height = 17
            Align = alTop
            BorderStyle = sbsSunken
            Caption = '  Мцгавилянин Нюмряси'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 3
            Top = 34
            Width = 107
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CONTRACTNO'
            DataSource = MainDataModule.DataSrcContracts
            TabOrder = 1
          end
        end
        object GroupBox7: TGroupBox
          Left = 256
          Top = 1
          Width = 140
          Height = 58
          Align = alLeft
          TabOrder = 2
          object StaticText7: TStaticText
            Left = 2
            Top = 15
            Width = 136
            Height = 17
            Align = alTop
            BorderStyle = sbsSunken
            Caption = '        Ачылма Тарихи'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit7: TDBEdit
            Left = 3
            Top = 34
            Width = 133
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'OPENDATE'
            DataSource = MainDataModule.DataSrcContracts
            TabOrder = 1
          end
        end
        object GroupBox6: TGroupBox
          Left = 396
          Top = 1
          Width = 140
          Height = 58
          Align = alLeft
          TabOrder = 3
          object StaticText6: TStaticText
            Left = 2
            Top = 15
            Width = 136
            Height = 17
            Align = alTop
            BorderStyle = sbsSunken
            Caption = '     Баьланма Тарихи'
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
          object DBEdit6: TDBEdit
            Left = 3
            Top = 34
            Width = 133
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CLOSEDATE'
            DataSource = MainDataModule.DataSrcContracts
            TabOrder = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 75
        Width = 537
        Height = 6
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 84
    Width = 543
    Height = 168
    Align = alTop
    BevelInner = bvRaised
    TabOrder = 1
    object ProlongationGrid: TDBGrid
      Left = 2
      Top = 46
      Width = 539
      Height = 120
      TabStop = False
      Align = alClient
      Color = clWhite
      DataSource = DataModuleProlongation.DataSrcProlongations
      FixedColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindow
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'HDATE'
          Title.Caption = 'Прологасийа  Тарихи'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDDATE'
          Title.Caption = 'Кющня Тарих'
          Width = 185
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NEWDATE'
          Title.Caption = 'Йени Тарих'
          Width = 193
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 539
      Height = 44
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 1
      object MainToolBar: TToolBar
        Left = 375
        Top = 2
        Width = 162
        Height = 40
        Align = alRight
        ButtonHeight = 36
        ButtonWidth = 73
        Caption = 'MainToolBar'
        EdgeOuter = esNone
        Flat = True
        Images = ImageList
        ShowCaptions = True
        TabOrder = 0
        object TBAddProlongation: TToolButton
          Left = 0
          Top = 0
          Caption = ' Пролонгасийа '
          ImageIndex = 0
          OnClick = TBAddProlongationClick
        end
        object ToolButton3: TToolButton
          Left = 73
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object TBDelLastProlongation: TToolButton
          Left = 81
          Top = 0
          Caption = 'Ляьв'
          ImageIndex = 1
          OnClick = TBDelLastProlongationClick
        end
        object ToolButton1: TToolButton
          Left = 154
          Top = 0
          Width = 8
          Caption = 'ToolButton1'
          ImageIndex = 2
          Style = tbsSeparator
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 373
        Height = 40
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 187
          Top = 0
          Width = 182
          Height = 40
          Align = alLeft
          Caption = 'Узадылмыш  Тарих'
          TabOrder = 0
          object DTPNewDate: TDateTimePicker
            Left = 3
            Top = 16
            Width = 174
            Height = 21
            CalAlignment = dtaLeft
            Date = 37554.7678947685
            Time = 37554.7678947685
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 187
          Height = 40
          Align = alLeft
          Caption = 'Пролонгасийа Тарихи'
          TabOrder = 1
          object DTPProlongationDate: TDateTimePicker
            Left = 3
            Top = 16
            Width = 174
            Height = 21
            CalAlignment = dtaLeft
            Date = 37554.7678947685
            Time = 37554.7678947685
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
      end
    end
  end
  object BtnClose: TButton
    Left = 455
    Top = 262
    Width = 75
    Height = 25
    Caption = '&Чыхыш'
    ModalResult = 2
    TabOrder = 2
  end
  object ImageList: TImageList
    Left = 372
    Top = 2
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000001000104200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000000010421000000000000000
      0000000010001000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010000000000000000000
      0000000000001000100010001000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F00000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000010000000000000000000
      0000000000000000100010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010000000000000000000
      0000000000001000000010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000010421000000000000000
      0000100010000000000000001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000001042100010001000
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFCFFFF0000
      FFFFF3FFFFFF0000FFFFE1F9FFFF0000FC7FE1F3FFFF0000FC7FF0E3E7FF0000
      FC7FF847CF830000E00FFC0FDFC30000E00FFE1FDFE30000E00FFC0FDFD30000
      FC7FF84FCF3B0000FC7FE0E3E0FF0000FC7FC1F1FFFF0000FFFFC7F8FFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
