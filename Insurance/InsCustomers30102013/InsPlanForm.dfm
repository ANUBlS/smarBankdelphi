object fmPlanForm: TfmPlanForm
  Left = 416
  Top = 246
  BorderStyle = bsDialog
  Caption = 'fmPlanForm'
  ClientHeight = 141
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object XFPanel1: TXFPanel
    Left = 0
    Top = 100
    Width = 269
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitWidth = 267
    DesignSize = (
      269
      41)
    object BitBtn1: TBitBtn
      Left = 77
      Top = 4
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitLeft = 75
    end
    object BitBtn2: TBitBtn
      Left = 172
      Top = 4
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
      ExplicitLeft = 170
    end
  end
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 0
    Width = 269
    Height = 100
    Align = alClient
    Caption = 'Yeni '#246'd'#601'm'#601
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = -1
    ExplicitWidth = 266
    ExplicitHeight = 98
    object XFLabel1: TXFLabel
      Left = 24
      Top = 26
      Width = 69
      Height = 15
      Caption = #214'd'#601'm'#601' tarixi'
    end
    object XFLabel2: TXFLabel
      Left = 24
      Top = 60
      Width = 89
      Height = 15
      Caption = #214'd'#601'm'#601' m'#601'bl'#601#287'i'
    end
    object DBEdit3: TDBEdit
      Left = 120
      Top = 52
      Width = 130
      Height = 23
      DataField = 'AMMOUNT'
      DataSource = InsDataMod.DSPayPlan
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 120
      Top = 18
      Width = 130
      Height = 23
      DataField = 'PAY_DATE'
      DataSource = InsDataMod.DSPayPlan
      TabOrder = 1
    end
  end
end
