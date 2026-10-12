object FrmTranches: TFrmTranches
  Left = 213
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Tranch for contract є'
  ClientHeight = 222
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 180
    Align = alTop
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 86
      Width = 492
      Height = 93
      Align = alBottom
      Caption = '“ранш ўаггында'
      TabOrder = 0
      object Label5: TLabel
        Left = 12
        Top = 18
        Width = 99
        Height = 13
        Caption = '“раншын ¬ерилдийи “арих'
      end
      object Label6: TLabel
        Left = 13
        Top = 49
        Width = 70
        Height = 13
        Caption = '÷муми ћ€бл€ь'
      end
      object DTPTranchDate: TDateTimePicker
        Left = 132
        Top = 13
        Width = 186
        Height = 21
        CalAlignment = dtaLeft
        Date = 37553.485734838
        Time = 37553.485734838
        Color = clWhite
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        TabStop = False
      end
      object TotalEdit: TCurrencyEdit
        Left = 133
        Top = 43
        Width = 184
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
    object GroupBoxAboutContract: TGroupBox
      Left = 1
      Top = 1
      Width = 492
      Height = 85
      Align = alClient
      Caption = 'ћцгавил€ ўаггында'
      TabOrder = 1
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 488
        Height = 60
        Align = alTop
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 65
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
            Caption = '   ћцшт€ринин ўесаб є'
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
            DataField = 'CLIENTACCNO'
            DataSource = TranchesDataModule.DataSrcAccountData
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 1
          Top = 1
          Width = 64
          Height = 58
          Align = alLeft
          TabOrder = 1
          object StaticText4: TStaticText
            Left = 2
            Top = 15
            Width = 60
            Height = 17
            Align = alTop
            BorderStyle = sbsSunken
            Caption = '      $'
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
            Width = 57
            Height = 21
            TabStop = False
            Color = clSilver
            DataField = 'CLIENTCURRENCY'
            DataSource = TranchesDataModule.DataSrcAccountData
            TabOrder = 1
          end
        end
        object GroupBox7: TGroupBox
          Left = 205
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
            Caption = '        ўесабын јды'
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
            DataField = 'CLIENTACCNAME'
            DataSource = TranchesDataModule.DataSrcAccountData
            TabOrder = 1
          end
        end
        object GroupBox6: TGroupBox
          Left = 345
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
            Caption = '       √алмыш  ћ€бл€ь'
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
            DataField = 'RESIDUARYAMOUNT'
            DataSource = MainDataModule.DataSrcContracts
            TabOrder = 1
          end
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 75
        Width = 488
        Height = 6
        Align = alTop
        TabOrder = 1
      end
    end
  end
  object BtnApplyTranch: TButton
    Left = 334
    Top = 190
    Width = 75
    Height = 25
    Caption = '&√€бул'
    TabOrder = 2
    OnClick = BtnApplyTranchClick
  end
  object BtnClose: TButton
    Left = 414
    Top = 190
    Width = 75
    Height = 25
    Caption = '»мтина'
    ModalResult = 2
    TabOrder = 3
  end
  object CBUseTransaction: TCheckBox
    Left = 6
    Top = 198
    Width = 142
    Height = 17
    Caption = 'ям€лиййатлар апарылсын'
    TabOrder = 1
  end
end
