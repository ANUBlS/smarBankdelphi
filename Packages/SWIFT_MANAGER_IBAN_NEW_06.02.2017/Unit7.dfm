object Form7: TForm7
  Left = 517
  Top = 1
  BorderIcons = [biSystemMenu]
  Caption = 'MT103AZN'
  ClientHeight = 711
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 565
    Height = 711
    ActivePage = Header
    Align = alClient
    MultiLine = True
    ScrollOpposite = True
    TabOrder = 0
    object Header: TTabSheet
      Caption = 'Header'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial AzLat'
      Font.Style = []
      ParentFont = False
      object GroupBox1: TGroupBox
        Left = 8
        Top = 32
        Width = 265
        Height = 145
        Caption = #1069#1102#1085#1076#1103#1088#1103#1085'/Sender'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 31
          Top = 48
          Width = 33
          Height = 14
          Caption = 'Type :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 104
          Width = 61
          Height = 14
          Caption = 'Insisution :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 192
        Width = 545
        Height = 161
        Caption = #1040#1083#1072#1085'/Receiver'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label7: TLabel
          Left = 39
          Top = 38
          Width = 33
          Height = 14
          Caption = 'Type :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 15
          Top = 86
          Width = 61
          Height = 14
          Caption = 'Insisution :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 82
          Top = 121
          Width = 146
          Height = 23
          DataField = 'RECEIVERBIC'
          DataSource = SWDataModule.sw_out_2s
          Enabled = False
          TabOrder = 0
          Visible = False
        end
        object reciverbic: TSearchEdit
          Left = 79
          Top = 84
          Width = 149
          Height = 23
          TabOrder = 1
          Visible = False
          DataSource = SWDataModule.sw_banks
          SearchField = 'BIC'
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 80
          Top = 85
          Width = 152
          Height = 23
          DataField = 'RECEIVERBIC'
          DataSource = SWDataModule.sw_out_2s
          Enabled = False
          KeyField = 'BIC'
          ListField = 'BIC'
          ListSource = SWDataModule.sw_banks
          TabOrder = 2
        end
        object GroupBox3: TGroupBox
          Left = 243
          Top = 17
          Width = 296
          Height = 126
          Caption = #1040#1076#1088#1077#1089' '#1072#1095#1099#1075#1083#1072#1084#1072#1089#1099'/Address Expansion'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -12
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object Edit2: TEdit
            Left = 9
            Top = 22
            Width = 280
            Height = 22
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial AzLat'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Edit3: TEdit
            Left = 9
            Top = 46
            Width = 280
            Height = 22
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial AzLat'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Edit4: TEdit
            Left = 9
            Top = 70
            Width = 280
            Height = 22
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial AzLat'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object Edit5: TEdit
            Left = 9
            Top = 94
            Width = 280
            Height = 22
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial AzLat'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 288
        Top = 32
        Width = 265
        Height = 145
        Caption = #1057#1087#1077#1089#1080#1092#1080#1082' '#1092#1086#1088#1084#1072#1090'/Format Specific'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label3: TLabel
          Left = 16
          Top = 29
          Width = 63
          Height = 14
          Caption = 'Sender LT :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 120
          Top = 85
          Width = 54
          Height = 14
          Caption = 'FIN-Copy :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 13
          Top = 58
          Width = 67
          Height = 14
          Caption = 'Application :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 95
          Top = 120
          Width = 87
          Height = 14
          Caption = 'Message Type :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit2: TDBEdit
          Left = 182
          Top = 80
          Width = 75
          Height = 23
          DataField = 'FINCOPY'
          DataSource = SWDataModule.sw_out_2s
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 183
          Top = 115
          Width = 74
          Height = 23
          DataField = 'MESSAGETYPE'
          DataSource = SWDataModule.sw_out_2s
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object sendertype: TComboBox
        Left = 88
        Top = 72
        Width = 145
        Height = 22
        Enabled = False
        TabOrder = 3
        Text = 'Institution'
        Items.Strings = (
          'Institution')
      end
      object ComboBox2: TComboBox
        Left = 88
        Top = 128
        Width = 145
        Height = 22
        Enabled = False
        TabOrder = 4
        Items.Strings = (
          'ATLTAZ22XXX')
      end
      object recivertype: TComboBox
        Left = 96
        Top = 228
        Width = 145
        Height = 22
        Enabled = False
        TabOrder = 5
        Text = 'Institution'
      end
      object senderlt: TComboBox
        Left = 376
        Top = 56
        Width = 154
        Height = 22
        Enabled = False
        TabOrder = 6
        Text = 'ATLTAZ22A'
        Items.Strings = (
          'ATLTAZ22A')
      end
      object monitoring: TComboBox
        Left = 300
        Top = 152
        Width = 49
        Height = 22
        Enabled = False
        TabOrder = 7
        Text = 'N'
        Items.Strings = (
          'N')
      end
      object Application: TComboBox
        Left = 376
        Top = 87
        Width = 60
        Height = 22
        Enabled = False
        TabOrder = 8
        Text = 'FIN'
      end
      object priority: TComboBox
        Left = 300
        Top = 126
        Width = 49
        Height = 22
        Enabled = False
        TabOrder = 9
        Text = 'N'
        Items.Strings = (
          'N')
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 360
        Width = 545
        Height = 148
        Caption = #1070#1083#1082#1103' '#1074#1103' '#1097#1077#1089#1072#1073#1072#1090' '#1090#1103#1081#1080#1085#1072#1090#1099
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial AzLat'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Visible = False
        object Label40: TLabel
          Left = 23
          Top = 78
          Width = 50
          Height = 14
          Caption = 'Country :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 271
          Top = 78
          Width = 53
          Height = 14
          Caption = 'H.Teyinat:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit4: TDBEdit
          Left = 88
          Top = 72
          Width = 128
          Height = 23
          DataField = 'COUNTRY'
          DataSource = SWDataModule.Sw_out_datasource
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 336
          Top = 72
          Width = 137
          Height = 23
          DataField = 'HESABAT'
          DataSource = SWDataModule.Sw_out_datasource
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Text'
      ImageIndex = 1
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 557
        Height = 683
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object MainPanel: TPanel
          Left = 0
          Top = 0
          Width = 516
          Height = 1075
          AutoSize = True
          TabOrder = 0
          object MF20: TPanel
            Left = 1
            Top = 1
            Width = 514
            Height = 89
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label9: TLabel
              Left = 20
              Top = 32
              Width = 27
              Height = 13
              Caption = 'MF20'
            end
            object Label10: TLabel
              Left = 224
              Top = 40
              Width = 209
              Height = 15
              Caption = #1043#1077#1081#1076#1080#1081#1081#1072#1090' '#8470'-'#1099#1096'/Senders Reference'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial AzLat'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit6: TDBEdit
              Left = 64
              Top = 32
              Width = 121
              Height = 21
              DataField = 'MF20_REFERENCE'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              TabOrder = 0
            end
          end
          object MF23B: TPanel
            Left = 1
            Top = 90
            Width = 514
            Height = 56
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label11: TLabel
              Left = 19
              Top = 24
              Width = 34
              Height = 13
              Caption = 'MF23B'
            end
            object Label12: TLabel
              Left = 179
              Top = 16
              Width = 255
              Height = 15
              Caption = #1041#1072#1085#1082' '#1071#1084#1103#1083#1080#1081#1081#1072#1090#1099' '#1050#1086#1076#1091'/Bank Operation Code'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Arial AzLat'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit7: TDBEdit
              Left = 64
              Top = 24
              Width = 81
              Height = 21
              DataField = 'MF23B'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              TabOrder = 0
            end
          end
          object MF32A: TPanel
            Left = 1
            Top = 146
            Width = 514
            Height = 85
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label15: TLabel
              Left = 320
              Top = 56
              Width = 25
              Height = 13
              Caption = '[Curr]'
            end
            object Label16: TLabel
              Left = 21
              Top = 16
              Width = 34
              Height = 13
              Caption = 'MF32A'
            end
            object Label17: TLabel
              Left = 172
              Top = 13
              Width = 154
              Height = 13
              Caption = 'Val Dte/Curr/Interbnk Settld Amt'
            end
            object mf32_date: TDateTimePicker
              Left = 72
              Top = 16
              Width = 84
              Height = 21
              Date = 39832.368310902800000000
              Time = 39832.368310902800000000
              Color = clAqua
              TabOrder = 0
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 72
              Top = 48
              Width = 81
              Height = 21
              TabOrder = 2
            end
            object mf32a_val: TDBViewComboBox
              Tag = 5
              Left = 71
              Top = 48
              Width = 83
              Height = 21
              Color = clAqua
              Enabled = False
              TabOrder = 1
              ListSource = SWDataModule.val_DataSource
              ListFields = 'VAL_NAME'
              FieldInterval = 5
              DropDownOnEnter = False
            end
            object DBEdit8: TDBEdit
              Left = 176
              Top = 48
              Width = 121
              Height = 21
              DataField = 'MF32A_AMOUNT'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              TabOrder = 3
            end
            object DBDateTimeEditEh1: TDBDateTimeEditEh
              Left = 71
              Top = 15
              Width = 84
              Height = 21
              Color = clAqua
              DataField = 'MF32A_DATE'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              EditButtons = <>
              Kind = dtkDateEh
              TabOrder = 4
              Visible = True
            end
          end
          object MF50: TPanel
            Left = 1
            Top = 231
            Width = 514
            Height = 170
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 3
            object MF50_main: TPanel
              Left = 0
              Top = 0
              Width = 514
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label20: TLabel
                Left = 28
                Top = 5
                Width = 27
                Height = 13
                Caption = 'MF50'
              end
              object Edit1: TEdit
                Left = 73
                Top = 1
                Width = 262
                Height = 21
                Enabled = False
                TabOrder = 0
                Text = 'K-Ordering Customer-Name $ Address'
              end
            end
            object MF50K: TPanel
              Left = 0
              Top = 30
              Width = 514
              Height = 140
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Edit3_MF50: TSearchEdit
                Left = 72
                Top = 8
                Width = 265
                Height = 21
                Enabled = False
                TabOrder = 0
                DataSource = SWDataModule.Account_sw
                SearchField = 'acc_no'
              end
              object DBMemo1: TDBMemo
                Left = 120
                Top = 40
                Width = 217
                Height = 89
                DataField = 'MF50_NAME$ADRESS'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                TabOrder = 1
              end
              object DBEdit12: TDBEdit
                Left = 80
                Top = 40
                Width = 257
                Height = 21
                DataField = 'MF50_ACCOUNT'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                TabOrder = 2
                Visible = False
              end
            end
          end
          object MF70: TPanel
            Left = 1
            Top = 697
            Width = 514
            Height = 146
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 5
            object Label27: TLabel
              Left = 25
              Top = 30
              Width = 26
              Height = 13
              Caption = 'OF70'
            end
            object MF70_memo: TMemo
              Left = 72
              Top = 24
              Width = 243
              Height = 85
              ScrollBars = ssHorizontal
              TabOrder = 0
              Visible = False
            end
            object Edit6: TEdit
              Left = 67
              Top = 25
              Width = 379
              Height = 21
              MaxLength = 35
              TabOrder = 1
              Visible = False
            end
            object Edit7: TEdit
              Left = 67
              Top = 52
              Width = 379
              Height = 21
              MaxLength = 35
              TabOrder = 2
              Visible = False
            end
            object Edit8: TEdit
              Left = 67
              Top = 77
              Width = 379
              Height = 21
              MaxLength = 35
              TabOrder = 3
              Visible = False
            end
            object Edit9: TEdit
              Left = 67
              Top = 104
              Width = 379
              Height = 21
              MaxLength = 35
              TabOrder = 4
              Visible = False
            end
            object DBMemo2: TDBMemo
              Left = 72
              Top = 24
              Width = 369
              Height = 105
              DataField = 'MF70'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              TabOrder = 5
            end
          end
          object MF71A: TPanel
            Left = 1
            Top = 843
            Width = 514
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 6
            object Label28: TLabel
              Left = 25
              Top = 14
              Width = 34
              Height = 13
              Caption = 'MF71A'
            end
            object Label29: TLabel
              Left = 168
              Top = 12
              Width = 86
              Height = 13
              Caption = 'Details of Charges'
            end
            object Edit1_MF71A: TEdit
              Left = 74
              Top = 9
              Width = 77
              Height = 21
              Color = clAqua
              Enabled = False
              TabOrder = 0
              Text = 'OUR'
            end
          end
          object MF72: TPanel
            Left = 1
            Top = 943
            Width = 514
            Height = 131
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 8
            object Label34: TLabel
              Left = 25
              Top = 22
              Width = 26
              Height = 13
              Caption = 'OF72'
            end
            object Label37: TLabel
              Left = 336
              Top = 18
              Width = 141
              Height = 13
              Caption = 'Sender to Reciver Information'
            end
            object DBMemo4: TDBMemo
              Left = 69
              Top = 16
              Width = 263
              Height = 102
              DataField = 'MF72'
              DataSource = SWDataModule.sw_out_2s
              Enabled = False
              TabOrder = 0
            end
          end
          object MF71G: TPanel
            Left = 1
            Top = 884
            Width = 514
            Height = 59
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 7
            object Label38: TLabel
              Left = 25
              Top = 14
              Width = 34
              Height = 13
              Caption = 'OF71G'
            end
            object Edit1_MF71G: TEdit
              Left = 72
              Top = 16
              Width = 105
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object Edit2_MF71G: TEdit
              Left = 222
              Top = 16
              Width = 192
              Height = 21
              Enabled = False
              TabOrder = 1
            end
          end
          object MF59_59A: TPanel
            Left = 1
            Top = 401
            Width = 514
            Height = 296
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 4
            object MF59_main: TPanel
              Left = 0
              Top = 0
              Width = 514
              Height = 49
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object Label33: TLabel
                Left = 18
                Top = 20
                Width = 45
                Height = 13
                Caption = 'M59/59A'
              end
              object CMF59: TComboBox
                Left = 72
                Top = 16
                Width = 265
                Height = 21
                Style = csDropDownList
                Color = clAqua
                Enabled = False
                TabOrder = 0
                Items.Strings = (
                  ''
                  'Field - 59'
                  'Field - 59A')
              end
            end
            object MF59: TPanel
              Left = 0
              Top = 178
              Width = 514
              Height = 118
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 2
              Visible = False
              object DBEdit11: TDBEdit
                Left = 74
                Top = 0
                Width = 261
                Height = 21
                DataField = 'MF59_ACCOUNT'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                TabOrder = 0
              end
              object DBMemo3: TDBMemo
                Left = 74
                Top = 29
                Width = 259
                Height = 89
                DataField = 'MF59_NAME$ADRESS'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                TabOrder = 1
              end
            end
            object MF59A: TPanel
              Left = 0
              Top = 49
              Width = 514
              Height = 129
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 1
              Visible = False
              object DBEdit9: TDBEdit
                Left = 73
                Top = 0
                Width = 263
                Height = 21
                DataField = 'MF59_ACCOUNT'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                TabOrder = 0
              end
              object DBMemo5: TDBMemo
                Left = 182
                Top = 40
                Width = 268
                Height = 89
                DataField = 'MF59_NAME$ADRESS'
                DataSource = SWDataModule.Sw_out_datasource
                Enabled = False
                TabOrder = 1
              end
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 24
                Top = 40
                Width = 145
                Height = 21
                DataField = 'MF59_BIC'
                DataSource = SWDataModule.sw_out_2s
                Enabled = False
                KeyField = 'BIC'
                ListField = 'BIC'
                ListSource = SWDataModule.sw_banks
                TabOrder = 2
              end
              object RichEdit1: TRichEdit
                Left = 182
                Top = 40
                Width = 268
                Height = 89
                Enabled = False
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Lines.Strings = (
                  ''
                  ''
                  '')
                ParentFont = False
                TabOrder = 3
                Visible = False
              end
            end
          end
        end
      end
    end
  end
end
