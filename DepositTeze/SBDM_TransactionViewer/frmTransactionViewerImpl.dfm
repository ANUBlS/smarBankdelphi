object frmTransactionViewer: TfrmTransactionViewer
  Left = 348
  Top = 204
  BorderIcons = [biSystemMenu]
  ClientHeight = 343
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 32
    Width = 667
    Height = 135
    Align = alTop
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 16
      Width = 663
      Height = 19
      Sections = <
        item
          ImageIndex = -1
          Text = #1044#1045#1041#1045#1058
          Width = 327
        end
        item
          ImageIndex = -1
          Text = #1050#1056#1045#1044#1048#1058
          Width = 360
        end>
      Style = hsFlat
    end
    object Panel1: TPanel
      Left = 2
      Top = 34
      Width = 351
      Height = 100
      BevelInner = bvLowered
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 73
        Width = 347
        Height = 24
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 345
          Height = 22
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 33
            Height = 14
            Caption = #1043#1072#1083#1099#1075':'
          end
          object Label2: TLabel
            Left = 157
            Top = 3
            Width = 64
            Height = 14
            Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
          end
          object LblDebitOstat: TLabel
            Left = 37
            Top = 3
            Width = 64
            Height = 14
            Caption = 'LblDebitOstat'
          end
          object LblDebitpokOstat: TLabel
            Left = 216
            Top = 3
            Width = 32
            Height = 14
            Caption = 'Label8'
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 50
        Width = 347
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboboxEh7: TDBLookupComboboxEh
          Left = 2
          Top = 1
          Width = 345
          Height = 22
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmTransactionViewer.AccDebitDatSrc
          TabOrder = 0
          Visible = True
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 26
        Width = 347
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DBEditEh8: TDBEditEh
          Left = 2
          Top = 1
          Width = 168
          Height = 22
          DataField = 'ACC_NO'
          DataSource = dmTransactionViewer.AccDebitDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh5: TDBLookupComboboxEh
          Left = 170
          Top = 1
          Width = 177
          Height = 22
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = dmTransactionViewer.AccDebitDatSrc
          TabOrder = 1
          Visible = True
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 347
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object DBEditEh4: TDBEditEh
          Left = 0
          Top = 0
          Width = 64
          Height = 22
          DataField = 'VAL_ACC'
          DataSource = dmTransactionViewer.TransactionDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh3: TDBLookupComboboxEh
          Left = 65
          Top = 0
          Width = 168
          Height = 22
          EditButtons = <>
          KeyField = 'VALUTE'
          ListField = 'VALU_NAME'
          ListSource = dmTransactionViewer.AvaluteDebitDatSrc
          TabOrder = 1
          Visible = True
        end
        object DBEditEh5: TDBEditEh
          Left = 230
          Top = 0
          Width = 114
          Height = 22
          DataField = 'RATE_D'
          DataSource = dmTransactionViewer.TransactionDatSrc
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
      end
    end
    object Panel2: TPanel
      Left = 353
      Top = 34
      Width = 351
      Height = 100
      BevelInner = bvLowered
      TabOrder = 1
      object PanelCredit: TPanel
        Left = 2
        Top = 73
        Width = 347
        Height = 24
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelCreditRest: TPanel
          Left = 1
          Top = 1
          Width = 345
          Height = 22
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 33
            Height = 14
            Caption = #1043#1072#1083#1099#1075':'
          end
          object Label4: TLabel
            Left = 157
            Top = 3
            Width = 64
            Height = 14
            Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
          end
          object LblCreditpokOstat: TLabel
            Left = 216
            Top = 3
            Width = 32
            Height = 14
            Caption = 'Label8'
          end
          object LblCreditOstat: TLabel
            Left = 36
            Top = 4
            Width = 32
            Height = 14
            Caption = 'Label8'
          end
        end
      end
      object Panel8: TPanel
        Left = 2
        Top = 50
        Width = 347
        Height = 23
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboboxEh8: TDBLookupComboboxEh
          Left = 2
          Top = 1
          Width = 345
          Height = 22
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = dmTransactionViewer.AccCreditDatSrc
          TabOrder = 0
          Visible = True
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 26
        Width = 347
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DBEditEh9: TDBEditEh
          Left = 2
          Top = 1
          Width = 168
          Height = 22
          DataField = 'ACC_NO'
          DataSource = dmTransactionViewer.AccCreditDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh6: TDBLookupComboboxEh
          Left = 170
          Top = 1
          Width = 177
          Height = 22
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'ACC_NO'
          ListSource = dmTransactionViewer.AccCreditDatSrc
          TabOrder = 1
          Visible = True
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 2
        Width = 347
        Height = 24
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object DBEditEh6: TDBEditEh
          Left = 0
          Top = 0
          Width = 64
          Height = 22
          DataField = 'CURRENCYID_C'
          DataSource = dmTransactionViewer.TransactionDatSrc
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object DBLookupComboboxEh4: TDBLookupComboboxEh
          Left = 65
          Top = 0
          Width = 168
          Height = 22
          EditButtons = <>
          KeyField = 'VALUTE'
          ListField = 'VALU_NAME'
          ListSource = dmTransactionViewer.AvaluteCreditDatSrc
          TabOrder = 1
          Visible = True
        end
        object DBEditEh7: TDBEditEh
          Left = 230
          Top = 0
          Width = 114
          Height = 22
          DataField = 'RATE_C'
          DataSource = dmTransactionViewer.TransactionDatSrc
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 667
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label5: TLabel
      Left = 9
      Top = 10
      Width = 111
      Height = 14
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1072#1088#1080#1093#1080
    end
    object Label6: TLabel
      Left = 233
      Top = 10
      Width = 88
      Height = 14
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#8470
    end
    object Label7: TLabel
      Left = 412
      Top = 10
      Width = 85
      Height = 14
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090' '#1090#1080#1087#1080
    end
    object DBEditEh2: TDBEditEh
      Left = 310
      Top = 6
      Width = 90
      Height = 22
      DataField = 'NO_PROV'
      DataSource = dmTransactionViewer.TransactionDatSrc
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 480
      Top = 8
      Width = 62
      Height = 22
      DataField = 'VID_OP'
      DataSource = dmTransactionViewer.TransactionDatSrc
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 544
      Top = 8
      Width = 161
      Height = 22
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmTransactionViewer.operationsDatSrc
      TabOrder = 2
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 98
      Top = 6
      Width = 130
      Height = 22
      DataField = 'DAT'
      DataSource = dmTransactionViewer.TransactionDatSrc
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 167
    Width = 667
    Height = 69
    Align = alTop
    Caption = #1052#1103#1073#1083#1103#1100#1083#1103#1088
    TabOrder = 2
    object Panel11: TPanel
      Left = 2
      Top = 16
      Width = 351
      Height = 25
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1044#1077#1073#1077#1090' '#1084#1103#1073#1083#1103#1100
      TabOrder = 0
      object DBEditEh10: TDBEditEh
        Left = 104
        Top = 2
        Width = 247
        Height = 22
        DataField = 'AMMOUNT'
        DataSource = dmTransactionViewer.TransactionDatSrc
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
    object Panel12: TPanel
      Left = 353
      Top = 16
      Width = 351
      Height = 25
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1088#1077#1076#1080#1090' '#1084#1103#1073#1083#1103#1100
      TabOrder = 1
      object DBEditEh11: TDBEditEh
        Left = 104
        Top = 2
        Width = 247
        Height = 22
        DataField = 'AMMOUNT_C'
        DataSource = dmTransactionViewer.TransactionDatSrc
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 41
      Width = 702
      Height = 25
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1052#1080#1083#1083#1080' '#1074#1072#1083#1081#1091#1090#1072#1076#1072' '#1077#1082#1074#1080#1074#1072#1083#1077#1085#1090
      TabOrder = 2
      object DBEditEh12: TDBEditEh
        Left = 238
        Top = 2
        Width = 247
        Height = 22
        DataField = 'LAMMOUNT'
        DataSource = dmTransactionViewer.TransactionDatSrc
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 236
    Width = 667
    Height = 69
    Align = alTop
    Caption = #1052#1103#1083#1091#1084#1072#1090#1083#1072#1088
    TabOrder = 3
    object Panel14: TPanel
      Left = 2
      Top = 41
      Width = 663
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1086#1085#1074#1077#1088#1090#1072#1089#1080#1081#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 1
      object DBEditEh14: TDBEditEh
        Left = 127
        Top = 2
        Width = 80
        Height = 22
        DataField = 'KASSA_Z'
        DataSource = dmTransactionViewer.TransactionDatSrc
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 207
        Top = 2
        Width = 495
        Height = 22
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = dmTransactionViewer.ConvertationSymbolsData
        TabOrder = 1
        Visible = True
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 16
      Width = 663
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1072#1089#1089#1072' '#1089#1080#1084#1074#1086#1083#1091
      TabOrder = 0
      object DBEditEh13: TDBEditEh
        Left = 127
        Top = 2
        Width = 80
        Height = 22
        DataField = 'KASSA_B'
        DataSource = dmTransactionViewer.TransactionDatSrc
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object DBLookupComboboxEh9: TDBLookupComboboxEh
        Left = 207
        Top = 2
        Width = 495
        Height = 22
        EditButtons = <>
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        ListSource = dmTransactionViewer.CashSymbolsData
        TabOrder = 1
        Visible = True
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 304
    Width = 708
    Height = 24
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' '#1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
    TabOrder = 4
    object DBEditEh1: TDBEditEh
      Left = 129
      Top = 1
      Width = 573
      Height = 22
      DataField = 'NAME'
      DataSource = dmTransactionViewer.TransactionDatSrc
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
  object BitBtnOk: TBitBtn
    Left = 626
    Top = 341
    Width = 80
    Height = 27
    Caption = #1041#1072#1100#1083#1072
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = BitBtnOkClick
  end
end
