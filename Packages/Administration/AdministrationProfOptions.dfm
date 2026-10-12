object fmProfOptions: TfmProfOptions
  Left = 250
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 317
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 358
    Height = 32
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 193
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      DoubleBuffered = True
      Enabled = False
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
      Left = 279
      Top = 4
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 2
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object hbErrorBx: THintBox
      Left = 5
      Top = 7
      Width = 176
      Height = 18
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      HintStyle = hsInformation
      Timeout = 3000
      BeepOnMessage = True
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 358
    Height = 285
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #350'ifr'#601
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 350
        Height = 257
        Align = alClient
        Caption = 'Qlobal parametrl'#601'r'
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 208
          Width = 163
          Height = 13
          Caption = 'Sistem'#601' daxil olma c'#601'hdl'#601'rinin say'#305
        end
        object Label2: TLabel
          Left = 8
          Top = 112
          Width = 122
          Height = 13
          Caption = #350'ifr'#601'nin etibarl'#305'l'#305'q m'#252'dd'#601'ti'
        end
        object Label3: TLabel
          Left = 8
          Top = 136
          Width = 109
          Height = 13
          Caption = 'T'#601'xir'#601' sal'#305'nma m'#252'dd'#601'ti'
        end
        object Label4: TLabel
          Left = 8
          Top = 160
          Width = 186
          Height = 13
          Caption = 'T'#601'krar istifad'#601'nin m'#252'mk'#252'nl'#252'y'#252' m'#252'dd'#601'ti'
        end
        object Label5: TLabel
          Left = 8
          Top = 184
          Width = 120
          Height = 13
          Caption = 'T'#601'krar istifad'#601'nin miqdar'#305
        end
        object Label8: TLabel
          Left = 8
          Top = 232
          Width = 126
          Height = 13
          Caption = 'Hesab'#305'n qapanma m'#252'dd'#601'ti'
        end
        object Label1: TLabel
          Left = 8
          Top = 88
          Width = 76
          Height = 13
          Caption = 'Hesab'#305'n aktivliyi'
          Enabled = False
          Visible = False
        end
        object Label7: TLabel
          Left = 8
          Top = 24
          Width = 119
          Height = 13
          Caption = #350'ifr'#601'nin minimal uzunlu'#287'u'
        end
        object Bevel1: TBevel
          Left = 1
          Top = 56
          Width = 348
          Height = 10
          Shape = bsBottomLine
        end
        object Label9: TLabel
          Left = 8
          Top = 58
          Width = 83
          Height = 13
          Caption = 'Lokal parametrl'#601'r'
        end
        object chkLockStatus: TCheckBox
          Left = 224
          Top = 89
          Width = 97
          Height = 17
          Caption = 'Ba'#287'l'#305'd'#305'r/A'#231#305'qd'#305'r'
          Enabled = False
          TabOrder = 0
          Visible = False
          OnClick = LockUnlockUserExecute
        end
        object PASSWORD_LIFE_TIME: TComboBox
          Left = 224
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'PASSWORD_LIFE_TIME'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object PASSWORD_GRACE_TIME: TComboBox
          Left = 224
          Top = 136
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'PASSWORD_GRACE_TIME'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object PASSWORD_REUSE_TIME: TComboBox
          Left = 224
          Top = 160
          Width = 121
          Height = 21
          TabOrder = 3
          Text = 'PASSWORD_REUSE_TIME'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object PASSWORD_REUSE_MAX: TComboBox
          Left = 224
          Top = 184
          Width = 121
          Height = 21
          TabOrder = 4
          Text = 'PASSWORD_REUSE_MAX'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object FAILED_LOGIN_ATTEMPTS: TComboBox
          Left = 224
          Top = 208
          Width = 121
          Height = 21
          TabOrder = 5
          Text = 'FAILED_LOGIN_ATTEMPTS'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object PASSWORD_LOCK_TIME: TComboBox
          Left = 224
          Top = 232
          Width = 121
          Height = 21
          TabOrder = 6
          Text = 'PASSWORD_LOCK_TIME'
          OnChange = edMinPassLengthChange
          Items.Strings = (
            'UNLIMITED')
        end
        object edMinPassLength: TComboBox
          Left = 224
          Top = 24
          Width = 120
          Height = 21
          TabOrder = 7
          Text = 'edMinPassLength'
          OnChange = edMinPassLengthChange
        end
      end
    end
  end
end
