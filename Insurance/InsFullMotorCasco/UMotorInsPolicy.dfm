object FormPolicy: TFormPolicy
  Left = 367
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Policy'
  ClientHeight = 348
  ClientWidth = 353
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
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 353
    Height = 70
    Caption = 'Ќ€глиййат васит€л€ринин там сыьортасы ш€щад€тнам€си'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 101
      Height = 13
      Caption = 'Ў€щад€тнам€нин Ќ-си'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 46
      Width = 70
      Height = 13
      Caption = 'Ў€ртсиз франшиза'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ENum: TDBEdit
      Left = 140
      Top = 21
      Width = 209
      Height = 21
      DataField = 'POLICY_NUM'
      DataSource = DataModuleFullMotor.DSContracts
      TabOrder = 0
      OnChange = ENumChange
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 140
      Top = 43
      Width = 209
      Height = 21
      DataField = 'MS_ID'
      DataSource = DataModuleFullMotor.PolicyData
      Enabled = False
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModuleFullMotor.FranshizData
      ReadOnly = True
      TabOrder = 1
      OnClick = ENumChange
    end
  end
  object GroupBox2: TGroupBox
    Left = -1
    Top = 72
    Width = 354
    Height = 90
    Caption = '÷чцнжц ш€хсл€р гаршысында мцлкц м€сулийй€т'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 18
      Width = 78
      Height = 13
      Caption = 'ћ€сулийй€т щ€дди'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 41
      Width = 70
      Height = 13
      Caption = 'Ў€ртсиз франшиза'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 64
      Width = 62
      Height = 13
      Caption = '—ыьорта щаггы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit8: TDBEdit
      Left = 176
      Top = 18
      Width = 174
      Height = 21
      TabOrder = 0
      OnChange = ENumChange
    end
    object DBEdit9: TDBEdit
      Left = 176
      Top = 40
      Width = 174
      Height = 21
      TabOrder = 1
      OnChange = ENumChange
    end
    object DBEdit10: TDBEdit
      Left = 176
      Top = 64
      Width = 174
      Height = 21
      TabOrder = 2
      OnChange = ENumChange
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 160
    Width = 353
    Height = 163
    Caption = '—црцжц в€ —€рнишинл€рин ‘€рди √€за —ыьортасы'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label30: TLabel
      Left = 8
      Top = 24
      Width = 108
      Height = 13
      Caption = '—ыьорта олунанларын сайы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 8
      Top = 42
      Width = 133
      Height = 13
      Caption = '“ибби х€ржл€р цзр€ цмуми лимит'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 8
      Top = 66
      Width = 52
      Height = 13
      Caption = '÷муми лимит'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 8
      Top = 92
      Width = 128
      Height = 13
      Caption = 'Ѕир сыьорта олунан цчцн лимит'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label34: TLabel
      Left = 8
      Top = 114
      Width = 164
      Height = 13
      Caption = 'Ѕир сыьорта олунан цчцн тибби х€ржл€р'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 8
      Top = 137
      Width = 62
      Height = 13
      Caption = '—ыьорта щаггы'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ENumberP: TDBEdit
      Left = 176
      Top = 16
      Width = 173
      Height = 21
      TabOrder = 0
      OnChange = ENumChange
    end
    object ETotalMedical: TDBEdit
      Left = 176
      Top = 40
      Width = 173
      Height = 21
      TabOrder = 1
      OnChange = ENumChange
    end
    object ETotalLimit: TDBEdit
      Left = 176
      Top = 64
      Width = 173
      Height = 21
      TabOrder = 2
      OnChange = ENumChange
    end
    object ELimitPer: TDBEdit
      Left = 176
      Top = 86
      Width = 173
      Height = 21
      TabOrder = 3
      OnChange = ENumChange
    end
    object EMedicalExpen: TDBEdit
      Left = 176
      Top = 108
      Width = 173
      Height = 21
      TabOrder = 4
      OnChange = ENumChange
    end
    object EPremiuumIns: TDBEdit
      Left = 176
      Top = 132
      Width = 173
      Height = 21
      TabOrder = 5
      OnChange = ENumChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 319
    Width = 353
    Height = 29
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object btPrint: TBitBtn
      Left = 18
      Top = 3
      Width = 75
      Height = 24
      Caption = '„ап'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 170
      Top = 3
      Width = 75
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 246
      Top = 3
      Width = 75
      Height = 24
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
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
      NumGlyphs = 2
    end
    object btApply: TBitBtn
      Left = 94
      Top = 3
      Width = 75
      Height = 24
      Caption = 'Apply'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btApplyClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
  end
  object INSWordExporter1: TINSWordExporter
    Left = 312
    Top = 343
  end
end
