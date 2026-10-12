object MainForm: TMainForm
  Left = 426
  Top = 240
  Width = 445
  Height = 211
  ActiveControl = ButtonClose
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 437
    Height = 112
    Align = alTop
    Caption = 'ћцгавил€ ўаггында'
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 433
      Height = 45
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 3
        Top = 4
        Width = 92
        Height = 16
        Caption = 'ћцшт€ринин  јды :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 20
        Width = 425
        Height = 21
        DataField = 'NAME'
        DataSource = ActvDataMod.DataSrcCreditInfo
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 60
      Width = 433
      Height = 50
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 51
        Height = 16
        Caption = '¬алйута :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 24
        Width = 62
        Height = 21
        Color = clSilver
        DataField = 'VAL_NAME'
        DataSource = ActvDataMod.DataSrcCreditInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clActiveCaption
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 77
        Top = 24
        Width = 149
        Height = 21
        DataField = 'OBLIGATION'
        DataSource = ActvDataMod.DataSrcCreditInfo
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 279
        Top = 24
        Width = 149
        Height = 21
        DataField = 'PLEDGEPRICE'
        DataSource = ActvDataMod.DataSrcCreditInfo
        TabOrder = 2
      end
      object CbOblication: TCheckBox
        Left = 77
        Top = 7
        Width = 97
        Height = 14
        Caption = 'ёщд€лик :'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object CbPledgPrice: TCheckBox
        Left = 279
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Ёировун д€й€ри :'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
  end
  object StatusPanel: TPanel
    Left = 0
    Top = 112
    Width = 437
    Height = 32
    Align = alTop
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object ButtonAccept: TButton
    Left = 265
    Top = 151
    Width = 91
    Height = 25
    Caption = 'BK йа отуздурмаг'
    TabOrder = 2
    OnClick = ButtonAcceptClick
  end
  object ButtonClose: TButton
    Left = 360
    Top = 151
    Width = 75
    Height = 25
    Caption = '„ыхыш'
    TabOrder = 3
    OnClick = ButtonCloseClick
  end
  object Button1: TButton
    Left = 165
    Top = 152
    Width = 89
    Height = 25
    Caption = 'BK dan чыхармаг'
    Enabled = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 264
    Top = 8
  end
end
