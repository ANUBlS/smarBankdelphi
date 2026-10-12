object FormAccIn: TFormAccIn
  Left = 395
  Top = 493
  Caption = 'FormAccIn'
  ClientHeight = 325
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 658
    Height = 125
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 654
      Height = 17
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
      Top = 32
      Width = 326
      Height = 92
      BevelInner = bvLowered
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object PanelDebit: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object PanelDebitRest: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = #1043#1072#1083#1099#1075':'
            Visible = False
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
            Visible = False
          end
          object d_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'd_ostat'
            Visible = False
          end
          object d_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'd_pok_ostat'
            Visible = False
          end
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 321
          Height = 21
          Enabled = False
          KeyField = 'NAME'
          ListField = 'NAME'
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 0
          Top = 0
          Width = 305
          Height = 21
          Color = clSilver
          DataField = 'NAME'
          Enabled = False
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object DebtAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 320
          Height = 21
          Enabled = False
          TabOrder = 0
          OnChange = DebtAccSearchEditChange
          DataSource = DataMod_Buyers.AccountData
          SearchField = 'acc_no'
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 160
          Top = 0
          Width = 161
          Height = 21
          Enabled = False
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          TabOrder = 1
          Visible = False
        end
        object DBEdit1: TDBEdit
          Left = 104
          Top = 0
          Width = 201
          Height = 21
          Color = clSilver
          DataField = 'ACC_NO'
          Enabled = False
          TabOrder = 2
          Visible = False
        end
        object acc_id: TEdit
          Left = 72
          Top = 0
          Width = 81
          Height = 21
          TabOrder = 3
          Visible = False
          OnChange = acc_idChange
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object editvalute: TComboBox
          Left = 69
          Top = 0
          Width = 172
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 0
        end
        object val_code: TEdit
          Left = 0
          Top = 0
          Width = 69
          Height = 21
          Enabled = False
          TabOrder = 1
          OnChange = val_codeChange
        end
        object editrate: TEdit
          Left = 240
          Top = 0
          Width = 78
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 2
        end
        object valname: TEdit
          Left = 152
          Top = 0
          Width = 73
          Height = 21
          TabOrder = 3
          Visible = False
        end
      end
    end
    object Panel2: TPanel
      Left = 329
      Top = 33
      Width = 326
      Height = 92
      BevelInner = bvLowered
      TabOrder = 2
      object Panel7: TPanel
        Left = 2
        Top = 68
        Width = 322
        Height = 22
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 320
          Height = 20
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = #1043#1072#1083#1099#1075':'
            Visible = False
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = #1045#1082#1074#1080#1074#1072#1083#1077#1085#1090':'
            Visible = False
          end
          object c_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'c_ostat'
            Visible = False
          end
          object c_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'c_pok_ostat'
            Visible = False
          end
        end
      end
      object Panel9: TPanel
        Left = 2
        Top = 46
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 323
          Height = 21
          Enabled = False
          KeyField = 'NAME'
          ListField = 'NAME'
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 1
          Top = 1
          Width = 305
          Height = 21
          Color = clSilver
          DataField = 'NAME'
          Enabled = False
          TabOrder = 1
        end
      end
      object Panel10: TPanel
        Left = 2
        Top = 24
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object CreditAccSearchEdit: TSearchEdit
          Left = 1
          Top = 1
          Width = 320
          Height = 21
          Enabled = False
          TabOrder = 0
          SearchField = 'acc_no'
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 157
          Top = 0
          Width = 167
          Height = 21
          Enabled = False
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          TabOrder = 1
          Visible = False
        end
        object DBEdit5: TDBEdit
          Left = 64
          Top = 0
          Width = 242
          Height = 21
          Color = clSilver
          DataField = 'ACC_NO'
          Enabled = False
          TabOrder = 2
          Visible = False
        end
        object acc_id_: TEdit
          Left = 72
          Top = 0
          Width = 81
          Height = 21
          TabOrder = 3
          Visible = False
          OnChange = acc_id_Change
        end
      end
      object Panel11: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 22
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object editrate_: TEdit
          Left = 239
          Top = 0
          Width = 80
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 0
        end
        object editvalute_: TComboBox
          Left = 64
          Top = 0
          Width = 176
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 1
        end
        object cur_val_code: TEdit
          Left = 0
          Top = 0
          Width = 64
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = cur_val_codeChange
        end
        object valname_: TEdit
          Left = 152
          Top = 0
          Width = 81
          Height = 21
          TabOrder = 3
          Visible = False
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 658
    Height = 64
    Align = alTop
    Caption = #1052#1103#1073#1083#1103#1100#1083#1103#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel3: TPanel
      Left = 4
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #1044#1077#1073#1077#1090' '#1084#1103#1073#1083#1103#1100
      TabOrder = 0
    end
    object Panel12: TPanel
      Left = 328
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1088#1077#1076#1080#1090' '#1084#1103#1073#1083#1103#1100
      TabOrder = 1
      object creditvalue: TCurrencyEdit
        Tag = 2
        Left = 96
        Top = 1
        Width = 229
        Height = 21
        TabOrder = 0
        Text = '0'
        OnChange = creditvalueChange
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 38
      Width = 652
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1052#1080#1083#1083#1080' '#1074#1072#1083#1081#1091#1090#1072#1076#1072' '#1077#1082#1074#1080#1074#1072#1083#1077#1085#1090
      TabOrder = 2
      object ekv: TCurrencyEdit
        Tag = 3
        Left = 211
        Top = 1
        Width = 229
        Height = 21
        TabStop = False
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 219
    Width = 658
    Height = 64
    Align = alTop
    Caption = #1052#1103#1083#1091#1084#1072#1090#1083#1072#1088
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1086#1085#1074#1077#1088#1090#1072#1089#1080#1081#1072' '#1090#1103#1081#1080#1085#1072#1090#1099
      TabOrder = 1
      Visible = False
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'FULLPATH'
        TabOrder = 0
        TabStop = False
        Visible = False
      end
      object SearchEdit2: TSearchEdit
        Left = 118
        Top = 0
        Width = 73
        Height = 21
        TabOrder = 1
        Visible = False
        SearchField = 'id'
      end
      object DBEdit7: TDBEdit
        Left = 64
        Top = -112
        Width = 441
        Height = 21
        Color = clSilver
        DataField = 'FULLPATH'
        TabOrder = 2
        Visible = False
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 654
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' '#1050#1072#1089#1089#1072' '#1089#1080#1084#1074#1086#1083#1091
      TabOrder = 0
      Visible = False
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        DataField = 'INBALANCECHAR'
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        TabOrder = 0
        TabStop = False
      end
      object SearchEdit3: TSearchEdit
        Left = 118
        Top = 0
        Width = 72
        Height = 21
        TabOrder = 1
        Visible = False
        SearchField = 'symbol '
      end
      object DBEdit8: TDBEdit
        Left = 193
        Top = 0
        Width = 440
        Height = 21
        Color = clSilver
        DataField = 'NAME'
        TabOrder = 2
        Visible = False
      end
    end
  end
  object Panel16: TPanel
    Left = 1
    Top = 218
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' '#1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1103#1081#1080#1085#1072#1090#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 194
      Top = 0
      Width = 460
      Height = 21
      KeyField = 'NAME'
      ListField = 'NAME'
      ListSource = DataMod_Buyers.Trdestinationdata
      TabOrder = 0
      OnCloseUp = DBLookupComboBox5CloseUp
    end
    object SearchEdit1: TSearchEdit
      Left = 120
      Top = 0
      Width = 74
      Height = 21
      TabOrder = 1
      DataSource = DataMod_Buyers.Trdestinationdata
      SearchField = 'id'
    end
    object EditTransName: TEdit
      Left = 192
      Top = 0
      Width = 440
      Height = 21
      TabOrder = 2
      Text = 'EditTransName'
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 658
    Height = 30
    Align = alTop
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 77
      Height = 13
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#1090#1072#1088#1080#1093#1080
    end
    object Label6: TLabel
      Left = 216
      Top = 9
      Width = 67
      Height = 13
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090#1099#1085' '#8470
      Enabled = False
      Visible = False
    end
    object Label7: TLabel
      Left = 383
      Top = 9
      Width = 61
      Height = 13
      Caption = #1071#1084#1103#1083#1080#1081#1081#1072#1090' '#1090#1080#1087#1080
      Enabled = False
      Visible = False
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      Date = 38125.661002002300000000
      Time = 38125.661002002300000000
      Enabled = False
      TabOrder = 0
    end
    object DBEditOperationNo: TDBEdit
      Left = 287
      Top = 7
      Width = 78
      Height = 21
      DataField = 'OPERATIONNO'
      Enabled = False
      TabOrder = 1
      Visible = False
    end
    object DBEdit4: TDBEdit
      Left = 503
      Top = 7
      Width = 130
      Height = 21
      DataField = 'NAME'
      TabOrder = 2
      Visible = False
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 488
      Top = 24
      Width = 145
      Height = 21
      Enabled = False
      KeyField = 'NAME'
      ListField = 'NAME'
      TabOrder = 3
      Visible = False
    end
    object SearchEdit4: TSearchEdit
      Left = 448
      Top = 16
      Width = 56
      Height = 21
      Enabled = False
      TabOrder = 4
      Visible = False
      SearchField = 'ID'
    end
    object DBEdit9: TDBEdit
      Left = 529
      Top = 24
      Width = 127
      Height = 21
      DataField = 'NAME'
      Enabled = False
      TabOrder = 5
      Visible = False
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 290
    Width = 658
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object ButtonApply: TButton
      Left = 421
      Top = 4
      Width = 75
      Height = 25
      Caption = '&'#1043#1103#1073#1091#1083
      TabOrder = 1
      OnClick = ButtonApplyClick
    end
    object ButtonCancel: TButton
      Left = 501
      Top = 4
      Width = 75
      Height = 25
      Caption = #1048#1084#1090#1080#1085#1072
      TabOrder = 2
      OnClick = ButtonCancelClick
    end
    object ButtonClose: TButton
      Left = 581
      Top = 4
      Width = 75
      Height = 25
      Caption = #1063#1099#1093#1099#1096
      TabOrder = 0
      OnClick = ButtonCloseClick
    end
  end
  object debtvalue: TCurrencyEdit
    Tag = 1
    Left = 99
    Top = 170
    Width = 229
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = '0'
    OnChange = debtvalueChange
  end
  object commission_id: TEdit
    Left = 48
    Top = 321
    Width = 121
    Height = 21
    TabOrder = 7
    Visible = False
  end
  object commission_trans_data: TDataSource
    DataSet = commission_trans_km
    Left = 360
    Top = 280
  end
  object commission_trans_km: TOracleDataSet
    SQL.Strings = (
      'select * from commision_trans_km')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000006000000040000004900440001000000000008000000440045004200
      54000100000000000C0000004300520045004400490054000100000000000E00
      000043005F00560041004C00550045000100000000000E00000044005F005600
      41004C00550045000100000000000A0000004400440041005400450001000000
      0000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 320
    Top = 280
  end
end
