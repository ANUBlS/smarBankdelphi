object fmPlanBuilder: TfmPlanBuilder
  Left = 542
  Top = 271
  BorderStyle = bsDialog
  Caption = 'fmPlanBuilder'
  ClientHeight = 193
  ClientWidth = 286
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
    Top = 151
    Width = 286
    Height = 42
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      286
      42)
    object BitBtn1: TBitBtn
      Left = 110
      Top = 9
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
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 197
      Top = 9
      Width = 81
      Height = 27
      Anchors = [akRight, akBottom]
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object hbError: THintBox
      Left = 0
      Top = 2
      Width = 104
      Height = 36
      AutoSize = True
      BevelOuter = bvNone
      Caption = 'hbError'
      TabOrder = 2
      Visible = False
      HintStyle = hsError
      Timeout = 4000
      BeepOnMessage = False
    end
  end
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 0
    Width = 286
    Height = 151
    Align = alClient
    Caption = 'Plan'#305'n sazlanmas'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object XFLabel1: TXFLabel
      Left = 9
      Top = 24
      Width = 85
      Height = 15
      Caption = 'Ba'#351'lanma tarixi'
    end
    object XFLabel2: TXFLabel
      Left = 9
      Top = 50
      Width = 60
      Height = 15
      Caption = 'Bitm'#601' tarixi'
    end
    object XFLabel3: TXFLabel
      Left = 9
      Top = 77
      Width = 77
      Height = 15
      Caption = #214'd'#601'm'#601'nin tipi'
    end
    object XFLabel4: TXFLabel
      Left = 9
      Top = 103
      Width = 95
      Height = 15
      Caption = 'Periodun miqdar'#305
    end
    object XFLabel5: TXFLabel
      Left = 9
      Top = 129
      Width = 89
      Height = 15
      Caption = #214'd'#601'm'#601' m'#601'bl'#601#287'i'
    end
    object edAmmount: TEdit
      Left = 121
      Top = 121
      Width = 156
      Height = 23
      TabOrder = 0
      Text = '0'
    end
    object edPeriod: TEdit
      Left = 121
      Top = 95
      Width = 156
      Height = 23
      Color = clWhite
      TabOrder = 1
      Text = '0'
    end
    object cbType: TComboBox
      Left = 121
      Top = 69
      Width = 156
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 2
      OnChange = cbTypeChange
      Items.Strings = (
        'AYLIQ'
        'R'#220'BL'#220'K'
        'YARIM '#304'LL'#304'K'
        #304'LL'#304'K')
    end
    object dtpEnd: TDateTimePicker
      Left = 121
      Top = 43
      Width = 156
      Height = 23
      Date = 39099.466676794000000000
      Time = 39099.466676794000000000
      TabOrder = 3
      OnChange = cbTypeChange
    end
    object dtpBegin: TDateTimePicker
      Left = 121
      Top = 14
      Width = 156
      Height = 23
      Date = 39099.466676794000000000
      Time = 39099.466676794000000000
      TabOrder = 4
      OnChange = cbTypeChange
    end
  end
end
