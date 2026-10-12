object FmOwnerSheep: TFmOwnerSheep
  Left = 339
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Sahibin d'#601'yi'#351'dirilm'#601'si'
  ClientHeight = 244
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object grOwn: TGroupBox
    Left = 0
    Top = 0
    Width = 383
    Height = 198
    Align = alClient
    Caption = 'Sahibin d'#601'yi'#351'dirilm'#601'si'
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 49
      Width = 379
      Height = 147
      Align = alClient
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 0
      object gaProc: TGauge
        Left = 15
        Top = 112
        Width = 345
        Height = 30
        ForeColor = clNavy
        MaxValue = 60
        Progress = 0
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 2
        Width = 177
        Height = 107
        Caption = 'Cari sahib'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 22
          Width = 65
          Height = 13
          Caption = #304'stifad'#601#231'i ad'#305':'
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object SC: TSearchCombo
          Left = 8
          Top = 35
          Width = 161
          Height = 22
          TabOrder = 0
          OnChange = SCChange
          DataSource = AdministrationData.Users
          ViewField = 'NAME'
          DefaultString = 'Unknown user'
          DefaultStringUse = True
          DefaultStringColor = clRed
        end
        object edID1: TEdit
          Left = 8
          Top = 75
          Width = 161
          Height = 21
          TabOrder = 1
          OnKeyUp = edID1KeyUp
        end
      end
      object GroupBox2: TGroupBox
        Left = 189
        Top = 2
        Width = 185
        Height = 107
        Caption = 'T'#601'z'#601' sahib'
        TabOrder = 1
        object Label2: TLabel
          Left = 8
          Top = 22
          Width = 65
          Height = 13
          Caption = #304'stifad'#601#231'i ad'#305':'
        end
        object Label4: TLabel
          Left = 8
          Top = 64
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object SC2: TSearchCombo
          Left = 8
          Top = 35
          Width = 169
          Height = 22
          TabOrder = 0
          OnChange = SC2Change
          DataSource = AdministrationData.Users
          ViewField = 'NAME'
          DefaultString = 'Unknown user'
          DefaultStringUse = True
          DefaultStringColor = clRed
        end
        object edID2: TEdit
          Left = 8
          Top = 75
          Width = 169
          Height = 21
          TabOrder = 1
          OnKeyUp = edID1KeyUp
        end
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 15
      Width = 379
      Height = 34
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object memCaution: TMemo
        Left = 2
        Top = 2
        Width = 375
        Height = 30
        TabStop = False
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clMenu
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMenuText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          'Diqq'#601't !'
          'Sahibi d'#601'yi'#351#601'rk'#601'n monopolizasiyaya '#601'min olun.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 198
    Width = 383
    Height = 46
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
    object btExit: TBitBtn
      Left = 296
      Top = 11
      Width = 75
      Height = 25
      Caption = #199#305'x'#305#351
      DoubleBuffered = True
      Kind = bkCancel
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btExitClick
    end
    object btApply: TBitBtn
      Left = 216
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
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
      TabOrder = 1
      OnClick = btApplyClick
    end
    object btnAdvanced: TBitBtn
      Left = 8
      Top = 11
      Width = 89
      Height = 25
      Caption = #399'lav'#601
      DoubleBuffered = True
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFF000000F000000000FFFFFFFF000000F0FF
        FFFFF0FFFFF00F000000F0F77777F0FFFF000F000000F0F77777F0FFF000FF00
        0000F0F77780008F000FFF000000F0F7700FFF0000FFFF000000F0F708FFFF08
        0FFFFF000000F0F80E000F0F08FFFF000000F0F0EFEFEF0FF0FFFF000000F0F0
        F0000F0FF0FFFF000000F000EFEFFF0FF0FFFF000000FFF80000000F08FFFF00
        0000FFFF00FFFFF80FFFFF000000FFFFF00FFF00FFFFFF000000FFFFFF80008F
        FFFFFF000000FFFFFFFFFFFFFFFFFF000000}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnAdvancedClick
    end
  end
  object MonTimer: TTimer
    Tag = 1
    Enabled = False
    Interval = 100
    OnTimer = MonTimerTimer
    Left = 348
    Top = 18
  end
end
