object fmPlanBuilder: TfmPlanBuilder
  Left = 542
  Top = 271
  BorderStyle = bsDialog
  Caption = 'fmPlanBuilder'
  ClientHeight = 175
  ClientWidth = 264
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
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 264
    Height = 141
    Align = alClient
    Caption = 'Планын сазланмасы'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 70
      Height = 13
      Caption = 'Башланма тарихи'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 64
      Height = 13
      Caption = 'Юдямянин типи'
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 78
      Height = 13
      Caption = 'Периодун мигдары'
    end
    object Label4: TLabel
      Left = 8
      Top = 112
      Width = 73
      Height = 13
      Caption = 'Юдямя мябляьи'
    end
    object Label5: TLabel
      Left = 8
      Top = 40
      Width = 67
      Height = 13
      Caption = 'Гуртарма тарихи'
    end
    object dtpBegin: TDateTimePicker
      Left = 112
      Top = 16
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 39099.466676794
      Time = 39099.466676794
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
      OnChange = cbTypeChange
    end
    object cbType: TComboBox
      Left = 112
      Top = 64
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 1
      OnChange = cbTypeChange
      Items.Strings = (
        'АЙЛЫГ'
        'РЦБЛЦК'
        'ЙАРЫМ ИЛЛИК'
        'ИЛЛИК')
    end
    object dtpEnd: TDateTimePicker
      Left = 112
      Top = 40
      Width = 145
      Height = 21
      CalAlignment = dtaLeft
      Date = 39099.466676794
      Time = 39099.466676794
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnChange = cbTypeChange
    end
    object edPeriod: TEdit
      Left = 112
      Top = 88
      Width = 145
      Height = 21
      Color = clWhite
      TabOrder = 3
      Text = '0'
    end
    object edAmmount: TEdit
      Left = 112
      Top = 112
      Width = 145
      Height = 21
      TabOrder = 4
      Text = '0'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 141
    Width = 264
    Height = 34
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 96
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    end
    object BitBtn2: TBitBtn
      Left = 184
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
    object hbError: THintBox
      Left = 0
      Top = 1
      Width = 212
      Height = 33
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
end
