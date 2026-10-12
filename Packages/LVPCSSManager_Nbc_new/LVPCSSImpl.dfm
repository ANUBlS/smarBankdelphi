object LVPCSSForm: TLVPCSSForm
  Left = 2
  Top = 0
  Width = 1278
  Height = 738
  Caption = 'LVPCSSForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1278
    Height = 738
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object MainPageControl: TPageControl
      Left = 0
      Top = 0
      Width = 1278
      Height = 738
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      HotTrack = True
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      OnChange = MainPageControlChange
      object TabSheet1: TTabSheet
        Caption = '    Lvpcss [ OUT ]  '
        object PanelBeneficary: TPanel
          Left = 0
          Top = 383
          Width = 1270
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Panel27: TPanel
            Left = 0
            Top = 253
            Width = 1270
            Height = 72
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 1270
              Height = 72
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                1270
                72)
              object Label1: TLabel
                Left = 5
                Top = 24
                Width = 80
                Height = 26
                Caption = #214'd'#601'ni'#351'in t'#601'yinat'#305' v'#601' '#601'sas'#305':'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label2: TLabel
                Left = 6
                Top = 54
                Width = 75
                Height = 13
                Caption = #399'lav'#601' m'#601'lumat:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 443
                Top = 5
                Width = 59
                Height = 13
                Caption = 'Alan M'#252#351't'#601'ri'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 592
                Top = 52
                Width = 86
                Height = 13
                Alignment = taCenter
                Caption = #399'm'#601'liyyat'#305'n kodu:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 31
                Top = 4
                Width = 51
                Height = 13
                Caption = 'Alan Bank:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object DBEdit8: TDBEdit
                Left = 89
                Top = 25
                Width = 1178
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'REMIT_INF'
                DataSource = DataMod.DS_BENEFICIARY
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit9: TDBEdit
                Left = 89
                Top = 48
                Width = 416
                Height = 21
                Color = clSilver
                DataField = 'ADD_INF'
                DataSource = DataMod.DS_BENEFICIARY
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit23: TDBEdit
                Left = 508
                Top = 4
                Width = 758
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'CLIENT_NAME'
                DataSource = DataMod.DS_BENEFICIARY
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit7: TDBEdit
                Left = 682
                Top = 47
                Width = 585
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'TRANSACTION_ID'
                DataSource = DataMod.DS_BENEFICIARY
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit24: TDBEdit
                Left = 89
                Top = 2
                Width = 351
                Height = 21
                Color = clSilver
                DataField = 'BANKNAME'
                DataSource = DataMod.DS_BENEFICIARY
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
            end
          end
          object Panel26: TPanel
            Left = 0
            Top = 0
            Width = 1270
            Height = 253
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object GridBeneficiary: TDBGrid
              Left = 1
              Top = 43
              Width = 1268
              Height = 209
              TabStop = False
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              DataSource = DataMod.DS_BENEFICIARY
              DrawingStyle = gdsClassic
              FixedColor = 8404992
              GradientEndColor = clBlack
              GradientStartColor = clNavy
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              ParentFont = False
              PopupMenu = PopupMessOut
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Azl Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = GridBatchsDrawColumnCell
              OnDblClick = MessagesOutEditExecute
              Columns = <
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'ID'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = #8470
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  Visible = False
                end
                item
                  Expanded = False
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Azl Sans Serif'
                  Title.Font.Style = []
                  Width = 19
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_DATE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Tarix'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 99
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clWhite
                  Expanded = False
                  FieldName = 'CLIENT_ACC_NO'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 190
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_NAME'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = '$'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 38
                  Visible = True
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'AMOUNT'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit M'#601'bl'#601#287
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 160
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Color = clSilver
                  Expanded = False
                  FieldName = 'MESS_REFERENCE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Qeydiyyat '#8470
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 106
                  Visible = True
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'LAMOUNT'
                  Title.Alignment = taCenter
                  Title.Caption = 'Ekvivalent'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'CurrencyRate'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Caption = 'Kurs'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end>
            end
            object ControlBar2: TControlBar
              Left = 1
              Top = 1
              Width = 1268
              Height = 42
              Align = alTop
              AutoSize = True
              BevelInner = bvLowered
              BevelOuter = bvNone
              TabOrder = 1
              object ToolBar2: TToolBar
                Left = 11
                Top = 2
                Width = 665
                Height = 36
                AutoSize = True
                ButtonHeight = 36
                ButtonWidth = 60
                Caption = 'ToolBar1'
                DrawingStyle = dsGradient
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Images = ImageList
                ParentFont = False
                ShowCaptions = True
                TabOrder = 0
                object ToolButton2: TToolButton
                  Left = 0
                  Top = 0
                  Action = MessagesOutAdd
                  ImageIndex = 23
                end
                object ToolButton7: TToolButton
                  Left = 60
                  Top = 0
                  Action = MessagesOutEdit
                  ImageIndex = 24
                end
                object ToolButton4: TToolButton
                  Left = 120
                  Top = 0
                  Action = MessOutDelete
                  ImageIndex = 49
                end
                object MessAcceptButton: TToolButton
                  Left = 180
                  Top = 0
                  Action = MessagesOutAccept
                end
                object ToolButton13: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton13'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object DateTimePicker1: TDateTimePicker
                  Left = 248
                  Top = 0
                  Width = 186
                  Height = 36
                  Date = 42710.659549513890000000
                  Time = 42710.659549513890000000
                  TabOrder = 0
                  Visible = False
                end
                object DateTimePicker2: TDateTimePicker
                  Left = 434
                  Top = 0
                  Width = 186
                  Height = 36
                  Date = 42688.659583692130000000
                  Time = 42688.659583692130000000
                  TabOrder = 1
                  Visible = False
                end
              end
            end
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 329
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 1
          object GridBatchs: TDBGrid
            Left = 1
            Top = 85
            Width = 1268
            Height = 243
            TabStop = False
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Ctl3D = True
            DataSource = DataMod.DS_BATCHS
            DrawingStyle = gdsClassic
            FixedColor = 8404992
            GradientEndColor = clBlack
            GradientStartColor = clNavy
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = PopupMT102
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clNone
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GridBatchsDrawColumnCell
            OnDblClick = GridBatchsDblClick
            OnTitleClick = GridBatchsTitleClick
            Columns = <
              item
                Color = clSilver
                Expanded = False
                FieldName = 'ID'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = #8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                Title.Alignment = taCenter
                Title.Caption = 'F'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Expanded = False
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'TRANSDATE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Tarix'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clWhite
                Expanded = False
                FieldName = 'ACC_NO'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 190
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = '$'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 28
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet M'#601'bl'#601#287
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 112
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'CurrencyRate'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Kurs'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Visible = False
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'TRANS_REF'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Qeydiyyat '#8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'USERNAME'
                Title.Alignment = taCenter
                Title.Caption = 'Daxil ed'#601'n'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'MODUSER'
                Title.Caption = 'Modifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'F.Verifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Visible = False
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'VUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'Verifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'Avtorizator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 112
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'FORMAT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Alignment = taCenter
                Title.Caption = 'Format'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 86
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODTIME'
                Title.Caption = 'Modifikasiya Tarixi'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SDATE'
                Title.Alignment = taCenter
                Title.Caption = 'Verifikasiya tarixi'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end>
          end
          object ControlBar1: TControlBar
            Left = 1
            Top = 1
            Width = 1268
            Height = 84
            Align = alTop
            AutoSize = True
            BevelInner = bvNone
            ParentFont = False
            TabOrder = 1
            object ToolBar1: TToolBar
              Left = 11
              Top = 2
              Width = 1252
              Height = 78
              AutoSize = True
              ButtonHeight = 36
              ButtonWidth = 75
              Caption = 'ToolBar1'
              DrawingStyle = dsGradient
              EdgeInner = esNone
              EdgeOuter = esNone
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Images = ImageList
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton1: TToolButton
                Left = 0
                Top = 0
                Action = Mt102Insert
                ImageIndex = 23
              end
              object ToolButton12: TToolButton
                Left = 75
                Top = 0
                Action = Mt102Edit
                ImageIndex = 24
              end
              object ToolButton9: TToolButton
                Left = 150
                Top = 0
                Action = MT102Delete
                ImageIndex = 49
              end
              object ToolButton3: TToolButton
                Left = 225
                Top = 0
                Action = Mt102Refresh
                ImageIndex = 167
              end
              object AcceptButton: TToolButton
                Left = 300
                Top = 0
                Action = Mt102Accept
                Caption = 'Modifikator'
              end
              object ToolButton20: TToolButton
                Left = 375
                Top = 0
                Caption = 'F.Verifikator'
                ImageIndex = 17
                Visible = False
                OnClick = ToolButton20Click
              end
              object ToolButton39: TToolButton
                Left = 450
                Top = 0
                Caption = 'Verifikator'
                ImageIndex = 18
                OnClick = ToolButton39Click
              end
              object ToolButton38: TToolButton
                Left = 525
                Top = 0
                Caption = 'Avtorizator'
                ImageIndex = 19
                OnClick = ToolButton38Click
              end
              object ToolButton23: TToolButton
                Left = 600
                Top = 0
                Caption = 'Geri qaytar'
                ImageIndex = 16
                OnClick = ToolButton23Click
              end
              object ToolButton8: TToolButton
                Left = 675
                Top = 0
                Caption = 'Parametrl'#601'r'
                ImageIndex = 177
                OnClick = ToolButton8Click
              end
              object ToolButton21: TToolButton
                Left = 750
                Top = 0
                Caption = #304'nkar et'
                ImageIndex = 201
                Visible = False
                OnClick = ToolButton21Click
              end
              object BtnSendToArchive: TToolButton
                Left = 825
                Top = 0
                Caption = 'Arxiv'#601' g'#246'nd'#601'r'
                ImageIndex = 6
                OnClick = BtnSendToArchiveClick
              end
              object ToolButton5: TToolButton
                Left = 900
                Top = 0
                Caption = 'Ged'#601'n fayl'
                ImageIndex = 11
                OnClick = ToolButton5Click
              end
              object ToolButton15: TToolButton
                Left = 0
                Top = 0
                Width = 6
                Caption = 'ToolButton15'
                ImageIndex = 9
                Wrap = True
                Style = tbsSeparator
              end
              object ToolButton11: TToolButton
                Left = 0
                Top = 42
                Caption = 'Fayl'#305' Haz'#305'rla'
                ImageIndex = 5
                OnClick = ToolButton11Click
              end
              object ToolButton6: TToolButton
                Left = 75
                Top = 42
                Caption = 'Baxmaq'
                ImageIndex = 203
                OnClick = ToolButton6Click
              end
              object Panel58: TPanel
                Left = 150
                Top = 42
                Width = 750
                Height = 36
                TabOrder = 1
                object Edit1: TEdit
                  Left = 2
                  Top = 4
                  Width = 150
                  Height = 21
                  Enabled = False
                  TabOrder = 0
                  Text = 'Modifikasiya ='
                end
                object Edit2: TEdit
                  Left = 153
                  Top = 4
                  Width = 150
                  Height = 21
                  Enabled = False
                  TabOrder = 1
                  Text = 'Verifikasiya = '
                end
                object Edit3: TEdit
                  Left = 304
                  Top = 4
                  Width = 150
                  Height = 21
                  Enabled = False
                  TabOrder = 2
                  Text = 'Avtorizator ='
                end
                object ComboBox1: TComboBox
                  Left = 600
                  Top = 4
                  Width = 145
                  Height = 21
                  ItemIndex = 0
                  TabOrder = 3
                  Text = 'Butun tipler'
                  OnCloseUp = ComboBox1CloseUp
                  Items.Strings = (
                    'Butun tipler'
                    'Daxil edilen'
                    'Modifikator'
                    'Verifikator'
                    'Avtorizator'
                    'Fayl Yaradilib')
                end
                object Edit4: TEdit
                  Left = 450
                  Top = 4
                  Width = 150
                  Height = 21
                  Enabled = False
                  TabOrder = 4
                  Text = 'Fayl Yarad'#305'lm'#305#351' ='
                end
              end
              object Panel22: TPanel
                Left = 900
                Top = 42
                Width = 186
                Height = 36
                BevelOuter = bvNone
                Color = 11319229
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                Visible = False
                object StDate: TDateTimePicker
                  Left = 0
                  Top = 12
                  Width = 92
                  Height = 21
                  Date = 37832.619571851900000000
                  Time = 37832.619571851900000000
                  Enabled = False
                  TabOrder = 0
                end
                object EndDate: TDateTimePicker
                  Left = 94
                  Top = 11
                  Width = 91
                  Height = 21
                  Date = 37832.619571851900000000
                  Time = 37832.619571851900000000
                  Enabled = False
                  TabOrder = 1
                end
              end
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 329
          Width = 1270
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 1270
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              1270
              25)
            object DBEdit19: TDBEdit
              Left = 592
              Top = 2
              Width = 678
              Height = 21
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clSilver
              DataField = 'NAME'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 488
              Top = 2
              Width = 102
              Height = 21
              Color = clSilver
              DataField = 'TRANS_REF'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit6: TDBEdit
              Left = 375
              Top = 2
              Width = 111
              Height = 21
              Color = clSilver
              DataField = 'AMOUNT'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 331
              Top = 2
              Width = 42
              Height = 21
              Color = clSilver
              DataField = 'VAL_NAME'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit4: TDBEdit
              Left = 140
              Top = 2
              Width = 190
              Height = 21
              BevelInner = bvNone
              Color = clSilver
              DataField = 'ACC_NO'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit2: TDBEdit
              Left = 63
              Top = 2
              Width = 70
              Height = 21
              Color = clSilver
              DataField = 'TRANSDATE'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit1: TDBEdit
              Left = 3
              Top = 2
              Width = 51
              Height = 21
              Color = clSilver
              DataField = 'ID'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
          end
          object Panel24: TPanel
            Left = 0
            Top = 25
            Width = 1270
            Height = 46
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              1270
              46)
            object Label4: TLabel
              Left = 456
              Top = 6
              Width = 27
              Height = 13
              Caption = 'V'#214'EN'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label7: TLabel
              Left = 16
              Top = 6
              Width = 31
              Height = 13
              Caption = 'F'#304'L'#304'AL'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit21: TDBEdit
              Left = 591
              Top = 2
              Width = 679
              Height = 21
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clSilver
              DataField = 'CLIENT_NAME'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit22: TDBEdit
              Left = 487
              Top = 2
              Width = 102
              Height = 21
              Color = clSilver
              DataField = 'CLIENT_INN'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit20: TDBEdit
              Left = 63
              Top = 2
              Width = 262
              Height = 21
              Color = clSilver
              DataField = 'FILIAL_NAME'
              DataSource = DataMod.DS_BATCHS
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit49: TDBEdit
              Left = 331
              Top = 1
              Width = 123
              Height = 21
              Color = clSilver
              DataField = 'SUMAMOUNT'
              DataSource = DataMod.DS_BatchsSum
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = '  Lvpcss [ IN ]   '
        ImageIndex = 1
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 708
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Panel_info: TPanel
            Left = 1
            Top = 666
            Width = 1268
            Height = 41
            Align = alBottom
            TabOrder = 0
            Visible = False
            object Info_ListBox: TListBox
              Left = 1
              Top = 1
              Width = 1266
              Height = 39
              Align = alClient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 14
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel12: TPanel
            Left = 1
            Top = 1
            Width = 1268
            Height = 665
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter2: TSplitter
              Left = 0
              Top = 45
              Height = 516
              MinSize = 10
              ExplicitLeft = 135
              ExplicitTop = 0
              ExplicitHeight = 482
            end
            object FileListIncoming: TListBox
              Left = 3
              Top = 45
              Width = 135
              Height = 516
              Align = alLeft
              BorderStyle = bsNone
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              PopupMenu = Popup_SingleConvert
              TabOrder = 2
            end
            object RichEdit1: TRichEdit
              Left = 195
              Top = 46
              Width = 573
              Height = 447
              Font.Charset = TURKISH_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
              Visible = False
              WordWrap = False
            end
            object Panel13: TPanel
              Left = 0
              Top = 561
              Width = 1268
              Height = 104
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object Panel14: TPanel
                Left = 0
                Top = 78
                Width = 1268
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Panel15: TPanel
                  Left = 104
                  Top = 0
                  Width = 1164
                  Height = 26
                  Align = alClient
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = #214'd'#601'ni'#351'd'#601'n v'#601'saiti alana m'#601'lumat'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  DesignSize = (
                    1164
                    26)
                  object DBEdit13: TDBEdit
                    Left = 168
                    Top = 2
                    Width = 992
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'REMIT_INF'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel16: TPanel
                  Left = 0
                  Top = 0
                  Width = 104
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = #214'd'#601'ni'#351'in kodu'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  DesignSize = (
                    104
                    26)
                  object DBEdit10: TDBEdit
                    Left = 72
                    Top = 2
                    Width = 28
                    Height = 21
                    Anchors = [akRight, akBottom]
                    Color = clSilver
                    DataField = 'TYPECODE'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
              object Panel17: TPanel
                Left = 0
                Top = 0
                Width = 1268
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Panel18: TPanel
                  Left = 344
                  Top = 0
                  Width = 670
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'Alan'#305'n ad'#305
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  DesignSize = (
                    670
                    26)
                  object DBEdit12: TDBEdit
                    Left = 52
                    Top = 2
                    Width = 615
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'REC_CLIENT_NAME'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel19: TPanel
                  Left = 0
                  Top = 0
                  Width = 344
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'G'#246'nd'#601'r'#601'nin ad'#305
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  DesignSize = (
                    344
                    26)
                  object DBEdit11: TDBEdit
                    Left = 79
                    Top = 2
                    Width = 262
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'SEN_NAME'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel56: TPanel
                  Left = 1014
                  Top = 0
                  Width = 254
                  Height = 26
                  Align = alClient
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'M'#601'bl'#601#287
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  DesignSize = (
                    254
                    26)
                  object DBEdit51: TDBEdit
                    Left = 39
                    Top = 2
                    Width = 211
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'SUMAMOUNT'
                    DataSource = DataMod.DS_XS_IncomingViewSum
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                  end
                end
              end
              object Panel20: TPanel
                Left = 0
                Top = 26
                Width = 1268
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Panel21: TPanel
                  Left = 253
                  Top = 0
                  Width = 209
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'Alan m'#252#351't'#601'rinin v'#246'eni'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  DesignSize = (
                    209
                    26)
                  object DBEdit15: TDBEdit
                    Left = 106
                    Top = 2
                    Width = 101
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'REC_CLIENT_INN'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel23: TPanel
                  Left = 0
                  Top = 0
                  Width = 253
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'G'#246'nd'#601'r'#601'n m'#252#351't'#601'rinin v'#246'eni'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  DesignSize = (
                    253
                    26)
                  object DBEdit16: TDBEdit
                    Left = 129
                    Top = 1
                    Width = 118
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'SEN_INN'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel39: TPanel
                  Left = 462
                  Top = 0
                  Width = 806
                  Height = 26
                  Align = alClient
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'G'#246'nd'#601'r'#601'n i'#351'trak'#231#305'n'#305'n M'#252'xbir subhesab'#305
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  DesignSize = (
                    806
                    26)
                  object DBEdit18: TDBEdit
                    Left = 192
                    Top = 2
                    Width = 610
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'SEN_BANK_SUBACC'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
              object Panel40: TPanel
                Left = 0
                Top = 52
                Width = 1268
                Height = 26
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 3
                object Panel41: TPanel
                  Left = 0
                  Top = 0
                  Width = 313
                  Height = 26
                  Align = alLeft
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = 'G'#246'nd'#601'r'#601'n i'#351'trakc'#305'n'#305'n ad'#305
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  DesignSize = (
                    313
                    26)
                  object DBEdit17: TDBEdit
                    Left = 117
                    Top = 2
                    Width = 190
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'SEN_NAME'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
                object Panel42: TPanel
                  Left = 313
                  Top = 0
                  Width = 955
                  Height = 26
                  Align = alClient
                  Alignment = taLeftJustify
                  BevelInner = bvRaised
                  BevelOuter = bvLowered
                  Caption = #399'lav'#601' m'#601'lumat'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clMaroon
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  DesignSize = (
                    955
                    26)
                  object DBEdit14: TDBEdit
                    Left = 83
                    Top = 1
                    Width = 868
                    Height = 21
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    Color = clSilver
                    DataField = 'ADD_INF'
                    DataSource = DataMod.DS_XS_IncomingView
                    Font.Charset = RUSSIAN_CHARSET
                    Font.Color = clBlack
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
            end
            object GridIncoming: TDBGrid
              Left = 138
              Top = 45
              Width = 1130
              Height = 516
              TabStop = False
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              DataSource = DataMod.DS_XS_IncomingView
              DrawingStyle = gdsClassic
              FixedColor = 8404992
              GradientEndColor = clBlack
              GradientStartColor = clNavy
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
              ParentFont = False
              PopupMenu = PopupMessIn
              TabOrder = 3
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Azl Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = GridIncomingDrawColumnCell
              OnDblClick = GridIncomingDblClick
              OnTitleClick = GridIncomingTitleClick
              Columns = <
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'ID'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = #8470
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Arial AzLat'
                  Title.Font.Style = []
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  Title.Alignment = taCenter
                  Title.Caption = 'F'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Azl Sans Serif'
                  Title.Font.Style = []
                  Width = 19
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Azl Sans Serif'
                  Title.Font.Style = []
                  Width = 19
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TRANS_DATE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Tarix'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWindow
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'REFERENCE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Qeydiyyat '#8470
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWindow
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 94
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clWhite
                  Expanded = False
                  FieldName = 'SEN_ACC'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Debet'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 190
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_NAME'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Caption = '$'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 28
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clWhite
                  Expanded = False
                  FieldName = 'REC_CLIENT_ACC'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 190
                  Visible = True
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_NAME'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Caption = '$'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'AMOUNT'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Debet M'#601'bl'#601#287
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 119
                  Visible = True
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'AMOUNT'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit M'#601'bl'#601#287
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'LAMOUNT'
                  Title.Alignment = taCenter
                  Title.Caption = 'Ekvivalent'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'CurrencyRate'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Caption = #1050#1091#1088#1089
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Arial AzLat'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'FILIAL'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'TYPECODE'
                  Visible = False
                end
                item
                  Color = clWindow
                  Expanded = False
                  FieldName = 'DESCRPTIONCORRECT'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Qeyd'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWindow
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 230
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TRANSACTIONIDX'
                  Title.Alignment = taCenter
                  Title.Caption = 'Format'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWindow
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 56
                  Visible = True
                end>
            end
            object Panel25: TPanel
              Left = 0
              Top = 0
              Width = 1268
              Height = 45
              Align = alTop
              TabOrder = 4
              object ControlBar3: TControlBar
                Left = 1
                Top = 1
                Width = 1266
                Height = 42
                Align = alTop
                AutoSize = True
                BevelInner = bvLowered
                BevelOuter = bvNone
                DrawingStyle = dsGradient
                ParentFont = False
                TabOrder = 0
                object ToolBar3: TToolBar
                  Left = 11
                  Top = 2
                  Width = 1251
                  Height = 36
                  AutoSize = True
                  ButtonHeight = 36
                  ButtonWidth = 90
                  Caption = 'ToolBar1'
                  Color = clBtnFace
                  DrawingStyle = dsGradient
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Images = ImageList
                  ParentColor = False
                  ParentFont = False
                  ShowCaptions = True
                  TabOrder = 0
                  object ToolButton10: TToolButton
                    Left = 0
                    Top = 0
                    Action = MessageInFileLoad
                    Visible = False
                  end
                  object ButtonMessInConvert: TToolButton
                    Left = 90
                    Top = 0
                    Action = MessagesInConvert
                    DropdownMenu = PopupMenuConvert
                    Style = tbsDropDown
                  end
                  object ButtonMessInRefresh: TToolButton
                    Left = 193
                    Top = 0
                    Action = MessagesInRefresh
                    ImageIndex = 167
                  end
                  object ButtonMessIneEdit: TToolButton
                    Left = 283
                    Top = 0
                    Action = MessagesInEdit
                    ImageIndex = 24
                  end
                  object ButtonMessInDel: TToolButton
                    Left = 373
                    Top = 0
                    Action = MessInDelete
                    ImageIndex = 49
                  end
                  object ButtonMessInAccept: TToolButton
                    Left = 463
                    Top = 0
                    Action = MessagesInAccept
                    Caption = 'Yoxla'
                  end
                  object tranzitacc: TToolButton
                    Left = 553
                    Top = 0
                    Caption = 'Tranzit Hesablar'
                    ImageIndex = 11
                    OnClick = tranzitaccClick
                  end
                  object ToolButton17: TToolButton
                    Left = 643
                    Top = 0
                    Caption = 'Cap'
                    ImageIndex = 89
                    OnClick = ToolButton17Click
                  end
                  object ToolButton43: TToolButton
                    Left = 733
                    Top = 0
                    Caption = 'Excel'
                    ImageIndex = 183
                    OnClick = ToolButton43Click
                  end
                  object Panel53: TPanel
                    Left = 823
                    Top = 0
                    Width = 186
                    Height = 36
                    BevelOuter = bvNone
                    Color = 11319229
                    ParentBackground = False
                    TabOrder = 0
                    object StDate_in: TDateTimePicker
                      Left = 2
                      Top = 2
                      Width = 92
                      Height = 21
                      Date = 37832.619571851900000000
                      Time = 37832.619571851900000000
                      Enabled = False
                      TabOrder = 0
                    end
                    object EndDate_in: TDateTimePicker
                      Left = 94
                      Top = 2
                      Width = 91
                      Height = 21
                      Date = 37832.619571851900000000
                      Time = 37832.619571851900000000
                      Enabled = False
                      TabOrder = 1
                    end
                  end
                  object ToolButton14: TToolButton
                    Left = 1009
                    Top = 0
                    Width = 8
                    Caption = 'ToolButton14'
                    ImageIndex = 8
                    Style = tbsSeparator
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 1017
                    Top = 7
                    Width = 91
                    Height = 21
                    KeyField = 'CODE'
                    ListField = 'CODE'
                    TabOrder = 1
                    Visible = False
                  end
                  object CheckBox1: TXFCheckBox
                    Left = 1108
                    Top = 0
                    Width = 97
                    Height = 36
                    Caption = 'T'#601'tbiq et'
                    TabOrder = 2
                    Transparent = False
                    Visible = False
                  end
                end
              end
            end
            object Memo1: TMemo
              Left = 320
              Top = 288
              Width = 457
              Height = 129
              Lines.Strings = (
                'Memo1')
              TabOrder = 5
              Visible = False
            end
          end
        end
      end
      object PgOutArchive: TTabSheet
        Caption = 'OUT [Archive]'
        ImageIndex = 2
        object Panel28: TPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 250
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object DBGridOUTArchBatchs: TDBGrid
            Left = 1
            Top = 46
            Width = 1268
            Height = 203
            TabStop = False
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = DataMod.DS_BatchsArchive
            DrawingStyle = gdsClassic
            FixedColor = 8404992
            GradientEndColor = clBlack
            GradientStartColor = clNavy
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentFont = False
            PopupMenu = PopMenuArc
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = GridBatchsDrawColumnCell
            OnTitleClick = DBGridOUTArchBatchsTitleClick
            Columns = <
              item
                Color = clSilver
                Expanded = False
                FieldName = 'ID'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = #8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                Title.Alignment = taCenter
                Title.Caption = 'F'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Expanded = False
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'TRANSDATE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Tarix'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 70
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clWhite
                Expanded = False
                FieldName = 'ACC_NO'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 190
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = '$'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 28
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet M'#601'bl'#601#287
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 112
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'CurrencyRate'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Caption = 'Kurs'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'TRANS_REF'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Qeydiyyat '#8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'USERNAME'
                Title.Alignment = taCenter
                Title.Caption = 'Daxil Ed'#601'n'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODUSER'
                Title.Caption = 'Modifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'FUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'F.Verifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 100
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'VUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'Verifikator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'AUSERID'
                Title.Alignment = taCenter
                Title.Caption = 'Avtorizator'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 101
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'FORMAT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Title.Alignment = taCenter
                Title.Caption = 'Format'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODTIME'
                Title.Caption = 'Modifikasiya tarixi'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SDATE'
                Title.Alignment = taCenter
                Title.Caption = 'Verifikasiya tarixi'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = True
              end>
          end
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 1268
            Height = 45
            Align = alTop
            TabOrder = 1
            object ControlBar4: TControlBar
              Left = 1
              Top = 1
              Width = 1266
              Height = 42
              Align = alTop
              AutoSize = True
              BevelInner = bvNone
              ParentFont = False
              TabOrder = 0
              object ToolBar4: TToolBar
                Left = 11
                Top = 2
                Width = 1251
                Height = 36
                AutoSize = True
                ButtonHeight = 36
                ButtonWidth = 92
                Caption = 'ToolBar1'
                DrawingStyle = dsGradient
                EdgeInner = esNone
                EdgeOuter = esNone
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Images = ImageList
                ParentFont = False
                ShowCaptions = True
                TabOrder = 0
                object ToolButton16: TToolButton
                  Left = 0
                  Top = 0
                  Action = Mt102Insert
                  Visible = False
                end
                object ToolButton19: TToolButton
                  Left = 92
                  Top = 0
                  Action = Mt102Edit
                  Visible = False
                end
                object ToolButton22: TToolButton
                  Left = 184
                  Top = 0
                  Action = MT102Delete
                  Visible = False
                end
                object OutArchRefresh: TToolButton
                  Left = 276
                  Top = 0
                  Caption = '     Yenil'#601'    '
                  ImageIndex = 167
                  OnClick = OutArchRefreshClick
                end
                object ToolButton24: TToolButton
                  Left = 368
                  Top = 0
                  Action = Mt102Accept
                  Visible = False
                end
                object ToolButton25: TToolButton
                  Left = 460
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton18'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object ToolButton26: TToolButton
                  Left = 468
                  Top = 0
                  Caption = #1060#1072#1081#1083#1099' '#1065#1072#1079#1099#1088#1083#1072
                  ImageIndex = 5
                  Visible = False
                  OnClick = ToolButton11Click
                end
                object ToolButton27: TToolButton
                  Left = 560
                  Top = 0
                  Caption = #1069#1077#1076#1103#1085' '#1060#1072#1081#1083
                  ImageIndex = 11
                  Visible = False
                  OnClick = ToolButton5Click
                end
                object ToolButton28: TToolButton
                  Left = 652
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton6'
                  ImageIndex = 3
                  Style = tbsSeparator
                end
                object ToolButton29: TToolButton
                  Left = 660
                  Top = 0
                  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1083#1103#1088
                  ImageIndex = 7
                  Visible = False
                  OnClick = ToolButton8Click
                end
                object ToolButton30: TToolButton
                  Left = 752
                  Top = 0
                  Caption = #1048#1085#1082#1072#1088' '#1077#1090
                  ImageIndex = 4
                  Visible = False
                end
                object ToolButton44: TToolButton
                  Left = 844
                  Top = 0
                  Caption = 'Excel'
                  ImageIndex = 183
                  OnClick = ToolButton44Click
                end
                object ToolButton31: TToolButton
                  Left = 936
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton20'
                  ImageIndex = 8
                  Style = tbsSeparator
                end
                object Panel54: TPanel
                  Left = 944
                  Top = 0
                  Width = 186
                  Height = 36
                  BevelOuter = bvNone
                  Color = 11319229
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentBackground = False
                  ParentFont = False
                  TabOrder = 0
                  object DTPickOutArchBeg: TDateTimePicker
                    Left = 2
                    Top = 2
                    Width = 92
                    Height = 21
                    Date = 37832.619571851900000000
                    Time = 37832.619571851900000000
                    TabOrder = 0
                  end
                  object DTPickOutArchEnd: TDateTimePicker
                    Left = 94
                    Top = 2
                    Width = 91
                    Height = 21
                    Date = 37832.619571851900000000
                    Time = 37832.619571851900000000
                    TabOrder = 1
                  end
                end
                object ToolButton32: TToolButton
                  Left = 1130
                  Top = 0
                  Width = 6
                  Caption = 'ToolButton15'
                  ImageIndex = 9
                  Style = tbsSeparator
                end
              end
            end
          end
        end
        object Panel29: TPanel
          Left = 0
          Top = 250
          Width = 1270
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Panel30: TPanel
            Left = 0
            Top = 0
            Width = 1270
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              1270
              25)
            object DBEdit25: TDBEdit
              Left = 592
              Top = 2
              Width = 678
              Height = 21
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clSilver
              DataField = 'NAME'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit26: TDBEdit
              Left = 488
              Top = 2
              Width = 102
              Height = 21
              Color = clSilver
              DataField = 'TRANS_REF'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit27: TDBEdit
              Left = 375
              Top = 2
              Width = 111
              Height = 21
              Color = clSilver
              DataField = 'AMOUNT'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit28: TDBEdit
              Left = 330
              Top = 2
              Width = 42
              Height = 21
              Color = clSilver
              DataField = 'VAL_NAME'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEdit29: TDBEdit
              Left = 139
              Top = 2
              Width = 190
              Height = 21
              Color = clSilver
              DataField = 'ACC_NO'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEdit30: TDBEdit
              Left = 68
              Top = 2
              Width = 70
              Height = 21
              Color = clSilver
              DataField = 'TRANSDATE'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEdit31: TDBEdit
              Left = 3
              Top = 2
              Width = 51
              Height = 21
              Color = clSilver
              DataField = 'ID'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
          end
          object Panel31: TPanel
            Left = 0
            Top = 25
            Width = 1270
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              1270
              26)
            object Label8: TLabel
              Left = 456
              Top = 6
              Width = 27
              Height = 13
              Caption = 'V'#214'EN'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 16
              Top = 6
              Width = 31
              Height = 13
              Caption = 'F'#304'L'#304'AL'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = 8404992
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit32: TDBEdit
              Left = 592
              Top = 2
              Width = 678
              Height = 21
              Anchors = [akLeft, akTop, akRight, akBottom]
              Color = clSilver
              DataField = 'CLIENT_NAME'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit33: TDBEdit
              Left = 489
              Top = 2
              Width = 102
              Height = 21
              Color = clSilver
              DataField = 'CLIENT_INN'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit34: TDBEdit
              Left = 68
              Top = 2
              Width = 261
              Height = 21
              Color = clSilver
              DataField = 'FILIAL_NAME'
              DataSource = DataMod.DS_BatchsArchive
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit50: TDBEdit
              Left = 327
              Top = 2
              Width = 123
              Height = 21
              Color = clSilver
              DataField = 'SUMAMOUNT'
              DataSource = DataMod.DS_BatchsArchiveSum
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
        object Panel32: TPanel
          Left = 0
          Top = 304
          Width = 1270
          Height = 404
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object ControlBar5: TControlBar
            Left = 0
            Top = 0
            Width = 1270
            Height = 42
            Align = alTop
            AutoSize = True
            BevelInner = bvLowered
            BevelOuter = bvNone
            TabOrder = 0
            object ToolBar5: TToolBar
              Left = 11
              Top = 2
              Width = 758
              Height = 36
              AutoSize = True
              ButtonHeight = 36
              ButtonWidth = 93
              Caption = 'ToolBar1'
              DrawingStyle = dsGradient
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Images = ImageList
              ParentFont = False
              ShowCaptions = True
              TabOrder = 0
              object ToolButton33: TToolButton
                Left = 0
                Top = 0
                Action = MessagesOutAdd
                Visible = False
              end
              object ToolButton34: TToolButton
                Left = 93
                Top = 0
                Action = MessagesOutEdit
                Caption = '      Redakt'#601' et     '
                Visible = False
              end
              object ToolButton35: TToolButton
                Left = 186
                Top = 0
                Action = MessOutDelete
              end
              object ToolButton36: TToolButton
                Left = 279
                Top = 0
                Action = MessagesOutAccept
                Visible = False
              end
              object ToolButton37: TToolButton
                Left = 372
                Top = 0
                Width = 8
                Caption = 'ToolButton13'
                ImageIndex = 5
                Style = tbsSeparator
              end
            end
          end
          object Panel33: TPanel
            Left = 0
            Top = 332
            Width = 1270
            Height = 72
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Panel34: TPanel
              Left = 0
              Top = 0
              Width = 1270
              Height = 72
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Azl Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                1270
                72)
              object Label10: TLabel
                Left = 6
                Top = 23
                Width = 80
                Height = 26
                Caption = #214'd'#601'ni'#351'in t'#601'yinat'#305'  v'#601' '#601'sas'#305':'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label11: TLabel
                Left = 6
                Top = 54
                Width = 75
                Height = 13
                Caption = #399'lav'#601' m'#601'lumat:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 441
                Top = 5
                Width = 59
                Height = 13
                Caption = 'Alan M'#252#351't'#601'ri'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label13: TLabel
                Left = 592
                Top = 52
                Width = 86
                Height = 13
                Alignment = taCenter
                Caption = #399'm'#601'liyyat'#305'n kodu:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label14: TLabel
                Left = 31
                Top = 4
                Width = 51
                Height = 13
                Caption = 'Alan Bank:'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = 8404992
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object DBEdit35: TDBEdit
                Left = 89
                Top = 25
                Width = 1177
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'REMIT_INF'
                DataSource = DataMod.DS_BeneficiaryArchive
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit36: TDBEdit
                Left = 89
                Top = 48
                Width = 416
                Height = 21
                Color = clSilver
                DataField = 'ADD_INF'
                DataSource = DataMod.DS_BeneficiaryArchive
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit37: TDBEdit
                Left = 505
                Top = 2
                Width = 761
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'CLIENT_NAME'
                DataSource = DataMod.DS_BeneficiaryArchive
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit38: TDBEdit
                Left = 684
                Top = 47
                Width = 582
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'TRANSACTION_ID'
                DataSource = DataMod.DS_BeneficiaryArchive
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit39: TDBEdit
                Left = 89
                Top = 2
                Width = 351
                Height = 21
                Color = clSilver
                DataField = 'BANKNAME'
                DataSource = DataMod.DS_BeneficiaryArchive
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
            end
          end
          object Panel35: TPanel
            Left = 0
            Top = 42
            Width = 1270
            Height = 290
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 2
            object DBGridOUTArchBeneficiary: TDBGrid
              Left = 1
              Top = 1
              Width = 1268
              Height = 288
              TabStop = False
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              DataSource = DataMod.DS_BeneficiaryArchive
              DrawingStyle = gdsClassic
              FixedColor = 8404992
              GradientEndColor = clBlack
              GradientStartColor = clNavy
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopMenuArchPrint
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Azl Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = GridBatchsDrawColumnCell
              Columns = <
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'ID'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = #8470
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 51
                  Visible = True
                end
                item
                  Expanded = False
                  Visible = False
                end
                item
                  Expanded = False
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Azl Sans Serif'
                  Title.Font.Style = []
                  Width = 19
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_DATE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Azl Sans Serif'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Tarix'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 99
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clWhite
                  Expanded = False
                  FieldName = 'CLIENT_ACC_NO'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit'
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 190
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Color = clSilver
                  Expanded = False
                  FieldName = 'VAL_NAME'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = '$'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 38
                  Visible = True
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'AMOUNT'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Alignment = taCenter
                  Title.Caption = 'Kredit M'#601'bl'#601#287
                  Title.Font.Charset = RUSSIAN_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 160
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Color = clSilver
                  Expanded = False
                  FieldName = 'MESS_REFERENCE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Qeydiyyat '#8470
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Width = 106
                  Visible = True
                end
                item
                  Color = clWhite
                  Expanded = False
                  FieldName = 'LAMOUNT'
                  Title.Alignment = taCenter
                  Title.Caption = 'Ekvivalent'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end
                item
                  Color = clSilver
                  Expanded = False
                  FieldName = 'CurrencyRate'
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clNavy
                  Font.Height = -11
                  Font.Name = 'Arial AzLat'
                  Font.Style = []
                  Title.Caption = 'Kurs'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = []
                  Visible = False
                end>
            end
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = '  IN  [ARCHIVE]   '
        ImageIndex = 3
        object Panel37: TPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 708
          Align = alClient
          Caption = 'Panel37'
          TabOrder = 0
          object Panel38: TPanel
            Left = 1
            Top = 46
            Width = 185
            Height = 557
            Align = alLeft
            TabOrder = 0
            Visible = False
            object GroupBox1: TGroupBox
              Left = 2
              Top = 29
              Width = 182
              Height = 58
              Caption = ' Filial filteri'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 6
                Top = 14
                Width = 173
                Height = 21
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                KeyField = 'FILIAL_ID'
                ListField = 'FILIAL_NAME'
                ListFieldIndex = -1
                ParentFont = False
                TabOrder = 0
              end
              object CheckBox2: TCheckBox
                Left = 3
                Top = 38
                Width = 97
                Height = 17
                Caption = 'Qeyd et'
                TabOrder = 1
              end
            end
            object GroupBox2: TGroupBox
              Left = 3
              Top = 92
              Width = 181
              Height = 58
              Caption = #214'd'#601'ni'#351'in kodu'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object DBLookupComboBox3: TDBLookupComboBox
                Left = 4
                Top = 14
                Width = 173
                Height = 21
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                KeyField = 'CODE'
                ListField = 'CODE'
                ListFieldIndex = -1
                ParentFont = False
                TabOrder = 0
              end
              object CheckBox3: TCheckBox
                Left = 7
                Top = 38
                Width = 97
                Height = 17
                Caption = 'Qeyd et'
                TabOrder = 1
              end
            end
            object Panel52: TPanel
              Left = 3
              Top = 0
              Width = 179
              Height = 25
              Color = clBlue
              ParentBackground = False
              TabOrder = 2
              object SpeedButton1: TSpeedButton
                Left = 154
                Top = 3
                Width = 23
                Height = 19
                Caption = 'X'
                Flat = True
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                OnClick = SpeedButton1Click
              end
            end
            object BitBtn1: TBitBtn
              Left = 40
              Top = 168
              Width = 75
              Height = 25
              Caption = 'T'#601'tbiq et'
              DoubleBuffered = True
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 3
              OnClick = BitBtn1Click
            end
          end
          object Panel7: TPanel
            Left = 1
            Top = 603
            Width = 1268
            Height = 26
            Align = alBottom
            Caption = 'Panel7'
            TabOrder = 1
            object Panel43: TPanel
              Left = 1
              Top = 1
              Width = 344
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'G'#246'nd'#601'r'#601'nin ad'#305
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object DBEdit40: TDBEdit
                Left = 76
                Top = 1
                Width = 262
                Height = 21
                Color = clSilver
                DataField = 'SEN_NAME'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel44: TPanel
              Left = 345
              Top = 1
              Width = 670
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Alan'#305'n ad'#305
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                670
                24)
              object DBEdit41: TDBEdit
                Left = 50
                Top = 2
                Width = 617
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'REC_CLIENT_NAME'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel57: TPanel
              Left = 1015
              Top = 1
              Width = 252
              Height = 24
              Align = alClient
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'M'#601'bl'#601#287
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              DesignSize = (
                252
                24)
              object DBEdit52: TDBEdit
                Left = 39
                Top = 2
                Width = 212
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'SUMAMOUNT'
                DataSource = DataMod.DS_XS_INCOMINGSUM
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object Panel8: TPanel
            Left = 1
            Top = 629
            Width = 1268
            Height = 26
            Align = alBottom
            TabOrder = 2
            object Panel45: TPanel
              Left = 1
              Top = 1
              Width = 253
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'G'#246'nd'#601'r'#601'n m'#252#351't'#601'rinin v'#246'eni'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                253
                24)
              object DBEdit42: TDBEdit
                Left = 133
                Top = 2
                Width = 118
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'SEN_INN'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel46: TPanel
              Left = 254
              Top = 1
              Width = 209
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Alana m'#252#351't'#601'rinin v'#246'eni'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                209
                24)
              object DBEdit43: TDBEdit
                Left = 112
                Top = 1
                Width = 94
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'REC_CLIENT_INN'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel47: TPanel
              Left = 463
              Top = 1
              Width = 804
              Height = 24
              Align = alClient
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'G'#246'nd'#601'r'#601'n i'#351'trak'#231#305'n'#305'n M'#252'xbir subhesab'#305
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              DesignSize = (
                804
                24)
              object DBEdit44: TDBEdit
                Left = 194
                Top = -1
                Width = 609
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'SEN_BANK_SUBACC'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object Panel9: TPanel
            Left = 1
            Top = 655
            Width = 1268
            Height = 26
            Align = alBottom
            Caption = 'Panel9'
            TabOrder = 3
            object Panel48: TPanel
              Left = 1
              Top = 1
              Width = 313
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'G'#246'nd'#601'r'#601'n i'#351'trak'#231#305'n'#305'n ad'#305
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                313
                24)
              object DBEdit45: TDBEdit
                Left = 118
                Top = 1
                Width = 193
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'NAME'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel49: TPanel
              Left = 314
              Top = 1
              Width = 953
              Height = 24
              Align = alClient
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = #399'lav'#601' M'#601'lumat'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                953
                24)
              object DBEdit46: TDBEdit
                Left = 79
                Top = -1
                Width = 876
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'ADD_INF'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object Panel10: TPanel
            Left = 1
            Top = 681
            Width = 1268
            Height = 26
            Align = alBottom
            Caption = 'Panel10'
            TabOrder = 4
            object Panel50: TPanel
              Left = 1
              Top = 1
              Width = 95
              Height = 24
              Align = alLeft
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = #214'd'#601'n'#305#351#305'n kodu'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              DesignSize = (
                95
                24)
              object DBEdit47: TDBEdit
                Left = 69
                Top = 1
                Width = 23
                Height = 21
                Anchors = [akRight, akBottom]
                Color = clSilver
                DataField = 'TYPECODE'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object Panel51: TPanel
              Left = 96
              Top = 1
              Width = 1171
              Height = 24
              Align = alClient
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = #214'd'#601'ni'#351'd'#601'n v'#601'saiti alana m'#601'lumat'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              DesignSize = (
                1171
                24)
              object DBEdit48: TDBEdit
                Left = 168
                Top = 2
                Width = 1002
                Height = 21
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clSilver
                DataField = 'REMIT_INF'
                DataSource = DataMod.DS_XS_INCOMING
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
          object GridIncomingArchive: TDBGrid
            Left = 186
            Top = 46
            Width = 1083
            Height = 557
            TabStop = False
            Align = alLeft
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = DataMod.DS_XS_INCOMING
            DrawingStyle = gdsClassic
            FixedColor = 8404992
            GradientEndColor = clBlack
            GradientStartColor = clNavy
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentFont = False
            PopupMenu = PopupMenu1
            TabOrder = 5
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = GridBatchsDrawColumnCell
            OnTitleClick = GridIncomingArchiveTitleClick
            Columns = <
              item
                Color = clSilver
                Expanded = False
                FieldName = 'ID'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = #8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                Title.Alignment = taCenter
                Title.Caption = 'F'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Azl Sans Serif'
                Title.Font.Style = []
                Width = 19
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSACTIONIDX'
                Title.Caption = 'FORMAT'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 80
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clWhite
                Expanded = False
                FieldName = 'TRANS_DATE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Tarix'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 63
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'REFERENCE'
                Title.Alignment = taCenter
                Title.Caption = 'Qeydiyyat '#8470
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 94
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clWhite
                Expanded = False
                FieldName = 'SEN_ACC'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 190
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = '$'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 28
                Visible = True
              end
              item
                Alignment = taCenter
                Color = clWhite
                Expanded = False
                FieldName = 'REC_CLIENT_ACC'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Kredit'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 190
                Visible = True
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'VAL_NAME'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = '$'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Debet M'#601'bl'#601#287
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 119
                Visible = True
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'AMOUNT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Kredit M'#601'bl'#601#287
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
              end
              item
                Color = clWhite
                Expanded = False
                FieldName = 'LAMOUNT'
                Title.Alignment = taCenter
                Title.Caption = 'Ekvivalent'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Visible = False
              end
              item
                Color = clSilver
                Expanded = False
                FieldName = 'CurrencyRate'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'Arial AzLat'
                Font.Style = []
                Title.Caption = #1050#1091#1088#1089
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'Arial AzLat'
                Title.Font.Style = []
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'FILIAL'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'TYPECODE'
                Visible = False
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'DESCRPTIONCORRECT'
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Azl Sans Serif'
                Font.Style = []
                Title.Alignment = taCenter
                Title.Caption = 'Qeyd'
                Title.Font.Charset = RUSSIAN_CHARSET
                Title.Font.Color = clWindow
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = []
                Width = 196
                Visible = True
              end>
          end
          object Panel36: TPanel
            Left = 1
            Top = 1
            Width = 1268
            Height = 45
            Align = alTop
            TabOrder = 6
            object ControlBar6: TControlBar
              Left = 1
              Top = 1
              Width = 1266
              Height = 42
              Align = alTop
              AutoSize = True
              BevelInner = bvLowered
              BevelOuter = bvNone
              ParentFont = False
              TabOrder = 0
              object ToolBar6: TToolBar
                Left = 11
                Top = 2
                Width = 1251
                Height = 36
                AutoSize = True
                ButtonHeight = 36
                ButtonWidth = 89
                Caption = 'ToolBar1'
                DrawingStyle = dsGradient
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Images = ImageList
                ParentFont = False
                ShowCaptions = True
                TabOrder = 0
                object ToolButton41: TToolButton
                  Left = 0
                  Top = 0
                  Caption = '         Yenil'#601'         '
                  ImageIndex = 167
                  OnClick = ToolButton41Click
                end
                object ToolButton45: TToolButton
                  Left = 89
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton17'
                  ImageIndex = 7
                  Style = tbsSeparator
                end
                object ToolButton18: TToolButton
                  Left = 97
                  Top = 0
                  Caption = 'Filter'
                  ImageIndex = 8
                  OnClick = ToolButton18Click
                end
                object ToolButton42: TToolButton
                  Left = 186
                  Top = 0
                  Caption = #199'ap'
                  ImageIndex = 89
                  OnClick = ToolButton42Click
                end
                object ToolButton46: TToolButton
                  Left = 275
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton14'
                  ImageIndex = 8
                  Style = tbsSeparator
                end
                object ToolButton47: TToolButton
                  Left = 283
                  Top = 0
                  Caption = 'Excel'
                  ImageIndex = 183
                  OnClick = ToolButton47Click
                end
                object Panel55: TPanel
                  Left = 372
                  Top = 0
                  Width = 186
                  Height = 36
                  BevelOuter = bvNone
                  Color = 11319229
                  ParentBackground = False
                  TabOrder = 0
                  object INCBDATE: TDateTimePicker
                    Left = 2
                    Top = 2
                    Width = 92
                    Height = 21
                    Date = 37832.619571851900000000
                    Time = 37832.619571851900000000
                    TabOrder = 0
                  end
                  object INCEDATE: TDateTimePicker
                    Left = 94
                    Top = 2
                    Width = 91
                    Height = 21
                    Date = 37832.619571851900000000
                    Time = 37832.619571851900000000
                    TabOrder = 1
                  end
                end
                object ToolButton40: TToolButton
                  Left = 558
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton40'
                  ImageIndex = 9
                  Style = tbsSeparator
                end
              end
            end
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Beneficiary [ IN ]'
        ImageIndex = 4
        object ToolBar7: TToolBar
          Left = 0
          Top = 0
          Width = 1270
          Height = 41
          ButtonHeight = 38
          ButtonWidth = 77
          Caption = 'ToolBar7'
          DrawingStyle = dsGradient
          Images = ImageList
          ShowCaptions = True
          TabOrder = 0
          object btnrefresh: TToolButton
            Left = 0
            Top = 0
            Cursor = crHandPoint
            Caption = 'Yenil'#601
            ImageIndex = 167
            ParentShowHint = False
            ShowHint = False
            OnClick = btnrefreshClick
          end
          object btnedit: TToolButton
            Left = 77
            Top = 0
            Cursor = crHandPoint
            Caption = 'Redakt'#601
            ImageIndex = 24
            OnClick = btneditClick
          end
          object btncancel: TToolButton
            Left = 154
            Top = 0
            Cursor = crHandPoint
            Caption = 'L'#601#287'v et'
            ImageIndex = 49
            OnClick = btncancelClick
          end
          object btnaccept: TToolButton
            Left = 231
            Top = 0
            Cursor = crHandPoint
            Caption = 'T'#601'sdiql'#601
            ImageIndex = 121
            OnClick = btnacceptClick
          end
          object btnfile: TToolButton
            Left = 308
            Top = 0
            Cursor = crHandPoint
            Caption = 'Hesabat al'
            ImageIndex = 128
            OnClick = btnfileClick
          end
          object btnarxiv: TToolButton
            Left = 385
            Top = 0
            Caption = 'Arxiv'
            ImageIndex = 11
            OnClick = btnarxivClick
          end
          object Settings: TToolButton
            Left = 462
            Top = 0
            Caption = 'Sazlama'
            ImageIndex = 21
            OnClick = SettingsClick
          end
          object filtrcombo: TComboBox
            Left = 539
            Top = 0
            Width = 145
            Height = 23
            TabOrder = 0
            Text = 'Filter'
            OnChange = filtrcomboChange
            Items.Strings = (
              'Filter'
              'Yeni'
              'T'#601'sdiql'#601'nmi'#351
              'Error'
              'Geri qaytarm'#305#351)
          end
          object DateTimePicker3: TDateTimePicker
            Left = 684
            Top = 0
            Width = 186
            Height = 38
            Date = 42775.607090578710000000
            Format = 'yyyy-MM-ddThh:mm:ss'
            Time = 42775.607090578710000000
            TabOrder = 1
            Visible = False
          end
        end
        object Panel59: TPanel
          Left = 0
          Top = 41
          Width = 1270
          Height = 667
          Align = alClient
          Caption = 'Panel59'
          TabOrder = 1
          object bngrid: TDBGrid
            Left = 1
            Top = 1
            Width = 1268
            Height = 665
            Align = alClient
            DataSource = DataMod.ds_benefisiar
            DrawingStyle = gdsClassic
            FixedColor = 8404992
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentFont = False
            PopupMenu = benefisiarpop
            TabOrder = 0
            TitleFont.Charset = RUSSIAN_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -12
            TitleFont.Name = 'Courier New'
            TitleFont.Style = []
            OnDrawColumnCell = bngridDrawColumnCell
            OnDblClick = bngridDblClick
            OnKeyDown = bngridKeyDown
            OnKeyUp = bngridKeyUp
            OnTitleClick = bngridTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Title.Caption = #8470
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORMAT'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REFERANCE'
                Title.Caption = 'Referens'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AMMOUNT'
                Title.Caption = 'M'#601'bl'#601#287
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SENDNAME'
                Title.Caption = 'G'#246'nd'#601'r'#601'nin ad'#305
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SENDERACC'
                Title.Caption = 'G'#246'nd'#601'r'#601'nin Hesab'#305
                Width = 225
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RECEIVERNAME'
                Title.Caption = 'Alan'#305'n ad'#305
                Width = 180
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RECEIVERACC'
                Title.Caption = 'Alan'#305'n Hesab'#305
                Width = 225
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CRDATE'
                Title.Caption = 'Time'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'INFO'
                Width = 300
                Visible = True
              end>
          end
        end
      end
    end
  end
  object OpenDialogIn: TOpenDialog
    Filter = 'XML|*.xml'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 221
    Top = 138
  end
  object ImageList: TImageList
    Left = 200
    Top = 201
    Bitmap = {
      494C0101CD002001200110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000004000000040030000010010000000000000A0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000925A614744E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000BD77A614E81CE71885140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000C6184A290921081DE71C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000BD77E71CF03DCE350821C61800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000E71C534A3146103EAE39000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C73F75E1963F95AF95A
      534E114639671042EF39CE390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007B6FF85E3C573D4F3D4F3D4F
      FB52D65618633967104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000005B637D5B7D5F9E5F9E5F7D5F
      5D5B5D57B652F03D000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003A677D5F9E63BE67BE67BE67BE67
      9E637D5F3C53534E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F75EBE6BDE6BDE6BDE6BDE6BDE6B
      DE6BBE6B9E5F1A57000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001963DF73DE6BDE6FDE6FDE6FDE6F
      DE6BDE6B9E631A5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D75EDF73DF7300000000DF6FDF6F
      DE6FDE6BDF6BF856000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F862FF73DF7300000000DF73DF6F
      DE6FDE6FDF739552000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000003A67DF73FF77FF77FF7BFF77
      DF77FF77744E9556000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000D75A3967FF7BFF7BFF7BFF77
      FF777B67534E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F75E744E9452534A
      9552FF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001316131A0000000000000000
      0000000000000000000000000000000000000000217664766476447223722372
      236E236E036A036AE265C261C261615500000000000000000000000000000000
      00000000000000000000BA42960D750D00000000000000000000000000000000
      000000000000000000000000000000000000F30D1F5B7F1AF311000000000000
      0000000000000000000000000000000000002276487B497B287B287B277B067B
      A5148410C27AE67AC57AA57A847A847A61510000000000000000000000000000
      00000000000000001916FD26DD26DD26960D0000000000000000000000000000
      000000000000000000000000000000000000561ABF775F5B5C06141200000000
      0000000000000000000000000000000000000176487B497B487B287B277B846A
      A514A5142262E57AC57AA57A847A847A61510000000000000000000000000000
      0000000000009A3AFD26DD26DD26DD26D7110000000000000000000000000000
      0000000000000000000000000000000000000000160EFF059F67BF2E370E0000
      0000000000000000000000000000000000000000917F487B487B287B277B047B
      AD35AD35C37AE57AC57AA57A847A847A00000000000000000000000000000000
      000000007B22BC227B1E7B1E7B1E1409FB4E00004408CB10ED14A90C43040000
      000000004408CA10EC10A80C23040000000000000000370E1F5BBF6F5D0A380E
      000000000000000000000000000000000000000085768D7B487B287B277B277B
      616A616AE37AE67AC57AA57AC57EC26100000000000000000000000000000000
      0000DC3E7B225A1A5A1E5A1E34093A1E00006508143A1A5F9D73F95AD2314304
      00006508143A1A5FBD73195FB02D230400000000000000005A0E1F027F633B02
      7A73A735B262D362905EA839DE7B000000000000777F0176277B487B277BE37A
      85148410C27AE57AC57AA57A8159567700000000000000000000000000000000
      DC2A191AF815F815D8153509DB3E000000002E195C6BB94EF529DA4E3A63CA10
      00004E1D5C6BBA4ED629DA4E3A63A90C000000000000000000005B123C025E5B
      0A469C7BDE7FBD7F9D7F7C7F8635386B000000000000AA76487B277B277BE37A
      A514A514C17AE57AC57AC57AC55D000000000000000000000000000000000000
      DC26F304D715B7155509BC260000000000007121DF7BD52DBC32F62DBE772E19
      0000B329DF7BD629BD32F62D9D6FEC14000000000000000000000000BB7B2B46
      0000FF7FBD7FBC7F5A7B387B597FD37600000000000000000E7B937F4C7B047B
      C618C618A17AE57AC47A026600000000000000000000DF7B97529752D3393B6B
      9C771D43F304550D1D4300000000000000009225BE73DA52B529DA52195F0E15
      A910501DBE73BA52B525DA52D8560D19000000000000000000000000F4627B77
      0000FF7FBD7FBC7F5A7B387B387B387F16630000000000008876937B6E7B4B7B
      E71CC718E57A097B0A7B28620000000000000000764ED3393B675B6B5B6B5B6B
      5B6B7C73FD261D3300000000000000000000EB18B952DE77FF7F9D6F133E2E19
      EC1870217D67DE77FF7F5B679129A810000000000000000000000000F35EDE7F
      BD7FBD7F9C7FBC7F9B7F7A7F16773677C835000000000000000088766E7F4A7B
      CE398C31297B4D7B496A00000000000000003B67DE7BBE77BD77BD77BD779D73
      1A633B6700000000000000000000000000000100D32D7D6B5C67D956B12D2F1D
      702971257D677D6BF956F335B22900000000000000000000000000001563BD7F
      BC7FBC7F9C7FDE7F387BF576387B16770B4600000000000000000000947F497B
      10421042297B4D7F00000000000000000000F441DE7BDE7BDE7BBE77BE77BE77
      5B6B764E000000000000000000000000000000000C1DDA569D6F1A5BD235501D
      0E1992299D6F7D6FD852F3350B1D000000000000000000000000000016637B7F
      7B7F7B7F9C7F387B0000BE7F387B15772C42000000000000000000006872947F
      4E7B4E7B4D7F486A000000000000000000001A63564E5B6B354ADE7BFF7FFF7F
      FF7F764E0000000000000000000000000000000064085742BE773B635546F431
      0000363A9E737D6F974EF43564080000000000000000000000000000155F387B
      597B597B9B7F1677BD7F9C7F377B1577F45E00000000000000000000547BCC76
      4C7B4C7BAB7234770000000000000000000097525C6B00000000564E00000000
      0000775200000000000000000000000000000000000090293B637C6FB84EF435
      0000363E5C677D6F974A90290000000000000000000000000000000000003867
      387B387BF472377B387B377BD376AF6200000000000000000000000000000000
      0E770E7700000000000000000000000000000000000000000000765200000000
      D95EFF7F00000000000000000000000000000000000022048F29153A8F292204
      00004204902D363E902922040000000000000000000000000000000000000000
      1573157B377B16771577F4769066D25600000000000000000000000000000000
      557B337700000000000000000000000000000000000000009756BD7700000000
      1A67000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DE7B586738671763796F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE7B3B677C6FF95E9D73
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000190E190E
      B809970575015401000000000000000000000000000000000000000000000000
      B200FB5A00000000000000000000000000000000534A534A534A534A534A534A
      534A534A534A534A534A534A534A534A00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009D127C12
      5C123A0EF90DF90D000000000000000000000000000000000000000000001411
      1B061B06DE77000000000000000000000000744EF75A52465246524652465246
      5246524652465246524652465246F75A744E00000000000000003172637C837C
      637C637C837C837C6274A6640000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000140DDA05
      FA05FA05D404BE770000000000000000000095527B6F3A675A6B5A6B5A6B5A6B
      5A6B5A6B5A6B5A6B5A6B5A6B5A6B7B6F95520000000000000000F071A37CC478
      C478C478C478C478C47CC674000000000000000000000000000000000000BF53
      1E2FFE227D025A0200000000000000000000000000000000000036117C0E5B0A
      1A06FA05FA05FA0500000000000000000000F75ADE7BDE7BDE7BDE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDF7FBB6FC21EF246F75A00000000000000007C7F2C7E257D
      497EF47F057D467D417C7419D80DB70D3C5B00000000000000000000DE739E4B
      3E33FD2A9C1A7C0A0000000000000000000000000000000097199C167B125B0E
      3B0A1A0AFA05FA05350D0000000000000000F85EFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FDC73243B344FF85E00000000000000000000937E0C7E
      8C7F6B7F897E887D446CDE0E9C169C16F8110000000000000000000000000000
      00000000000000000000000000000000000000000000F8213A121A12BE4FFC1E
      7B127B0E5B0A98059805570500000000000000009C739C739C739C739C739C73
      9C739C739C739C739C739D73BD779D7700002926283368374837683782388130
      0A7FA57E43618128132E1E2BFD2AFD2A3A1E000000000000000000009B1E9B1E
      3A121A12D809B8050000000000000000000000000000000000000000FF6B1D27
      9C169B167C0E761900000000000000000000FF7F7B6B7B6B7B6B7B6B7B6B7B6B
      7B6B7B6F9C739C739C739C737B737B6FFF7FCD3A4737473747374837A2408238
      E77EE77E087F612C56323E371D371D37FC420000000000000000000000009E53
      5E3B3E2FFD1E7C120000000000000000000000000000000000000000FF6F3D2F
      DC1EDC1ADD1AB81D00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F76097C0A7C0E7C0AD909FF7FFF7FFF7F34534847463F473F473F24460451
      927F927FD17FE244427E017EFC3AFE2600000000000000000000000000009E4F
      3E371E2BDD1A5C0E0000000000000000000000000000000000000000FF735E37
      FD22FD1EFD1ED81D00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F97099C129C169C12F90DFF7FFF7FFF7F0000B467674B66436643454AA248
      B47FD67F034DC240E67EC67EC271FF7B00000000DE1ABD1ADE6B7E3B9F4F5E3F
      1E2BFD229D0E7C06D801F90114011101000000000000000000000000FF777E3F
      3D2F1D2B1D27B81900000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FD90DDD22DD22DD223A16FF7FFF7FFF7F000000006A62C67EA67E04720451
      E24CE24C034DE2484C7F297F4A7FF276000000000000BD16BE6FDF735E3B3E37
      FE22DD1A9C0A5C0218021C33110100000000000000007B265D3FDC1ADF6B7E43
      3E333D2F3D2B5B129B1A3A16000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FF90D1D2B1D2BFD2A5B1AFF7FFF7FFF7F00000000EF7EE77EE77E087F2459
      245524552359044DB37F937FF47FEF3900000000000000003B125B169E5F1E27
      DD1A9D125B021902550112010000000000000000000000009B1EDF6B7E3F7E3F
      7E3B5E375E335E331A160000000000000000FF7FFF7FFF7FFF7FFF7FFF7F7B1A
      9E573D2F5E3B3E3B3E371D2FFD2AF915FF7F000000008F5EB37F937FB17F2B56
      00000000944EE81C2821AF5EA6106C2D000000000000000000003A0E9D6B5E3F
      BD169C0A1902FD1A1301000000000000000000000000000000007B16DF677E3F
      7E3F7E3F7E3BBF5B00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      3D43BF635E3F5E3F5E3B5E3B5B1A1A16FF7F00000000A610482DB47FF57FC718
      000000007B6F0921E91CE818E81C734E000000000000000000000000F9093A1A
      FD1E5C02B805350100000000000000000000000000000000000000009C1ADF6B
      7E439E43BB1ADF7700000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FBD1EBF637E479F4BDC26FF7FFF7FFF7F000000002A210821E818E818E81C
      000000000000000000000000000000000000000000000000000000000000B805
      7D5BDD163501000000000000000000000000000000000000000000000000DC22
      BF5BFF6FFF77000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F9E5BBF5B1D2B9C1AFF7FFF7FFF7F00000000BD772A252A252A21F75E
      0000000000000000000000000000000000000000000000000000000000000000
      7701760100000000000000000000000000000000000000000000000000000000
      BC129E5F0000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FDD22FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000226022602260226022602260
      2260226022602260226022602260215C00000000000000000000000000000000
      B909000000000000000000000000000000000000140614063506350656065706
      780679069A069B06FF7FFF7FFF7FFF7FFF7F00000000000000007C0519013901
      F900F800F800D8003B0500000000000000002264637863786378637864748D75
      5A7B5A7B8D71646C437843784378437822600000000000000000000000000000
      1B021B02DF73000000000000000000000000130A3F5FFF3EBF1ABF1ABF12BF0E
      BF0ADF0A9F0ABF12FF7FFF7FFF7FFF7FFF7F0000000000000000BC051E337D0E
      5D0E5D0A3D061D06BC0500000000000000004268837883786378847400000000
      0000000000000000636863746378637822640000000000000000000000000000
      1B023C021B0E5E5B00000000000000000000130A3F4B1F3FFF2ABF12BF1ABF26
      BF429F4AFF4A1F4FFF7FFF7FFF7FFF7FFF7F0000000000000000DC057E4B9D16
      5D0E5D0E3D0A3D0ABC0900000000000000004268A478847800000000BD7F8D75
      637063708D71BD7F0000000063748378426800000000000000009B42DA053C06
      5C025C061C02FB015C220000000000000000130A3F4F1F43FF2EFF22DF22DF2A
      BF32BF36FF36FF3EFF7FFF7FFF7FFF7FFF7F0000000000000000FD057E53DE1E
      9D169D167E125D0EDC090000000000000000426CA47884780000000063748478
      636C636C8374426C00000000636484784268000000000000971998057D067D0A
      7C0A5C061B067C0EDD2A1C12000000000000130A5F5F3F573F4B3F431F331F2B
      DF16DF0EBF0ABF12FF7FFF7FFF7FFF7FFF7F00000000000000001D0A7F57DE22
      9E1A9D167E127D12DC090000000000000000636CA5780000BD7F6374C478636C
      00000000636CC4784268BD7F00006364426C000000007A3EDE12BD129D0E3E2B
      1E2F5C0ABF531A1200000000000000000000130A5F5F5F573F4B3F471F371F2B
      DF16DF0ABF06BF12FF7FFF7FFF7FFF7FFF7F00000000000000003D0A9F5FFE2A
      DE22BE1EBE1A9D1ABC0D0000000000000000636CAE790000AE79C478E478636C
      00000000636CC478A4748C6D00006C69436C0000DF7BF500DD16BD163E371A16
      BD1A1E2BB9091D5700000000000000000000130A3F471F3BFF22BF16BF1EBF2A
      BF3E9F4AFF4A1F4FFF7FFF7FFF7FFF7FFF7F00000000000000003D0ABF631E2F
      DE22DE22DE1EBE1AFC11000000000000000029755A7F000084780579E578636C
      00000000636CE478E478636800003977087100005511FE1EFE221E235D630000
      9F4F78050000000000000000000000000000130A3F4F3F471F2FDF1EDF22BF26
      BF32BF36FF36FF3AFF7FFF7FFF7FFF7FFF7F1D067D163D0ADD057D129F5B1E37
      FE2EFE2ADE26DE22BA0DDB05BC09FC09BC054A757C7F0000847805790579636C
      00000000636C0579E578636C000039774A75000016013F271E27DE1E00000000
      990900000000000000000000000000000000130A5F5BDF469F32BF2EBF26BF1E
      BF12BF0EDF16BF26FF7FFF7FFF7FFF7FFF7F1E06FE2A9F4F3E333E373E371E33
      1E331E2FFE2ADE263B1A3C16BD1A7D16BC058C75947E0000947A0E7E2F7EED7D
      00000000CD752E7E0E7A7372000053726B75000077055F335F337C1600000000
      0000000000000000FE225E335E33FE1E0000394B140234023502360256065706
      780679069A069A02FF7FFF7FAC35F762EE390000DD05BC01FF7BBF6B5F3F5F43
      3E3B3E371E331E2FFE2A1F2FBC05BC0500008C79EE790000DE7FAD794F7E0E7E
      000000000E762F7E8C71DE7F0000AC6D6B75000016017F375F331E2B00000000
      00000000000000003E2F5F335F33FE1A0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1863FF7F0F46FF7FFF7FFF7FAC35F75EEE3900000000FE059F4FDF775F435F43
      5F3F3F3B3E371E333F371E2FBD0500000000AD79707EEF7900000000CE79507A
      EE79EE754F7ACD7500000000AD6D4F7E8C79000039367C1A7F3B9F3F57059E6B
      00000000BF6B3B0E7F3B7F3B5E375E470000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      3867FF7F724AFF7FFF7FFF7FAC353967CE39000000000000FE05FD01DF77BF63
      5F475F473F3F5F433D0EBD05000000000000AD79707E707E00000000DE7FB57A
      EE79EE759576DE7F000000004F7A507E8C790000DF7BF5009F3F9F3F7F379905
      DC46FD463B0E7F379F3F9F3FDD1AFF7B0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      3867FF7F514AFF7FFF7FFF7F0F421867CE390000000000000000FE05BF5FDF77
      5F477F477F4B7F4BDD050000000000000000AD79917E917E717E0F7A00000000
      0000000000000000EE71707A917E707EAD79000000000000DC2ADF539F479F47
      BF47BF479F479F47BF575E43000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      1863FF7F7A6F724EEE3D8A2DF75ED65EEE39000000000000000000001E065D0A
      DF77BF6F9D1AFD05000000000000000000008C79917E917E917E917E107AB57A
      9C7F9C7F95760F76917E917E917E917E8D79000000000000560D7B1EBF4BBF47
      9F479F479F47BF531E339D1E000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      5A6BD65ABD775A6B5A6B3967F75E7B6F18630000000000000000000000001E06
      DF6FDF6FFE0500000000000000000000000000008C79AC79AD79AD79AD79AD79
      AD79AD79AD79AD79AD79AD79AD79AD790000000000000000000000009B3EF919
      5B1A7B1A5B22FD4200000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F514A31460F3EEE3D0F423967FF7F0000000000000000000000000000
      5E063E060000000000000000000000000000000000002F052F052F052F052F05
      2F052F052F052F052F052F010E050E0500000000000000000000000000000000
      000001548D6500000000000000000000000000000000000000000000575F2C32
      8511851185118511851185118511A51500000000000000000000000000000000
      000000000000000000000000000000000000000000004F090000000000000000
      000000000000000000000000BE734F0900000000000000000000000000000000
      2158427442742158000000000000000000008511072F072FE5190000C72AE72E
      E72EE72EE72EE72E461E461E461EE51500001305D200B200B200B200B200B200
      B200B200B200B200B200B200D200D200130500000000B2153C5F741974197419
      7419741974197419741973157C67500900000000000000000000000000000000
      A5604274637C215C000000000000000000008511E72EE72EE519A619072FE72E
      E72EE72EE72E072F85118511851185110000000035059F3F3C023C023C021C02
      1B021B021B021B021B021B021C02F300000000000000F3210000DE77DE77DE77
      DE77DE77DE77DE73DE77BE737C67500900000000000000000000000000000000
      21606378837C216000000000000000000000A511E72EE72EE519E515E732E72E
      E72EE72EE72EE732073307330733073300000000BE73D3009F4B7C0E5C0E5C0A
      5C0A5C0A3B0A3B0A3B0A5C0A55110000000000000000F321FB52951D951D951D
      951D951D951D951D951D951D7C67500900000000000000000000000000000000
      4268A3786374216000000000000000000000A511E72EE72E061A261EE72EE72E
      E72EE72EE72E07338511851185118511000000000000BE73F9119F537C127C12
      7C127C0E7C0E5C0E7C0E360500000000000000000000F3210000DE77DE77DE77
      DE77DF7BDF7BDF7BDF7BBE777C6750090000000000000000000000009C7F2264
      C478A478426C397B00000000000000000000E71D72574F4F261E882AE62EE62E
      E62EE62EE62E07372B434D4B72577257071E0000000000001C5715019F4FBD1A
      BD1ABD1ABD1ADD1A3505BE7300000000000000000000F321FB52951D951D951D
      951D951DB61D951D961D951D7C67500900000000000000000000000022684370
      C478C47863702268E86CE86CE86CE76C0000071E715771576A2EEE427257725B
      4E4F7157725772577257725772577257E61900000000000000001C57FD327F4B
      DD1EDD1EFE22D90DBF73000000000000000000000000F3250000DE77DE77DE7B
      DF7BFF7BFF7FDF7BBE779D6B5C6370090000226C22682268226C856C057DE478
      E478E478E478E478047D047D047D057D226C271E925B925BAB32061A71577157
      71577157715771577157715771577257061A000000000000000000005A327705
      7F4B1E2B78093D570000000000000000000000000000142E3C5F95199519951D
      951D951D951D9419741953153B5B70090000226C057D057D4370226C04790479
      04790479E47804790479047904790479436C061A27222722261E2722925B7157
      7157715771577157715B715B715B715B27220000000000000000000000007B32
      BF57FD2A3D5B00000000000000000000000000000000563600000000FF7FFF7F
      FF7F0000BE73BD737C6B3B5FD84A710D00002370E47805794270837405790579
      0579057905790579C478C478C478C378437000000000000000000000051A2F47
      715B715B2F4B47226A2E6A2E6A2E6A2E00000000000000000000000000000000
      1A1A7E5F000000000000000000000000000000000000773A3C5F951D951D951D
      951D951D7419741953153215B846911100004370707EEB7D4274837425792579
      257925792579257925790479CA7D4F7E4370000000000000000000000000251A
      915B715BCA320000000000000000000000005B265B225B225B225B225B225B22
      7C2A7B2A5B225B227B227B227B267B267B260000000097420000FE7FFF7F0000
      DE73BE733B5F973EDE7BBE73773AB21500004374907E907EC6744A79917E917E
      917E917E917EB27E027402740274227400000000000000000000000000000000
      EC3E915F7157461E000000000000000000001B0A7F3F7F437F437F437F437F43
      7F437F437F437F437F437F437F437F433B0E0000000097423C5F951D951D9519
      741974191011973EBE733B5FF321000000004374917E917EC678A678917E917E
      917E917E917E917ED27ED27ED27ED37E00000000000000000000000000000000
      6726915F9163A92E000000000000000000003B0A7F3B7F3F7F3F7F3F7F3F7F3F
      7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F5C0E00000000B7460000FF7FDF77BE73
      7C6B5B5FD94655327636F3210000000000004374B17EB17EE7782274B27EB17E
      B17EB17EB17EB27E027822782278437800000000000000000000000000000000
      A92E915FB163CA32000000000000000000009D167C0E7C0E7C0E9C0E9D0E9D0E
      9D0E9D0E9D0E9D0E9D0E9D0E9D0E9D0EBD1600000000B74600000000DF7BBE73
      5C673B5BB842F321F32100000000000000004378D37ED37EE7780000B37ED27E
      B27EB27EB27EB27EAC79AC79CD79E77800000000000000000000000000000000
      86229163925FA626000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B846B742B742B746B846
      973E973E342ED31D0000000000000000000000000000000000000000D67E2979
      4378437843784378437843784378227800000000000000000000000000000000
      B96BC72A304B0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FD2EDD26
      5C0E5C0EDD26FE32000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000CE5DA55C
      01640168C664CE6100000000000000000000000000002F052F052F052F052F05
      2F052F052F052F052F052F010E05C13C00000000000000005C0E3E2B5F375F37
      5F375F375F375F373E2B5C0E0000000000000000EF3D6B2D7B6F000000000000
      000000000000000000007B6F6B2DEF3D00000000000000008C61847042784278
      42784278427842782274C660000000000000000000004F090000000000000000
      000000000000000000000000F77FFA7F414D00000000BD325F375F333F333E2F
      3E2B3E2B3E2F3F335F335F37BD32000000000000CF312A219C6F000000000000
      000000000000000000009C6F2A21CF310000000000000000846C427842784278
      427842784278427842784278000000000000000000004F093C5F741974197419
      74197419741974197419E04CF97F207E000000001B0A3E2F1E2B3E2F00000000
      00000000000000003E2F1E2B3E2F1B0A0000167B807F807F807F607F607F407F
      207F207F007FE07EC07EC07EA07E807E1677000000000000847C627863786378
      637863786378637863786378845C0000000000000000B2150000DE77DE77DE77
      B0354D29754EDE732B7FFD7F6059500900000000FD221E2B1E2BFF7F0000DF77
      3E333E33DF770000FF7F1E2B1E2BFD2200006176607F607F607F407F207F007F
      007FE07EE07EC07EA07EA07EA07E807EA171000000000000A478837883788378
      83788378837883788378837821640000000000000000B215FB52951D951D890C
      7D5BFF673A672F21A97E007E7C6750090000191EFE26FE2200000000DE1A3E3B
      000000003E3BDE1A00000000FE22FE269C3A007B8F313242EA18806A207F007F
      007FE07EE07EC07E6272F1358D31A610007A000000000000E57CA37CA37CA37C
      A37CA37CA37CA37CC574C47C21640000000000000000D31D0000DE77F52DBF5B
      7E5FDF6BFF7700007325BE777C6750090000B80DDE22DD1A0000DF773E3B0000
      0000000000003E3BDF770000DD1ADE22D915007BB13132420B210156207F007F
      007FE07EE07EC07E4566123EAD31A80C007A000000000000267DC37CC37CC37C
      C37CC37CC37CA37C6364057DA56C0000000000000000F321FB52951DFE46FC4A
      BF67DF6BFF77FF7B195F12157C675009000015011E3BBD1A0000DD1E00000000
      0000000000000000DD1E0000BD1A1E3B1501C07A807FE16E407F407F207F007F
      007FE07EE07EC07EA07E807E026A807EC0750000000000000D7ECB7DCB7DCB7D
      CB7DCB7DCB7DCB7DC664CB7D076D0000000000000000F3250000DE77DE423D53
      9E677E57DF6BDF6B7C63554A5C637009000015011D37FD2E0000BD1A00000000
      0000000000000000BD1A0000FD2E1D3715016B76607F607F407F407F207F207F
      007F007FE07EC07EA07EA07E807E607E2A6E0000000000002E7EEC7DCB7DEC7D
      CB7DCB7DCB7DCB7DC5608A7D076D0000000000000000142E3C5F95197C323D53
      00007E63DF67BF631A5310153B5B70090000F915FD2EDD260000DF7B3D3F0000
      0000000000003D3FDF7B0000DD26FD2E77110000E17E3F37BE1ABE1ABE1ABE1A
      BE1ABE1ABE1ABE1ABE1ABE1ABF12E07E00000000000000002E7EEC7D0E7EEB7D
      707EEB7D0F7AEC7DE850276DC5680000000000000000563600000000B2315B32
      5D535D5BFC4ABF5BF13D3B5FD84A710D00007B323E3FDD2600000000DD1E3D3F
      000000003D3FDD1E00000000DD263E3F59360000AB7F9F671E371E2FFE2EFE2E
      FE2EFE2EFE2EFE2EFE2EFE2EFD32207F00000000000000002E7EEC7D0E7EEB7D
      707EEB7D0F7AEB7D19773166AD610000000000000000773A3C5F951DB425D335
      5B2EBD3EDD42173A53153215B8469111000000005A1E5E43DD1EFF7F0000DF77
      DD26DD26DF770000FF7FDD1E5E435A1E00000000487FB27F9F5FBF5FBF5FBF5F
      BF5FBF63BF63BF63BF5FBF5FB27B487F00000000000000004F7EEC792E7E0C7E
      917E0C7E2F7A0C7E397700000000000000000000000097420000FE7FFF7F0000
      DE73BE733B5F973EDE7BBE73773AB21500000000F400DC2A1D37DD2200000000
      0000000000000000DD221D37DC2AF400000000008976CA7FBF5FBF5FBF5FBF5F
      BF5FBF5FBF5FBF5FBF5FBF5FCA7F897200000000000000004E7EAB752E7E2D7E
      917E2D7E2F7A0C7E397700000000000000000000000097423C5F951D951D9519
      741974191011973EBE733B5FF3210000000000000000F729BC261D331D2FFD2E
      FD2AFD2AFD2E1D2F1D33BC26F729000000000000317B677F667F667F837F217F
      637F637F217F837F667F467F667F317B00000000000000008C6974722E7E2D7E
      917E2D7E0E762D7E3977000000000000000000000000B7460000FF7FDF77BE73
      7C6B5B5FD94655327636F321000000000000000000000000D20019161D2F1D2F
      FD2EFD2E1D2F1D2F1916D20000000000000000000000537B1077EE76057B6060
      C8718769605C057BEE761077337B00000000000000000000000000000C7E0C7E
      907E2D7ECC750C7E3977000000000000000000000000B74600000000DF7BBE73
      5C673B5BB842F321F32100000000000000000000000000000000000016321211
      B000B000121116320000000000000000000000000000000000000000A676937F
      A876A876937FA676000000000000000000000000000000000000000039779C7B
      29692869F776316A0000000000000000000000000000B846B742B742B746B846
      973E973E342ED31D0000000000000000000000000000000000008C5D00500050
      00500050005000508C5D0000000000000000000000000000000000003E47DD2A
      BD22BD22DD2A3E47000000000000000000000000000000000000FF7BAB1A4502
      84022502CC22754F0000000000000000FE770000000000000000000000000000
      000000000000000000000000000000000000000000000000425C637821742174
      21742174217421742178005C0000000000000000000000009C1E3E3B5E435E43
      5E435E435E435E433E3B9C1E00000000000000000000DD73A402630383036303
      6303630364076407C506860A0000ED2EC406F1415A6B5A6B5A6B5A6FBB325A6F
      5A6B5A6B5A6FBB325A6F5A6B5A6B5A6B6C2D000000006B616378417442744274
      2174217421742174217422786B610000000000000000FD3E5E435E435E435E43
      5E435E435E435E435E435E43FD3E000000000000DD7345026303830363038403
      85078507860B860B850B2507250EC30605071146396739673967596BBA32596B
      39673967596BBA32596B3967396739678D350000436083786274627442744274
      42744274427442744274427442780160000000005B1E3E3F5E3F1D37DC2EDC2E
      DC2EDC2EDC2EDC2E1D375E3F3E3F5B1E00000000A40262036303830385074503
      E70A4B1FD24FAC27AA1BA91BA71BA923260B114A5A6F5A6F5A6F5A73DA3E5A73
      5A6F5A6F5A73DB3A5A735A6F5A6F5A6FAE398C65A37862746274627462746274
      627462746274427442744274427442788C6500001D333E3B1D375409F71DF71D
      F71DF71DF71DF71D54091D373E3B1D330000FF7B4203420363038403C702870A
      DB6B744BC6064B27CB23CC2BCB2BCC2F460B324E5A127B169B1E9B22BC22DC2E
      FC32FD321D3BFD323D433D435E475E47CF3D426441646C69216062746360A564
      82780064296942604268A564627862742160DC421E371D37BC2A382600000000
      00000000000000003826BC2A1D371E37DC428A1A420343038507080700000000
      00000000E50ACD3FCE33CE37F043F147670F534A7B6F7B6F7B6F7B731B477B73
      7B6F7B6F7B731B477B737B6F7B6F7B6FD03D4264B57200000000A5685A770000
      006CBD7B00000000C57000006178827821643A22FD32FD32BC26392600000000
      00000000000000003926BC26FD32FD323A226502E30243036607E90E00000000
      FD73C5068D3FF767F45BF14FEF43F0478713534E7B6F7B6F7B6F7B731C477B73
      7B6F7B6F7B731C477B737B6F7B6F7B6FF03D22684174C66C00008C71397B0000
      CF71000081788D718C710000000000002168F8153E47FD32BC227A2A00000000
      00000000000000007A2ABC22FD323E47F8155505000000000000000000000000
      0000000000000000B6574E33450FAB33671774529C779C779C779C7B3C539C7B
      9C779C779C773C4F9C779C779C739C731146E76CE770000031764070397B0000
      CF750000A278CE758C710000AE750000646CD8113D433D439C1E7A2A00000000
      00000000000000007A2A9C1E3D433D43D811D811DC32391A7A323D5700000000
      00000000000000000000000000000000660F95567B167B1A9B22BC26BC26DC32
      FD32FD361D3B1D373D433E435E475E4B11460871F07900000000327A00000000
      747AFF7F000000008B79000000000000E770F81D1D3B1D3FFC3A1C4B00000000
      00000000000000001C4BFC3A1D3F1D3BF81D77015C027C061D2F7E4BBF637E4F
      1A12DF77000000009C1E7F439F475F3BFD229556BD77BD77BD77BD7B5D57BD77
      BD77BD77BD775D57BD77BD77BD77BD77334A08714779107A747A4B79747A747A
      6C7907755A7F527A8B79747A747A2979E7709A3E5D4B1D37FC363D4B00000000
      00000000000000003D4BFC361D375D4B9A3E97017C067C0EBC16BD1A5E3F9B26
      0000000000000000BC1E9F4B9F4BBF5B1E33B556BD77BD77BD77BD775D57BD77
      BD77BD77BD775D57BD77BD77BD77BD77534AF079B27ECA79CA79CA79CA79CA79
      CA79CA79CA79CA79AA79AA79AA79CA79F07900009B325E4FFC321D435E4F5E4F
      5E4F5E4F5E4F5E4F1D43FC325E4F9B32000098057C0A9C0EBD1ADD1AFD3A1A12
      3D53BF6F7C1E9C1E9F479F47BF57DF6B0000B75ADF7FDF7FDF7FDF7F7F5FDF7F
      DF7FDF7FDF7F7F5FDF7FDF7FDF7FDF7F755200004A75B27ECB79CB79CB79CB79
      CB79CA79CA79CA79CA79CA79CB79087500000000750DFC3E3D471C37DC2EDC2E
      FC2EFC2EDC2EDC2E1C373D47FC3E750D0000B8057C0E9C12BD1ADD1E3E379F57
      1D3BBC263E337F439F479F47DF6F3E370000B75A04270427042704273433032B
      0427042704270B2F0427042704270427755200000000CF79D27EEB79EB79EB79
      EB79EB79EB79EB79EB79EB79CF7900000000000000003832DC363D433D433D43
      3D433D433D433D433D43DC36383200000000B8093A0EF815BC22FD221E2B1E2F
      3E375E3B7F3F7F3F9F53DF6FDD1EFF770000B75A253B253B253B253B553F243B
      253B253B253B2C3F253B253B253B253B75520000000000004A79D37EEB79EB79
      EB79EB79EB79EB790C7A087900000000000000000000000054097A263D3F3D3F
      1D3F1D3F3D3F3D3F7A265409000000000000D8099B360000F9119B221E2F1E2F
      3E335E375F3F9F4FDF6B3E37FF7700000000B75AAE5FAE5FAE5FAE5FAE5FAE5F
      AE5FAE5FAE5FAE5FAE5FAE5FAE5FAE5F75520000000000000000F07909790979
      0979097909790979F079000000000000000000000000000000000000583A9515
      540954099515583A00000000000000000000DF7700000000000000005E57BC32
      7C16FD2EBD1AFE32000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000003A67B6565A6BD65AB556B556
      B556B556B556B556D65A1863F7627B6FDE7B000000000000000000000000760D
      770D760955090000000000000000000000000000000079367505182600000000
      000000000000000000001C579509D715000000000000000000000000FD3E7B1E
      3B0E3B0E7B1EFD3E0000000000000000000000005D2EDF6F5615000000000000
      00000000000000000000AD592154737EBD7B0000000000001A16D819DF7BB711
      9C167C12970DDF7B9615D80D0000000000000000FC46F9150000F81100000000
      0000000000000000BF6F191600005A2200000000000000001A0E5C0A5C0A5C0A
      5C0A7C0A1B0A1B0A5C0A1A0E0000000000000000F9295D5F1C1EB92100000000
      0000000000000000085D2154737E6B6DD67A000000007A36DD229C1EF9117B1A
      9C169C163B12D80D5B0E7C0E38320000000000007F5F7B2200005B1E00000000
      0000000000000000DF77BC3200007B22000000000000BC367C0E7C0E7C0E7C0E
      7C0E7C0E360136019D0E7C0EBC36000000000000DB4EB815D5003C1EB94A0000
      00000000000008516354D67E004C2248000000007B1E1D2BDD26DD26DD22DC22
      5B1A5B1ABC1A9C1A9C167C129C12F90D0000000000000000391AB701B6019601
      9601960196019601960196011916F81100000000FA0DBD16BD16BD16BD16BD16
      1501BE6B00000000BD16BD16BD16FA0D000000000000BA465100F600B9153C5F
      000000003166004CD67EEF752144D67200000000191EDD26FD2AFD269C1E5A1A
      7B1A5B1A97111A169C1A9C167B12B719000000000000D805D805D805D805D805
      D801D801D801D701D701D701D701D701000000009C16BD1ABD1ABD1ADD1A9D16
      DE6F000000000000DD1ABD1ABD1A9C160000000000000000BB42B62179097D2A
      000000006354737A004C21440000000000000000DF7B7B1E1D2FDD261D2FBC22
      7B2EBB3E1A161D27F911BD1EF911DF7B000000000000F90D0000000000000000
      000000000000000000000000000000000000BB3AFD22BD1E980578059805FF77
      FC3EB90900000000FE22FD22FD22FD22BB3A0000000000000000DB463100DC0D
      56466B5D317EAD75844C39770000000000001A165B1AFD2A1D33BC1EDC267B1A
      00000000760DF9113409BC1E7B1AD81197110000000019127505750575057505
      750575057505750575057505750575050000F919FE22DD1E0000000000000000
      B9091E27000000001E27FD22FD22FD22F919000000000000000000007B2A0E35
      845CF77E0050B572000000000000000000003D4B9E5F7E4FFD2A1D2FDD2A0000
      000000000000B619BC1E970DDD22BC1ED80D000000003A1AB60DB60D0000B60D
      00000000B60D0000B60DB60D000095090000D90D9E4F1E2F000000000000B905
      3E2B3E2F000000003E2F1E2B3E379E4FB9090000000000000000000000005842
      CD7D4A69946A0000000000000000000000003D4B9E5F9E5F7E539E5B5E470000
      000000000000B61DDC2AB70D3D3B3D3BFC42000000005B1ED811D8110000D811
      00000000D8110000D811D8110000D8110000B8099E4F7E4B000000000000DA09
      3E335E33000000003E333E2F9E539E4FB8090000000000000000000039675773
      78462C51BE01754A000000000000000000003D475D4B9E5B9E575E4F5D479E5F
      000000003C539A32BB3A3D475E4F1C43FC3E000000007C229B2A7B2600003A1A
      000000003A1A00003A1A3A1A00009C2E0000B8159F537E4F0000000000000000
      BD227E4300000000BF579E539E539F53B815000000000000000000005A6B7A73
      0000DA25353E166B3967BD77FF7F00000000000000005D4F9F5F5E4B9E5B3D47
      9E679E63BB365E539A329E5B3D47FF7B0000000000009C26FD3AFD3A00009C2A
      000000007C260000BD2EBD3200009C2E00007B3ADF639E4F1D33FD321D370000
      5D4B3E4300000000BF579F579F57DF637B3A0000000000003967396B00000000
      00000000BD77734E1042DE7B00000000000000007E4FBF5FBF63BF633D435D4F
      BF63BF633D4B9A369E5B9E5B7E573D4B000000000000BD2E3F433F3F00003F3F
      000000003F3FDF6F3F3F3F3F00003F3F000000005E4BDF6FBF5BBF5BBF5B9E4F
      0000000000000000BF5BBF5BDF6F5E4B0000000000000000396B5B6F00000000
      00000000FF7F000039675A6BF75E0000000000007E57BF67BF63BF63BF637E53
      FC3ADB3A3D4BBE5F9E5B9E5B9E5B5D4F000000000000DE2E5F473F4300003F43
      000000003F4300003F433F4300003F3F000000007705DF67DF6BBF63BF5BBF5F
      3D3B000000000000BF63DF6BDF67770500000000F76200000000000000000000
      000000007B6F0000B5565A6B9452D65A0000000000009E5BBF67BF637E539E5F
      BF63BF639E5B5E4F9E5BBF5F7E5B0000000000007E5B5F470000000000000000
      00000000000000000000000000000000000000000000392EDF67DF6FDF6FDF6F
      DF6FDF6B9E579E57FF73DF67392E00000000000000005A6B0000000000000000
      000000005A6B9C731863F75E0000BD7700000000000000009E5B7E5300007E4F
      BF63BF635D4F00005D4F7E5300000000000000001E3F7F4B0000000000000000
      00000000000000000000000000000000000000000000000077055E4BFF6FDF6F
      DF6FDF6FDF6BDF6B5E4B7705000000000000DE7B9C7300000000000000000000
      00000000000000005A6B7B6FBD77000000000000000000000000000000007E4F
      7E537E535E4F00000000000000000000000000001E3BFF7B0000000000000000
      0000000000000000000000000000000000000000000000000000000059367611
      560556057611593600000000000000000000000000000000000000003D4BDC2E
      BC26BC26DC2E3D4B000000000000000000000000000000000000000036365211
      120112015211363600000000000000000000000075090000B615B615B615B615
      B615B615B615B615B615B6150000750D750D0000CE354A29A514A510A514A614
      FF7FFF7F00006C2D8410630C630C630C630C0000000000009B263D3F5E475E47
      5E475E475E475E473D3F9B2600000000000000000000000034053A12190E190E
      190E190A190AF909F9053301000000000000D7157C0A324E7B6F7B6F7B6F7C6F
      9C6F9C6F9C739C739C739C6F324E7C0EB60D8510F75AEF39630C630C8410A614
      FF7FFF7F4B291863A514630C630C8410841000000000FC425E475E475E435E43
      5E435E435E435E435E475E47FC420000000000000000F62D5B163A123A123A12
      190E190E190E190E190A1A0AF52900000000D7157C0E525295523346D03DCF39
      6D314C2D2A250925C71C4B2D52527C12B711E81C1963D656081DE81CE71CE71C
      FF7FFF7FAE31B552AE35081DE71CE718841000007A223E433E3F3E3F3E3F3E43
      5E433E433E3F3E3F3E433E435E437A2200000000B615BC26B70D33055B1A5A16
      3A163A163A123A12B70DD80D3A0E54050000F8199C1673567B6F7B6B5B6B5B6B
      5A6B5A6B5A6B5A6B3A675A6B73569C1AD711CF39F85E9C6FCF39CE356B294A25
      FF7FFF7F103E11421863CF398C2D2A25292500001D373D3F3D3F3D3F3E3F5E43
      181A3E3F3D3F3D3F5E439A263D3F1D3B000000001D3B7B1A5B1AAF007C1E5B1A
      5B1A5A165A165B1AAE00D70D3A123A120000F8199C1A9456B6561246D03DAF39
      6D314C2D0A25E920A7184C2D9456BD1ED811F03DD65A9C6FCF39CE356C2D4A29
      FF7FFF7F113EF03D3963CF398C2D2A256B2DDB461D3B1D3B3D3BFC32950D9D6B
      34053E3F1D3BF819FB4A0000BB2E1D3BDB46583A9C229C229C22BC221205AE00
      960D960DD000D0007B1A5B1A5B1A5B1A583A191EBD1EB55EDF7BDF7BDF7BDF7B
      DF7BDF7BDF7BDF7BDF7BDF7BB55EDD22F8159C7394525A6B103ECF396C2D2A25
      FF7FFF7FAE35F03D5A6BEF398D314B295A6B3926FD361D37181A750900000000
      54053E3F5505993A00000000BB2AFD363926B6199C26BC269C229C22BD265B1A
      54095409F8159C227B1E7B1A7B1A5B1A9519391EDD22B65E1863B656744E744E
      324A1146F041D03DAE353246B65EDD26F915FF7F944E7B6F534AEF398D310921
      FF7FFF7F6C2D113EBD773142AE358C2DFF7FF819BA36BA360000000000000000
      F7199D6B0000000000000000DC2E3D4BF8197A2EBD26BD2ABD2ABC2ADD2ABD2A
      BC26BC26BC26BC269C229C229C229B22960D5A22FD2A945AFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F945AFD2A391AB556C618A5148510851009218C2D
      6C2D630C6B2D4A2521042104210421048C31D715DB3ABA360000000000000000
      F8113C5700000000000000001C433D47D715DB3E5E4B1D3BBD2ADD2AB60D391A
      BC2ABD2AD711D711BC269C229C229C22960D5A22FE2E5736F231F231F231F231
      F231F231F231F231F231F23157361E33391A7B6F53467C6FBD775A678D316C2D
      6B29630C6B2D2A25FF7FDF7B5A673A679452F7211D3F1D3FBB32BB3200000000
      F815BB267A221C4B00000000FC3A1D3FF721DB3E5E4F5F4F5E4F7F53172A172A
      5E475E479415D5195E473E4B3E4B3E4BBB3E7A221D331E3774567B6F5A6B5A6B
      5A6B5A6B5A6B5A6F7B6F74561E371E375A1EFF7F103EF75E3967D75A6C2D6B2D
      6B29630C6B2D2921BD733967B556D656FF7F9A3E5D4B1C3B1C3F1C3FBB329E67
      9A2EDC361C3FFC3A5D5B0000FC365D4B9A3E3D539F577F537F539F53F625F625
      7F537F53F62516267F4F5E4B5E4B5E4B3C537B261E371E3BB55A7B6F5B6B5B6B
      5B6B5B6BD75EF75E5A6BB55A1E3B1E3B5B1EFF7FF03DD75A3967F75A6C2D6B2D
      6B29630C6B2D2921BD733967B552D75AFF7F00009A365D4FFC32FC36FC36FC36
      BB32FC36FC36FC36FC32DB325D4F9A3600000000DF6B9F5B7F537F53DB3E3D4B
      7F537F53FC42FB3E7F4F5E4F5F4F5F4F00009B263E3B3E3FD75E9C739C6F9C6F
      9C6F9C6F142A7F3F324EF8623E3F3E3F7B22FF7F744E3A67744A8D312A212A25
      A614640CF75A534AEF398D316C2D6B29FF7F00009511FC423D47FC3ADC2EDC32
      DC32DC32DC32DC2EFC3A3D47FC429511000000001D47DF6B7F537F537F577F57
      7F537F537F537F537F537F537F53FC3E0000BC2A3E3F3E3FF7629D739C739C73
      9C739C73F3295F43524E18673E3F3E3F9B22FF7F1142CF394B2911424A252925
      FF7FFF7FD75A185F2A25C71CA5148410FF7F000000003836DB3A3C433D433D43
      3D433D433D433D433C43DB3A383600000000000000003E53DF6BBF5F7F579F57
      7F577F577F537F537F539F5B3D4F00000000BC2A5E3F5E431967DE77BD77BD77
      BD77BD77B025FB3A7352396B5E437E47BC2EFF7FFF7FFF7FE81CAE35E81CC618
      FF7FFF7F8C31AE3500008410FF7FFF7FFF7F000000000000540D792A3C433C43
      1C431C433C433C43792A540D0000000000000000000000003E4BDF6B9F5B9F57
      9F577F577F539F53BF633D4B000000000000DC2E7E475E43396BDE7BDE7BDE7B
      DE7BDE7B735274525A6B396B7F47DD2AFF7FFF7FFF7FFF7FCE359D73185FD75A
      FF7FFF7F3967BD77F75ACF39FF7FFF7FFF7F00000000000000000000583A9419
      540D540D9419583A00000000000000000000000000000000000000007E573E47
      3E473E473E477E5700000000000000000000BC22FD2EFD2EFC36FC36FD36FD36
      FD36FD36FD36FD36FC36BC2EDD2EFF7FFF7FFF7FFF7FFF7F0921EF396C2D6B29
      FF7FFF7F6B2DAE352A250000FF7FFF7FFF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000A5602170216C9C7B0000
      000000000000000000000000000000000000000000002F052F052F052F052F05
      2F052F052F052F052F052F010E050E0500000000000095115A1E591E591E591E
      591E591E591E591E391E5A1E950D000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000028716A7D627C216C
      000000000000000000000000000000000000000000004F090000807E0000007C
      0000800F000000003B063B06BE734F0900000000D7157E4FDC26DC26DC26DC26
      DC26DC26DC26DC265E577E57FD2AB71100000000000000000000000000000000
      0000000000000000000000000000000000008C69000000009C7B6A756278627C
      00000000000000000000000000000000000000000000B21500006076BE730070
      BE73600B9D6F9D6FFA05F9057C675009000000009A3E1C3F9C1E9C1E9C1E9C1E
      9C1E9C1E9C1E9C1A5D4F3D435B1ABA4600000000000000000000000000000000
      000000000000000000000000000000000000AB75A56C0000E57C827C8378637C
      00000000000000000000000000000000000000000000F32100006076DE77DE77
      DE77600BDE77DE731A061A067C675009000000000000FB52DC2A5B0E5B0E5B0E
      5B0E5B0E5B0E9B1AFC327B125D5F000000000000000000000000000000000000
      0000000000000000000000000000000000000871C37C6270A37CA378837C837C
      00000000000000000000000000000000000000000000F32100006076DE77DE77
      DE77600BDE77DE771A061A067C67500900000000000000003D3F5B0E3A0E3A0E
      3A0E3A0E3A0ADC267B123A0A000000000000216C247D257D247D047DE37CE37C
      C37CC37CA27C827C627C627C417C217C00645A7B4F7EC478A378A27C00500154
      6274B576000000000000000000000000000000000000F32100006076DE77DE77
      DE77600BDF7BDF7B1B061A067C6750090000000000000000BA42DB2E1A063A0A
      3A0A3A0A5A0E3D43190AFB4E0000000000006370257D257D247D047DE47CE47C
      C37CC37CA27CA27C827C627C417C417C006C0000846C0E7ACB7DCC7D0050015C
      426C6274000000000000000000000000000000000000F3210000DE77DE77DE77
      DE77600BFF7BDF7B1B06FA057C67500900000000000000000000D8151A021A06
      1A061A067B16FC2A392A000000000000000029794F7EEB7D467D257D057D047D
      047D047DE37CC37CC37CA27C827C827C0074000000000000000000006A794975
      0168216862749C7F0000000000000000000000000000F3250000DE77DE77DE7B
      DF7B800BFF7FDF7BFA05F9055C637009000000000000000000000000BF6B7F5B
      7E577E57BF6B5E5300000000000000000000297D4E7E4F7E4E7E2D7EA97D887D
      467D047DE37CC37CC37CC27CA27C827C007800000000000000000000B57A6A79
      0068216C427462740000000000000000000000000000142E0000FF7BFF77FF7B
      FF7FFF7BFF7FDE77F905D8053B5B70090000000000000000000000005A22DF73
      7E577E579F631D43000000000000000000004A7DF37EF47EF47ED37ED37ED37E
      D27EB27EB27EB27E917E717E717E717E2A7D0000000000000000000000000000
      6A796A7922742278837C837C6278226C000000000000563600001B061B061B06
      1B061B061A06F905D805B801D84A710D00000000000000000000000000001912
      7E5B7E5F1912000000000000000000000000E87C6B7D6B7D6B7D6B7D6B7D6B7D
      6B7D6B7D6B7D6B7D6B7D6B7D4B7D4B7DE87C0000000000000000000000000000
      B57A6A7901782278A37883788278637C187B00000000773A00001B061B061B06
      1B061B06FA05F905D805B701B846911100000000000000000000000000001912
      7E5F7E5F19120000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000AA7DC378A378A378E7740E7E42740000000097420000FE7FFF7F0000
      DE73BE735C63973EDE7BBE73773AB21500000000000000000000000000003A16
      9E639E633A160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000AA7DC378C378C37C000029794278000000009742000000000000FF7B
      BD739D6F1A57973EBE733B5FF321000000000000000000000000000000005B16
      9E639E635B160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000707EC378A3789C7F000000008D7900000000B7460000FF7FDF77BE73
      7C6B5B5FD94655327636F3210000000000000000000000000000000000007B16
      9F679F677B1A0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000002879EC7DE478837800000000000000000000B74600000000DF7BBE73
      5C673B5BB842F321F321000000000000000000000000000000000000FD36DC2A
      BF6FBF6FDC2EFD36000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C7F4A79CC7D08790000000000000000B846B742B742B746B846
      973E973E342ED31D00000000000000000000000000000000000000001D3FBC1E
      BC1EBC1EBC1E1D3F00000000000000000000000000000000435CE85800000000
      0000000000000000085901580000000000000000000000000000000000546358
      0000000000000000000000000000000000000000000000000000000000000000
      0000B90900000000000000000000000000000000000000000000FF7BD7193401
      9701350119261C530000000000000000DF7B0000000000008B7D21784274015C
      00000000015C42744278427C00000000000000000000000064600160227C227C
      00589C7F0000000000000000000000000000000000000000000000000000DF73
      1B021B02000000000000000000000000000000000000BE7397015B025C025B02
      7C067C069C12BD161A12D9110000BB365B160000000000000F7E41786278627C
      01580158627C62786278627C0000000000000000000000000164427C427C427C
      216C005C0000000000000000000000000000000000000000000000005E5B1B0E
      3C021B0200000000000000000000000000000000BE7334017C025C025B025C02
      7C0A9C0EBD16BD1AFE229C1E1A1ABC227B1A0000000000002971C57C83788378
      837883788378837883784270000000000000000064640168627C627C627C627C
      627C627C01649C7F0000000000000000000000000000000000005C22FB011C02
      5C065C023C06DA059B420000000000000000000097017C025B025C029C0A3B0A
      191ABC327F4F3E371E2B1E2F3E375E3B9C1E000000000000E76C067D83788378
      8378837883788378837C426C00000000000000002168627C627C627C627C627C
      627C627C22700164000000000000000000000000000000001C12DD2A7C0E1B06
      5C067C0A7D0A7D0698059719000000000000FF7B5B025C025C027C069709B711
      9E6B1C4FD90DFD3A1E2F3E335E3B5F3BBC1E0000000000004368697DA378A378
      A378A378A378A378A37C42680000000000000168827C837C837C837C837C837C
      837C837C837C837C01689C7F000000000000000000000000000000001A12BF53
      5C0A1E2F3E2B9D0EBD12DE127A3E00000000D7195C027C069D0EB80900000000
      00000000BC2A7F4B3E375E3B7F437F43DD220000000000004879E47CA378A378
      C378C378C378C378C378A378000000000000646C0D7E827CA37CA37CA37CA37C
      A37CA37CA37CA37C42700168000000000000000000000000000000001D57B909
      1E2BBD1A1A163E37BD16DD16F500DF7B000055011A067C0A9C12B81100000000
      DF73F9117E53DF6BBF5B9F4F7F437F47DD2600008C71ED79ED7DED7D0D7E0E7E
      AB7D687D0579A378C378C378A378646800000000006C8474A37CC37CC37CC37C
      C37CC37CC37CC37CC37CC37C016C9C7F00000000000000000000000000000000
      78059F4F00005D631E23FE22FE1E551100005505000000000000000000000000
      00000000000000007E5FFD3E1D337E4F1E330000ED790D7E0D7E0D7E0D7E0D7E
      0D7E0D7E0E7E0E7EAB7DAB7DCB7D8A79000000009C7F016C2E7EC37CC37CC37C
      C37CC37CC37CC37CC37CC37C8474017000000000000000000000000000000000
      0000990900000000DE1E1E273F2716010000D811DC32391A7A323D5700000000
      00000000000000000000000000000000FE26EF79927E507E0D7E0D7E0D7E0D7E
      0E7E0E7E0E7E0D7E0D7E0D7E4F7E507ECD790000000000000170A574C37CC37C
      C37CC37C057D677DAD79317EEC7DEC7D9C7F0000FE1E5E335E33FE2200000000
      00000000000000007C165F335F337705000077015C027C061D2F7E4BBF637E4F
      1A12DF77000000009C1E7F439F475F3BFD22CE75107A527AF67E167F927E0D7E
      2E7E2E7E2E7E0E7EF57ED47E527A107ACF750000000000009C7F0174167FA97D
      CA7DEC7D0D7EA674327A2174F47EEB7DB67E0000FE1A5F335F333E2F00000000
      00000000000000001E2B5F337F371601000097017C067C0EBC16BD1A5E3F9B26
      0000000000000000BC1E9F4B9F4BBF5B1E3300000000000000000000AD79377F
      2E7E2E7E4F7E6B79000000000000000000000000000000000000000000746B79
      EC7DEC7D287D327A00000000B37E0C7E097900005E475E377F3B7F3B3B0EBF6B
      000000009E6B57059F3F7F3B7C1A3936000098057C0A9C0EBD1ADD1AFD3A1A12
      3D53BF6F7C1E9C1E9F479F47BF57DF6B000000000000000000000000747AD47E
      2E7E2E7E0E7E957E00000000000000000000000000000000000000009C7F0074
      167F0C7E8B7D22780000BD7F707E0C7E85780000FF7BDD1A9F3F9F3F7F373B0E
      FD46DC4699057F379F3F9F3FF500DF7B0000B8057C0E9C12BD1ADD1E3E379F57
      1D3BBC263E337F439F479F47DF6F3E370000000000000000000000000000317E
      707E4F7E327E0000000000000000000000000000000000000000000000000000
      00786C7D2D7E2D7EED7D0D7E2D7E2D7E22780000000000005E43BF579F479F47
      BF47BF479F479F47DF53DC2A000000000000B8093A0EF815BC22FD221E2B1E2F
      3E375E3B7F3F7F3F9F53DF6FDD1EFF770000000000000000000000000000FF7F
      167F6F7EFF7F0000000000000000000000000000000000000000000000000000
      9C7F0078577FD37E4E7E2D7E2D7E4E7E64780000000000009D1E1E33BF539F47
      9F479F47BF47BF4B7B1E560D000000000000D8099B360000F9119B221E2F1E2F
      3E335E375F3F9F4FDF6B3E37FF77000000000000000000000000000000000000
      8C798D7D00000000000000000000000000000000000000000000000000000000
      000000009C7FD67E097D857C0278647C000000000000000000000000FD425B22
      7B1A5B1AF9199B3E00000000000000000000DF7700000000000000005E57BC32
      7C16FD2EBD1AFE3200000000000000000000000000000000000000000000BA4E
      3701370100000000000000000000000000000000000000000000000071157211
      2F052F0550052E0500000000000000000000000000000000000000003D4BDC2E
      BC26BC26DC2E3D4B000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000B9193F1F
      FB01FB0199015C630000000000000000000000000000000000000000FA36FB26
      370E370E370ED509000000000000000000000000000000009B263E3F5E475E47
      5E475E475E475E473E3F9B2600000000000000000000000000000000C474477D
      C65C00000000000000000000000000000000000000000000000000003B223F23
      1D021D02BA01DA520000000000000000000000000000000000000000FA36FB26
      570E570E370EF5090000000000000000000000000000FC425E475E475E435E43
      5E435E435E435E435E475E47FC420000000000000000000000000000E67C4979
      C574946E0000000000000000000000000000000000000000000000001D5B9D22
      FE16BE0E570D00000000000000000000000000000000000000000000FB361B27
      580A580E580EF5090000000000000000000000007A223E433E3F3E433E3B391A
      76017601391A3E3B3E433E3F3E437A2200000000000000000000296563788478
      8478427400000000000000000000000000000000000000000000000000003D5F
      7C1EFB110000000000000000000000000000000000000000000000001B371B27
      780E780A580E150A0000000000000000000000001D373E3F3E3F3E4376010E35
      627C627C0E3576013E433E3F3E3F1D370000000000000000DE7F016C22782278
      427842780000000000000000000000000000000000000000000000000000DB0D
      DB05BB059915000000000000000000000000000000000000000000001B373B27
      780A780A980E160A00000000000000000000FC461D3B1D3B1D37B705217C2278
      227822782278217CB7051D371D3B1D3BFC46000000000000016C217821782178
      2178217842640000000000000000000000000000000000000000000000009D22
      BF0EBF0E1B1E000000000000000000000000000000000000000000003B373B27
      980A980A980E360A000000000000000000005926FD36FD365A1A0F3942784278
      42784278427842780F395A1AFD36FD3659260000000000002178217842788578
      217821782178B576000000000000000000000000000000000000000000003C1A
      DF12DE127E0EBC4A00000000000000000000000000000000000000005B375C27
      B90AB90AB90E560A00000000000000000000181A3D4BFD361A0E617C63786378
      6378637863786378617C1A0EFD363D4BF819000000004B752879A5782A717B7B
      297984784278427800000000000000000000000000000000000000000000DD4A
      3F2BFF16FF16DB0500000000000000000000000000000000000000005C377C27
      D90AD90AD90A570A00000000000000000000F7153D473D473A0E617C83788378
      8378837883788378617C3A0E3D473D47F8150000B67A6A79EE7DB57E00000000
      6B71497921784178F77A00000000000000000000000000000000000000000000
      3E43DF6F3F2B3F23BA09000000000000000000000000572616261626DE5BBD3B
      D906F90AF90A770A2F052F052F0500000000F8211D3F1D3FFC3A7656897D477D
      05790579477D897D7656FC3A1D3F1D3FF8210000AB7D0E7EAE75000000000000
      00000000F57E0E7ECB7D8C750000000000000000000000000000000000000000
      7E5F7F577F3F7F435F3B1D4B00000000000000000000BE6FFD67DD3FBC33BC33
      9C275B17FA06FA0A1A0B3B0BF952000000009A3E5D4B1D3B1D3BFD32EC7DEC7D
      EC7DEC7DEC7DEC7DFD321D3B1D3B5D4B9A3ECE79B37ED47E0000000000000000
      00000000AD75D47ECB7DCC7D00000000000000000000000000009F5FFF7B0000
      0000DF739F439F477F47FE2E0000000000000000000000007D633B3BBC2FBC2B
      BC2BBC2BBC2BBC2BD92A7D670000000000000000BA365E4FFC32FC361E37B85A
      2D7E2D7EB85A1E37FC36FC325E4FBA3600009D7FDE7F00000000000000000000
      0000000000000000F57E507EEC79537A00000000000000007F539F5B5F373E3F
      BF6BFE329F4B9F4B9F471E2F00000000000000000000000000009D63FE63BC2F
      BC2BBB2BBB2BBC2B3B57000000000000000000009511FC423D47FC3ADC321D37
      3E3B3E3B1D37DC32FC3A3D47FC42951100000000000000000000000000000000
      0000000000000000AE79167F0D7ECC7900000000000000007F43DF679F53BF53
      BF53BF539F4F9F4FBF531E3F000000000000000000000000000000009D635C3B
      BB2FBB279C2B1B4700000000000000000000000000005836DB3A3D433D433D43
      3D473D473D433D433D43DB3A5836000000000000000000000000000000000000
      000000000000000000000000307E587F0F7A000000000000BF63DF73BF5FBF53
      9F539F53BF4FBF4F3E377E5F0000000000000000000000000000000000007D5B
      FE63DB2F1B4B000000000000000000000000000000000000740D7A2A3D433D43
      1D431D433D433D437A2A740D0000000000000000000000000000000000000000
      000000000000000000000000FF7F117A8C7900000000000000000000BF5F9F53
      9F537F4F7F4F7F53000000000000000000000000000000000000000000000000
      3C4BDA32000000000000000000000000000000000000000000000000783A9519
      740D740D9519783A000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001D47BC2A
      9C229C22BC2A1D4700000000000000000000000000000000000000001D47BC2A
      9C1E9C1EBC2A1D470000000000000000000000000D112E112E112E112E112E11
      2E112E112E112E112E112E112E112E110000000000000000000000000000D67E
      8374637000000000000000000000000000000000000000007B1E3E3B5F433E3F
      3E3F3E3F3E3F3E3F1D375B1E0000000000000000000000007B1E1D373E3F3E3F
      3E3F3E3F3E3F3E3F1D377B1E0000000000002D11571A571A571A571A36161616
      B2110D11571A571A571A571A571A571A2E1100000000000000000000107EC378
      C378C378EF6900000000000000000000000000000000DC3E5E3FD711D70D3E3F
      3E3F3E3F3E3F3E3F3E3F3E3FDC3E0000000000000000DC3E3E3F3E3F3E3B3E3B
      3E3B3E3B3E3B3E3B3E3F3E3FDC3E000000002E11571A571A571A561A15161612
      88080D11571A571A571A571A571A571A4F1100000000000000000000107E8378
      82788278106E0000000000000000000000000000391A3E3BFD3A00000000DF77
      FD363E3B950D5405BB2A3E3B1E3B391A000000003A1A1E3B1E371E371E371E37
      1E37D7153F3F7B26D000D0003E3B3A1A00004F11571A571A561636164F0D8804
      DE77ED08571A571A571A771A771A771A4F11000000000000000000000000AD79
      4278217400000000000000000000000000000000DC2E1E3B7E57000000000000
      DC2EBC2E9E6FFF7B12017A26FD36DC2E00000000DD2E1D37FD36FD361E373E3B
      F100993E3E3BF8150000DA461E3BDD2E00004F11571A571A571657168804FF7F
      BD730D09981A981A981A981A981A981A4F110000000000000000000000000000
      000000000000000000000000000000000000DB42DD32DD32BC2AD70D1C4B0000
      BC2AB6190000000000003301DD32DD32DB42DB42FD32DD32FD32DC2E74099D6F
      000000001E33F8150000DA46FD32FD32DB426F11771A771A4F0D2F1500000000
      00009D73BE73BE77BE77BE7777424F0D7011000000000000000000000000CE79
      2278227C00000000000000000000000000001822BC2EDC2EDD2EDD2ED70D0000
      9B2ADD2EDB46000000003301DC2EBC2E18221822DD2EDD2E191A540500000000
      00000000FD2EF8150000DA46DD2EDD2E18224F11981A981A4F19000000000000
      000000000000000000000000F9524F0D7011000000000000000000000000A578
      227822780000000000000000000000000000D7151D43DC2EBC2ABC2AD8110000
      7B26BC2ABD2ABC2A00003301DC2E1D43D615D7159A3279320000000000000000
      00000000DD2A19160000FB46DD2E1D43B711B83EB221911D0000000000000000
      000000000000000000000000D94ED21DB83E00000000000000000000397F4278
      427842787B77000000000000000000000000B611FC3EFC3E9C269B26D8110000
      7B22BC269C26BC2A00003301FC3EFC3EB611B6119B329A360000000000000000
      00000000BC2619160000FB4A1D3FFD3EB611B83EB83E353A0000000000000000
      0000000000000000000000005B677636B83E00000000000000000000317E4278
      42784278526A000000000000000000000000D61DDC36DC36DC3ADC3A9B2A0000
      B70DBC26BC2ADC360000B415DC36DC36D61DD61DFC36FC36BB327A2600000000
      00000000BC2A9B2600005D5BFC36FC36D61DB83E5B3F5B3F142EFF7F00000000
      0000000000000000000000005B639732D83E0000000000000000000029798278
      627862781066000000000000000000000000993E1D43DC32DC36DC369B2EFF7B
      3C5BB60D7A2EBB320000B415DC321D43993E793E1D43DC32DC36DC369B2E7E63
      00000000DC32BB2E00005D5BDC321D43793EB83E7B437B3FD936143200000000
      0000000000000000000000007C67B736D83E000000000000000000006C798278
      82788278C6640000000000000000000000000000792E3D47BB2EBB2EBB2E3826
      00000000000000000000B4153D47792E00000000792E3D47BB2ABC2EBC2EBC2E
      BC2E3D53BB2ABB2E00007E633D47792E0000D93E7C437C437B3F7B3F142A9D6F
      BE77762A7B3B7B3B9B3F9B3F9B3F9B3FF93E000000000000000000008C7D2E7E
      EC7D467963600000000000000000000000000000540DDB3AFC3EDC329B2A9B2E
      392679321C579E6F0000B515DB3A540D00000000540DDB361C3FDC32BB26BB2A
      BB26BC2EBB26BB2ABC2EDC32DB36540D0000D93E9B439B439B437B3F1937142A
      DE7B762E7B3F7B3F9B439B439B439B43F93E00000000000000000000AC7D2E7E
      2E7E4F7EAC71000000000000000000000000000000003732BA321C3BFC3AFC3A
      FC3EFC3AFC3A1C3BDB369A32373200000000000000003732BB321C3BFC3AFC3A
      1C3B1C3BFC3AFC3A1C3BBB32373200000000F9429B439B439B439B439B3F7A3B
      7732D9369B3F9B439B439B439B439B431A3F00000000000000000000CD7D707E
      6F7E6F7EAB7100000000000000000000000000000000000053093826FC3AFC3A
      FC3AFC3AFC3AFC3A5826530900000000000000000000000033093826FC3AFC3A
      FC3AFC3AFC3AFC3A38263309000000000000F93E9B439B439B439B439B3F9B3F
      7B3BFA3E9B439B439B439B439B439B43FA4200000000000000000000CD7D907E
      907E907EAB71000000000000000000000000000000000000000000003732320D
      32093209320D37320000000000000000000000000000000000000000573A7315
      320932097315573A0000000000000000000000001A431A431A431A433A433A43
      3A433A433A433A433A433A433A431A430000000000000000000000000000957E
      ED79CD7500000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000760D
      770D76095509000000000000000000000000000000000000000000003D47DD2A
      BC22BC22DD2A3D4700000000000000000000000000000000000000003E47DD2A
      DD22DD22DD2A3E47000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001A16D819DF7BB711
      9C167C12970DDF7B9615D80D0000000000000000000000009B1E3E3B5E435E43
      5E435E435E435E433E3B9B1E0000000000000000000000009C1E3E3B5F435F43
      5F435F435F435F433E3B9C1E00000000000000000000000000009C7BE7642160
      01642168216C8478BE730000000000000000000000007A36DD229C1EF9117B1A
      9C169C163B12D80D5B0E7C0E38320000000000000000FC3E5E435E435E435E43
      5E435E435E435E435E435E43FC3E0000000000000000FD3E5F435F435E435E43
      5E435E435E435F435F435F43FD3E0000000000009C7B6458005400584264836C
      8370A474A374207C1305330959360000000000007B1E1D2BDD26DD26DD22BC1A
      BC1ABC1ABC1A9C1A9C167C129C12F90D000000005A1A3E3F3E3F5E3F1305B70D
      5E3F3E3F3E3F3E3F3E3F3E3F3E3F5A1A000000007B1E5E3F3E3F3E3F3E3F3E3F
      3E3F5E3F9B265505FD325E3F5E3F7B1E00000000004800502160A470667D667D
      667D667D667D4A493B12F80D7511F71D00000000191EDD26FD2AFD26FD26FD26
      FD26DD22BC1ABC1A9C1A9C167B12B719000000001D333E3B3E3B5E3FBE6FFB4A
      391A3E3B3E3B3E3B3E3B3E3B3E3B1D33000000001D333E3B3E3B3E3B3E3B3E3B
      5F3FFD327609DF77FD323E3B3E3B1D330000D34EA458057DE478E478E478E478
      E478E478E9349D167B1A7B1A7B163A167E630000DF7B7B1E1D2F1D2F1D2FBC22
      7B2EBB3E7B12BD1EBD1EBD1EF911DF7B0000DC421D371D371D373E379E6F0000
      0000BE73B70DBC2A1D371D371D371D37DC42DC421E371E371E371E373E375A1E
      DB42000000000000FD321E371E371E37DC42640D880E6B21C37CC37CC378C378
      C378C37CF8059C1E7B1E7B1E7B1E7B1A7A261A165B1AFD2A1D331D33DC267B1A
      00000000760D7B12DD1EDD1E7B1AD81197113922FD32FD32FD321D33BE6F0000
      000000007D637505FD32FD32FD32FD3239223A22FD32FD32FE321E3397093926
      00000000000000001E33FD32FD32FD323A225457C626C626E52A89126460627C
      627C6264DD26BC26BC26BC22BC22BC229C223D4B9E5F7E4F5E471D2FDD2A0000
      000000000000B619BC1EFD26DD22BC1ED80DF8153E47FD32DD2AFD2EBE730000
      000000000000000000007A2AFD323E47D811F9153E471D33F8153C5300000000
      0000000000000000FD2ADD2AFD323E47F915B86BC62AC62AC62AC62A8816091D
      217CCB0CDC2ADC2ABC2ABC2ABC26BC26BC263D4B9E5F9E5F9E577E535E470000
      000000000000B61DDC2A1D2F3D3B3D3BFC42D7113D433D43BC26DC26BE730000
      00000000000000000000BB3A3D433D43D711D8113D433E4719165D5F00000000
      0000000000000000FE2ADD263D433D43D811B86BE52EE62EE62EE62EE62EE62E
      670D1F37FD32FD32FD2EFD2EFD2EDD2EDD2E3D475D4B9E5B9F5F9F5F5D479E5F
      000000003C539A329E579E575E4F1C43FC3ED71D1D3B1D3B1D3F1D3FDE770000
      00000000BE6F9B2A1D3B1D3F1D3B1D3BD71DF81D1D3B1D3B1D3F1D3F9B26FC3E
      0000000000000000DC321D3F1D3B1D3BF81DB86BE52EE62EE62EE62EE62EE62E
      B0111E371D33FD32FD32FD32FD32FD321D3B000000005D4F9F5F9F5F9E5B3D47
      9E679E63BB365E539E579E573D47FF7B00009A3E5D4B1D371D3B1D3BDF770000
      0000DF7BDC32FC361D3B1D3B1D375D4B9A3E9A3E5E4B1D371D3B1D3B1D3BFD36
      7D5F000000000000BC2E1D3B1D375E4B9A3E0000966705370537053705370537
      1F3B3E3B3E3B3E3B1E3B1E3B1E371D37000000007E4FBF5FBF63BF63BF63BF63
      BF639E5B9E5B9E5B9E5B9E5B7E573D4B000000009A2E5E4FDC2EFC2EDF7B9E67
      FC32FC2EFC32FC32FC2EDC2E5E4F9A2E00000000BB325E4FFD32FD32FD32FD32
      FD32FD323D47FF7BDC2EFD325E4FBB3200000000B76BB76B0437053B053B253B
      5F433E3F3E3F3E3F3E3F3E3B3E3B7E57000000007E57BF67BF63BF63BF63BF63
      BF63BF639E5FBE5F9E5B9E5B9E5B5D4F000000007509FC3E3D47FC321D3FFD32
      DC2ADC2EDC2ADC2AFC363D47FC3E750900000000960DFC3E3D47FD36DD2ADD2E
      FD2EFD2EFD2E1D371D373D47FC3E960D0000000000000000B76FB86F6B57A736
      5E3F3E3F3E3F3E3F9F5FBF6F000000000000000000009E5BBF67BF637E539E5F
      BF63BF639E5B5E4F9E5BBF5F7E5B00000000000000003832DB363D3F3D3F3D3F
      3D433D433D3F3D3F3D3FDB36383200000000000000003832DC363D3F3D3F3D3F
      3D433D433D3F3D3F3D3FDC363832000000000000000000000000FD7BD9737967
      DF6FDF6FDF6FDF73FF7B00000000000000000000000000009E5B7E5300007E4F
      BF63BF635D4F00005D4F7E5300000000000000000000000054097A263D3F1D3F
      1D3F1D3F1D3F3D3F7A26540900000000000000000000000055097A263D3F3D3F
      1D3F1D3F3D3F3D3F7A2655090000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E4F
      7E537E535E4F00000000000000000000000000000000000000000000583A7415
      540954097415583A000000000000000000000000000000000000000059369515
      550955099515593600000000000000000000000000000000000000003E43DD22
      BD1ABD1ADD223E43000000000000000000000000000000000000000000000000
      0859004C005800580058005884544B61FF7F0000FF7BDA4AF625540D540D540D
      740D540D540D74113832DA4A000000000000000000000000000000001D43BC22
      9C169C16BC221D43000000000000000000000000000000009C165E377F3F7F3F
      7E3F7E3F7F3F7F3F5E379C16000000000000000000000000000000000000A560
      8278A378A378A378A378A378A378A378216800003D377B127B125B125B125B12
      5B165B167B167B167B167B165B16750D00000000000000007C165E337E3F7E3F
      5E3B5E3B7E3F7E3F5E337C1600000000000000000000FD3A7E3F7E3F7E3F7E3F
      7E3F7E3F7E3F7E3F7E3F7E3FFD3A00000000000000000000000000000000AE6D
      C378E478E478E478E478E478E478E478216800005D435B127B167B167B167B16
      7B167B167B167B167B1A7B1A9B1A740D000000000000DC367E3B5E3B5E3B5E3B
      5E3B7F3F9F3F7F3B9F3F7F3FDC360000000000003B125E37DD261401DB42FB46
      7F3B7F3BFB46DB421401DD265E373B1200000000D24AE925C81D640D840D2315
      6F7E25792679CC7E6E7F877946796679F0750000DB36FC369B1E9B1E9B1E9B1E
      9B1E9B1E9B229B1E9B1E9B22391A382E000000003B0E5E373E373E375E373E2F
      2C1D9356DE7FFF7F0000185F5E373B12000000001D2B5E37DD22D81500000000
      7F3B7F3B00000000D815DD225E371D2B00000A268726C72A283728374837682F
      727E4F7EE87D8D7F6C7F4C7F87798879FF7F0000B6117E57BC22BC22BC22BC22
      BC22BC22BC22BC22BC22BC26B6115D6300000000FD2A3E333E333E33FE261109
      7B6F9D73BE7BDE7B0000000056011E2F0000BC3A3E2F1E2FBC1EF91900000000
      5E335E3300000000F919BC1E1E2F3E2FBC3A2926073708370837083708372837
      A60C8508C371AD76E375025D852CE82C00000000BE73750D5E53DC26DC2ADC2A
      DC2ADC2ADC2ADC2AFC2A9B26BE7300000000BC3A1D2B1D2B1D2BFE22B45A7B6F
      00007D677B6F00000000DE771E2B1E2FBC3A1A1AFD2A1D2BBC1E191E00000000
      3E2F3E2F00000000191ABC1E1D2BFD2A1A1A4C2E273B273B273B273B273B273B
      8610A614AE72A67EA67EA67EA610C6140000000000003C5B1C437E5BDC2ADC2E
      DC2EDC2EDC2EFC2E7A22B611000000000000F919FD26FD2AFE26950D9C6F9C73
      7A2AB80593567B6F7D5FD400FD2AFD26F919B9095E431D2B9C1A391E00000000
      FE26FE2600000000191A7B161D2B5E43B809000093634A4B263F263F273F273F
      C63A650C4C7F097FE97E097F860C186300000000000000000000D7191D37FD32
      FD32FD32FD32960D0000000000000000000098093E43FD2A4F197B6FDE7F1C4B
      FD22DD22DD1E9805DD1EDD22FD2A3E43980997095D3F5D3F9C165A1E00000000
      FD22FD2200000000391A5B125D3F5D3F980900008A2E9367463F0547A546C546
      C63A650C927F717F4D7F4C7F860C524A0000000000000000BE73D7111D371D37
      1D371D371D37DC2E0000000000000000000077093D3B3D3F314ABD77DE7B9801
      BC1EBC1EBC1EDD1EBC1EBC1E3D3F3D3B7709B7151D371D371D331D4700000000
      BC1ADD1E00000000FC3EFC2E1D371D37B715000000000000307FA67E867EA67E
      E348A710D47FB47FAA396508A614534A000000000000000038269E673D3F3D3B
      3D3B3D3B3D3B3E3FBB42000000000000000096151D331D2FFF7FDF7B185F9B26
      BC1ABC1ADC22FD2E1D371D371D331D3396157A365E471D33FD2E3D4700000000
      1D333D37000000003D47FC2A1D335E477A360000000000000B7FC77EC77EC77E
      6772C814292973778610C718C614524A0000000000000000792EDF6F7E577E4F
      3E433D3F3D3F3E3F3826000000000000000059365D47FD2A0000FF7F7B6F185F
      BC2A1D33FD32FD32FD2EFD2EFD2E5D47593600009B267E4BFD2A5D4B00000000
      DD26FD2A000000005D4BDD267E4B9B26000000000000797B707F507F2B7F097F
      4A7F6A3129212921092109218C31000000000000000000007A2EDF737E577E57
      7E577E577E579E5B3926000000000000000000007A267E4700000000BD777B6F
      BC26DC26DC26DC26DC26DC267E4B7A260000000035011D373D3F3D3FBE6BBF6F
      DC22DC22BF6FBE6B3D3F3D3F1D3735010000000000005A6B927FB37F927F727F
      D37F6B29AE35AE35AE35AE3500000000000000000000000059269E679E579E57
      9E579E579E579E5B9A3A000000000000000000001401FC325A6F0000BD775D57
      DC22DC22DC22DC22FC2A3D3FFC321401000000000000F82DDC2E5D3B3D3B5D3B
      5D3F5D3F5D3B3D3B5D3BDC2EF82D00000000000000005A6BE81CC718F67FF67F
      860CC61400000000000000000000000000000000000000009E6B7A269F5F9F5B
      9F5B9F5B9F5B9F5BFF7B000000000000000000000000F729DC2AFC32FD2E3D3B
      3D3B3D3B3D3B3D3B3D3BDC2AF72900000000000000000000F3005A1E3D373D3B
      3D373D373D3B3D375A1EF30000000000000000000000DE7B081DE81CA714A710
      E7184A25000000000000000000000000000000000000000000005A26DF77BF67
      9F5B9F5BBF63BA2E00000000000000000000000000000000D2005A1A3D373D37
      1D371D371D373D375A1AD2000000000000000000000000000000000018323411
      F300F3003411183200000000000000000000000000000000CF3909214B29F03D
      955200000000000000000000000000000000000000000000000000001C4F591E
      7A2239169E670000000000000000000000000000000000000000000017363311
      D200D200331117360000000000000000000000000000000000000000AD618450
      005000508450AD610000000000000000000000005309540DF204F104F104F104
      F104F104F104F104F104F104FF7FFF7FFF7F00000000000000000000D93A3616
      150615063616D93A000000000000000000000000A659C659C659C659C659C55D
      CE00D31DB219B219B219D319D31DD21DEE000000000000000054227042784278
      42784278427842782270005400000000000038265309540DBD229C1EB80DBD1A
      7B167B165A125A123A0E5B0EFF7FFF7FFF7F000000000000D405790E990E990E
      990E990E990E990E790ED405000000000000AA7E877E877E877E877EA77EA77E
      940DFF7FDE77DE77DE77BE77BE73BD73D21D000000006B614278427842784278
      4278427842784278427842786B610000000038265309540DDC26BC228040E820
      B31D7B165A125A125A0E5A0EFF7FFF7FFF7F00000000772EBA0E990EB90E9A0E
      9A0E990E990E990EBA12BA0E772E00000000CA7EA87EA87EA87EA87EC87EC97E
      B415FF7FDE77DE77DE77DE77BE77DE77F3210000015C63786378637863786378
      6378637863786378637863786378015C000038265309540DDD2ABC260D19B77F
      917F087F720D7B165A167B12FF7FFF7FFF7F00009305BA0E990EBA0E31010000
      32015816990E990E990E990EBA0E93050000AA7EA97EC97EC97EC97EC97EC97E
      B415FF7FDE77DE77DE77DE77DF7BDF7BF3250000627483788378837883788378
      83788378837883788378837883786274000038265309540DFD2ABC26B615BB7F
      6A7F84722276720D7B167B16FF7FFF7FFF7F0000780EB90EBA0E570A0000DE7F
      7D5F52019A0E990E990EB90EBA0E780E0000AA7EC97EC97EC97EC97EC97EEA7E
      B415FF7BDE77DE77DE77DF7BDF7BDE77F425AE6DA378A378A378A378A378A378
      A378A378A378A378A378A378A378A378AE6D382A5409540D1D2FDC2ADC2A7B16
      C17F417F65720372720DBD1AFF7FFF7FFF7F773ADA0EDA0E3201FE7FDE7BDE7B
      FF7F00005201570AD90ED90ED90EDA0E773AAA7EC97EEA7EEA7EEA7EEA7E0B7F
      F51D0000FF7BFF7BFF7FFF7FBD739C6BF321A668A4784168C664C664C664C664
      C664C664C664C664C664C6644168A4788564382A540D740D1D33DC2EDC2ADC26
      E87FC17F217F6572E171720DFF7FFF7FFF7F9215B90A570AFE7FBD77FF7FFE7F
      000000005C575201FA0AFA0ADA0EB90A9215AA7EE97EEA7EEA7EEA7EEA7E0A7F
      F5210000FF7BFF7FFF7FDF7B9D6F7C67F321E86CE478206C0000000000000000
      000000000000000000000000206CE4780164592A740D750D3E37FD32FC2EFC2E
      DD267B16C27F417F65722372DC7FFF7FFF7F50057C373201BC7BFE7FFB0EDA0E
      11010000000000005201370A3B1B7C373005AA7EEA7EEB7EEB7EEB7E0A7F0B7F
      36260000FF7FFF7FBE739D6FB846773EF425E870EC7983740000000000000000
      0000000000000000000000002070E4780060592E750D95113E3BFD32FD32FC2E
      FC2EDD26E97FC27F217F6572036EDC7FFF7F0F017B337C337C771101DA0EBA0E
      FA0A1101000000005C5752019C377B330F01AA7EEA7E0B7F0B7F0B7F0B7F0B7F
      372A0000FF7FFE7B9D6F5C630000DE7700004B75EC796979F77EF77E947E527E
      727E727E727E727E527E727EE678EB7D4B71792E951196115E3F1D37FD36FD32
      FD32FC2EDD2A190EC27F417F06563C63BD7F50117C2F9C339B339B337B2F7B37
      9B2F9B3310010000FE7B000032019C2F5011AA7E0A7F0C7F6C7F8D7F8D7F8C7F
      572E0000FF7FBE773B5BF94E142600000000327A0D7EEC79CB79CB79CB79EB79
      6879677967796779A979CB79EC790D7E327A792E9611B6155E3F1D3B1D37FD36
      FD32FD32FD2EDD2AEA7FE17FBF739D6BA3783536BD479C2F9B2F9B2F9B2F9B2F
      9B2F9B2F9B331101DE7BDE7B7205DD4B3536AA7E0A7F2C7FC872055626622562
      17221A4FD942993A372A162200000000000000004A79917E0C7A0C7A0C7A0C7A
      0C7A0C7A0C7A0C7A0C7A0C7AB17E096500007A32B611D7155E433D3B1D3B1D3B
      1D371D37FD32FD32DD2A190EE66D847DED790000D82ADD579B2B9B2F9B2F9B2F
      9B2F9B2F9B2F9B2F1101B712DD57D82A0000AA7EE77E2A7F363EF85ED756D756
      D756D756123A8449C97EA97E0000000000000000C8742F7E0C7A0D7A0D7A0D7A
      0D7A0D7A0D7A0D7A0D7A0C7AED71C76800007A32B611D7157E433D3F3D3B3D3B
      1D3B1D37FD36FD36FD32FD2E0A7F477EFF7F0000CC009C3FBC4B9B379B2F9B2F
      9B2F9B2F9B2F9B2FBB3BBC4F9C3FCC000000AA7E6F7F6E7F3D5FDE7B9B737B73
      9B739B73D65AA54D0B7FCA7E00000000000000000000107E2F7A157F4E7E2D7E
      2D7E2D7E2D7E4E7E157F2F76107A000000009A32D715D8157F473E433D3F3D3F
      3D3B3D3B1D3B1D37FD361D37FF7FFF7FFF7F00000000D3297B37BB4FBB4FBB4F
      BB53BC4FBC4FBC4FBB4F7B37D3290000000000000000000000007B6F00001042
      0000DD7B0000000000000000000000000000000000000000C8744A75F57EF47E
      B37EB37EF47EF57E2969C76C0000000000009A32D715F8157F475E433E433E3F
      3D3F3D3F1D3B1D3B1D373D3BFF7FFF7FFF7F000000000000CC00B722BB4BBB4F
      BB4BBB4BBB4FBB4BB722CC000000000000000000000000000000000000003146
      00009C73000000000000000000000000000000000000000000000000327E4B79
      C774C7744B75327E00000000000000000000391EBB36BB36BB369A369A369A36
      9A369A329A329A369A36792AFF7FFF7FFF7F0000000000000000000014362D11
      CC00CC002D11143600000000000000000000000000000000000000000000524A
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001D47BC2A
      9C1E9C1EBC2A1D470000000000000000000000002E112E112E112E112E112E11
      2E112E112E112E112E112E112E110D110000000000000000000000008D5D844C
      004C004C844C8D5D000000000000000000000000000000001505593A3D02D400
      DA01DA01F4043D02593A15050000000000000000000000007B1A1D375E3F3E3F
      3E3F3E3F3E3F5E3F1D377B1A0000000000002E11571A571A571A571A571A571A
      0D11B21116163616571A571A571A571A2D110000000000000050217022782278
      22782278227822782170005000000000000000000000000015053C069E067D06
      5D067D067D027E021C02150500000000000000000000DC3A3E3F3E3F3E3B3E3B
      3E3B3E3B3E3B3E3B3E3F3E3FDC3A000000004F11571A571A571A571A571A571A
      0D11880816121516561A571A571A571A2E11000000006B5D4278427842784278
      427C427C42784278427842786B5D0000000000000000F821BE0E9D0A7D0A7D0A
      7D0A7D0A7D0A7D067D069E06F8250000000000003A1A3E3BB000D000BC2A3E37
      F8153E371E371E371E371E371E373A1A00004F11771A771A771A571A571A571A
      ED08DE7788044F0D36165616571A571A4F110000015862786278627CC75CF776
      000000002154427462786278627801580000000057053605BE129D0E9D0E9D0E
      9D0E9D0E7D0A7D0A7D0A9D0A3605770500000000FD2E3E3BBE7300001816BC2A
      5832F1003E3B1E371D371D371E37FD2E00004F11981A981A981A981A981A981A
      0D09BD73FF7F880457165716571A571A4F11000042746278627C216400000000
      000000006274627862786278627842740000000037055D0A5D0A5D065D067D06
      5C025D063C023C021C02FB015C0E57090000BB42FD32FD329D6B000019169C26
      000000003C5B7509DD2AFD32FD2EFD32BB4270114F0D7742BE77BE77BE77BE73
      9D730000000000002F154F0D771A771A6F11AD6D83788378C764000000000000
      8460827883788378837C216883788378AD6D7B321F17BF579D023E3F9D16DE6F
      0000FE7BBE6B00009D670000FE16FF167B32191EDD2ADD2E9D6B000019169B26
      000000000000000075051916DD2EDD2E191E70114F0DF9520000000000000000
      000000000000000000004F19981A981A4F1185648378A378F776000000000000
      6274A378837883782168AE6DA378837885647E57BE0EBF67000000009D1AFF7F
      FC36BC1A0000000000000000DF0EDE1A7E5BD7111D43DD2E9D6B000019167B22
      0000000000000000000000005926BB32B711B83ED21DD94E0000000000000000
      000000000000000000000000911DB221B83E0164AA7D057D000000006B6D8370
      C378C378C378637400000000057DAA7D01605E571E27BF6700005D029D1AFF7F
      FF7F9E6700003D4F00007D67BC221D375E57B6111D3B1D3F9E6F000039167B1E
      000000000000000000000000BA36BB32B611B83E76365B670000000000000000
      000000000000000000000000353AB83EB83E016CAA7DAB7D000000008374E47C
      C378C37883746C6D00000000AB7DAA7D01603E4B9F4BBF6B1E2F3E33FD32DE77
      0000BE77BE77DC2E5D5BFC36BC221D373E4BD619FC36FC36BE7300009B2A9B26
      00000000000000007A26DC32FC36FC36D619D83E97325B630000000000000000
      0000000000000000FF7F142E5B3F5B3FB83E8570CB7DCB7DAE754270E47CE47C
      047DA374000000000000F77ACB7DCB7D85680000BC2A5E3B5E435E435F435E3F
      3E373E3B3E3B1D373E3B1D371D37DD2E0000793A3D43DC32BE730000BC2EDC32
      000000007D5FBB2EDC36FC36DC323D43793AD83EB7367C670000000000000000
      00000000000000001432D9367B3F7B43B83EAD75EC7DCB7D8474477D047D047D
      C4788570000000000000E770CB7DEC7DAD750000FD32FD2E9F539F4F9F4F9F4F
      9F4F9F4F9F4F9F4F9F4F9F4FFD2EFD32000000007A2A3D4BDF770000BC2EDC2E
      3D4BDC2EDC2EDC2EBC2EBC2A3D4B7A2A0000F93E9B3F9B3F9B3F9B3F7B3B7B3B
      762ABE779D6F142A7B3F7B3F7C437C43D93E0000E87C707ECB7DEB7D687DE478
      000000000000000084740C7E707EC65C0000000000003E43BF5B9F539F539F53
      9F539F539F539F4F9F53BF573E430000000000005409DB3ADC32DC2EBC2ABB2A
      DC2ABB26BC26BB26DC2E1C3FDB3654090000F93E9B439B439B439B437B3F7B3F
      762EDE7B142A19377B3F9B439B439B43D93E00000174EE7DEB7DEC7DAA7D2274
      00000000F77EC7740C7EEB7DAC71006000000000000000003E379F53BF5BBF5B
      BF57BF57BF57BF5B9F4F3E37000000000000000000001732BB321C3B1C3B1C3B
      1C3B1C3B1C3B1C3B1C3BBB321732000000001A3F9B439B439B439B439B439B3F
      D93677327A3B9B3F9B439B439B439B43F942000000006C790E7ED37E2D7E0C7E
      2D7E2D7E0C7E2D7ED37EED756C79000000000000000000003E3B9F57BF573E33
      9F4B9F4B3E37BF579F573E3B00000000000000000000000033095922FC36FC3A
      FC36FC36FC3AFC3659223309000000000000FA429B439B439B439B439B439B43
      FA3E7B3B9B3F9B3F9B439B439B439B43F93E0000000000000174E774D47ED37E
      917E917ED37EF47EC66400600000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000583A7315
      330533057315583A0000000000000000000000001A433A433A433A433A433A43
      3A433A433A433A431A431A431A431A43000000000000000000000000AD7D8574
      017001708570AD79000000000000000000000000000000008E318D31AE31AE35
      8D318E31AE318D318E3100000000000000000000C714C714C714C714C714C714
      C714C714C714C714C714C714C714C714FF7F0000000000009721380158011605
      000000000000000000000000000000000000000000002F052F052F052F052F05
      2F052F052F052F052F052F010E050E0500000000000000002A21DF733B5FA614
      BE6FBE6F3B5FBE6FE81C6C2D000000000000B6520A1D2B216D296D296D296D29
      6D296D296D296D296D296D290A1D0A1DFF7F0000000078115D065D063D063C02
      1D0256150000000000000000000000000000000000004F090000000000000000
      000000000000000000000000BE734F090000000000000000E81C0000BE738510
      FF7B0000BE73FF7BE81C6B29000000000000B6562B21AE2D3A633A633A633A63
      3A633A633A633A633A633A632B1D4B21FF7F000000003B127D0A7D0A5D065D06
      5D025901000000000000000000000000000000000000B2150000DE77BE73BE73
      BE73BE739D6F9D6FBE737D677C6750090000000000000000E81C323E4C25A514
      123A113A4C25123AE81C4B29000000000000D75A8D296D296C256C256C256C25
      6C256C256C256C256C256C258D298D29FF7F00000000FB099E0A9E0A7D0A7D0A
      7D0A1C06000000000000000000000000000000000000F3210000DE77DE77DE77
      DE77DE77DE77DE73DE77BE737C6750090000000000000000E81CDF737C67640C
      BE6FFF777C67BE6FE81C2A25000000000000F85AAF2D113A3A633A633A633A63
      195F3A633A633A633A633A63AE2DAF31FF7F000000005B36BF533E239D0A7D0A
      7D0A1C06000000000000000000000000000000000000F3210000DE77DE77DE77
      DE77DE77DE77DE77DE7BDE737C6750090000000000000000E81CC718C718E818
      C718E818C718C718E81C4A25000000000000195FF139F139F135F135F135F135
      195FF135F135F135F135F135F139F139FF7F0000000000007E679C3EB9193A32
      7F2F5D0A000000000000000000000000000000000000F3210000DE77DE77DE77
      DE77DF7BDF7BDF7BDF7BBE777C6750090000000000000000E81C333EAE2DA514
      323E123AAE2D323EE81C4B290000000000003963123E5446195F195F195F195F
      195F195F195F195F195F1963123E323EFF7F0000000000000000000000000000
      7F337D0A000000009A117B3E00000000000000000000F3210000DE77DE77DE77
      DE77DE77FF7BDF7BDF7BBE737C6750090000000000000000E81CDE77195F8510
      BD73BE73195FBD73E81C4B29000000000000195FF139F139D035D035D035F135
      F135D035D035D035F139F135D035D035FF7F0000000000000000000000000000
      9F3BBD0E00000000DE12DE1200000000000000000000F3250000DE77DE77DE7B
      DF7BFF7BFF7FDF7BBE779D6B5C6370090000000000000000C718A614C718C718
      A614A618C718A614C7186C2D0000000000009552E818E8185446744A964E0A1D
      C8145446754A754AC814C714744A754AFF7F0000000000000000000000000000
      9F3FBE1200000000FE16FE1600000000000000000000142E0000FF7BFF77FF7B
      FF7FFF7BFF7FDE77BD737C673B5B70090000000000000000BA32BA323D3F3D3F
      3D3F3D3F3D3F3D3FBA32AE35000000000000D7564C257C6F9D73DE7B2B214B21
      BD73BD738E2D2B217C6FBD73BE778E2DFF7F0000000000000000000000000000
      BF47FE16000000001E1F1E1B00000000000000000000563600000000FF7FFF7F
      FF7F0000BE73BD737C6B3B5FD84A710D00000000000000009646DF639F5B9F57
      9F579F579F5B9F5B96463146000000000000D75ADE7BFF7FFF7F744A6C25DE7B
      DF7BFF7F4C256C25FF7FDF7BAF314B21FF7F0000000000000000000000000000
      BF4BFE1A00007C2E3E1F3E1F00000000000000000000773A00000000FF7FFF7F
      0000FF7BBE73BD737C673B5BB8469111000000000000000055427F537E537E53
      7E537E537E537E5355423146000000000000F0393A637C6FD7566C291963DE7B
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      DF533F233F235F2B5F27BD160000000000000000000097420000FE7FFF7F0000
      DE73BE735C63973EDE7BBE73773AB2150000000000000000553E5E4B5D4B5D4B
      5D4B5D4B5D4B5D4B553E32460000000000006D294C25DE7BBD7754464C257B6B
      3A6753463967FF7BFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      DF537F2F7F2F5F2B3F23FD42000000000000000000009742000000000000FF7B
      BD739D6F1A57973EBE733B5FF321000000000000000000007542FD2EFC2EFC2E
      FC2EFC2EFC2EFC2E7542534A000000000000BD7753468E2DFF7FFF7F2B212B21
      DF7BDE7B0A1D0A1D7B6B7B6B09192A21FF7F0000000000000000000000000000
      DF579F379F33BF4B0000000000000000000000000000B7460000FF7FDF77BE73
      7C6B5B5FD94655327636F32100000000000000000000000075423C475E475E47
      5E475E475E475E477542534E000000000000FF7FFF7FFF7FFF7FFF7F195F4C21
      FF7FFF7FD7562B21FF7FBD77F0392A21FF7F0000000000000000000000000000
      DF5F9F37DF5BBD120000000000000000000000000000B74600000000DF7BBE73
      5C673B5BB842F321F32100000000000000000000000000001863196319631963
      196319631963196318630000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FB652FF7FFF7F7C6FFF7F0000000000000000000000000000
      7F335F2F000000000000000000000000000000000000B846B742B742B746B846
      973E973E342ED31D000000000000000000000000191619161916191619161916
      19161916191619161916191619161916D71D0000FF7FF452C821220522052205
      220522052205440D4E3AB24A0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001C43B7095B0E5B0E5B0E5B0E5B0E
      5B0E5B0E5B0E5B0E5B0E5B0E5B0EB709F90D00004E4BE52AE52AE52AE52AE52A
      E52AE52AE52AE52AE52AE52AC52A830D0000000000000000727FC4654E66DE7F
      00000000FF7FCF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FB3E1A0A55095B0A3B0A3B0A3B0A
      3B0A3B0A3B0A3B0A3B0A5B0A5409FA09D90900006F53E426E52AE52AE52AE52A
      E52AE52AE52AE52AE52AE52A052F430900000000000000001077217FC4654455
      0000FF7F11460000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FC425B0E5B0ED90D34097C0E5B0E
      5B0E5B0E5B0E7C0E3409D8095B0E5B0EF90D00000F4B2A43E52EE52EE52EE52E
      E52EE52EE52EE52EE52EE52E64224B2E0000000000000000906A017F407F607F
      C37600000000000000005A6B0000000000004561827A827A827A827A827A827A
      827A827A827A827A827A827A827A827A4561FC427C127C127C125B12B80D9C12
      7C127C129C12B80D3A129C127C127C12191200000722905BE432E532E432E432
      E532E532E532E532E432E532C311365B0000000000000000C85D6C7F407F407F
      A07F00000000000000009452000000000000A469C26DA05CA05CA05CA05CA05C
      A05CA05CA05CA16DA27AA27AA27AA27A82691C47BC1EBC1EBC1E9C1A792EDB42
      D80DD80DDB42792E3B16BD1EBC1EBC1E3A1600009A6F051A4B4FE336043B043B
      043704370437E436043BC432DD77000000000000000000002451B57F407F407F
      807F00000000000000001142000000000000A569E26DC05CC05CC05CC05CC05C
      C05CC05CC05CA16DC27AC27AC27AC27A82691C4BBC22BC221A125505DE77BE73
      55059509BE73DE771301D80DBC22BC225A1A00000000565B705B4D532437A342
      A1490246243B043BC432041A0000000000000000000000002551C27A407F607F
      807F0000000000000000534E000000000000C569C37AA276A276A276A276A276
      A276A276A276A276E27AE27AE27AE27A83693D4BBC225405FF7FDE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDE7BDE7B3401BC227B1E0000000000000000AA32CC7E647E
      437E437EC2750031000000000000000000000000DD7FEA614E7F4E7F8E7F8B7F
      A07F00000000000000000000744E39670000C569E37AC176C176C176C176C176
      C176C176C176C176017B017B017B027BA3695D5376099A2AFF7F7C631B571A57
      1A571A571B571B571A57DF7B8F2D97099C2200000000000000002C7A647E647E
      647E647E847E215D000000000000000000000000EA61CC764E7F4E7F8E7F8E7F
      AD7F000000000000000000000000744E0000C56D237B017B017B017B017B017B
      017B017B017BA176607660766076607662651D433E37BB32FF7F7C673A5B1A5B
      1A5B3A5B3A5B3A5B1A5BDE7BF2353F375B1A00000000000000000F7BA67EA67E
      A67EA67EA67EC77E000000000000000000000A620C7F0C7F4D7F4D7F6E7F8E7F
      AD7F0000000000000000000000000000324AC56D437B217B217B217B217B217B
      217B217BE4727C6B7B127B127B127C6B6269DF779E631C4BFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7B133E1E2FDF77000000000000797F0F7F2E7F0B7F
      C77EC77EC77EE77E000000000000000000000A62F46E9A7BDB7FD87F907F8E7F
      AD7F00000000000000000000DE7B7B6F324AE56D637B417B417B417B417B417B
      417B417BE3729D6FDC26DC26DC269D6F8269FF7FFF7F7C6BFF7BFF7BFF7BFF7B
      FF7BFF7BFF7BFF7BFF7BDF7B544EFF7FFF7F0000000000005A6B8510EA49EE72
      4F7F4F7F4F7FB17F9C730000000000000000000000000000000000000B66D47F
      AD7F00000000744E00000000000000000000E56D847B627B627B627B627B627B
      627B627B2573DE77DE77DE77DE77DE77C26DFF7FFF7FFF7F5B675A6B5A6B3A67
      1967D75A96569656544E544E544EFF7FFF7F0000000000005A6B851064084408
      907F707FB17FAA415A6B000000000000000000000000000000000000B26EF372
      AC7F00007C731863000000000000000000006569A87F857B857B857B857B857B
      857B857B867B6A7749734973487327736569FF7FFF7FFF7FFF7FFF7F3D43BF67
      7F437F473E37DD2EFF7FFF7FFF7FFF7FFF7F0000000000009C73A614A514A514
      E720E71C640C85103A670000000000000000000000000000000000000000B26E
      CB7F0000D75A0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F7E57
      DF6F7E4B7E57FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000C718A614A614
      A614A514A614A51400000000000000000000000000000000000000000000FF7F
      F57F0000FF7F0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000E81CC718
      E81CF0418D313967000000000000000000000000000000000000000000000000
      0966965200000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002F052F052F052F052F05
      2F052F052F052F052F052F010E050E05000000004F154F155015501550154F15
      501550154F154F154F154F154F154F15000000000000CC59015501552159215D
      205D406140654069606D80710000000000000000000000006C31E71C00000000
      00000000000000000821CF39000000000000000000004F090000000000000000
      000000000000000000000000BE734F0900004F15981E981E9211921192119211
      921192119211921192119211981E981E4F15000000002451B67F2E7F867E857E
      447E237E027E227E437E847E000000000000000000000000DE777B6FDD7BE820
      000000004A29BE777B6F000000000000000000000000B2157677007E76777419
      7419741974197419741973157C67500900007015981E991EDE7B000000000000
      00000000000000000000DE7B981E781E7015000000002351947F517FEC7E877E
      877EC87E2C7F4C7F0C7F2D7F00000000000000000000000000007B6FDE7BFF7B
      A7182A25DF7BDE7B7C6FBC7300000000000000000000F3210000DE77DE77DE77
      DE77DE77DE77DE73DE77BE737C67500900007115981EB91EDE7B000000000000
      00000000000000000000DE7B991E981E7015000000002351727F2F7FA97E657E
      A77EE97E6E7FB07F707F717F000000000000000000000000B556FF7FDE7BDE7B
      00000000DE7BDE7B0000314600000000000000000000F3215373007E7677951D
      951D951D951D951D951D951D7C67500900007115B91E981E9211920D920DB20D
      CC04CC04B20D920D920D9211981E981E7015000000002451D77FB57F727F307F
      EC7EAA7E457E037E227E647E000000000000000000000000534E0000DE7BFF7B
      FF7BFF7BFF7FDE7B00008C3100000000000000000000F3210000DE77DE77DE77
      DE77DF7BDF7BDF7BDF7BBE777C67500900009219B91EB91EB91EB91E361A2E11
      00000000ED08361AB91EB91EB81E991E9115000000002451D67FB57F727F307F
      EC7EAA7E457E237E227E647E000000000000000000000000E81C0000FF7FFF7F
      000000000000FF7F0000A61400000000000000000000F3215373007E7677951D
      951D951DB61D951D961D951D7C67500900009115D91EB91ED91EFA1E0D090000
      0000000000002E0DB91EB91EB91EB91A7115000000002351937F517FCB7EA97E
      A97ECA7E2B7F2C7F0C7F2D7F0000000000000000000000007B6F0000FF7F0000
      000000000000000000005A6B00000000000000000000F3250000DE77DE77DE7B
      DF7BFF7BFF7FDF7BBE779D6B5C6370090000D83E3A2FD91AB81A0E0500000000
      00000000000000000E09981AB91A1A2FB83E000000002351937F517FCC7EA97E
      A97ECA7E2B7F2C7F0C7F2D7F0000000000000000744E7C6FDE7BFF7F00000000
      0000000000000000FF7FDE7B5A676D31000000000000142E7677007E7677951D
      951D951D951D9419741953153B5B70090000B83E9C479C4B91159C6700000000
      00000000000000009C6791159C4B7C47B83E000000002451D77F927F4D7F2B7F
      C87EA77E447E237E437E847E00000000000000005A6B0000DE7BFF7F00000000
      0000000000000000FF7FDE7B0000F85E000000000000563600000000FF7FFF7F
      FF7F0000BE73BD737C6B3B5FD84A710D0000D93E9B473A431A43D93A194B0000
      000000000000D93A1A3F1A3F3A439C43D83E000000000C6227660566056A056A
      E46DC36DA17180718075A075000000000000744EBD77DE7B0000000000000000
      000000000000000000000000DE7BBD77324600000000773A7677007E7677951D
      951D951D7419741953153215B84691110000F93E9C479C479C479B471A4F0000
      0000000000001A4F9C479C479C479C47D93E0000000000009552000075460000
      00000000AE355B6B4B290000000000000000B65AF86218637C6F9C7300000000
      00000000000000009C737B6FF862F85E95520000000097420000FE7FFF7F0000
      DE73BE733B5F973EDE7BBE73773AB2150000F93E9B479B479B479C471A4F0000
      0000000000001A4F9C479C479C479C47F93E00000000000095520000534A0000
      00000000AE357B6F4B29000000000000000000000000000000000000534A0000
      FF7FFF7F0000F041000000000000000000000000000097427677007E76779519
      741974191011973EBE733B5FF321000000001A439B479B479B439B433B530000
      0000000000003B539C479B479B479B43F93E00000000000095520000744E0000
      00000000AE353A674B29000000000000000000000000000000000000F85EDE7B
      FE7BFF7B7B6FF85E0000000000000000000000000000B7460000FF7FDF77BE73
      7C6B5B5FD94655327636F3210000000000001A439B479B479B47BB475B530000
      0000000000005B539B479B479B479B471A430000000000009552BD779C6FF862
      F1418E35185FF75E8D310000000000000000000000000000000000000000D75E
      DE7BDE7BD75E00000000000000000000000000000000B74600000000DF7BBE73
      5C673B5BB842F321F32100000000000000003A43BB47BB47BB47BB471A475B57
      5B535B535B571A43BB479B479B479B471A430000000000005A6B544EDE7B9C73
      7B6F5A6B18633A67D65A00000000000000000000000000000000000000000000
      DE7BFE7F000000000000000000000000000000000000B846B742B742B746B846
      973E973E342ED31D0000000000000000000000003B433B433B433B433B433B43
      3B433B433B433B433B433B433B433A43000000000000000000000000534A324A
      1142F03DF03DF75E000000000000000000000000000000000000000000000000
      7552755200000000000000000000000000000000000076110000000000000000
      0000000000000000140514091409350900000000000000000000000000000000
      000000000000000000000000000000000000000000000000167B000000000000
      0000000000000000000000000000000000000000000000000000B47F917FDA7F
      000000000000D67FD27FFD7F0000000000000000000056099715BE7300000000
      00000000000000001D333B067C0A140900000000000000000000000000000000
      000000000000000000000000000000000000000000000000867BE27100000000
      0000000000000000000000000000000000000000077B827F447F267F067F2662
      0F460F4629298566437F627FD57F000000000000000056057709560900000000
      00000000000000001D333B065C0A140900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000472C47F00000000
      00000000000000000000000000000000000000000E7B047F0B7F0C7FAA7E1477
      FE7FFE7F7A73A976057F247F837F6D7F0000000000007709BC16DD1E760D3D5B
      00000000000000003D3B7C0E9D0E14090000000000000000000000003A1A0000
      00000000000076050000000000000000000000000000000000002372A176D576
      0000000000000000000000000000000000000000127BCC7E547F737F0000304A
      9A7BBB7BBB7BEF7AEE762F7FC77EDC7F0000000000007709DD1ADD1EFA11760D
      00000000000000003D3F9C12BD123509000000000000000000001A1A7B1E0000
      00000000000097055411000000000000000000000000000000005072607B2172
      00000000000000000000000000000000000000000000777FB67FEE76EF41BB7B
      797379779B73F07A062D893D327B0000000000000000B809FD22FD26FD261D27
      970D7A36000000005D47BD1ADD1E5609000000000000DF779F531E2F5B169705
      9705970597059705FA01D901BE730000000000000000000000000000A77F207B
      C76D00000000000000000000000000000000000000000000A6106C297A737A6F
      BC77BC779B739B6FC618C618D65A0000000000000000B9091D271D2B1D2B1D2B
      9C1EB80D000000005E4BDD1EFD22560900000000DF777B1E3E371E2FFD2AFE26
      BD1E9C1A5C0E3B0AFA01FA011301BE73000000000000000000000000C576627F
      C17A2E7200000000000000000000000000000000000000002A2508259C739C77
      DE7BDE7BDE7B9B73630C0000F75E0000000000000000FA0D3E333E333E333E33
      3E2F3E2FD911191E7E4F1D271E2B970D00009E5FBF5F5F3B5F3B3E371E2FFD2A
      BD22BC1E5B165B121A06FA01FA011A021B5B000000000000000000009C7FA576
      E17A017FBC7F0000000000000000000000000000000000001863082139670000
      FF7FFF7FDE7B9D732104630C00000000000000000000FA0D5E375E373E373E37
      3E337E4BD90D7E637E4F1E2B3E2F980D00007C167F4B5F3B5F3B3F371E2FFE2E
      DD22BD1E7C165B121A0A1A06F901FA01D100000000000000F57A487229720272
      E07AE17A42690000000000000000000000000000000000000000EF3DAD35DE7B
      FF7FFF7FDD7BB55643082925000000000000000000003B125E3B7E3F5E3F5E3B
      DC2EFA11000000009E573E375E3BB90D00000000BD269F5B5F3B5F3B3F3B3E3B
      1E33FD2EDC26BC1E3B0E3A0AD901540D00000000000000000000357B637F217B
      E07AC07AA17A417A000000000000000000000000000000000000000020049452
      7A739B731763631031460000000000000000000000005B127E3F7E437E3FDF63
      1A125E5B000000009E575E3B7E3FD90D0000000000009C22BF575F3BBF5FDF67
      BF63BF5F9F5B5E475B125B0E540D0000000000000000000000000000D27F897F
      697F467F047B047F797B000000000000000000000000000000000000AD35CE39
      806A876A1042000000000000000000000000000000007C169F479F47BC225B16
      00000000000000009E5B7E3F9F43FA1100000000000000007B1EBF5BBC220000
      0000000000001A125B16751100000000000000000000000000000000147BB37F
      697F697F8B72F4763677000000000000000000000000000000000000596BE551
      6E7F487FC124210400000000000000000000000000009C169F47DF6B7C1ADF77
      0000000000000000BE5B7E439F471A12000000000000000000007B261D3B0000
      0000000000003A16B71D0000000000000000000000000000000000000000CE76
      687F697F4A7FCF7600000000000000000000000000000000000000001863A845
      8E6EE855082121040000000000000000000000000000BD1AFD26DD2600000000
      0000000000000000BF5F9F47BF4B3B160000000000000000000000009B2E0000
      000000000000182A000000000000000000000000000000000000000000000000
      B37F6B7F4A7F4A7FDD7F00000000000000000000000000000000000018634A29
      8410B5560000630C0000000000000000000000000000DD1EFD2A000000000000
      0000000000000000BF5FBF53BF575B1200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      EF76B37F4A7F4A7F8B720000000000000000000000000000000000007B6F4A29
      2925E71CA51429250000000000000000000000000000FD260000000000000000
      00000000000000009C1A9C169C169C1A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000567BEF76EF76EF768D72000000000000000000000000000000000000FF7F
      524A3146B55600000000000000000000000000000000EF69015C8C6500000000
      00000000000000000000000000000000000000000000000000000000D93A3616
      F505F5053616D93A0000000000000000000000001B1F1B1BFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000001D47BC2A
      9C1E9C1EBC2A1D4700000000000000000000000085684270647C447CF0690000
      000000000000000000000000000000000000000000000000D405590E790E570E
      9A0E9A0E580E790E590ED4050000000000001B0FFD0EFF32FD22593BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000007B1E1D373E3F3E3F
      3E3F3E3F3E3F3E3F1D377B1E0000000000005B7BC67C847C0058847C015CB572
      00000000000000000000000000000000000000000000772E9A0E790E580E370A
      FC2EFC32580E580E790E9A0E772E000000003B23360BFD0EFF36FC1EFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000DC3E3E3F3E3F3E3F3E3F
      3E3F3E3F3E3F3E3F5E3F3E3FDC3E000000002160A478A57CC57C626CA57CA57C
      DE7F00000000000000000000000000000000000093059A0E580E580E580E370A
      00000000580E580E580E580E9A0E93050000FF7FDE2EDE22DC0ADF2AFB12BC5B
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00003A1A3E3FF1007A223E3B1E3B
      1E3B1E3B1E3BDC2ED100D1003E3F3A1A0000A568C478C57CC57CC57C0058C57C
      197B000000000000000000000000000000000000780E790E580E580E580E370A
      00000000580E580E580E580E790E780E0000FF7F381BDE2E150BDC0AFF36DD1A
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000DC2E3E3BFB4AD619BC2A3E3B
      1D371D371D379B26000000003E3BDC2E0000A66CE57C057D057D057DA56CC668
      000000000000000000000000000000000000773A990E580E580E580E580E370A
      00000000580E580E580E580E580E990E773AFF7FFF7FFF7FDE2EBE22FA0ABF2A
      DD225837FF7FFF7FFF7FFF7FFF7FFF7FFF7FDB42FD321D379D6B00000000DA46
      191AFD32FD327B22000000001D33FD32DB422268057D267D257D267DCE710000
      0000000000000000000000000000000000007215780A580E580E580E580E370A
      00000000580E580E580E580E580E780A7215FF7FFF7FFF7F371BDE2EF40AFA0A
      DF36DD22190F190F190F170FDE6BFF7FFF7F1822DD2EFD329D6B000000000000
      38265505FD327B2200000000FD32DD2E1822D67A707E267D467D267D00000000
      0000000000000000000000000000000000003005FC2E7A0E580E580E580E370A
      00000000580E580E580E580E590EFC2E3005FF7FFF7FFF7FFF7FFF7FBE2E9E1E
      3E065E065E0A5E0A5E0A5E0A3F06FA0AFF7FD7111D43DD329E6F000000000000
      000000007D63B60D00000000DD321D43B7110000D47E677D477D677D6C750000
      0000000000000000000000000000000000009401FB2AFC329A0E580E580E360A
      00000000580E580E580E790EFC32FB2A9401FF7FFF7FFF7FFF7FFF7F381BBE2E
      3E063E0A3E0A3E0A3E0A3E0A5E0A3F06DE6BB6111D3F1D439E6F000000000000
      000000001C4F9609000000001D431D3FB61100000274927E677D677D887D4370
      0000000000006C71467D437000000000000094111C2BFC2EFC2E9A129A12DB26
      5D4F5D4F9B169A12590EFC32FC2E1C2B9411FF7FFF7FFF7FFF7FFF7FFF7F7A43
      1E063E0A3E0A3E0A3E063E063E063E0A391BD61DFC36FC3ABE73000000000000
      9A321916BC2ABB2E00000000FC3AFC36D61D00005B7F4374A97D887D887D887D
      D67A00006C75C674C46C887D6C750000000058369D47DB2AFB2AFC2EFC2EBB1A
      9A12590EBB1AFC2EFC2EFB2ADB2A9D475836FF7FFF7FFF7FFF7FFF7FFF7F3723
      1E061E0A1E0A1E0A1E0A5F1A1E061E06DC1A793E3D47FC32BE73000000003D53
      DC32FC36FC36DC3200000000FC323D47793E0000000000002979157FA87DA97D
      A87DE578887D887D887D0058C97DA57400000000B82ABD57DB2ADB2ADB269B16
      FF7B00009B16DB26DB2ADB2ABD57B82A0000FF7FFF7FFF7FFF7FFF7FFF7F3723
      FE051E061E061E06BD57FF7F3E57DF36FC3200007A2E3D4B7E5FFC3ABC2EDC2E
      DC2EDC2EDC2EBC2E000000003D4B7A2E000000000000000065786B7DA87DA97D
      A97DC97DA87DA87DA87DA87D6264C97DAE79000032019D473D471C37DB269B16
      000000009B16DB261C373D479D4732010000FF7FFF7FFF7FFF7FFF7FFF7F582B
      FE05FE051E0A1E12FF7FFF7F3E4F9F2E5C3F00005409DB3AFC36DC32BB2ABB2A
      BB2ABB2ABB2ABB2ABC2EDC32DB3A5409000000000000000000000000C678577F
      C97DC97DC97DC97DC97DA97DC97D0058437800000000162A9C3F9C4B5D4B9A12
      DB26DB269A125D4B9C4B7B37162A00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      3F57DF3A9E2E9E2E9F2EBE2E7F2A7F2EDE67000000001732BB321C3B1C3B1C3B
      1C3F1C3F1C3B1C3B1C3FBB3217320000000000000000000000000000737E2378
      577F707EA97DC97DA97DA97DC97D2D7E397F0000000000001101B7229C4B7C4B
      5D4B5D4B7C4B9C4B192B1101000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      5C3B3F577E2A7E2A7E2A7E2ADF3E3C43FF7F00000000000033095926FC3AFC3A
      FC3AFC3AFC3AFC3A592633090000000000000000000000000000000000000000
      0000957E0178E77CC77C6478527E000000000000000000000000000058367211
      110111017211583600000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F7C3F5C3F5C3F7C43BE63FF7FFF7F00000000000000000000583A7315
      320932097315583A0000000000000000000000000000000000000000FE3E9D1E
      7D127D129D1EFE3E000000000000000000000000000000009429000000000000
      00000000000000000000000000000000000000005E4F3E371E2FFD2EDD26DD22
      BC1E9C1A7C125B121A0A1A061A029A420000000000009E73570137012F052F05
      2F052F052F052F052F052F052F010E050E050000000000005C0E1E2B5F375F37
      7C12DD261E2B5F371E2B5C0E000000000000000000000000F600170100000000
      00000000000000000000000000000000000000003E4BFE7FDE7FFE7F0000D65A
      EF41EF41D65E00000000000000009A3E000000007E679D16DC01FC01D7210000
      000000000000000000000000000000004F0900000000BC323F333F333F33BD16
      000000005C0E5F333F333F33BC3200000000000000000000F600DB0113150000
      00000000000000000000000000000000000000003E4BBE77DE7BDE7BFF7FB556
      EF3DEF3DB6560000FF7FFF7F00009A3E000000007E67DD32DD011D0296197419
      7419741974197419741974197315FF7B50090000FB093F2F1E2B1E2B3E2F1B06
      000000009D6FFE221E2B1E2B3F2FFB0900000000B629D4009905FB05FB05BA01
      16011601B300B300B300B300B304373E000000005E4B9D73BD73BD77DE7B734E
      AD35CE359452FF7FDE7BDE7B00009A3E0000000000000000DD2ED9110000DE77
      DE77DE77DE77DE77DE73DE77BE73000050090000DD221E2B1E2B1E2B1E2B5C12
      00000000FA011E2B1E2B1E2B1E2BDD220000BE77FB053C0A1B061B06FB05FB05
      180117011B06FB05FB05DB01FB017901000000005E4B9C739C739C73BD77524A
      AD318C31734EDE7BBD77BE77DE779A3E000000000000BE73BF73D41DBA4A951D
      951D951D951D951D951D951D951DDF7B50099B3AFE26DE22DE22DE22FE22DD1E
      5B1E5B1AFA09FE26DE22DE22DE22FE269B3A58055C0A5C0A3C0A3C0A5C0A5901
      0000000099051B0A1B061B06FB05FB05D40000005E4B7B6F7B6F7B6FBD731042
      4B294B291142BD779C739C739D739A3E0000000000005E4FFF16FF129B4ADE77
      DE77DE77DF7BDE77DF7BDF7BBE7700005009D915DE1EDD22DD22DD22DE227C16
      00000000B901DE22DD22DD22DD22DE1ED91599057C0E7C0E7C0E7C0E7C0E7901
      00000000DA053C0A3B0A3B0A1B0A1B06D50000005E4B5B6B7B6B7B6F9C73EF3D
      2A252A25F03DBD779C739C739C739A3E000000000000FD46FF1EBE127715951D
      951D951D951D961D951D951D951DDF7B500977051E37DD229D1ABD1ABD1ABD1A
      000000003C4FB901BD1A9D1ADD221E377705FA0D9C0E9C129C129C129C12FB09
      F90DD90D9D0E7C0E7C0E7C0E5C0A3B0A78050000FE2E3A673A675A675A6B3967
      5B6B5B6B3A677B6F7B6F7B6F7B6FB71D0000000000000000DF6B5F373F1B7E0A
      DE7BDF7BFF7BFF7BDF7BDE779D6B0000700956011D331D379D169C169D169D16
      391E000000007A2A9D169D161D371D3356015B125D3FFD22BD12BD12BD12FB05
      00000000BD129C0E7C0E7C0EBC1A3D331A0E00007C0ADB32396739673A675A6B
      7B6F7B6F5A6B5A6B5A6B5B6BBB1E3C0200000000000000003E4BFF775F339F33
      9619951D951D951D941974195315BE7770097611FD2AFD2AFD2EFD2EDD269D1A
      9D16360100000000191AFD2EFD2AFD2A76117B167E477E477E477E4B7E4F7E4F
      00000000191E5D435E475E435D435D433A1200005E4F3E3BDB32734E1863D75A
      534A534A5A6B396739679B1E3B02F901000000009F5F00000000BF6B7F3F7F43
      BD22FF7F0000DE77BD739D6F3B5F7C67710D59363E3FDD26DD26DD269C22FD2A
      FD2ADD2600000000DB46BC22DD263E3F59369C1A7E4F7E4F7E4B7E4B7E477E4B
      DB320000FF7FB70D5E475E475E435E433B1200007E5F5E4FDE1EDB36F85ED656
      534A534A396719639A1A1B02FA011C5700007F579F4F1F33BF671E379F479F4B
      FE2A951D951D95197419741932153B5F91110000F9115E43BC1EBD1E0000FF7F
      592AFB4A00000000DB427B1A5E43F91100005B0E9E539E4F9E4F9E4FDC26DC26
      7E4F7A220000DE7B9F4F7E4B7E477E477B160000000000005E537F4BFC3E1142
      B552B652734EBB2A7C06185F0000000000009F53BF5F9F4F9F539F539F4BBF57
      FD42FF7BBE73BD73973E0000BE735B63B2150000F3009B1E1D377B1E00000000
      0000000000000000181E1D379B1EF30000007B129E539E539E539F57BE73BE73
      7A1E7D630000DE7B9F537E4F7E4F7E4F7B160000000000007E5B5E533E331C3F
      D65AD75ADB36BD1A7C6B386B000000000000FF7BDF67FF77DF5FBF5BFF6F9F57
      9519741974197419973E00003B5F773A000000000000F6295A161D2F9B2AFB4A
      7D67BE771C537A2E1D2F5A16F62900000000BC1E9F539F579F579F53DC26BE73
      00000000BE7319169E539E539E539E4FFC2A000000000000000000007E539F57
      1C471C473E377C1A9C6F18670000000000000000000000000000B7460000FE7B
      BE739D6F5B5F3B5F55325B63F32100000000000000000000D200B809FD2E1D2F
      BB2A9B26DC2AFD2AB809D200000000000000DD3EBF679F579F579F577E4BDC26
      DC26DC261916BF539F539E539E4F9F5B3B16000000000000000000005E5B5E53
      5F3F5F3FDD2A39265A6BD65E0000000000000000000000000000B74600000000
      BE739D6F3B5B1A57F321973E0000000000000000000000000000000016321211
      D100D10012111632000000000000000000000000BD261D2B3D3B3D3B3D373D3B
      3D373D373D373D373D373D371D2F7C1600000000000000000000000000000000
      1D43DC3600000000392A392A0000000000000000000000000000B846B742B742
      B846B846973E7636D31D000000000000000000000E0D2F112F112F112F112E11
      2F112F112F112F112F112F112F110E0D000000000000000000000000A411E719
      000000000000000000000000000000000000000000000000000000000000783A
      56053832000000000000000000000000000000004B29744E10425105190E190E
      190E180EF80DF80DF80DF80DF80DF80D00000E1137161612F511F5153716500D
      F321D221B121911D901D901DD415381A0E0D000000000000E71DE515272F272F
      A411DD77000000000000000000000000000000000000000000000000960DD901
      1867386B57327609182E7D6700000000000000006C2D744E10427205390E390E
      3A0EF80934019609390E390E390E3A0E00002F11F6111A3F3A4F562A50097C5F
      0000000000000000000000007111581A2F11000000000000E515262F072F072F
      451AA411000000000000000000000000000000000000000000000000B801FB01
      186718631867596FF71DF400DB4A0000000000006C2D744E104272093A123A12
      1912B5150000BA463A123A123A123A1200005011F60DBD6F00001A4BDE770000
      000000000000BD739D6B9D6FCB0837164F110000E71DE515072F072F072F072F
      072F272FA511DD77000000000000000000000000000000000000D71D3B06BD1E
      3E333532B55A596B9C73BC7700007D6B340100006C2D744E1042930D5A1A5A1A
      F811DA4A0000FF7F5A1A5A1A5A1A5A1A00005011F60DBD7300001A4B00000000
      0000000000000000000000000D11371650110000E515262F072F072F072F072F
      072F272F451AA511000000000000000000000000000000001C57B8019C169F5B
      3F331E2B7926F22D5A6FDE7BDE7F0000182A00006C2D744E1042B4117B1E7B1E
      7B1E960DFB4AB6157B1E7B1E7B1E7B1E00007011F60DBD6F0000F94600000000
      000000000000000000000000142E300D5011C4112633262F2733273327332733
      2733273327334733C511DD77000000000000000000000000D9013B06BF5F3F37
      DE229E5F3C537C0E3C0A3C02F41D1763000000006C2D744E1042D4159B229B22
      9C227A2E0000BD6F9B229B229B229B2200007111F60DBD730000F94600000000
      0000000000000000000000009D6B0E095011071EB157062F2733273327332733
      2733273327332733651EC515000000000000000000009E6B1B029C165F3F3E33
      1D37FE7F9C7B9C263B0A1B06FA01FA019A3A00006C2D744E1042D5199C269C26
      BC26B70D0000DF7BBC26BC269C26BC2600009736981EBE7700003A4F00000000
      0000000000007C679C6B7C6B701D152297360000E411A92A2633263327332733
      273327332733273327334737E515DD7700000000DC46F901DD2ABF631E2FFE2A
      BD1EFD325B123B0A1B021B02F901F9015D5F00006B2D744EEF41F519BC2ABC2A
      BC2ADC2EDE7700007A327B22BC2EDC2E000097361A3B1A4BB836F415552A0000
      000000000000000000000000DE77342E97360000DD770412B15B263326372637
      263726372637263726372633A82A051600000000D9051A029F5F5F3BFE2ADD26
      DE7FBD7B3B063B0A1B021A02F901FA01000000006C2D9552524A782E1D3F1D3F
      1D3F1D3F592600000000391EDC2EDD2E0000B8367B3F7B3B7B3F7B3B7C3F562E
      00000000F325D936F93A19373A3B7B3B97360000000000000416C92E25372533
      26372533483F6A47514F745B8E538E53DD771C4B3B0AFD2E3F371E33DD26BD1E
      BD7B9C771B021B02FA01F9013A1A000000000000F03DD65A734E99363D473D47
      DC3EBB32BC327D5F0000DE733D431D3B0000B8367B3F7B3F7B3F7B3B7B3B5B3B
      FF7F0000762E9C3F7B3B7B3F5B3F7B3FB836000000000000DD772516D76F6C4B
      6D4F8F538F53CA323353461AB5678E53775F9B269C1A9F5F1E33FE2A9D1A9C1A
      3C537B73FB011B02F901F901DF73000000000000F03DD65A734E993A3E4B1D3F
      0000FF7BBE73000000005D5B3E4B5E4B0000D9369B3F9B3F9B3F9B3F7B3B7B3B
      352AFF7FF952F9367B3F7B3F7B3F7B3FB83600000000000000000000451A4F4B
      8D538D532B3F34530000000095638D53CC36DC2E9F533F37FE2ABD1E0000DE7B
      7B6F5A6B5A0EFA01FA053D530000000000000000F03DD65A734EB93E5E4F5E4B
      FC3A5D57BF73DF73FC363E475E4F5E4F0000F93A9B3F9B3F9B3B9B3B9B3B9B3B
      772EBD733B5FD8369B3B9B3B9B3B7B3BD83A00000000000000000000DD77651A
      D66F8D536D4F66220000FD77B25F8D57A92A3D435F331E2FDD26BD1EFE7FDD7B
      7B6F5A6B1A02F901DD3A00000000000000000000F03DD65A734ED93E5E4F5E4F
      7E4F3E471D3F1D3F7E4F5E4F5E4F7E4F0000F93A9B3F9B3F9B3F9B3F9B3F9B3F
      7732DE7BF42D7B3B9B3F9B3F9B3F9B3FF93A0000000000000000000000000000
      851E504F8D578D5B8E578E578D578D57A7260000DF737E573E475E537C161B02
      FA01FB01F9015C16000000000000000000000000EF3DD65A534EB93E7E4F7E4F
      7E4F7E4F7E4F7E4F7E4F7E4F7E4F7F4F0000FA3A9B3F9B3F9B3F9B3F9B3F9B3F
      F93A973EF9369B3F9B3F9B3F9B3F9B3FF93A0000000000000000000000000000
      DD77A51ED773B2678E5B8D578D578D5BC82A00000000000000009E633E3F5E4B
      9C16FA015C0EDF77000000000000000000000000D75A7B6F19635B5BBF67BF67
      BF67BF67BF67BF67BF67BF67BF67DF6B000000001A3B1A3B1A3B1A3B1A3B1A3B
      1A3B3A3B1A3B1A3B1A3B1A3B1A3B1A3B00000000000000000000000000000000
      00000000DD7797630C3BE92EE72AE82E00000000000000000000000000000000
      0000000000000000000000000000000000000000F75AA610430442041622161E
      F519D419B4159311930D720D5209740900000000000000000000000049492949
      29494A4D0000000000000000000000000000000000000000000000001D43BC22
      9C1A9C1ABC221D4300000000000000000000000000000000000000001D43BC22
      9C1A9C1ABC221D4300000000000000000000000000000000000000001D3FBC22
      9C169C16BC221D3F00000000000000000000000000000000833C833C84388438
      843884384304E71C000000000000000000000000000000007B163E337E3F5E3F
      5E3B7E3F5E3F7E3F3E337B160000000000000000000000007B163E337E3F5E3F
      7E3F5E3B5E3F7E3F3E337B160000000000000000000000007B163E335E3B5E3B
      5E3B5E3B5E3B5E3B3E337B1600000000000000008C51C640A464A468A558A558
      84408440630C21000000000000000000000000000000DC365E3F5E3B5E3B7E3F
      36017F3F5E3B5E3B5E3B5E3FDC360000000000000000DC365E3F5E3B5E3B5E3B
      7F3F14017E3F5E3B5E3B5E3FDC360000000000000000DC365E3B5E3B5E3B5E3B
      5E3B5E3B5E3B5E3B5E3B5E3BDC36000000002869A56C844863346250A474C474
      C474A464832C630C00004A2900000000000000003A125E373E373E37FD2A3601
      36017F3B3E373E373E373E375E373A12000000003A125E373E373E373E373E37
      7F3B14011401FD2A3E373E375E373A12000000001A123E333E333E33F9115605
      3E333E373E333E333E333E333E331A120000C564A458C47483486330C5548358
      C474A46083386318210021040000000000000000FD2A3E333E335E3714017D5B
      36017F3B3E373E373E373E373E33FD2A00000000FD2A3E333E373E373E373E37
      7F3B14017D5B14015E373E333E33FD2A00000000FD2A3E333E333E33F90D5D5B
      F400FD263E333E333E333E333E33FD2A00008B69C568845043442100526BD77F
      A364C474833C832842080000000000000000BB3E1D2F1D2B5B1A760900000000
      DB42FB46FB46FB46FB461C4F3E2F1D2FBB3EBB3E1D2F3E2F1C4FFB46FB46FB46
      FB46DB420000000014015B1A1D2B1D2FBB3EBB3A1D2BFD2AFD2AFD2AF90D5D5B
      000000001A121E2F1D2BFD2AFD2A1D2BBB3A0000834C210443282100AF5AF67F
      A554C4708340832842082104000000000000F919FD2A1E2BD719000000000000
      0000000000000000000000001E2BFD26F919F919FD261E2B0000000000000000
      0000000000000000000014011E2BFD2AF919F919DD26DD26FD26FD26F90D5D5B
      0000000097091A12FD2AFD26DD26DD26F9190000834C0E46AF5AAA65AF5AF57F
      E740A474833C8328630C63082100C618000097095A22D7190000000000000000
      0000000000000000000000001D2B3D43B809B8093D431D2B0000000000000000
      000000000000000000000000D7195A22970998093D3FFD26BD1EBD1E1A0E5D5B
      00000000000000005701BC1EFD263D3F97090000834CF87F7477AA65F57FD47F
      E748A47483388330832063106308010000009709DC32D7150000000000000000
      0000000000000000000000005D3F3D3B760976093D3B5D3F0000000000000000
      000000000000000000000000D715DC32970976093D3B3D3BBC1ABC1A1A0E5D5B
      000000000000000077019C1A3D3B3D3B76090000834C8348F87F6959D67BB67F
      A46CA450833C833CA464A4686244630C420496151D331D37F8119E6B00000000
      0000000000000000000000001D371D33961596151D331D370000000000000000
      00000000000000009E6BF8111D371D33961596151D331D331D331D379C229E63
      000000009B2A7B1E1D371D331D331D3396150000E4708350F2664F56725E725E
      A46C8450833C832C8360A470A45C62444204593A5D47FC2EFC2EF91100000000
      7D5F9E639E639E639E639E67FD2E5D47593A593A5D47FD2E9E679E639E639E63
      9E637D5F00000000F911FC2EFC2E5D47593A59365D43FD2EFD2EFD2EBC2A9E63
      0000FF7F7B1EFD2EFD2EFD2EFD2E5D4359360000A374A46C6338633884508450
      8340832C4208410400000000E648834C420400007A267E4BDC26DC263A1ABE6F
      3A16FC2ADC2ADC2ADC26DC267E4B7A26000000007A267E4BDC26DC26DC2ADC2A
      FC2A3A16BE6F3A1ADC26DC267E4B7A26000000007A225E47DC26DC26DC26BE6B
      DC26DC26DC26DC26DC26DC265E477A22000000000F6EA46C8314E724A434A434
      A42884148C3194560000000007496244292500001401FC323D3FFC2EBC221912
      7A1EDC22DC22DC22FC2E3D3FFC321401000000001401FC323D3FFC2EDC22DC22
      DC227A1E1912BC22FC2E3D3FFC321401000000001401FC323D3FFC2ADC2AFD32
      DC22BC22BC1EBC1EFC2A3D3FFC32140100000000000000006344314E00000000
      0000000000000000000000006A514945000000000000F72DDC2E3D3B3D3B3D3B
      1D373D3B3D3B3D3B3D3BDC2EF72D0000000000000000F72DDC2E3D3B3D3B3D3B
      3D3B1D373D3B3D3B3D3BDC2EF72D0000000000000000F72DBB2A3D373D373D37
      3D3B3D3B3D3B3D373D37BB2AF72D000000000000000000005172634400000000
      0000000000000000000000000F56FF7F0000000000000000F2005A1E3D371D37
      1D371D371D373D375A1EF200000000000000000000000000F2005A1E3D371D37
      1D371D371D373D375A1EF200000000000000000000000000D200391A1D331D37
      1D331D331D371D33391AD2000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000017363405
      F200F20034051736000000000000000000000000000000000000000017363405
      F200F20034051736000000000000000000000000000000000000000017323311
      D200D20033111732000000000000000000000000AD31AD310000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008D618454
      0054005484548D61000000000000000000000000000000000000000000000000
      5801580100000000000000000000000000000000AE35AE350000000000000000
      000000000000000000000000000000000000D1017D225C165C165C165C125C12
      5C125C0E5C0E5C0E5C0A5C0A5C0A5C0EB1010000000000000054227442784278
      4278427842784278227400540000000000000000000000000000000000000000
      58013C0258010000000000000000000000000000CE35CF390000000000000000
      000000000000000000000000000000000000D101BF2E7F229F1E7F1E7F1A7F1A
      7F167F167F129F127F0E7F0E7F0E7F0EB101000000006B65427C427842784278
      42784278427842784278427C6B65000000000000000000000000000000000000
      58011E1F99055801000000000000000000000000EF3910420000000000000000
      000000000000000000000000000000000000D101BF2E7F227F227F227F1E7F1E
      7F1A7F1A7F167F167F127F127F0E7F0EB10100000160637C6378637863786378
      637863786378637863786378637C016000000000000000000000000000000000
      78013C02BD0E3C02580100000000000000000000F03D32460000000000000000
      000000000000000000000000000000000000F201BF327F267F229F227F1E9F1E
      7F1A7F1A7F167F167F127F127F127F0ED20100006274837C8378837883788378
      837883788378837883788378837C627400009809780578055705570557055705
      78055D023C02DE0E9809980500000000000000001142734E0000000000000000
      000000000000000000000000000000000000F301BF369F2A7F269F267F227F22
      7F1E7F1E7F1A7F1A7F167F167F127F12F301AD6DA37CA37CA37CA37CA37CA37C
      A37CA37CA37CA37CA37CA37CA37CA37CAD6DFA115F333F2F1E271E23FE1ADE16
      BD0E9D0A5D065D029D021C027805000000000000524695520000000000000000
      000000000000000000000000000000000000F401BF369F2A9F2A7F269F267F22
      9F227F1E7F1E7F1A7F1A7F167F167F12F401A668A36C85046304630463046304
      4304430443004200420042004200A37085681B127F373F2F3E2B1E27FE1EFE1E
      BE16BD129D0A7D061C027D027809780500000000744E195F0000000000000000
      00000000000000000000000000000000000015021F4FBF367F2A7F2A9F267F26
      7F267F227F227F1E7F1A7F1EDF321F3FF501E870C4684A21E71CE71CC618C618
      A514A51484108410641063106308C46801683C129F3F7F3B5F335F333E2B3E27
      FE22FE1EDE16BE129D0E7D0AFE165E3F98050000944ED772167F000000000000
      00000000BD7F527A0000000000000000000015021F53FF4AFF46DF3E9F329F2E
      9F2A9F2A9F26DF32FF36FF3EFF3AFF3A1502E874CB71CF350821E81CE71CC718
      C618A514A5148410841084106408E46C01645C169F439F3F7F3B5F375F2F3F2B
      1E271E23FE1EDE1ABD127D0A5E3F7C1E78050000B55218732579A879EA7D8779
      937E727E6378426CC474267946790000000036021F53FF4AFF4AFF4AFF46FF46
      FF42FF42FF42FF3EFF3EFF3EFF3AFF3A16024B75CC755246534632428D2D8D2D
      6B256B254B254B254A212A212A21CB754B757D16BF4B9F479F3F9F3F7F3B7F37
      5F333F2F3E2B1E231E1F5E3FFA11780500000000D656397725798879EB7D8779
      0579E4786378426CC474467946790000000037021F53FF4AFF4AFF4A1F4F1F4F
      1F4F1F4B1F4B1F4B1F471F471F471F473702327A2D7EEC7DEC7DEC7D0C7E0C7E
      A97D887D887D887DCA7D0C7E0C7E2D7E327ABD1EFF6FDF6BDF6BDF6BDF67DF63
      BF5B5F333F2B3E275E3FBE127805000000000000F75A5A7B25798879EB7D8779
      0579E4786378426CC474467967790000000058021F57FF4EFF4EFF4E58023802
      38023802380238023802380238023802000000006B7DB17E0D7E0D7E0D7E0D7E
      0D7E0D7E0D7E0D7E0D7E0D7EB27E296900009D165D0E5D0E5C0E5C0E5C0E3C0E
      5C129F3BDF63BF5FFA1198050000000000000000F75E7B7B25798879EB7D8779
      0579E4786378426CC474467967790000000059021F57FF4EFF4EFF4E39020000
      0000000000000000000000000000000000000000E878307E0D7E2D7E2D7E2D7E
      2D7E2D7E2D7E2D7E2D7E0D7EEE75C76C00000000000000000000000000000000
      BD16BF47BF5B3E33980500000000000000000000185F7C7B25798879EA7D6779
      0579E4786378426CE47447796779000000005A023F573E533E533F575A020000
      00000000000000000000000000000000000000000000107E307E157F4F7E2D7E
      2E7E2E7E2D7E4F7E157F2F76117E000000000000000000000000000000000000
      BD16BF57FA117805000000000000000000000000185FBD7F677D8879A97D6779
      0579E478A478C6740575467946790000000000005A025A025A025A0200000000
      000000000000000000000000000000000000000000000000E8784B79157FF47E
      D37ED37EF47E157F4A6DC76C0000000000000000000000000000000000000000
      DE1A3E33B90D00000000000000000000000000003246B55200000000597FF57E
      B37E937E187F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000327E4B79
      E874E8744B79327E000000000000000000000000000000000000000000000000
      FA11B90D0000000000000000000000000000000000000000000000000000750D
      3C5F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000D115B011DD7B000000000000000000001D4BBC2E
      9C229C22BC2E1D4B0000000000000000000000000000F300D200D20095190000
      000000000000000000000000000013050000000000000000000000000000F719
      5B0ED809960D0000000000000000000000000000000000000000000000000000
      00000000000000000000F311FE01DE01B10D0000000000007B221E3B5E435E43
      3E433E435E435E431E3B7B2200000000000000000000F3001B023B0696190000
      00000000000000000000BE73F815D2000000000000000000000000000000F819
      5B12D90DD70D0000000000000000000000000000000000000000000000000000
      0000000000000000B3055C0EDE01DE01141600000000FC3E5E435E433E3F3E3F
      3E3F3E3F3E3F3E3F3E435E43FC3E0000000000000000F4003B063B0A961D0000
      0000000000000000BE73B200BD12D2000000000000000000000000000000181E
      7C1AF911D8110000000000000000000000000000000000000000000000000000
      00000000BE73D501FE3ADE36190A982E000000005A1E3F3FF200F200DC323E3F
      1E3B1E3B3E3F3E3F7A2612015F3F5A1E00000000000015015C0E7C12B61D0000
      000000000000FB56BB2E9C125C0AF3000000000000000000000000000000181E
      9C1A1A12F8110000000000000000000000000000000000000000000000000000
      00000000F601DE3E1F4BDE36992E000000000000FD323E3F000000009B2A1E3B
      1E3B1E3B3E3FBC2EF61DFB4E3E3FFD3200000000000015017C127C12B71D0000
      00000000FB56F3009C125B0E7C0E14050000000000000000000000000000391E
      BC223A16F9150000000000000000000000000000000000008835462DEB418835
      4F4E1563F9013F535B1ABB2E000000000000DB42FD361E37000000009B26FD36
      FD36391EDA4A000000009E6B1E37FD36DB420000000056059C16BD1AD81D0000
      0000182E3D3F9C169C167C169D16150500000000000000000000000000003922
      DC265A1A19160000000000000000000000000000BC7788355973BE7F7C7F7B7F
      4E566631B842FB01BC2A00000000000000003926DD32FD36000000009B26FE36
      7509382A0000000000009E6BFD36DD323926000000007605BD1ADD1EF8210000
      182E760DBD169C169C169C16BD16350500000000000000000000000000005A22
      FD2A5B1E3A1A0000000000000000000000000000F5620000DE7FBD7F7B7F5A7B
      1777387BCA3D796F00000000000000000000F8151D47FD3600000000D7117D63
      000000000000000000009E6FFD361D47D715000000009705DD22FD223A2A9715
      9F57DD1ADD1EDD1EBD1EBD1EDD1E77090000000000000000000000009B36FC3E
      FD2E9B221916BB3A00000000000000000000386700000000DE7FBD7F7B7F5A7B
      F67616779066EB3D00000000000000000000D7151D3F1D4300000000B70D3C53
      00000000000000000000BE6F1D431D3FD715000000009805FD22FE263A263D5F
      7E4F9F53DD1EDD22DD22DD1EFE22770900000000000000000000BE6F7E571D33
      FD321D331A163A1ABE6F00000000000000008731BD7FBD7FBD7F9C7F9C7F9B7F
      597BF576F4764D5A00000000000000000000F71DFD3AFD3A00000000DC2EDC2E
      391ABB36000000000000DE73FD3AFD3AF71D00000000D9091E2B1E2F3A220000
      3D5B7705BF5F1E2BFD26FD261E27B8090000000000000000DF773A161D331E37
      1D371D371A161A163A1ADF77000000000000A8359C7F9C7F9C7F7B7F7B7F387B
      D4723777D4726F5E000000000000000000009A3E3D47FC3600000000DC36FC3A
      FC3ADC363D5300000000BF73FC363D479A3E00000000DA093E2F3E335A220000
      00003D5B3D43BF5FFE26FE2A1E2BB90900000000000000005D4F5E473E3B3E37
      1E371E37BC225B1A3B1ABC26000000000000C9397A7F7A7F5A7B7B7F387B0000
      7B7F597BD3726E5A0000000000000000000000009A325D4B00000000DC2EDC32
      DC32DC32DC32DC32FD3E7E5F5D4B9A320000000000001A0A3E335F377B260000
      00000000DF77D909BF633E373E33FA0D000000000000FD427E475E435E4F9E5F
      7E5F7D5F7D577B1E5B1E5C1A1D4700000000B2565A7F387B387B597B597BBD7F
      7A7F387BB1726F52000000000000000000000000740DDB3EDC32DC32DC2EBC2E
      BC2EBC2EBC2EBC2AFC36FD3ADB3E740D0000000000003B0A5E375F3B7C260000
      000000000000DF77FC32BF673E331A0E00000000DC3200000000BE6B9D6B9D6B
      1C3F1C3F7C673B53DA36DA465A679B2600000000915E177BF576D37237771777
      F576D3729156BD7700000000000000000000000000003832BB361C3F1C3F1C3F
      1C3F1C3F1C3F1C3F1C3FBB36383200000000000000005C0E7F3B7F3F9C260000
      000000000000000000005B1AFF6F7C1600000000FC32DC263B0A5B0A5B0A5B0E
      5B0E5B0E5B0E5B0E5B125B0E7B1ABB2A00000000904E915E16771677F572F472
      D2728F6A9B73000000000000000000000000000000000000530D592A1C3F1C3F
      1C3F1C3F1C3F1C3F592A530D000000000000000000007C0E7F479F4BBC260000
      000000000000000000000000FD2A9C1A000000009E635E4F1E3FFD2EFD2EFD2E
      3E3B3E3BFD2EFD2EFD2E1E3F5E4F9E6300000000000000001663B256B25AB356
      7A6F0000000000000000000000000000000000000000000000000000583A9415
      530953099415583A00000000000000000000000000009D169C129C12FD2E0000
      0000000000000000000000000000BD1E00000000000000000000000000000000
      A66442640000000000000000000000000000000000000000000000003D4BDC2E
      BC26BC26DC2E3D4B00000000000000000000000000000000A154896100000000
      00000000000000008961C1540000000000000000000000008C612959004C004C
      00580058004C004C295D8D65FF7F000000000000000000000000000000006470
      317E837843640000000000000000000000000000000000009B223E3F5E475E43
      5E435E435E435E473E3F9B22000000000000000000000000437B607F6165A150
      00000000A1504165C07E627A00000000000000000000A5646278837883788378
      83788378837883788378837883782160000000000000000000000000C674A574
      83786278427442600000000000000000000000000000FC3E5E435E435E435E43
      5E435E435E435E435E435E43FC3E00000000000000000000E576407F407FE07E
      A150A150807EE07EA07E22760000000000000000000064608378A378A378A378
      A378A378A378A378A378A378A3780160000000000000000000006478927EA478
      837883788378637C6460000000000000000000005A1E3E3F3E3F3E3F3E3F3E3F
      3E3F5E433E3F3E3F3E3F3E3F3E3F5A1E0000000000000000A465607F207F207F
      007F007FE07EC07EC07E4265000000000000000000002264E478047905790579
      E478E4780479057905790579C474856800000000000000006478A578C478A378
      A378837883788378426C636000000000000000001D373E3BBB2A5E3F3E3B3E3B
      3E3FD7155E433E3F3E3B3E3B3E3FFD360000000000000000AA65807F207F207F
      007F007FE07EC07EC07E646100000000000000000000096DCB7D057925792579
      497EAC7E05792579257925798370AE75000000000000A678157F677D0579E578
      C478A478A378A378A37CA47CA55C00000000DC421E3BBC2A0000FB4A191A1E37
      3E3B34055C5F950D1D331E3B1D371D37DC420000000000008150617F407F207F
      007F007FE07EE07EA07EA150000000000000000000000000CD79F47E6679C87D
      4B7F4B7F6C7F297E8779A87D2975000000000000E778A5780979E878EE79AA7D
      C478C478C478837408654A65E75C4A6100003926FD369C2A0000000099365505
      3E3B5405000000003401391AFD36FD323926000000000000466A817F407F207F
      207F007FE07EE07EC07EC171000000000000000000000000017CAD7D0C7E877E
      4576C46D087FC87EA87D837C00000000000000000000000000000000EE7DCA7D
      E478E478E478A37800000000000000000000F8193D4BDC2E0000000000000000
      9D67D70D0000000000000000792EBB36F81500002D6AAB72A97FA97F8A7F8A7F
      677F447F017FE07EC07EC07E206504590000000000000000A614A614840C096A
      857E857E857EE254A60CA61000000000000000000000000000000000EE7DCA7D
      E478E478E478A37800000000000000000000D7153D431C3F0000000000000000
      3C57B70900000000000000009A36DC3AD7150000CA72EA7FA97FA97F897F897F
      8A7F8A7F6A7F6A7F477F277F477F286E0000000000000000A614A614A6104F7F
      A67EA67EA67EC67EA614A614000000000000000000000000000000000E7EEB7D
      05790579057DC47800000000000000000000F71D1D3FFC3A00000000FC3E7A22
      DC2A391600000000BB2EFC3A1D3F1D3FF71D0A66F97FF57FA77FA87F887F897F
      897F8A7F697F697F487F487F917FD97F0A660000000000000000A614CF6A097F
      E97EE97EE97E097F8610AE35000000000000000000000000000000000E7EEB7D
      25790579057DC478000000000000000000009A3E3D4BFC3600003D53FC3A1D3F
      1D3FDC367E63BB321D3B1D3BFC3A3D4B9A3E8F6E4E6AB16E7B7BDE7FF57F887F
      897F897F697F8C7FBB7F7B7BB26E6E6A8F6E0000000000000000A614737F707F
      2B7F097F097F2A7F850C734E00000000000000000000000000000000F57EB27E
      467D2579257DC478000000000000000000000000BA325E4FFC32FC32FC32FC32
      FC32FC36FC32FC32FC32DC325E4FBA32000000000000000000000000EA65D67F
      897F897F8A7FEB65000000000000000000000000000000000000A614F06AB37F
      927F927F927FEB45A6144B2900000000000000000000000000000000D57ED37E
      4E7E2D7EA87D0679000000000000000000000000950DFC3E3D47FC36DC2EDC2E
      DC2EDC2EDC2EDC2EFC363D47FC3E950D000000000000000000000000F472F572
      897F897FAB721577000000000000000000000000000000000000C7188935F57F
      B37FD47F64088510A6146B2900000000000000000000000000000000577FD37E
      4E7E4E7E4E7EEC7900000000000000000000000000003832DB363D433D433D43
      3D433D433D433D433D43DB36383200000000000000000000000000000000B272
      A87FA97FB27200000000000000000000000000000000000000002921E81CC718
      8B352925C718C718C718534A00000000000000000000000000000000577FF37E
      4E7E4E7E4D7EEC7900000000000000000000000000000000540D7A2A3C3F1D3F
      1C3F1C3F1D3F3C3F7A2A540D0000000000000000000000000000000000000000
      F57FAB7F00000000000000000000000000000000000000000000114209210921
      E81CE81CE81CE81CE71CFF7F00000000000000000000000000000000EE79307A
      107A107A1076CE750000000000000000000000000000000000000000583A9515
      540954099515583A000000000000000000000000000000000000000000000000
      0A6A0A6A0000000000000000000000000000000000000000000000006C2D0921
      8C2D103E09210921000000000000000000000000000000000000FF7F162A7411
      75097509750995193C5B000000000000000000004374857484708470646C646C
      64686468646463606360435C425822500000000000000000000000000000F95A
      4F1D4F1570154F15D12D75460000000000000000425C8360A460A464C568E568
      066D066DE66CE66CE66CE66CC568C468B47A000000001C5B190E7B12F80DB60D
      540DF729960DB60D3A0E740D0000000000004474887989798879687968792679
      9B7FDE7FC3740675C574C574A5748474214C00000000000000001336781A781A
      771A771A771A771A771A771A991E4F1500002158215C4160626483680068626C
      5176727A836C006483646264215C215C846400003C5B950D5A12960DFB52BE73
      000000000000BE73D61DBE7300000000000022748879A979887988796879E374
      00000000A2740675C574C574A5748474214C000000000000553E9115771A771A
      771A771A781A781A771A771A981A4F1500002158215C415C62642064EE71BD7F
      FF7FFF7FFF7F307600606260215C205CA46400005B1A5A1AFF7BDF7BB611B711
      583600009511B711382E3C5B0000000000000000707A88798879887968790475
      00000000C3740675C574C574A57885780000000000000000771A781A771A771A
      361A2E11964A964A6F1D9115B91E7015000041580058215C005CD676FF7F186F
      20580058186FFF7F5A7B005C205C005884607D679C1ED7157D67B6159C1E9C1E
      3A1A96119B1E9C1E9B1EF815FF7F000000000000A6742D7A8879887967794779
      40744074C3740675C574C574A57C42580000000000007C6B981A781A781A981A
      6F215542000000000000FF7F4F154F150000425C00582058AD69FF7F31620050
      4168416800541066FF7F5272005800548460F721191A7D67191ABC26793A0000
      D71D5A1EBC26D715BA42D7157A1E182600000000F77E2370687988796879E374
      00000000A2740675C574C5742254D772000000007019F315981A981A981A981A
      F419F419F419F41900000000000000000000425C00540054BD7FFF7F00502064
      4260426020600054FF7FFF7F005000548360F815F81500009B22DC2600000000
      0000F721BC26F81500003D5FDD2AF8150000000000004B75887968796879C374
      0000000081740675C574C578A558000000000000B91AB91A981A981AB81AB81A
      D91AD91AD91AD91E00000000000000000000425C0054004CFF7FF77200640064
      0064006400640060EF69FF7F0050005483605926191A00009C26FD2E00000000
      00000000FD2E9B26000000005A1EFD2E0000000000000000CE75917ECC790479
      000000008174E574C578426000000000000000000000D321B81AB81AD91A9115
      000000000000000000000000000000000000625C005C005CFF7F7372006C006C
      006C016C006C00688C71FF7F00600058836059267A2600007B22FD32DF770000
      00000000DD2EDC2E00000000191AFD3200000000000000000971727A0E7AAB79
      00000000E57469796A79095D00000000000000000000F425B816B81AD91AB215
      000000000000000000000000000000000000626400680064FF7FFF7F00680068
      FF7FFF7F00680068BD7FFF7F0060006863647A2EFC3E3C5359265E4B191ADF77
      000000007B221D37BF7300007A2A5E4F0000000000000000000009712E7AAA79
      000000006979CC792961000000000000000000009C479C477C437C477C477C47
      7C3B7C3B7C3B7C3F000000000000000000006268006800689472FF7F84700068
      FF7FFF7F0068006CFF7FDE77006800686368FC465E4F7A2ABE6F9B323D4B5A26
      00000000BB325E4F5D5B00009A2A7E53000000000000000000000000927E8979
      000000006979CC7D0000000000000000000000001A4B1A4B7B437B437B439C47
      F936F93AF93AF93A0000000000000000000063680068006C006CE764FF7F296D
      FF7FFF7F6B75FF7FEF61006400680068636400005E4F5E4F00000000FC3A7E53
      7F537F53BB325E4F9B2E00005E4F3D4B000000000000000000000000096DB37E
      ED79ED79CC790A6500000000000000000000000000000000BD5B9B439B439C43
      15261A5700000000000000009732762A00008368006C006C00700070CE650068
      FF7FFF7F216C186F006800700068006862640000BB2E7E537B2600001D4B7A26
      1D3FBB32DC42BB2A9B2A5D577F53BB32000000000000000000000000957A6C71
      CC79CC794B6D9576000000000000000000000000000000005B539C4B9C439C43
      9C47B836F94AD94A973A562ABC47762A00008368006C006C0070007400700074
      FF7FFF7F007000680074006C006C0068626400000000FC3E9F5B7E53FC429E67
      00000000FF7B7E5F1D3F9F577B22000000000000000000000000000000000000
      CD71CE710000000000000000000000000000000000000000000056269C479B43
      9B439B439B439B439B439B439B47972A0000836C006C00700074007400780078
      9C73BD6B0078007400700070006C006C4264000000000000DC327E535E4FFD3A
      9B22DC32DC323E479F5B3D4BDF77000000000000000000000000000000000000
      B57673760000000000000000000000000000000000000000000000009C5BBD57
      9B439B439B439B439B439B43BC47B82E0000836C006C0070007400740078007C
      006C00680078007400700070006C006C4264000000000000000000001D47DC32
      DD32DD32DD32FC36000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B936D932F93AD932D932D93E0000000000005A7FA470C574C574C574A474A474
      A4708470846C836C636863686364216400000000000000000000000000000000
      7805980500000000000000000000000000000000324A324A324A324A324A324A
      324A324A324A324A324A324A324A324AD65A0000172F3737FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000001E3FBD1E
      BD12BD12BD1E1E3F000000000000000000000000000000000000000000007805
      7C1E5E3F7805000000000000000000000000F04100001146324A324A324A324A
      324A324A324A324A324A324A1146D65A534E383789011E33FF261B0F383BFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000007D125E2F9F3B9F3B
      7F3B7F3B9F3B9F3B5E2F7D12000000000000000000000000000000007805FA11
      5E3FFE16780978050000000000000000000011467C7339673967396739673967
      396739673967396739673967396B7B6F7452FF7F5E4B7F573F3BFF32F9067A4B
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000DD367F3B7F3B7F377F37
      7F377F377F377F377F3B7F3BDD360000000000000000000000009805BE125E3F
      7D0A7D0A7D021C0298050000000000000000524EDE7BDE7BDE7BDE7BDE7BDE7B
      DE7BDE7BDE7BDE7BDE7F9C6F15067642D65AFF7F5D4BDF6F9F1A5F02DB06DB06
      3833FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00003C0E5F331E271E231E23FE22
      FE1EFD1EDD1EDD1EDD1ABD1E7F373C0E00000000000000009805FA115E3F1E1F
      BD129D0E1C029D0298095801000000000000534EFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FBD73190FD84EF75EFF7F3A2BFF7FFF013F02DB0EDB06
      DC0A5833FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001E271E1F7E577E535E535D4F
      3D4B3D4B1C4BFC46FC42FC42BD1E3E2B00000000000078053E33BF5F3E271E23
      DE1ABE127D065D02DE0E3C02580100000000F8629C739C739C739C739C739C73
      9C739C739C739C739C739C739C779C73B65AFF7FFF7F5B3B7E019E013F025F02
      DB06DB065933FF7FFF7FFF7FFF7FFF7FFF7FBC3A3E2BDE160000000000000000
      000000000000000000000000B8113F2BBC3A0000B90DFA11BF5BDF633F2B3E2B
      FE1EDE169D0A5D063C02BD0E990558010000FF7F5B6F5B6F5B6F7B735B6F5B6F
      5B6F5B6F5B6F5B6F5B6F5B6F5B6F5B6FFF7FFF7FFF7FFF7FFF1D7E011F023F02
      DB0EDB06DC0A5A33FF7FFF7FFF7FFF7FFF7FFA151E27DE1AFD2ADD26BC229C1E
      5B1A3B1A1A16F915D811B811B8111E27FA15B90D3E33BF57BF479F3B5F333F2F
      1E23FE1EBD129D0A5D023C021E1F3C025801FF7FFF7FFF7FFF7FAA047111A904
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDB267E019E01
      3F025F02DB06DB067A33FF7FFF7FFF7FFF7F99055E43FE223C061C06DB01BA01
      58013701F500D400B3009200BD1A5E439905FA11DE1ABD16BD165C12BF5B5F33
      1E27FE22BE16BD0E78057801580158015801FF7FFF7FFF7FEB08701D57167111
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF1D7E01
      1F023F02DB0EDB06FC0A7A33FF7FFF7FFF7F78055E3B5E3B0000000000000000
      00000000000000000000FF773E375E3B780500000000000000003C0EDF637F37
      3F2B3E27FE1EDE1657050000000000000000FF7FFF7F0D0D7C47781677167716
      7111CB0CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFB26
      7E019E013F025F02DB06DB067B33FF7FFF7F78113E333E331E2F3D3F00000000
      0000000000000000391E9C223E333E33781100000000000000005C0EDF677F3B
      5F2F3E2BFE1EFE1A57050000000000000000FF7F4F0DB3219816981678167716
      57167111FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      DF197E011F023F02DB0EFC06F01D7B33FF7F5A367E431E2B1E2FFD2600000000
      00000000000000005B1A3E2F1E2B7E435A3600000000000000005C0EDF6B9F3F
      5F375F331E271E23570500000000000000009211D31971159C57B812B8169816
      CB0CEC0C0C0D0C0DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFC2E7E019E013B02AF25DE7F512E9C4300009C229E4BFD22FD22BD1EBE6F
      000000005D5B1A16FD22FD229E4B9C22000000000000000000005C0EDF6B9F3F
      7F3B5F333E2B1E2757050000000000000000FF7FFF7FFF7FBD53D812B816B816
      0D11FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FDF197F01B025DE7F512E5103770B0000F5001D2F5E3F1D2BDD1E9C1E
      000000001A16DD1A1D2B5E3F1D2FF500000000000000000000005D0EDF6B9F47
      9F3F7F3B3F2F3F2F78050000000000000000FF7FFF7FFF7FBC531913F916F916
      4F11FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F194FFF7F3232D707D603981300000000F729DD2A5E375E375E37
      9B227B225E3B5E375E37DD2AF7290000000000000000000000005D0EFF6FBF4B
      9F439F3F7F375F3378050000000000000000FF7FFF7FFF7FBC53191319171917
      4F11FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F323A3B0BDB0BD707FF77000000000000D3005B165E333E37
      FD2AFD2A3E375E335B16D30000000000000000000000000000009D16BD1E7D16
      5C163C121B12FA1198090000000000000000FF7FFF7FFF7FD92ED92EB82E982E
      7111FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F3D1F7C1BFF77FF7F0000000000000000000017321311
      D300D300131117320000000000000000000000000000955229213A6700000000
      00000000000000003A672921D65A000000000000000000000000000000000000
      0000FA5A1015931D93195019B952000000000000000000000154015400000000
      0000000000000000000000000000000000000000000000000000000000000000
      73157215FA5600000000000000000000000000000000282D8414524E00000000
      0000000000000000724E8414492D0000000000000000000000000000D952B325
      DC22BB22BB22BB22BB22BB22DB26BB22BD73000000000000B572426001500000
      000000000000000000000000000000000000000000000000BE73D425F419151A
      561A561A361AF519D425BE7300000000000000003E4BD80DB60919165A223A1E
      391E191EF81DF819950D11011201793E00000000000000000000000099421C33
      BB22BB22BB22BB22BB22BB22BB227219B41D0000000000000000215021640150
      0000000000000000000000000000000000000000000000005211151A561A561A
      561E561A561E561E151A521100000000000000005C125B1271115C125B125B12
      5B125B125B125B125C1292153A127C12000000000000000092211B53DB22DB22
      DB22BB22BA1EBB22BB22BB22D51D3C23774200000000000000000000A674437C
      01509C7B0000000000000000000000000000000000003636561A771AB419D952
      9826771AF52D3111771A771EF52D000000000000BE1A2A25E61C850C9C1A9C1A
      9C1A9C1A9C1A9C1A8F216B31420CDF1E0000000000000000FB4E1C27DB22DB22
      DB2237227D4FBB1EBB22B41D5C235B1B0000000000000000000000006360857C
      227001500000000000000000000000000000000000007319561A771AB94A0000
      B826771AB94A0000771E771A521100000000A71D3F2F4B21A5180A111E2F1E2F
      1E2F1E2F1E2F1E2FB125292964085F33A71D00009D6F3736FB1EFB22FB22FC22
      3B5F0000363AFA4A581A7C1F563E00000000000000000000000000004260A678
      6378637CA55C00000000000000000000000000000000D429B425B42500000000
      B826971AB94A0000971A771A931500000000A0095F373F3736267F373E373E37
      3E373E373E373E375F37572A5F375F3BA0090000B321BD53FB1EFB221C23B319
      000000000000573EFD53FA1E000000000000000000000000000000006B79C67C
      8378637400000000000000000000000000000000000000000000000000000000
      D826971AF52D5215971E971A521100000000E10DFD01BB221D3F1D431D431D43
      1D431D431D431D431D431D437A163801E10D0000BE4F1B1B1B1F1B23573E0000
      00000000000000000000000000000000000000000000000000000000B5764264
      C578C578216000000000000000000000000000000000000000003C635211D415
      971A971A971A971AB81AF519000000000000E20D77167B1A5D535D535D535E53
      5E535E535E535E535E535E53F8019401E20D3C637C2F1B1F1B1FFB1E00000000
      0000000000000000000000000000000000000000000000000000000000006B6D
      717ECC7D8B75226400000000000000000000000000000000F52D9315B81AB71A
      B71AB71AD81A771A521136360000000000000212861A3F3FDF77DF73DF77DF77
      DF73DF73DF73DF73DF77DF77FE3A24120212F6293B1B3B1F3B1F3C1FB9460000
      0000000000000000000000000000000000000000000000000000000000000000
      2A714F7EEC790D7E096D0000000000000000000000007D6B7B43D822971EB521
      F926D81AB94E0000000000000000000000000212C022FF32FF7BDF77DF77DF77
      DF77DF77DF77DF77DF77DF7B5C22C022021298365B1B3B1F3B1F3B1F371ED525
      000000000000000000000000000000000000000000000000000000009C7F2268
      4F7EEC7DED7D0D7E296D00000000000000000000000098465B437B47110D0000
      1923D81A984A0000000000000000000000004216E226881ABF5FBF5FBF5FBF5F
      BF5FBF5FBF5FBF5FDF5FDF632512E2264216B9365B1B5B1F5B1F7C1F5219FC22
      9D6B0000000000000000000000000000000000000000000000000000DE7F226C
      2D7E2E7E2E7E0D7ABD7F00000000000000000000000078427B437B43B4210000
      9B475A33FA529321F9163923784200000000421AE22AE12A6E124D162C122C12
      0B0E0B0EEA0DEA0DC909A909E22AE22A421A572E7B175B1F7C1FB91EDB225C1F
      FF7B00000000000000000000000000000000000000000000000000000000187B
      917E2E7E2E7E4E7E226C000000000000000000000000BE73BC537B3FF521D429
      9C4B7B43110DF5217B439B47000000000000821E022F022F022F022F022F022F
      022F022F022F022F022F022F022F022F821EBE6FDC4F7B17B41DFB221A1B5C5F
      0000000000000000000000000000000000000000000000000000000000000000
      C770EE794F7E6F7E0E7A64700000000000000000000000007319993E9B4B9B43
      7B3F7B3F9B439B43772A110D000000000000A222023302330233023302330233
      02330233023302330233023302330233A22200007C4F9C3FFB227B1F1B4F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00002270707E907E447000000000000000000000000000000000984677363B4F
      9B477B3FB82E562636360000000000000000FE7BA222C226C226C226C226C226
      C226C226C226C226C226C226C226A222FE7B00000000FB4A1B37DA4200000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000006570F079000000000000000000000000000000000000000000000000
      162EF629FA52000000000000000000000000000000000000000000000000BC77
      F75E9C73000000000000000000000000000000000000000000000000AD618554
      015401548554AD6100000000000000000000000000009C225A163A161912F911
      D811D811B611960D750D750D540D54110000000022502254214C000000000000
      00000000000000000000214C225422500000000000000000000000006F25B811
      7A26391E593E0000000000000000000000000000000000002154427443784378
      21782178437843784274215400000000000000009C1E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00004354847885786468425400000000
      000000000000000042546468857884784354000000000000000000009615F815
      BE6FDA46B611FF7F00000000000000000000000000006B616378437843784278
      737E737E42784378437863786B610000000000009C1E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A0000855C8474A574A578846822540000
      00000000000022548468A578A5748474A55C00000000000000000000D911B715
      00009C7319165C5F000000000000000000000000215C83788378837863782979
      0000000029796378837883788378215C000000009C1EBF5F9E5B9F63BF739E63
      5D4B3E3F1D37FD32BC229B1A3A0E3A0A00002258CE716A79C574C574A46C435C
      00000000435CA46CC574C5746B79CE71225800003967734ED65ABD77D621191A
      DE7B3046391ABE7300000000000000000000000063748378837883788378E678
      00000000E67883788378837883786374000000009C1EBF679F63BF6BDF77BF6B
      7E535E4B5E431D3BDC2ABC227B167B1200000000855CCE75C574C574E578A46C
      435C435CA46CE578C574C574CE71855C00009C73B8151816F819F8195732563A
      9B2A9C2E5D5B000000000000000000000000AE6DA478A478A478A478A478A378
      82788278A378A478A478A478A478A478AE6D00000000FD36DC32FC36FC3EBB32
      7A267A225A1E191AD811B70D96097509000000000000425CEE758A7906750675
      E574E57406750675AB79AD71435C00000000F75E391EDB3A0000FA5A9B265636
      5A227B220000000000000000000000000000C668C478C478C478C478C4788278
      000000008278C478C478C478C478C478A6680000DC2ABF5F9F5FBF6BDF779F67
      5E4F5E433E3B1D33BC229C1A5B0E5A0A0000000000000000A664EE7506750675
      0679067906750575CD716460000000000000BD77191A78365A6B31469B2A9C2A
      B54E8C2D3B635B63D756734A53467B6F00000871E578E478E478E478C378AA79
      00000000AA79C378E478E478E478E47822640000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00000000000000000000436448752679
      267526752675487943640000000000000000000097111816721D9515BB36582E
      954AB652F95A9D6BBF6FDF73BE73D7560000E870EC796879E478E578E478AA79
      00000000AA79E478E578E578E578E57801600000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00000000000000000000436426754779
      477947794779477543640000000000000000000000000000BE73000000000000
      32429D6BB652BD73195B3A63BE6FDF77F85A4B75EC79EC79ED79EC790579AA79
      00000000CB79E478057904798979EC7D4B710000DC2ADF6BBF67BF6FDF7BBF6F
      7E5B7E577E4F5E471D3BFC2EBB1EDC1E00000000000000006468067147794779
      6879687947794779E67044680000000000000000000000000000000000000000
      F039BE6FF95A0000000000007B6B195FF856327A0D7AEC79EC790C7AEC79927E
      000000002E7A8879CB790C7A0D7A2D7E327A00000000DC2EFC3AFC3EFC42DB36
      9A2A7A2A59263922181EF81DF719B615000000000000446C0675687968796779
      507A507A677968796879E670646C000000000000000000000000000000000000
      CE35DF735B67BD770000000000000000000000004B79B27E0D7A0D7A0C7AB27E
      00000000B27E0C7A0D7A0D7AB27E296500000000FD2E9F5F9F5BBF67DF739F67
      5E4B5E433D3BFD32BC229B1A3A0E3A0A0000000064702775887968790D7A0F7A
      436C436C307A0D7A68798879E674646C00000000000000000000000000000000
      113EBE6F9D6F7C6B000000000000000000000000E878307E0D7A2D7A0D7AB37E
      00000000B37E0D7A2D7A0D7AEE71C76C00000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A000044702775897988798879EE79C770
      00000000E8702F7A887988798979277564700000000000000000000000000000
      F75E3A63DF735B630000000000000000000000000000107E307A157F4F7E2D7E
      597F597F2D7E4F7E157F2F76117E000000000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A0000C774887989792E7A307A43700000
      0000000000004370307A2E7A89798879C6740000000000000000000000000000
      0000944ADF737C6700000000000000000000000000000000E8744A75157FF47E
      B27EB27EF47E157F2A69C76C0000000000000000FD2EBF639E5B9F63BF739E63
      5D473D3F1D37FD2E9C1E7B163A0A3A0A0000A6740D7AEB79307AE87400000000
      0000000000000000C674307AEB790D7AA6740000000000000000000000000000
      000000005B67185B0000000000000000000000000000000000000000527E4B79
      E874E8744B75527E0000000000000000000000000000BC26BC2ABB2A9B2A9A26
      5A225A1E391E181AF819D715B611951100000000A674C7746474000000000000
      000000000000000000006474E878A67400000000000000000000000038369611
      97019701B6113836000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ED00
      50095009500950095009500950095009CC0000000000000000000000D93A3616
      150615063616D93A00000000000000000000000000000000D9015C025C02BD1A
      5E3B3E3BBD163B025C02B80100000000000000000000343E2E159115141A781E
      8F250000352E9822361ED3190D15000000000000000000000000000000005632
      DE77DE73DE77DE779D6F9E73BE739D6F910D000000000000D405790E990E990E
      990E990E990E990E790ED40500000000000000000000392E7C065C065E4F7B2A
      5A265A269B2A5E4F5C025C02392E00000000000000009025771E771E561E771E
      964A00004F191B43561E571E701500000000000000000000000000000000763A
      DE77DE77DE77DE77DE77DE77DE77BE77910D00000000772EBA0E990E990EBA12
      BA12BA12BA12990E990EBA0E772E000000000000FA099D125E4BFB4ADD7BBD77
      000000005A6B3967793A5E477C0AD9050000000000000000F932561A771E971E
      343E974A0D155622771E771E0D1500000000000000000000000000000000773A
      DE77DE77DE77DE77DE77DE7BDE7BDE77910D00009305BA0E990E990EBA0EF425
      00000000F425BA0E990E990EBA0E930500000000BD1A9D121C4F0000BD77BD73
      734EB5565A6739671863793A7C0A9D0E00000000000000003B43771A771E771E
      F319D219351A771E771E771EF23100000000700DF321F321F321F321F321763A
      DE77DE77DE77DE77DE77DF7BDF7BDE77910D0000780EB90E990E990EBA0AF421
      00000000F421BA0A990E990EB90E780E00009A3ABD1E1E3B0000DE7BBD77BD73
      7C6F7B6F195776011863F75E1E379D169A3A1332B125553EB832771A771E771E
      771E771E771E771E771E981EB74E4F199025773ADF77DE77DE77DE77DE775532
      DE77DE77DE77DE7BFF7BFF7BDE779D6F9111773ADA0ED90EDA0ADA0ADA06F521
      00000000F521DA06DA0ADA0AD90EDA0E773A3A1ADD22BC320000DE7BBD77BD73
      9C737B7357019709F85EF75ADD32BD161A1A4F15561AD219771E971A971E971E
      971E971E971E971E971EB81E4F15351A4E199742DE77DE77DE77DE77FF7B7636
      DF7BDE7BDF7BDF7BFF7FDF7BBE737C6B91119215B90ADA0E352A152215227742
      00000000774215221522352ADA0EB90A92155B1AFE263E4B00003967BD77DE73
      005CBE167A2A396BEF3D0000DB3ADD1E5B12D2251A33F92AB71AB71AB71AB71A
      B71AB71EB71AB71AB71AB71AD826192FF325973EDE77DE77DE77DE77FF7F973E
      0000FF7BFF7FFF7FDE77BE737C673B5F911150057C373B1B0000000000000000
      0000000000000000000000003B1B7C3730057B1AFE2ADD3200003967BD77DE73
      4370956E5B6F3967EF3D00005A1EFE225B16B11D3A373A371A371A33F926D822
      B81AB81AD822D822192F1A333A373A37901D973EDE77DE77DE77DE77FF7F973E
      0000FF7FFF7FFF7FBE739D6F3C631A5791150F017B339C370000000000000000
      0000000000000000000000009C377B330F017B1E5F3FDC260000FF7FBD7B2278
      AE71DE737C6F7B6F5A6B5A67FD325F4B7B1EB746D3219119BD535A375A375A37
      5A375A375A375A375A375B37552E7B53553A973EDF77DE77DE7BDF7B0000B746
      0000FF7FDE7BBE737C6BD94ABE73F94E000050117C2F9C339832982E982ED946
      00000000D946982E982E98329C337C2F5011DC3ABF635E430000FF7F0A7D8678
      DE739D737C6F7B6F5A6B5A6B5E439F5FDC3A0000000000009C4B5A375A375A37
      5A375A375A375A375A377A373532B219BE77B846FF7BFF7BFF7FFF7F0000B846
      0000FF7FBD779D6F3B5F98429D6BD94A00003536BD479C2F9C2F9C2F9B2FB82E
      00000000B82E9B2F9C2F9C2F9C2FBD4735360000BF5FBF675E530000FF7BDE77
      F75E39677C6F7B6F5A6FFB46BF679F5B0000000000007C637B3F7A377A37562A
      B846B84697329B4B7A377A37152A00000000B84A0000FF7FFF7F0000DE77D94A
      0000DF7B9D6B5B63D94A552E0000000000000000D82ADD579B2F9B2F9B2FF92E
      00000000F92E9B2F9B2F9B2FDD57D82A00000000FD32BF677F475E53DE7BDE77
      420C420C7C6F7B6F1C477F47BF67FD2E000000000000B8427A337A379B37D31D
      00000000D31D9B437A377A37F42100000000D94A0000FF7FFF7FDF77D84A973E
      3B5F1A5BF94EB8467636342A0000000000000000CC009C3FBC4B9B3B9B2BFA32
      00000000FA329B2B9B3BBC4B9C3FCC00000000000000FD3ADF67BF6F7F4B3E3B
      7E4F7E4F3E3F7F4BBF6BBF67FD3A0000000000000000F94AD8365B4BBC539B4B
      00000000DC5BBB4B9B4B1A43151E00000000F94E0000FF7FBD739D6FD94E3B5F
      352E0000000000000000000000000000000000000000D3297B37BB4FBB4FBB4F
      BB4FBB4FBB4FBB4FBB4F7B37D329000000000000000000003E37BF63BF6FBF67
      9F5B9F5BBF67BF6FBF631E33000000000000000000000000F94A9732151E151A
      00000000351E151E141A5626000000000000F94EFF7FDF7B9D6F7C67B842F952
      000000000000000000000000000000000000000000000000CC00B722BB4BBB4F
      BB4BBB4BBB4FBB4BB722CC00000000000000000000000000000000003E431E2F
      3E373E371E2F3E43000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8423B5F1A5BF94EB84655320000
      0000000000000000000000000000000000000000000000000000000014362D11
      CC00CC002D1114360000000000000000000000000000197F0000000000000000
      00000000000000000000000000746B61000000000000B415F411F411F411F411
      F311F311F311F311F311F311B4150000000000000000000000000000583AB619
      B709B709B619583A0000000000000000000000004258435C435C435C425C425C
      425C425C425C425C425C425C4258425800000000467D457DE47CC67C00000000
      00000000000000000000AE6D417C6B61000000001F271F271F1B1F1BFF1A1F1B
      1F171F171F17FF161F171F171F17DF0A0000000000000000D90D7C0E5B0ADC1E
      5D435E43DC1E3B065B0AB809000000000000435CA574A574846C846C84748474
      84748474847484744360646C64746474435C0000667D257DE47CA27C00000000
      00000000000000007C7B00742074946E000000001F271F27FF1EFF1EFF1EFF1E
      FF1EFF1AFF1AFF1A1F171F171F17FF0A00000000000059327C127B0E7E579B2E
      7A2A7A2A9B2E7E575B0A5B0A5932000000006360A574A57422542254A574A574
      A574A574857485742250225484748474436000004E7E257DE47CE37C107A0000
      0000000000000000007C227C295D0000000000001F2BDF2ADF22DF22DF22DF26
      DF26DF26FF1EFF1EFF1AFF1A1F17FF0A000000001A12BC1A5E4F1C537B6FDE7B
      8410734E7B6F3A67993E7E4F7C12F90D00006364C57043580000DE7F4358A570
      C574C57484684258000000004358846C63600000287DCA7DE47CE37C417CDE7F
      0000000000009576017C227C39770000000000001F2BDF2ADF26DF26DF26DF2A
      DF26DF26DF26FF22FF1EFF1E1F1BDF0A00000000DD1E9C1A3C5700008410DE7B
      BD77BD773A678410396BBA427B129C16000064648464435800000000AD69435C
      C574C574435895720000DE7F435CA570636400000000007CE47CE37CA37C417C
      00000000007C217C217C006400000000000000001F2BDF32DF2ADF2ADF2ADF2A
      DF2ADF2ADF2ADF26DF26DF22FF1AFF0E00009A3EDD223D3F84109C73BE77BD77
      9C739C6F5B6B5A67841018633D3BBC1A9A3E8468067506754360957600000000
      4360436000000000AE6D4360E574E574646400000000397F4E7EE37CA37C837C
      DE7F9C7F227C217C007CAE6900000000000000001F2BFF36DF2ADF2ADF2ADF2A
      DF2ADF2ADF2ADF2ADF26DF26FF1EDF0E00003A22FD26DC363967BE77BE77BD77
      9C739C6F5B6B5A6718631863FD3ABC1E3A22846826752675C56C436000000000
      AE6DAE6D000000006360E5700675067584680000000000006B7D287DA27C837C
      427C427C227C227C397B000000000000000000001F2BFF3ADF2EDF2EDF2EDF2E
      DF2EDF2EDF2EDF2ADF2ADF26FF1EDF1200007B1EFD2A5E5384100000BE77BD77
      00000000630C630C630C734EFC3EFD265B1A4A7147794779277927794364F071
      00000000AE71436426752675267526754A6D00000000000000006478AA7D827C
      627C427C427C01740000000000000000000000001F2BFF3EDF2EDF2EDF2EDF2E
      DF2EDF2EDF2EDF2EDF2ADF2ADF22BF0E00009B1E1D2FFD36F75E0000BD77BD77
      630C734E000000009C737C6F7B26FD2A7B1A6B71EC798A79477947796468AE71
      00000000F0716468277926798979CC796B710000000000000000317EE47C837C
      637C637C21745A7F000000000000000000000000FF2AFF42DF32DF2E7F369F3A
      7F327F327F327F32DF2EDF2EDF22BF0A00009B265E43DC2E0000FF7FDE7BDE7B
      630CB65A9C739C6F5A6BB65A1D3B7E4F7B226B710E7A0E7AED794B7100000000
      73765276000000004B71AC75ED79ED796B710000000000006A7DEC7DCB7DAB7D
      297D087D847C2274000000000000000000000000FF2A1F47DF329F32B515F819
      18161816181618169F32BF2AFF22BF0A0000DC3EBF675E4BDE7B8410DE7BDE7B
      630CF75E9C739C6F84107B6F5E479E63DC3E8B750E7A0E7A4B71527600000000
      4B714B7100000000F87A4B710D7A0D7A6B7100000D7E4F7E0D7E0D7ECC7D2F7E
      6C754B75317E4B7D2A7DB5760000000000000000FF2A1F479F2A78321763D55E
      D55ED55ED55E166BB211DF1EFF22BE0E00000000BF67BF6B7E5B0000BD73BD77
      DE7BBD77BD737C6F7B731C4BBF6BBF5F00008C750E7A4B75DE7F0000F87E4B75
      2E7A2E7A4B75537A000000004B75AC798B75957E707E4F7E2E7E0D7E927E317E
      00005B7FF079957E4B7D4A7D0000000000000000FF2A5F5FDF3ABA42DE7B7B6F
      9C6F9C6F7C6FFE7F9315BE22FF26BE0E000000001D37BF6B7E4F7E5B84103967
      630C7C6F9D7384103C4F7E4FBF6B1D3700008C75ED796B75000000004B75CD79
      2E7A2E7A0E7A4B75DE7F00004B75ED798C75527E707E707E927ED57EB67E0000
      0000000000005A7FCF75747E727E0E7E9C7B000000000000000000007B6F0000
      1042F75EDE779B7300000000000000000000000000001D3FDF6FDF6F9E535E43
      7E577E575E437E53BF6FDF6F1D3F000000008C794F7A4F7A6B794B794F7A4F7A
      2F7A2F7A2F7A2F7A6B796B792E7A2E7A8C75CF7D377F167F727EAE7D00000000
      0000000000000000F77AAD6D317A937EEF710000000000000000000000009C73
      314618639C730000000000000000000000000000000000003D3BDF67DF73BF6B
      BF5FBF63BF6BDF73BF673D3B0000000000008C794F7A4F7A0E7ACD794F7A4F7A
      4F7A4F7A4F7A4F7A0E7AEE792F7A2F7A6C750000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      524A734E0000000000000000000000000000000000000000000000003E431D33
      3E3B3E3B1D333E430000000000000000000000008C798C798C798C798C798C79
      8C798C798C798C798C798C798C798C7900000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000F524845
      A338A33848450F4E0000000000000000000000001963BD770000000000000000
      0000000000000000000000000000000000000000000000000000000037323211
      740D740D3211373200000000000000000000B51D74097409740D74097409740D
      74097409740D74097409740D74097409B51D00000000000080448050C064E070
      00790079E068A058A050804C00000000000000005A6B944E7B6BBD7700000000
      000000000000000000000000000000000000000000000000740D7E679E6F7E6B
      FF7BBF737E6B7E6B1C575409000000000000950D1D4B1D4B3A0EFC42FC463A0A
      1C4B1D4F5A161D4FBC363A0E1D4BFC46950D00000000725AC05CE070207D207D
      007D007D207D207DC060A054304E00000000000019634B293963BD7700000000
      00000000000000000000000000000000000000000000172ADF7BBF73BF737E6B
      DF7BBF737E6B7E675E637E6B172A00000000950D000000003A0E000000003A0E
      000000009B2E00009E6F3A0E00000000961100008048C070C0746074AA61206C
      E070E070A070807088614074C068A0540000000018639C733246F85EBD770000
      0000000000000000000000000000000000000000B611DF7B9F73BF73DF7B9F6F
      BF77DF779E6F7E6B5D635D635E6B750D0000B6111D4F1D4F5B16FC4ADC3A5B1A
      1D4F1D4F7B1E1D4FDC3A5B161D4FFC4AB6110000C06CC074A170506EFF770659
      E074E070206C9276DF73695DC06CC07000000000000018630921944E7B6BBD77
      00000000000000000000000000000000000000007E6B9E6FBF73BF73DF7BDF7B
      BF73DF7B9E6F7E6B5D635D635D63FC520000B611000000007B1A000000007B1A
      00000000DC3A00009E6F7B1A00000000D719305A8068A0684068C36CFF6F0000
      E6580064000000009176406880604064EE4D0000000000009C736C2DF75A3967
      FF7F0000DA52D8215D67000000000000000079369E6F9F6FBF77DF77FF7BDF7B
      5E67DF77BF737E6B5E675D633D5F3D637936F71D000000009B1E000000007B1E
      00000000FD3A0000BF739B1E00000000F821484D40606060A068006C7B6FFF6F
      DE7BD56E0000000000684068405C406027490000000000003967BE773242F85E
      BC7B00001B023B06DA09BE73000000000000B6119E6FBF73BF77DF77DF77BF6F
      BF730000DF779F6F5E675D633D5F3D5FB615181EBF73BF731D43BF6F9E6BFD3A
      9E6F9E6F3D4BDF735E5BFD42BF73BF6F1822815440604068606860680068806C
      BD6F0000D56E006080686068606C4064A24C0000000000000000000095524A2D
      78013B065B0E5C0E7C123E3700000000000059263D5B3D5B5E639E6B9F6F0000
      00000000BF73BF73BF73BF739E6F7E6BD719181E000000001D43000000001D3F
      000000003D530000BF771D4300000000182281504068606C606C606C00680E6A
      FF7B00007B73075960706068606C606CA24C000000000000000000007A733209
      3B0A5B0E7C129C16FD267E4F7E630000000059263D5B3D5B5E637E639F6FDF7B
      00000000FF7BBF73DF77BF779F739E6FF81939227F5B9F5F3E4B5E575E573E4B
      5E577E5B3E4B5E5B5E533E4B9F5F7F5B39224859606C606C206C006CFF6FFF7B
      2F76626C00000000E6580068606C606C284900000000000000009E735C0A5C0E
      7C129C16BD1AFD221D3F5E4BBF5F9E5F0000191A1D573D5B5D5F5E639E6B9E6F
      DF777E67BF73DF7BDF77BF779F6F9E6FF8193922F7211205FC425E4F5E4B5E4F
      3E4B3E4B5E4F5E4F5E4FFC3E1205F7213922B46A2070206C416C516EFF7B0000
      A16C616CBD7F0000FF776A5D406C60740F4A0000000000000000D8197C127C12
      9C1ABD1AFD267E53FC52D71D9F57BF670000BB3E1D5B3D5B5D5F5E637E6B9F6F
      9E6F7E6BDF7BFF7BDF77BF779F6F9E6FBB3E5A2A96117B1E79329F5B7F5B7F5B
      7F5B7F5B7F5B7F579F5B7A367B1E95115A2A00002F7AF67EE4742F7A7B7F307A
      B47A937AED792F7A177B80740579687D00000000000000000000B80DBD1ABD1E
      FD267E4BDC3E0000BB3EBB32FF7B9E5F000000005E5F1D5B3D5B5D5F7E679E6B
      DF77BF73BF77DF77DF77BF77BF733D63000059261822BC2A7A36DB42BB3EDB3E
      DB3EDB3EDB3EDB3EDC429A36BC2A182259260000685DBC7F0E7A927AD57A167F
      177FF67EB37A2F7AEC7905752E7EC350000000000000000000003D5FDD1E1D2B
      9F571D37000000005D47FF739E5B0000000000007B225E673D5B5D5F7E679E6B
      DF77DF77BF73DF7B9E6FDF77BF773A1E000000009A325E437936000000000000
      00000000000000000000BA3A5E439A320000000000003873F57E7A7F387FBC7F
      DE7F9B7FD47E717E177F797F525200000000000000000000000000003D4B9F57
      9F571E371D3BBF63BF63000000000000000000000000FC3A5E673D5F7E677E6B
      BF73DF77BF73BF73BF739E73DC3A000000000000BB36FD361C4F000000000000
      000000000000000000003D57FD369B360000000000000000EC5D587B7A7F177F
      177FF67E167F7A7F377F48590000000000000000000000000000000000005E4B
      BF5BBF5BFF6FFF77000000000000000000000000000000009C265E5F7E677E67
      BF73DF77BF73BF737E677B220000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000176F9366
      72665166ED553156000000000000000000000000000000000000000000000000
      BF6BDF73FF7B000000000000000000000000000000000000000000001D43BC22
      BC2ABC2A9C221D430000000000000000000000000000000000000000D2001309
      0000000000000000000000000000000000000000FF7F94520821420821048510
      650865042104640CCF39524A0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000191E191E181E181E
      F81DF819D819D815B715D71D000000000000000000000000330DF3001C023D02
      F400BE7300000000000000000000000000000000103EC614C718C618640C0000
      5A16BB268410C618C718C718C618630C00001401F300F300D300D200D200D200
      B200B100B100B100B100B100B100B200D20000000000BB3E5E4F5B1EFC42BF6B
      5A1EF8195E4FBC2A181E1D47000000000000000000000000F3001C021C023D02
      5801F500000000000000000000000000000000001142A614C718C718A6140000
      9B1E1C3F8410C718C718C718E718630C0000F4009D129D129D129D127C0E7C0E
      7C0E7C0A5C0A5C0A5C0A3C063C063B06D20000000000BB3E1D3F5D53FC429E63
      5D535D533D43BC2ABB363D470000000000000000330DF3001C021C023D025D06
      5D0A9E0E1601BF7300000000000000000000000032468D31E81CE81C8C310000
      DC2ABE6B4B29E718E81CE81CC6186C2D00001501FD26FD26FD26FD26DD22DD22
      DD22DD1EBD1EBD1EBD1ABC1A9C169C16B10000000000DC3EBF6BBE6BBE6BBF6F
      9E637E5F7E5F7E633D4B3D4B0000000000000000F4001C021C023C025D065D06
      7D0A9D0EBA0536010000000000000000000000002925734EE81CE81C11420000
      FD32DF778D31C718E81CE81C8410D65A000036053E433E433D433D433D3F3D3F
      3D3F1D3F1D3B1D3B1D3B1D3B1D371D37B20000000000DC42BF6F1C439E6BBF6F
      BB361C477E5F1D431D473D47000000000000B2001C021C023C025D067D0A7D0A
      7D0E9E12BE12FF165805BF7300000000000000005B6BE718CF398D3100009C6B
      5E3F5E43DE7B000009210821BD77000000000000000000000000000000000000
      3D5F9715000000000000000000000000000000000000FC425E477E633D539E63
      7E639E635E477E633D533D4B00000000000034093F273C025D065D067D0A7D0E
      BE129E12DE16DE161B0A790500000000000000000000D65A734EBD7700000000
      3B5F000000000000E81CA5100000000000000000000000000000000000000000
      970D970D000000000000000000000000000000000000FC423D53DF773D53BF6B
      DF77BE6F7E5BDF735D573D4B0000000000000000F400D9095D067D0A9D0E9E0E
      BE12BE16DE1AFE1A1F233F27BA05DF73000000000000000000002A25ED7E867E
      657E657E2476EE51FF7F0000000000000000000000000000000000003D579709
      DD1EDD1E77095A3200000000000000000000000000001D43BF6FFC3E9E67BF6F
      BB321C4B7E63D2691C533D4B0000000000000000BF73F5005F377D0A9E12BE12
      BE16DE16FE1AFE1E1F231F239D1ADB05000000000000000000008D7E867E867E
      867E867EA67E83650000000000000000000000000000000000000000B809DC2E
      FD26FD267C16770500000000000000000000000000001D47FD36BB327A2E9E63
      1C437A2A4E718378865C3D4B00000000000000000000000036013B12BE0EBE12
      DE16DE1A1F273F333E3F7F539F4B9F4FDF730000000000000000537FC87EC87E
      C87EC87EC87E097F00000000000000000000000000000000DF77FA0D3E2F3E33
      3E2F3E2F1E2F3E2F98093D5B000000000000000000001D475E4BDF775D579E67
      DF77BE6F976E0F7A905D3D4B000000000000000000000000BF735801DF633F2F
      5F375F437F477C1A1D4BFB05DF679F4F7E5B000000000000797F537F507F2D7F
      E97EE97EE97E297F00000000000000000000000000000000FA0DDC2E3E375E37
      3E333E333E333E335B16B809000000000000000000003D47BF739E67BF6FBF6F
      BE6B9E637E631B5F5D4F3D4B000000000000000000000000000000007901FD32
      5F3F5F3FFE2A1D4B00000000BF5F9F53BD260000000000005A6BE71C8D5E507B
      717F717F727FD37F9C730000000000000000000000007C1A9F437F3F7F3B7F3B
      5F3B7F3B5F3B5F375F377F3BD909DF730000000000003D4BFD2AFD26BC1E9C16
      7B0E5B0E3B0A3B0A3A0A191A00000000000000000000000000000000DF739A01
      BF675F433E3BFB090000DF77BF5B9F539D1A0000000000005B6BC718A610A610
      B37F927FB37F6D565A6B000000000000000000009C1A3E379F479F479F479F47
      7F477F477F477F477F437F437B1A1A160000000000005E4B5E3F1D33FD2ADD22
      9C1A9C165B0E5B0A3B0A3A160000000000000000000000000000000000000000
      DB011E377F479F4F7F479F4F9F539F539E120000000000009C73E81CE81CE81C
      8A316A31A614C7185A6B0000000000000000BD1EDD1EDD1EBD1ABD1ABD1ABC1A
      9C1A9C1A7C167C167C165B165B167B1A3B16000000005E4BBF63BF639F5F9E5F
      7E535E4B5D433D3F3D43BC2A0000000000000000000000000000000000000000
      DF73FB05DF6FBF5F9F539F4F9F4FBF57BE1A00000000000000000921081DE81C
      E81CE818E81CE71C000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005E4BBF63BF63BF63BF63
      9E5F9E5B7E577E535E4BDC2E0000000000000000000000000000000000000000
      00000000DF737F5BDE2A9E1A9E0EBE1A0000000000000000000000002A250921
      4A253146CE395A6B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003D373D371D371D37
      1D371D33FD32FD2EDD2A3E430000000000000000000000000000000000000000
      BC05BC0500000000000000000000000000000000005C01600160015C01600160
      015C016001600160015C015C015C015C00000000E058005D005D005D005D005D
      005D005D005D005D005D005D005DE05800000000113E52460000000000000000
      000000000000000000000000000000000000000000000000000000000000BC05
      7D16FC0900000000000000000000000000000160227C227C227C227C227C227C
      0178A2780178227C227C227C227C227C0160005DC17D2065A661E058C17DE17D
      E17DE17DC179E17DE17DE17DE17DE17D005D0000DE7BF75E534A000000000000
      00000000000000000000000000000000000000000000000000000000BD05BC05
      BD1ABC0900000000000000000000000000000164427C427C427C427C427C427C
      0078997F0074427C427C427C427C427C01642061005DB16EFF7FDE7F2065027E
      E27D005D225D606DE27DC1750061A1712061000009217B6F734A114200000000
      0000000000000000000000000000000000000000000000000000BD051E2F1F2F
      3C16DB0500000000000000000000000000002168627C627C627C627C627C627C
      007400002C7A0178627C627C627C627C21644065F472FF7FFF7FFF7F8F6EA171
      816D5877FF7FA665C275A665FF7F1473406500007B6FB6563A67B65610420000
      000000000000000000000000000000000000000000000000DD053D0E3F37FE2A
      3B1ABA0DFC11BC0DDC09DC09BC09BC053B052168827C827C827C827C827C827C
      00740000E9792174827C827C827C827C21684069D172FF7FFF7FFF7F6D6EC275
      40655877FF7FA665E275A665FF7FF47640690000B6567B6F6B2D3A6731423142
      00000000000000000000000000000000000000000000FD057F4B5F431E331E2F
      DE26DE22BE1A9D1A7D125D0E3D0A1D06D800216C837CA37C837C837CA37C827C
      9A7F00000070A37CA37CA37C837C837C216C6169A1718469DE7F1477C275447E
      AF72FF7F3677616D816D1377FF7F2A6E61690000000000000000B6563A67744E
      103E000000000000000000000000000000000000FE059D1A7F4B3F3F3E371E33
      FE2ADE26DE1EBE1A7E127E123D0A3D06F800216CA37CA37CA37CA37CA37C0070
      00000000006C627862786278A278A37C016C616D657E0376616D816D657EE375
      DE7FFF7FC669E3752065DE7FFF7F6369616D000000000000185FBD776B2D3A67
      F03D114200000000000000000000000000003E06DF6FBF6F7F475F473F3B3E37
      1E2FFE2ADE22BE1E9D169D165D0E5D0AF800A875E3740070006C006CE2700000
      000000000000000000000000357BA26CA875826D867E857EE375A2714A72DE7F
      FF7FFE7F447A867E787BFF7F4A72E375826D00000000000000000000BD77514A
      5601FB01FA01FA011A0297010000000000005E06DF6FDF775F475F475F3F3E3B
      1E33FE2EDE22DE229E1A9D165D0E5D0EF90088758779BB7F00002B7AFD7F0000
      0000000000007A7F7A7F797B4E72A26C8875A26DED7EC371AF76367BFF7FFF7F
      FE7FC46DA77EA271FF7FFF7FC46DEB7EA26D00000000000000000000B65A2C19
      3B063B061B061B061B061B0659360000000000001E065D0ADF77BF635F435F43
      1E331E371E2FFE2ADE22DE1E9D167D0E3901A8796775797F0000B17A00000000
      000000000000000000000000F476676DA879C371CC7EAE76FF7FFF7FBC7FD07A
      A97A0D7F6A76FE7FFF7F797B2E7F0E7FC371000000000000000000001C575E53
      7C167C167C167C167C167C125C12770D0000000000001E06BF5FDF775F435F3F
      3E379F5BBF639F5F7F577E537E4B1E331901A8796675797F0000B17600000000
      000000000000000000000000B176466DA879C3712F7F4876347BCE7A4876CC7E
      ED7E4876FE7FFF7FBC7F48762F7F2F7FC371000000000000000000005A2E5F47
      9D1A9D1A9D1A9D1A9C1A9C1A7C165B260000000000000000FE05FD01DF77BF6B
      3E377D123D0A3D0A1D0AFD05DC05BC057C05A8796671797B0000B17600000000
      0000000000009A7B9A7B9A7B25652C7EA879E375507F307FCB7E897A487ACE7A
      FF7FFF7FFF7FBA7FEC7E507F507F507FE37500000000000000000000BB367F53
      FE2EFE2EB60DDF773E475E4B5F477B2A00000000000000000000FE059F4FFF7B
      3E33DD050000000000000000000000000000A9796671797B0000B176DD7F0000
      00000000000000000000000025652C7EA979E379517F687E9A7F9A7FFF7FFF7F
      FF7FFF7F347F477A517F517F517F517FE379000000000000000000003D4FDF73
      7F4F7F535D5F0000BF731D3F5F4B7B26000000000000000000000000FE05BC01
      9F4F3D0A0000000000000000000000000000C97D666DF47A797B4E720465BC7F
      000000000000000000000000A8716E7EC97D037A517F897EFF7FFF7FFE7F987F
      687EAA7E727F727F727F727F727F727F037A0000000000000000000000001D43
      7F539F531D43F721DB3A9F531E3F9E6F0000000000000000000000000000DD05
      FE2A7D160000000000000000000000000000A97DA971666D466D466DEB79E464
      0C6EF476F476F476F476F476A9716E7EC97D037A727F0D7FCD7ECD7E687ECA7E
      517F727F727F727F727F727F727F727F037A0000000000000000000000009F6B
      DF6F9F5B9F57BF5BBF577F4F1C4F000000000000000000000000000000000000
      1E061D0600000000000000000000000000000000C97DC97DC97DC97DC97DC97D
      C97DCA7DEA7DEA7DEA7DEA7DC97DC97D00009A7F037E247E247E247E247E247E
      247E247E247E247E247E247E247E037E9A7F0000000000000000000000000000
      FF7B7F5FFE3A9C2EDD3A9F6B0000000000000000000000000000000000000000
      00000000000000000000D529000000000000000000000000000000002E0D2E0D
      0D05ED04ED04ED040000000000000000000000000000000000000000392E9809
      9901990198097A3A000000000000000000000000000000000000000000003B57
      BE73000000000000000000000000000000000000000000000000000000000000
      000000000000000077015601000000000000000000000000000000002E0DDA36
      77127712F50DED0400000000000000000000000000000000FA0D5C061D377B2E
      DA01FB019B3A7B1E3C02DA09000000000000000000000000000000007201980E
      F509B41100000000000000000000000000000000000000000000000000000000
      00000000000074191B027601000000000000000000000000000000002E0DDA36
      78127812150EED0400000000000000000000000000001C57BD123E33BF730000
      1B063B060000FF7FFD2A5C067D670000000000000000000000007D67B80E3C13
      FB16D50900000000000000000000000000000000783E34051401140114011401
      77017701D9051B061B0AD9053401F7290000000000000000000000002E0DFA36
      980E7812150EED04000000000000000000000000BB3E5C0AFC52000000000000
      3B0E5C0E0000000000005D675C0A5B3200000000000000005201F90E7C135B13
      FB12BB129301572E000000000000000000000000B9011B061B061B061B063B0A
      350135013B0A1B0A3B0E3B0E5C0E1B0EBE73000000000000000000002E0DFA36
      9812980E350EED040000000000000000000000009C2AFE1E9E6B000000000000
      3B0E7C0E000000000000DF7BBD12FA0D000000000000BE6F190B9B137C135B13
      FB12BB127B1673010000000000000000000035011B0A1B0A3B0A3B0E5B0E5701
      0000000097015C125C127C125C127C12B80970112E0D2E0D2E0D2E0DED04D92E
      B80EB80E350EED04ED04ED04ED04ED04ED0400009D16DD16DC2E1D4F00000000
      5B129D1600000000BF735B1E9D129D12000000005201390BBA0F9A139C131B2F
      DF4FFC1A7A125B1272011B5300000000000055053B0E3B0E3B0E3B0E7C127701
      0000000097057C127C167C167C167C16D90D9111760E760E760E760E760ED92E
      D90EB90E350E350E760E760E760E760E500900005E3F7E47BF6F000000000000
      7C16BD160000000000003D5B3E437F3F0000BE73380BD80FB90F9A0F3B2F7201
      F511DF577B125A12180E7201000000000000D80D5C125C127C167C167C16D905
      00000000D9099D1A9C1A9C1A9D1A9C1A3A16B2153A0F3A0F3A0F1A0F1A0F1A0F
      F90EF90ED90ED90EB90EB80EB80E981270090000000000000000000000000000
      DE22FE2200000000000000000000000000003B577B1FD70FDA1B7C2FBE6F0000
      000093059F4B7A125A125B12720100000000391A1D37BC227C167C169D1AF905
      00000000FA09BD1E9D1A9D1ADD2A3D3F5A1ED2155B0B5B0F3A0F3A0F1A0F1A0F
      1A0FF90EF90ED90ED90ED90EB80EB80E7109000000000000BF6FDD329C2AFC4E
      DD1EFE22FC4E9C369C229E6B000000000000000072017A1F7C33720100000000
      0000BE6FFC367F4B5A125A12B505B41100003A1A3E433E433E473E473E47DD2A
      00000000DD2A5E4B5E4B5E475E4B3E4B7B22F315BD27DD27BD27BD279D2B3A0F
      3A0F3A0F190FF90E5C2B5C2B3C2B3B2BB30D0000000000007E533E3F7F473E3F
      3E371E2F3E3F5F475F433D4700000000000000000000BE735C5B000000000000
      000000005C5F71011F3B3A0E5A125B1277325A1E3E473E473E473E473E47DD2A
      0000DF77DD2A5E4B5E4B5E4B5E4B5E4B9B22F311F311F311F311F311F3117C37
      3A0F3A0FD80E91099109910991099109910900000000000000005E4F9F5F0000
      FE261E2B00007E5F1D4300000000000000000000000000000000000000000000
      0000000000001B535F473F3B5A125B12D4117B225E4B5E4B5E4B5E4B5E4B3E43
      DF6FDF6F3E3F5E4F5E4F5E4F7E4F7E4F5B1600000000000000000000B30D9D37
      7B0F7B0FF90EB30D000000000000000000000000000000000000000000000000
      1E2B3F2F00000000000000000000000000000000000000000000000000000000
      0000000000000000572EB4097201572E00007B225E4B5E4B5E4B5E4B5E4F3E3F
      00000000FC3A7F4F7E4F7E4F7E4F7E537B1E00000000000000000000B30D9D3B
      7B0F7B0FF90EB30D000000000000000000000000000000000000000000005E4B
      7F3F7F431E370000000000000000000000000000000000000000000000000000
      00000000000000000000572E1B5300000000DC325E4B7E4F7E4F7E4F7F4F1E3F
      00000000BB329F537F537F537F537F4FBC2A00000000000000000000B30DBD37
      9B0F9B0F3A0FB30D00000000000000000000000000000000000000009F5B5F37
      BF6BFF777F3F9F57000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005B1A7E537E4F7E4F7F4F7F4F1E3F
      BC2EBC2EBB327F4F7F4F7F4F7F53BF5FFD4200000000000000000000B30DBE37
      7A0B7A0B3A0BB30D0000000000000000000000000000000000000000BF677F43
      3E375E477F439F57000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007C1EFD361D3B1D3B1D3B1D3B
      1D3F1D3F1D3F1D3B1D3F1D3FFD2EDD2A000000000000000000000000F3117716
      781A781A7716F31100000000000000000000000000000000000000000000DF6F
      9F539F53BF630000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000154015400000000
      0000000000000000000000000000000000000000000000000000000000000000
      73157215FA5600000000000000000000000000000000427C8A65627E427A427E
      34363B0A3A0A3A0A745BE62AC62AE72AFF7F00000000000000008C5D00500050
      004C004C004C00508C5D0000000000000000000000000000B572426001500000
      000000000000000000000000000000000000000000000000BE73D425F419151A
      561A561A361AF519D425BE7300000000000083788378837C4160A27E817AA17E
      AD315C0E5A127B122D1AE62AC62AE72E8511000000000000215C2174006C0068
      0068006400640070217800600000000000000000000000000000215021640150
      0000000000000000000000000000000000000000000000005211151A561A561A
      561E561A561E561E151A5211000000000000A378A378A37C6168C17EA17AC17E
      AE357C127B169B162D1AE62EC62AE72EA511000000006B6141780070957A0000
      00000000F776005C007421786B610000000000000000000000000000A674437C
      01509C7B0000000000000000000000000000000000003636561A771AB419D952
      9826771AF52D3111771A771EF52D000000004F7E4F7E707E83708C7F277F247F
      CE3DBD1A9C1EBC224E1EE62EE62E072FA5110000426462780070327A00000000
      000000000000000021580078217801640000000000000000000000006360857C
      227001500000000000000000000000000000000000007319561A771AB94A0000
      B826771AB94A0000771E771A521100000000707E707EB17E62748B7F4B7F8C7F
      EF49DD22BC22BC264E1EE62EE62E072FA5158C69827841740070000000000000
      0000000000000000DE7B0060217441788C69000000000000000000004260A678
      6378637CA55C00000000000000000000000000000000D429B425B42500000000
      B826971AB94A0000971A771A931500000000FF7FF47EF57E337F8A7F6A7FAB7F
      30565F4B5D4F1D3B6F22E62EE62E0733C5152268627861784174000000000000
      000000000000000000002164417441780168000000000000000000006B79C67C
      8378637400000000000000000000000000000000000000000000000000000000
      D826971AF52D5215971E971A521100000000FF7FFF7FFF7FFC7F8A7F8A7FAA7F
      305A7F4F5D4F7E576F22E532E62E0633C5152268827862784274000000000000
      00000000000049750000216441746278016800000000000000000000B5764264
      C578C578216000000000000000000000000000000000000000003C635211D415
      971A971A971A971AB81AF519000000000000FF7FFF7FFF7FFB7F8A7F8A7FAB7F
      305E7F537E537E5BD5367057E6320637E515216C827882786274000000000000
      00000000000021640000416461748278016C0000000000000000000000006B6D
      717ECC7D8B75226400000000000000000000000000000000F52D9315B81AB71A
      B71AB71AD81A771A52113636000000000000FF7FFF7FFF7FFF7FAC7F857F857F
      F0667F577E579E5BD536705707370637E519C6708278827862740000DE7F0000
      0000000000002164000082686178617863700000000000000000000000000000
      2A714F7EEC790D7E096D0000000000000000000000007D6B7B43D822971EB521
      F926D81AB94E000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      DF6B9E5B9E5B9F5FF6366F5B70576E53051AE874897989796A7900005A7F0000
      00008975000049757C77486D88798979C674000000000000000000009C7F2268
      4F7EEC7DED7D0D7E296D00000000000000000000000098465B437B47110D0000
      1923D81A984A000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      DF6F9E5B9E5B9F5FF63A6F5B7057915B251AE874A979A9798B7900005A7F0000
      000069710000ED752775897D89798979C67400000000000000000000DE7F226C
      2D7E2E7E2E7E0D7ABD7F00000000000000000000000078427B437B43B4210000
      9B475A33FA529321F9163923784200000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F9F5B9F579F5737476F5B7057905F451EEF79D27ECA790E7E00005A7F0000
      0000C4700000ED75CA79C979A979CA7DF079000000000000000000000000187B
      917E2E7E2E7E4E7E226C000000000000000000000000BE73BC537B3FF521D429
      9C4B7B43110DF5217B439B47000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FDF6BDF6BB8636F5B705B905F461E00004A79D37E8979957E5A7F0000
      0000C4700000EE75CA79CA79EA7DE77800000000000000000000000000000000
      C770EE794F7E6F7E0E7A64700000000000000000000000007319993E9B4B9B43
      7B3F7B3F9B439B43772A110D000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FD76F905B905B905F662200000000CE79F37ECA79537A187B
      0000C47000002871EB790B7ECF79000000000000000000000000000000000000
      00002270707E907E447000000000000000000000000000000000984677363B4F
      9B477B3FB82E562636360000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FD76F8F5B8F5B905F86220000000000004A79F37EA9798879
      8D7527750675EB7D0C7A07790000000000000000000000000000000000000000
      000000006570F079000000000000000000000000000000000000000000000000
      162EF629FA52000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FB46F8C5F8C6329470000000000000000EF7D08790879
      0879087908790879F07D0000000000000000000000009C225A163A161912F911
      D811D811B611960D750D750D540D54110000000022502254214C000000000000
      00000000000000000000214C22542250000000000000955229213A6700000000
      00000000000000003A672921D65A000000000000000000000000000000000000
      0000FA5A1015931D93195019B9520000000000009C1E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00004354847885786468425400000000
      00000000000000004254646885788478435400000000282D8414524E00000000
      0000000000000000724E8414492D0000000000000000000000000000D952B325
      DC22BB22BB22BB22BB22BB22DB26BB22BD7300009C1E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A0000855C8474A574A578846822540000
      00000000000022548468A578A5748474A55C00003E4BD80DB60919165A223A1E
      391E191EF81DF819950D11011201793E00000000000000000000000099421C33
      BB22BB22BB22BB22BB22BB22BB227219B41D00009C1EBF5F9E5B9F63BF739E63
      5D4B3E3F1D37FD32BC229B1A3A0E3A0A00002258CE716A79C574C574A46C435C
      00000000435CA46CC574C5746B79CE71225800005C125B1271115C125B125B12
      5B125B125B125B125C1292153A127C12000000000000000092211B53DB22DB22
      DB22BB22BA1EBB22BB22BB22D51D3C23774200009C1EBF679F63BF6BDF77BF6B
      7E535E4B5E431D3BDC2ABC227B167B1200000000855CCE75C574C574E578A46C
      435C435CA46CE578C574C574CE71855C00000000BE1A2A25E61C850C9C1A9C1A
      9C1A9C1A9C1A9C1A8F216B31420CDF1E0000000000000000FB4E1C27DB22DB22
      DB2237227D4FBB1EBB22B41D5C235B1B000000000000FD36DC32FC36FC3EBB32
      7A267A225A1E191AD811B70D96097509000000000000425CEE758A7906750675
      E574E57406750675AB79AD71435C00000000A71D3F2F4B21A5180A111E2F1E2F
      1E2F1E2F1E2F1E2FB125292964085F33A71D00009D6F3736FB1EFB22FB22FC22
      3B5F0000363AFA4A581A7C1F563E000000000000DC2ABF5F9F5FBF6BDF779F67
      5E4F5E433E3B1D33BC229C1A5B0E5A0A0000000000000000A664EE7506750675
      0679067906750575CD716460000000000000A0095F373F3736267F373E373E37
      3E373E373E373E375F37572A5F375F3BA0090000B321BD53FB1EFB221C23B319
      000000000000573EFD53FA1E0000000000000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00000000000000000000436448752679
      267526752675487943640000000000000000E10DFD01BB221D3F1D431D431D43
      1D431D431D431D431D431D437A163801E10D0000BE4F1B1B1B1F1B23573E0000
      0000000000000000000000000000000000000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A00000000000000000000436426754779
      477947794779477543640000000000000000E20D77167B1A5D535D535D535E53
      5E535E535E535E535E535E53F8019401E20D3C637C2F1B1F1B1FFB1E00000000
      0000000000000000000000000000000000000000DC2ADF6BBF67BF6FDF7BBF6F
      7E5B7E577E4F5E471D3BFC2EBB1EDC1E00000000000000006468067147794779
      6879687947794779E67044680000000000000212861A3F3FDF77DF73DF77DF77
      DF73DF73DF73DF73DF77DF77FE3A24120212F6293B1B3B1F3B1F3C1FB9460000
      00000000000000000000000000000000000000000000DC2EFC3AFC3EFC42DB36
      9A2A7A2A59263922181EF81DF719B615000000000000446C0675687968796779
      507A507A677968796879E670646C000000000212C022FF32FF7BDF77DF77DF77
      DF77DF77DF77DF77DF77DF7B5C22C022021298365B1B3B1F3B1F3B1F371ED525
      0000000000000000000000000000000000000000FD2E9F5F9F5BBF67DF739F67
      5E4B5E433D3BFD32BC229B1A3A0E3A0A0000000064702775887968790D7A0F7A
      436C436C307A0D7A68798879E674646C00004216E226881ABF5FBF5FBF5FBF5F
      BF5FBF5FBF5FBF5FDF5FDF632512E2264216B9365B1B5B1F5B1F7C1F5219FC22
      9D6B000000000000000000000000000000000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A000044702775897988798879EE79C770
      00000000E8702F7A88798879897927756470421AE22AE12A6E124D162C122C12
      0B0E0B0EEA0DEA0DC909A909E22AE22A421A572E7B175B1F7C1FB91EDB225C1F
      FF7B000000000000000000000000000000000000FD2E9F5B9E5B9F67BF739E63
      5D4B3E433D3BFD32BC229B1A3A0E3A0A0000C774887989792E7A307A43700000
      0000000000004370307A2E7A89798879C674821E022F022F022F022F022F022F
      022F022F022F022F022F022F022F022F821EBE6FDC4F7B17B41DFB221A1B5C5F
      0000000000000000000000000000000000000000FD2EBF639E5B9F63BF739E63
      5D473D3F1D37FD2E9C1E7B163A0A3A0A0000A6740D7AEB79307AE87400000000
      0000000000000000C674307AEB790D7AA674A222023302330233023302330233
      02330233023302330233023302330233A22200007C4F9C3FFB227B1F1B4F0000
      00000000000000000000000000000000000000000000BC26BC2ABB2A9B2A9A26
      5A225A1E391E181AF819D715B611951100000000A674C7746474000000000000
      000000000000000000006474E878A6740000FE7BA222C226C226C226C226C226
      C226C226C226C226C226C226C226A222FE7B00000000FB4A1B37DA4200000000
      000000000000000000000000000000000000000000000000000000000000ED00
      50095009500950095009500950095009CC0000000000000000000000D93A3616
      150615063616D93A00000000000000000000000000000000000000000000BC77
      F75E9C73000000000000000000000000000000000000000000000000AD618554
      015401548554AD61000000000000000000000000000000000000000000005632
      DE77DE73DE77DE779D6F9E73BE739D6F910D000000000000D405790E990E990E
      990E990E990E990E790ED405000000000000000000000000000000006F25B811
      7A26391E593E0000000000000000000000000000000000002154427443784378
      217821784378437842742154000000000000000000000000000000000000763A
      DE77DE77DE77DE77DE77DE77DE77BE77910D00000000772EBA0E990E990EBA12
      BA12BA12BA12990E990EBA0E772E00000000000000000000000000009615F815
      BE6FDA46B611FF7F00000000000000000000000000006B616378437843784278
      737E737E42784378437863786B6100000000000000000000000000000000773A
      DE77DE77DE77DE77DE77DE7BDE7BDE77910D00009305BA0E990E990EBA0EF425
      00000000F425BA0E990E990EBA0E9305000000000000000000000000D911B715
      00009C7319165C5F000000000000000000000000215C83788378837863782979
      0000000029796378837883788378215C0000700DF321F321F321F321F321763A
      DE77DE77DE77DE77DE77DF7BDF7BDE77910D0000780EB90E990E990EBA0AF421
      00000000F421BA0A990E990EB90E780E000000003967734ED65ABD77D621191A
      DE7B3046391ABE7300000000000000000000000063748378837883788378E678
      00000000E678837883788378837863740000773ADF77DE77DE77DE77DE775532
      DE77DE77DE77DE7BFF7BFF7BDE779D6F9111773ADA0ED90EDA0ADA0ADA06F521
      00000000F521DA06DA0ADA0AD90EDA0E773A9C73B8151816F819F8195732563A
      9B2A9C2E5D5B000000000000000000000000AE6DA478A478A478A478A478A378
      82788278A378A478A478A478A478A478AE6D9742DE77DE77DE77DE77FF7B7636
      DF7BDE7BDF7BDF7BFF7FDF7BBE737C6B91119215B90ADA0E352A152215227742
      00000000774215221522352ADA0EB90A9215F75E391EDB3A0000FA5A9B265636
      5A227B220000000000000000000000000000C668C478C478C478C478C4788278
      000000008278C478C478C478C478C478A668973EDE77DE77DE77DE77FF7F973E
      0000FF7BFF7FFF7FDE77BE737C673B5F911150057C373B1B0000000000000000
      0000000000000000000000003B1B7C373005BD77191A78365A6B31469B2A9C2A
      B54E8C2D3B635B63D756734A53467B6F00000871E578E478E478E478C378AA79
      00000000AA79C378E478E478E478E4782264973EDE77DE77DE77DE77FF7F973E
      0000FF7FFF7FFF7FBE739D6F3C631A5791150F017B339C370000000000000000
      0000000000000000000000009C377B330F01000097111816721D9515BB36582E
      954AB652F95A9D6BBF6FDF73BE73D7560000E870EC796879E478E578E478AA79
      00000000AA79E478E578E578E578E5780160973EDF77DE77DE7BDF7B0000B746
      0000FF7FDE7BBE737C6BD94ABE73F94E000050117C2F9C339832982E982ED946
      00000000D946982E982E98329C337C2F5011000000000000BE73000000000000
      32429D6BB652BD73195B3A63BE6FDF77F85A4B75EC79EC79ED79EC790579AA79
      00000000CB79E478057904798979EC7D4B71B846FF7BFF7BFF7FFF7F0000B846
      0000FF7FBD779D6F3B5F98429D6BD94A00003536BD479C2F9C2F9C2F9B2FB82E
      00000000B82E9B2F9C2F9C2F9C2FBD4735360000000000000000000000000000
      F039BE6FF95A0000000000007B6B195FF856327A0D7AEC79EC790C7AEC79927E
      000000002E7A8879CB790C7A0D7A2D7E327AB84A0000FF7FFF7F0000DE77D94A
      0000DF7B9D6B5B63D94A552E0000000000000000D82ADD579B2F9B2F9B2FF92E
      00000000F92E9B2F9B2F9B2FDD57D82A00000000000000000000000000000000
      CE35DF735B67BD770000000000000000000000004B79B27E0D7A0D7A0C7AB27E
      00000000B27E0C7A0D7A0D7AB27E29650000D94A0000FF7FFF7FDF77D84A973E
      3B5F1A5BF94EB8467636342A0000000000000000CC009C3FBC4B9B3B9B2BFA32
      00000000FA329B2B9B3BBC4B9C3FCC0000000000000000000000000000000000
      113EBE6F9D6F7C6B000000000000000000000000E878307E0D7A2D7A0D7AB37E
      00000000B37E0D7A2D7A0D7AEE71C76C0000F94E0000FF7FBD739D6FD94E3B5F
      352E0000000000000000000000000000000000000000D3297B37BB4FBB4FBB4F
      BB4FBB4FBB4FBB4FBB4F7B37D329000000000000000000000000000000000000
      F75E3A63DF735B630000000000000000000000000000107E307A157F4F7E2D7E
      597F597F2D7E4F7E157F2F76117E00000000F94EFF7FDF7B9D6F7C67B842F952
      000000000000000000000000000000000000000000000000CC00B722BB4BBB4F
      BB4BBB4BBB4FBB4BB722CC000000000000000000000000000000000000000000
      0000944ADF737C6700000000000000000000000000000000E8744A75157FF47E
      B27EB27EF47E157F2A69C76C000000000000B8423B5F1A5BF94EB84655320000
      0000000000000000000000000000000000000000000000000000000014362D11
      CC00CC002D111436000000000000000000000000000000000000000000000000
      000000005B67185B0000000000000000000000000000000000000000527E4B79
      E874E8744B75527E0000000000000000000000000000000000000000583AB619
      B709B709B619583A0000000000000000000000004258435C435C435C425C425C
      425C425C425C425C425C425C4258425800000000000000000000000038369611
      97019701B6113836000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000D90D7C0E5B0ADC1E
      5D435E43DC1E3B065B0AB809000000000000435CA574A574846C846C84748474
      84748474847484744360646C64746474435C000000000000D9015C025C02BD1A
      5E3B3E3BBD163B025C02B80100000000000000000000343E2E159115141A781E
      8F250000352E9822361ED3190D15000000000000000059327C127B0E7E579B2E
      7A2A7A2A9B2E7E575B0A5B0A5932000000006360A574A57422542254A574A574
      A574A574857485742250225484748474436000000000392E7C065C065E4F7B2A
      5A265A269B2A5E4F5C025C02392E00000000000000009025771E771E561E771E
      964A00004F191B43561E571E70150000000000001A12BC1A5E4F1C537B6FDE7B
      8410734E7B6F3A67993E7E4F7C12F90D00006364C57043580000DE7F4358A570
      C574C57484684258000000004358846C63600000FA099D125E4BFB4ADD7BBD77
      000000005A6B3967793A5E477C0AD9050000000000000000F932561A771E971E
      343E974A0D155622771E771E0D15000000000000DD1E9C1A3C5700008410DE7B
      BD77BD773A678410396BBA427B129C16000064648464435800000000AD69435C
      C574C574435895720000DE7F435CA57063640000BD1A9D121C4F0000BD77BD73
      734EB5565A6739671863793A7C0A9D0E00000000000000003B43771A771E771E
      F319D219351A771E771E771EF231000000009A3EDD223D3F84109C73BE77BD77
      9C739C6F5B6B5A67841018633D3BBC1A9A3E8468067506754360957600000000
      4360436000000000AE6D4360E574E57464649A3ABD1E1E3B0000DE7BBD77BD73
      7C6F7B6F195776011863F75E1E379D169A3A1332B125553EB832771A771E771E
      771E771E771E771E771E981EB74E4F1990253A22FD26DC363967BE77BE77BD77
      9C739C6F5B6B5A6718631863FD3ABC1E3A22846826752675C56C436000000000
      AE6DAE6D000000006360E5700675067584683A1ADD22BC320000DE7BBD77BD73
      9C737B7357019709F85EF75ADD32BD161A1A4F15561AD219771E971A971E971E
      971E971E971E971E971EB81E4F15351A4E197B1EFD2A5E5384100000BE77BD77
      00000000630C630C630C734EFC3EFD265B1A4A7147794779277927794364F071
      00000000AE71436426752675267526754A6D5B1AFE263E4B00003967BD77DE73
      005CBE167A2A396BEF3D0000DB3ADD1E5B12D2251A33F92AB71AB71AB71AB71A
      B71AB71EB71AB71AB71AB71AD826192FF3259B1E1D2FFD36F75E0000BD77BD77
      630C734E000000009C737C6F7B26FD2A7B1A6B71EC798A79477947796468AE71
      00000000F0716468277926798979CC796B717B1AFE2ADD3200003967BD77DE73
      4370956E5B6F3967EF3D00005A1EFE225B16B11D3A373A371A371A33F926D822
      B81AB81AD822D822192F1A333A373A37901D9B265E43DC2E0000FF7FDE7BDE7B
      630CB65A9C739C6F5A6BB65A1D3B7E4F7B226B710E7A0E7AED794B7100000000
      73765276000000004B71AC75ED79ED796B717B1E5F3FDC260000FF7FBD7B2278
      AE71DE737C6F7B6F5A6B5A67FD325F4B7B1EB746D3219119BD535A375A375A37
      5A375A375A375A375A375B37552E7B53553ADC3EBF675E4BDE7B8410DE7BDE7B
      630CF75E9C739C6F84107B6F5E479E63DC3E8B750E7A0E7A4B71527600000000
      4B714B7100000000F87A4B710D7A0D7A6B71DC3ABF635E430000FF7F0A7D8678
      DE739D737C6F7B6F5A6B5A6B5E439F5FDC3A0000000000009C4B5A375A375A37
      5A375A375A375A375A377A373532B219BE770000BF67BF6B7E5B0000BD73BD77
      DE7BBD77BD737C6F7B731C4BBF6BBF5F00008C750E7A4B75DE7F0000F87E4B75
      2E7A2E7A4B75537A000000004B75AC798B750000BF5FBF675E530000FF7BDE77
      F75E39677C6F7B6F5A6FFB46BF679F5B0000000000007C637B3F7A377A37562A
      B846B84697329B4B7A377A37152A0000000000001D37BF6B7E4F7E5B84103967
      630C7C6F9D7384103C4F7E4FBF6B1D3700008C75ED796B75000000004B75CD79
      2E7A2E7A0E7A4B75DE7F00004B75ED798C750000FD32BF677F475E53DE7BDE77
      420C420C7C6F7B6F1C477F47BF67FD2E000000000000B8427A337A379B37D31D
      00000000D31D9B437A377A37F42100000000000000001D3FDF6FDF6F9E535E43
      7E577E575E437E53BF6FDF6F1D3F000000008C794F7A4F7A6B794B794F7A4F7A
      2F7A2F7A2F7A2F7A6B796B792E7A2E7A8C7500000000FD3ADF67BF6F7F4B3E3B
      7E4F7E4F3E3F7F4BBF6BBF67FD3A0000000000000000F94AD8365B4BBC539B4B
      00000000DC5BBB4B9B4B1A43151E000000000000000000003D3BDF67DF73BF6B
      BF5FBF63BF6BDF73BF673D3B0000000000008C794F7A4F7A0E7ACD794F7A4F7A
      4F7A4F7A4F7A4F7A0E7AEE792F7A2F7A6C750000000000003E37BF63BF6FBF67
      9F5B9F5BBF67BF6FBF631E33000000000000000000000000F94A9732151E151A
      00000000351E151E141A5626000000000000000000000000000000003E431D33
      3E3B3E3B1D333E430000000000000000000000008C798C798C798C798C798C79
      8C798C798C798C798C798C798C798C790000000000000000000000003E431E2F
      3E373E371E2F3E43000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001963BD770000000000000000
      0000000000000000000000000000000000000000000000000000000037323211
      740D740D321137320000000000000000000000000000197F0000000000000000
      00000000000000000000000000746B61000000000000B415F411F411F411F411
      F311F311F311F311F311F311B4150000000000005A6B944E7B6BBD7700000000
      000000000000000000000000000000000000000000000000740D7E679E6F7E6B
      FF7BBF737E6B7E6B1C5754090000000000000000467D457DE47CC67C00000000
      00000000000000000000AE6D417C6B61000000001F271F271F1B1F1BFF1A1F1B
      1F171F171F17FF161F171F171F17DF0A0000000019634B293963BD7700000000
      00000000000000000000000000000000000000000000172ADF7BBF73BF737E6B
      DF7BBF737E6B7E675E637E6B172A000000000000667D257DE47CA27C00000000
      00000000000000007C7B00742074946E000000001F271F27FF1EFF1EFF1EFF1E
      FF1EFF1AFF1AFF1A1F171F171F17FF0A0000000018639C733246F85EBD770000
      0000000000000000000000000000000000000000B611DF7B9F73BF73DF7B9F6F
      BF77DF779E6F7E6B5D635D635E6B750D000000004E7E257DE47CE37C107A0000
      0000000000000000007C227C295D0000000000001F2BDF2ADF22DF22DF22DF26
      DF26DF26FF1EFF1EFF1AFF1A1F17FF0A00000000000018630921944E7B6BBD77
      00000000000000000000000000000000000000007E6B9E6FBF73BF73DF7BDF7B
      BF73DF7B9E6F7E6B5D635D635D63FC5200000000287DCA7DE47CE37C417CDE7F
      0000000000009576017C227C39770000000000001F2BDF2ADF26DF26DF26DF2A
      DF26DF26DF26FF22FF1EFF1E1F1BDF0A00000000000000009C736C2DF75A3967
      FF7F0000DA52D8215D67000000000000000079369E6F9F6FBF77DF77FF7BDF7B
      5E67DF77BF737E6B5E675D633D5F3D63793600000000007CE47CE37CA37C417C
      00000000007C217C217C006400000000000000001F2BDF32DF2ADF2ADF2ADF2A
      DF2ADF2ADF2ADF26DF26DF22FF1AFF0E00000000000000003967BE773242F85E
      BC7B00001B023B06DA09BE73000000000000B6119E6FBF73BF77DF77DF77BF6F
      BF730000DF779F6F5E675D633D5F3D5FB61500000000397F4E7EE37CA37C837C
      DE7F9C7F227C217C007CAE6900000000000000001F2BFF36DF2ADF2ADF2ADF2A
      DF2ADF2ADF2ADF2ADF26DF26FF1EDF0E00000000000000000000000095524A2D
      78013B065B0E5C0E7C123E3700000000000059263D5B3D5B5E639E6B9F6F0000
      00000000BF73BF73BF73BF739E6F7E6BD7190000000000006B7D287DA27C837C
      427C427C227C227C397B000000000000000000001F2BFF3ADF2EDF2EDF2EDF2E
      DF2EDF2EDF2EDF2ADF2ADF26FF1EDF120000000000000000000000007A733209
      3B0A5B0E7C129C16FD267E4F7E630000000059263D5B3D5B5E637E639F6FDF7B
      00000000FF7BBF73DF77BF779F739E6FF81900000000000000006478AA7D827C
      627C427C427C01740000000000000000000000001F2BFF3EDF2EDF2EDF2EDF2E
      DF2EDF2EDF2EDF2EDF2ADF2ADF22BF0E000000000000000000009E735C0A5C0E
      7C129C16BD1AFD221D3F5E4BBF5F9E5F0000191A1D573D5B5D5F5E639E6B9E6F
      DF777E67BF73DF7BDF77BF779F6F9E6FF8190000000000000000317EE47C837C
      637C637C21745A7F000000000000000000000000FF2AFF42DF32DF2E7F369F3A
      7F327F327F327F32DF2EDF2EDF22BF0A00000000000000000000D8197C127C12
      9C1ABD1AFD267E53FC52D71D9F57BF670000BB3E1D5B3D5B5D5F5E637E6B9F6F
      9E6F7E6BDF7BFF7BDF77BF779F6F9E6FBB3E0000000000006A7DEC7DCB7DAB7D
      297D087D847C2274000000000000000000000000FF2A1F47DF329F32B515F819
      18161816181618169F32BF2AFF22BF0A00000000000000000000B80DBD1ABD1E
      FD267E4BDC3E0000BB3EBB32FF7B9E5F000000005E5F1D5B3D5B5D5F7E679E6B
      DF77BF73BF77DF77DF77BF77BF733D63000000000D7E4F7E0D7E0D7ECC7D2F7E
      6C754B75317E4B7D2A7DB5760000000000000000FF2A1F479F2A78321763D55E
      D55ED55ED55E166BB211DF1EFF22BE0E000000000000000000003D5FDD1E1D2B
      9F571D37000000005D47FF739E5B0000000000007B225E673D5B5D5F7E679E6B
      DF77DF77BF73DF7B9E6FDF77BF773A1E0000957E707E4F7E2E7E0D7E927E317E
      00005B7FF079957E4B7D4A7D0000000000000000FF2A5F5FDF3ABA42DE7B7B6F
      9C6F9C6F7C6FFE7F9315BE22FF26BE0E0000000000000000000000003D4B9F57
      9F571E371D3BBF63BF63000000000000000000000000FC3A5E673D5F7E677E6B
      BF73DF77BF73BF73BF739E73DC3A00000000527E707E707E927ED57EB67E0000
      0000000000005A7FCF75747E727E0E7E9C7B000000000000000000007B6F0000
      1042F75EDE779B73000000000000000000000000000000000000000000005E4B
      BF5BBF5BFF6FFF77000000000000000000000000000000009C265E5F7E677E67
      BF73DF77BF73BF737E677B22000000000000CF7D377F167F727EAE7D00000000
      0000000000000000F77AAD6D317A937EEF710000000000000000000000009C73
      314618639C730000000000000000000000000000000000000000000000000000
      BF6BDF73FF7B000000000000000000000000000000000000000000001D43BC22
      BC2ABC2A9C221D43000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      524A734E00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000191E191E181E181E
      F81DF819D819D815B715D71D0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000F524845
      A338A33848450F4E000000000000000000001401F300F300D300D200D200D200
      B200B100B100B100B100B100B100B200D20000000000BB3E5E4F5B1EFC42BF6B
      5A1EF8195E4FBC2A181E1D47000000000000B51D74097409740D74097409740D
      74097409740D74097409740D74097409B51D00000000000080448050C064E070
      00790079E068A058A050804C000000000000F4009D129D129D129D127C0E7C0E
      7C0E7C0A5C0A5C0A5C0A3C063C063B06D20000000000BB3E1D3F5D53FC429E63
      5D535D533D43BC2ABB363D47000000000000950D1D4B1D4B3A0EFC42FC463A0A
      1C4B1D4F5A161D4FBC363A0E1D4BFC46950D00000000725AC05CE070207D207D
      007D007D207D207DC060A054304E000000001501FD26FD26FD26FD26DD22DD22
      DD22DD1EBD1EBD1EBD1ABC1A9C169C16B10000000000DC3EBF6BBE6BBE6BBF6F
      9E637E5F7E5F7E633D4B3D4B000000000000950D000000003A0E000000003A0E
      000000009B2E00009E6F3A0E00000000961100008048C070C0746074AA61206C
      E070E070A070807088614074C068A054000036053E433E433D433D433D3F3D3F
      3D3F1D3F1D3B1D3B1D3B1D3B1D371D37B20000000000DC42BF6F1C439E6BBF6F
      BB361C477E5F1D431D473D47000000000000B6111D4F1D4F5B16FC4ADC3A5B1A
      1D4F1D4F7B1E1D4FDC3A5B161D4FFC4AB6110000C06CC074A170506EFF770659
      E074E070206C9276DF73695DC06CC07000000000000000000000000000000000
      3D5F9715000000000000000000000000000000000000FC425E477E633D539E63
      7E639E635E477E633D533D4B000000000000B611000000007B1A000000007B1A
      00000000DC3A00009E6F7B1A00000000D719305A8068A0684068C36CFF6F0000
      E6580064000000009176406880604064EE4D0000000000000000000000000000
      970D970D000000000000000000000000000000000000FC423D53DF773D53BF6B
      DF77BE6F7E5BDF735D573D4B000000000000F71D000000009B1E000000007B1E
      00000000FD3A0000BF739B1E00000000F821484D40606060A068006C7B6FFF6F
      DE7BD56E0000000000684068405C40602749000000000000000000003D579709
      DD1EDD1E77095A3200000000000000000000000000001D43BF6FFC3E9E67BF6F
      BB321C4B7E63D2691C533D4B000000000000181EBF73BF731D43BF6F9E6BFD3A
      9E6F9E6F3D4BDF735E5BFD42BF73BF6F1822815440604068606860680068806C
      BD6F0000D56E006080686068606C4064A24C00000000000000000000B809DC2E
      FD26FD267C16770500000000000000000000000000001D47FD36BB327A2E9E63
      1C437A2A4E718378865C3D4B000000000000181E000000001D43000000001D3F
      000000003D530000BF771D4300000000182281504068606C606C606C00680E6A
      FF7B00007B73075960706068606C606CA24C000000000000DF77FA0D3E2F3E33
      3E2F3E2F1E2F3E2F98093D5B000000000000000000001D475E4BDF775D579E67
      DF77BE6F976E0F7A905D3D4B00000000000039227F5B9F5F3E4B5E575E573E4B
      5E577E5B3E4B5E5B5E533E4B9F5F7F5B39224859606C606C206C006CFF6FFF7B
      2F76626C00000000E6580068606C606C2849000000000000FA0DDC2E3E375E37
      3E333E333E333E335B16B809000000000000000000003D47BF739E67BF6FBF6F
      BE6B9E637E631B5F5D4F3D4B0000000000003922F7211205FC425E4F5E4B5E4F
      3E4B3E4B5E4F5E4F5E4FFC3E1205F7213922B46A2070206C416C516EFF7B0000
      A16C616CBD7F0000FF776A5D406C60740F4A000000007C1A9F437F3F7F3B7F3B
      5F3B7F3B5F3B5F375F377F3BD909DF730000000000003D4BFD2AFD26BC1E9C16
      7B0E5B0E3B0A3B0A3A0A191A0000000000005A2A96117B1E79329F5B7F5B7F5B
      7F5B7F5B7F5B7F579F5B7A367B1E95115A2A00002F7AF67EE4742F7A7B7F307A
      B47A937AED792F7A177B80740579687D000000009C1A3E379F479F479F479F47
      7F477F477F477F477F437F437B1A1A160000000000005E4B5E3F1D33FD2ADD22
      9C1A9C165B0E5B0A3B0A3A1600000000000059261822BC2A7A36DB42BB3EDB3E
      DB3EDB3EDB3EDB3EDC429A36BC2A182259260000685DBC7F0E7A927AD57A167F
      177FF67EB37A2F7AEC7905752E7EC3500000BD1EDD1EDD1EBD1ABD1ABD1ABC1A
      9C1A9C1A7C167C167C165B165B167B1A3B16000000005E4BBF63BF639F5F9E5F
      7E535E4B5D433D3F3D43BC2A00000000000000009A325E437936000000000000
      00000000000000000000BA3A5E439A320000000000003873F57E7A7F387FBC7F
      DE7F9B7FD47E717E177F797F5252000000000000000000000000000000000000
      000000000000000000000000000000000000000000005E4BBF63BF63BF63BF63
      9E5F9E5B7E577E535E4BDC2E0000000000000000BB36FD361C4F000000000000
      000000000000000000003D57FD369B360000000000000000EC5D587B7A7F177F
      177FF67E167F7A7F377F48590000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000003D373D371D371D37
      1D371D33FD32FD2EDD2A3E430000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000176F9366
      72665166ED553156000000000000000000000000E058005D005D005D005D005D
      005D005D005D005D005D005D005DE05800000000113E52460000000000000000
      00000000000000000000000000000000000000000000000000000000D2001309
      0000000000000000000000000000000000000000FF7F94520821420821048510
      650865042104640CCF39524A000000000000005DC17D2065A661E058C17DE17D
      E17DE17DC179E17DE17DE17DE17DE17D005D0000DE7BF75E534A000000000000
      000000000000000000000000000000000000000000000000330DF3001C023D02
      F400BE7300000000000000000000000000000000103EC614C718C618640C0000
      5A16BB268410C618C718C718C618630C00002061005DB16EFF7FDE7F2065027E
      E27D005D225D606DE27DC1750061A1712061000009217B6F734A114200000000
      000000000000000000000000000000000000000000000000F3001C021C023D02
      5801F500000000000000000000000000000000001142A614C718C718A6140000
      9B1E1C3F8410C718C718C718E718630C00004065F472FF7FFF7FFF7F8F6EA171
      816D5877FF7FA665C275A665FF7F1473406500007B6FB6563A67B65610420000
      0000000000000000000000000000000000000000330DF3001C021C023D025D06
      5D0A9E0E1601BF7300000000000000000000000032468D31E81CE81C8C310000
      DC2ABE6B4B29E718E81CE81CC6186C2D00004069D172FF7FFF7FFF7F6D6EC275
      40655877FF7FA665E275A665FF7FF47640690000B6567B6F6B2D3A6731423142
      0000000000000000000000000000000000000000F4001C021C023C025D065D06
      7D0A9D0EBA0536010000000000000000000000002925734EE81CE81C11420000
      FD32DF778D31C718E81CE81C8410D65A00006169A1718469DE7F1477C275447E
      AF72FF7F3677616D816D1377FF7F2A6E61690000000000000000B6563A67744E
      103E00000000000000000000000000000000B2001C021C023C025D067D0A7D0A
      7D0E9E12BE12FF165805BF7300000000000000005B6BE718CF398D3100009C6B
      5E3F5E43DE7B000009210821BD7700000000616D657E0376616D816D657EE375
      DE7FFF7FC669E3752065DE7FFF7F6369616D000000000000185FBD776B2D3A67
      F03D1142000000000000000000000000000034093F273C025D065D067D0A7D0E
      BE129E12DE16DE161B0A790500000000000000000000D65A734EBD7700000000
      3B5F000000000000E81CA510000000000000826D867E857EE375A2714A72DE7F
      FF7FFE7F447A867E787BFF7F4A72E375826D00000000000000000000BD77514A
      5601FB01FA01FA011A0297010000000000000000F400D9095D067D0A9D0E9E0E
      BE12BE16DE1AFE1A1F233F27BA05DF73000000000000000000002A25ED7E867E
      657E657E2476EE51FF7F0000000000000000A26DED7EC371AF76367BFF7FFF7F
      FE7FC46DA77EA271FF7FFF7FC46DEB7EA26D00000000000000000000B65A2C19
      3B063B061B061B061B061B065936000000000000BF73F5005F377D0A9E12BE12
      BE16DE16FE1AFE1E1F231F239D1ADB05000000000000000000008D7E867E867E
      867E867EA67E836500000000000000000000C371CC7EAE76FF7FFF7FBC7FD07A
      A97A0D7F6A76FE7FFF7F797B2E7F0E7FC371000000000000000000001C575E53
      7C167C167C167C167C167C125C12770D000000000000000036013B12BE0EBE12
      DE16DE1A1F273F333E3F7F539F4B9F4FDF730000000000000000537FC87EC87E
      C87EC87EC87E097F00000000000000000000C3712F7F4876347BCE7A4876CC7E
      ED7E4876FE7FFF7FBC7F48762F7F2F7FC371000000000000000000005A2E5F47
      9D1A9D1A9D1A9D1A9C1A9C1A7C165B260000000000000000BF735801DF633F2F
      5F375F437F477C1A1D4BFB05DF679F4F7E5B000000000000797F537F507F2D7F
      E97EE97EE97E297F00000000000000000000E375507F307FCB7E897A487ACE7A
      FF7FFF7FFF7FBA7FEC7E507F507F507FE37500000000000000000000BB367F53
      FE2EFE2EB60DDF773E475E4B5F477B2A0000000000000000000000007901FD32
      5F3F5F3FFE2A1D4B00000000BF5F9F53BD260000000000005A6BE71C8D5E507B
      717F717F727FD37F9C730000000000000000E379517F687E9A7F9A7FFF7FFF7F
      FF7FFF7F347F477A517F517F517F517FE379000000000000000000003D4FDF73
      7F4F7F535D5F0000BF731D3F5F4B7B26000000000000000000000000DF739A01
      BF675F433E3BFB090000DF77BF5B9F539D1A0000000000005B6BC718A610A610
      B37F927FB37F6D565A6B0000000000000000037A517F897EFF7FFF7FFE7F987F
      687EAA7E727F727F727F727F727F727F037A0000000000000000000000001D43
      7F539F531D43F721DB3A9F531E3F9E6F00000000000000000000000000000000
      DB011E377F479F4F7F479F4F9F539F539E120000000000009C73E81CE81CE81C
      8A316A31A614C7185A6B0000000000000000037A727F0D7FCD7ECD7E687ECA7E
      517F727F727F727F727F727F727F727F037A0000000000000000000000009F6B
      DF6F9F5B9F57BF5BBF577F4F1C4F000000000000000000000000000000000000
      DF73FB05DF6FBF5F9F539F4F9F4FBF57BE1A00000000000000000921081DE81C
      E81CE818E81CE71C000000000000000000009A7F037E247E247E247E247E247E
      247E247E247E247E247E247E247E037E9A7F0000000000000000000000000000
      FF7B7F5FFE3A9C2EDD3A9F6B0000000000000000000000000000000000000000
      00000000DF737F5BDE2A9E1A9E0EBE1A0000000000000000000000002A250921
      4A253146CE395A6B000000000000000000000000172F3737FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000003B57
      BE73000000000000000000000000000000000000000000000000000000000000
      BC05BC0500000000000000000000000000000000005C01600160015C01600160
      015C016001600160015C015C015C015C0000383789011E33FF261B0F383BFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000007201980E
      F509B4110000000000000000000000000000000000000000000000000000BC05
      7D16FC0900000000000000000000000000000160227C227C227C227C227C227C
      0178A2780178227C227C227C227C227C0160FF7F5E4B7F573F3BFF32F9067A4B
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000007D67B80E3C13
      FB16D509000000000000000000000000000000000000000000000000BD05BC05
      BD1ABC0900000000000000000000000000000164427C427C427C427C427C427C
      0078997F0074427C427C427C427C427C0164FF7F5D4BDF6F9F1A5F02DB06DB06
      3833FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000005201F90E7C135B13
      FB12BB129301572E000000000000000000000000000000000000BD051E2F1F2F
      3C16DB0500000000000000000000000000002168627C627C627C627C627C627C
      007400002C7A0178627C627C627C627C2164FF7F3A2BFF7FFF013F02DB0EDB06
      DC0A5833FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000BE6F190B9B137C135B13
      FB12BB127B16730100000000000000000000000000000000DD053D0E3F37FE2A
      3B1ABA0DFC11BC0DDC09DC09BC09BC053B052168827C827C827C827C827C827C
      00740000E9792174827C827C827C827C2168FF7FFF7F5B3B7E019E013F025F02
      DB06DB065933FF7FFF7FFF7FFF7FFF7FFF7F00005201390BBA0F9A139C131B2F
      DF4FFC1A7A125B1272011B5300000000000000000000FD057F4B5F431E331E2F
      DE26DE22BE1A9D1A7D125D0E3D0A1D06D800216C837CA37C837C837CA37C827C
      9A7F00000070A37CA37CA37C837C837C216CFF7FFF7FFF7FFF1D7E011F023F02
      DB0EDB06DC0A5A33FF7FFF7FFF7FFF7FFF7FBE73380BD80FB90F9A0F3B2F7201
      F511DF577B125A12180E72010000000000000000FE059D1A7F4B3F3F3E371E33
      FE2ADE26DE1EBE1A7E127E123D0A3D06F800216CA37CA37CA37CA37CA37C0070
      00000000006C627862786278A278A37C016CFF7FFF7FFF7FFF7FDB267E019E01
      3F025F02DB06DB067A33FF7FFF7FFF7FFF7F3B577B1FD70FDA1B7C2FBE6F0000
      000093059F4B7A125A125B127201000000003E06DF6FBF6F7F475F473F3B3E37
      1E2FFE2ADE22BE1E9D169D165D0E5D0AF800A875E3740070006C006CE2700000
      000000000000000000000000357BA26CA875FF7FFF7FFF7FFF7FFF7FFF1D7E01
      1F023F02DB0EDB06FC0A7A33FF7FFF7FFF7F000072017A1F7C33720100000000
      0000BE6FFC367F4B5A125A12B505B41100005E06DF6FDF775F475F475F3F3E3B
      1E33FE2EDE22DE229E1A9D165D0E5D0EF90088758779BB7F00002B7AFD7F0000
      0000000000007A7F7A7F797B4E72A26C8875FF7FFF7FFF7FFF7FFF7FFF7FFB26
      7E019E013F025F02DB06DB067B33FF7FFF7F00000000BE735C5B000000000000
      000000005C5F71011F3B3A0E5A125B12773200001E065D0ADF77BF635F435F43
      1E331E371E2FFE2ADE22DE1E9D167D0E3901A8796775797F0000B17A00000000
      000000000000000000000000F476676DA879FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      DF197E011F023F02DB0EFC06F01D7B33FF7F0000000000000000000000000000
      0000000000001B535F473F3B5A125B12D411000000001E06BF5FDF775F435F3F
      3E379F5BBF639F5F7F577E537E4B1E331901A8796675797F0000B17600000000
      000000000000000000000000B176466DA879FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFC2E7E019E013B02AF25DE7F512E9C430000000000000000000000000000
      0000000000000000572EB4097201572E0000000000000000FE05FD01DF77BF6B
      3E377D123D0A3D0A1D0AFD05DC05BC057C05A8796671797B0000B17600000000
      0000000000009A7B9A7B9A7B25652C7EA879FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FDF197F01B025DE7F512E5103770B0000000000000000000000000000
      00000000000000000000572E1B53000000000000000000000000FE059F4FFF7B
      3E33DD050000000000000000000000000000A9796671797B0000B176DD7F0000
      00000000000000000000000025652C7EA979FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F194FFF7F3232D707D60398130000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FE05BC01
      9F4F3D0A0000000000000000000000000000C97D666DF47A797B4E720465BC7F
      000000000000000000000000A8716E7EC97DFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F323A3B0BDB0BD707FF770000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DD05
      FE2A7D160000000000000000000000000000A97DA971666D466D466DEB79E464
      0C6EF476F476F476F476F476A9716E7EC97DFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F3D1F7C1BFF77FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1E061D0600000000000000000000000000000000C97DC97DC97DC97DC97DC97D
      C97DCA7DEA7DEA7DEA7DEA7DC97DC97D00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000760D
      770D760955090000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000002E0D2E0D
      0D05ED04ED04ED04000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001A16D819DF7BB711
      9C167C12970DDF7B9615D80D000000000000B51D74097409740D74097409740D
      74097409740D74097409740D74097409B51D000000000000000000002E0DDA36
      77127712F50DED04000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A36DD229C1EF9117B1A
      9C169C163B12D80D5B0E7C0E383200000000950D1D4B1D4B3A0EFC42FC463A0A
      1C4B1D4F5A161D4FBC363A0E1D4BFC46950D000000000000000000002E0DDA36
      78127812150EED04000000000000000000000000000000001863000000000000
      00000000000000001863000000000000000000007B1E1D2BDD26DD26DD22DC22
      5B1A5B1ABC1A9C1A9C167C129C12F90D0000950D000000003A0E000000003A0E
      000000009B2E00009E6F3A0E000000009611000000000000000000002E0DFA36
      980E7812150EED04000000000000000000000000000000001863000000000000
      0000000000000000186300000000000000000000191EDD26FD2AFD269C1E5A1A
      7B1A5B1A97111A169C1A9C167B12B7190000B6111D4F1D4F5B16FC4ADC3A5B1A
      1D4F1D4F7B1E1D4FDC3A5B161D4FFC4AB611000000000000000000002E0DFA36
      9812980E350EED04000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000DF7B7B1E1D2FDD261D2FBC22
      7B2EBB3E1A161D27F911BD1EF911DF7B0000B611000000007B1A000000007B1A
      00000000DC3A00009E6F7B1A00000000D71970112E0D2E0D2E0D2E0DED04D92E
      B80EB80E350EED04ED04ED04ED04ED04ED040000000000000000186300000000
      0000000000000000000000000000000000001A165B1AFD2A1D33BC1EDC267B1A
      00000000760DF9113409BC1E7B1AD8119711F71D000000009B1E000000007B1E
      00000000FD3A0000BF739B1E00000000F8219111760E760E760E760E760ED92E
      D90EB90E350E350E760E760E760E760E50090000000000000000186300000000
      1863000000000000000000000000000000003D4B9E5F7E4FFD2A1D2FDD2A0000
      000000000000B619BC1E970DDD22BC1ED80D181EBF73BF731D43BF6F9E6BFD3A
      9E6F9E6F3D4BDF735E5BFD42BF73BF6F1822B2153A0F3A0F3A0F1A0F1A0F1A0F
      F90EF90ED90ED90EB90EB80EB80E981270090000000000000000000000000000
      0000000000000000000000000000000000003D4B9E5F9E5F7E539E5B5E470000
      000000000000B61DDC2AB70D3D3B3D3BFC42181E000000001D43000000001D3F
      000000003D530000BF771D43000000001822D2155B0B5B0F3A0F3A0F1A0F1A0F
      1A0FF90EF90ED90ED90ED90EB80EB80E71090000000000000000000018630000
      0000000000000000000000000000000000003D475D4B9E5B9E575E4F5D479E5F
      000000003C539A32BB3A3D475E4F1C43FC3E39227F5B9F5F3E4B5E575E573E4B
      5E577E5B3E4B5E5B5E533E4B9F5F7F5B3922F315BD27DD27BD27BD279D2B3A0F
      3A0F3A0F190FF90E5C2B5C2B3C2B3B2BB30D0000000000000000000000000000
      000000000000000000000000000000000000000000005D4F9F5F5E4B9E5B3D47
      9E679E63BB365E539A329E5B3D47FF7B00003922F7211205FC425E4F5E4B5E4F
      3E4B3E4B5E4F5E4F5E4FFC3E1205F7213922F311F311F311F311F311F3117C37
      3A0F3A0FD80E9109910991099109910991090000000000000000000000000000
      00000000000000000000000000000000000000007E4FBF5FBF63BF633D435D4F
      BF63BF633D4B9A369E5B9E5B7E573D4B00005A2A96117B1E79329F5B7F5B7F5B
      7F5B7F5B7F5B7F579F5B7A367B1E95115A2A00000000000000000000B30D9D37
      7B0F7B0FF90EB30D000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007E57BF67BF63BF63BF637E53
      FC3ADB3A3D4BBE5F9E5B9E5B9E5B5D4F000059261822BC2A7A36DB42BB3EDB3E
      DB3EDB3EDB3EDB3EDC429A36BC2A1822592600000000000000000000B30D9D3B
      7B0F7B0FF90EB30D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009E5BBF67BF637E539E5F
      BF63BF639E5B5E4F9E5BBF5F7E5B0000000000009A325E437936000000000000
      00000000000000000000BA3A5E439A32000000000000000000000000B30DBD37
      9B0F9B0F3A0FB30D000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009E5B7E5300007E4F
      BF63BF635D4F00005D4F7E530000000000000000BB36FD361C4F000000000000
      000000000000000000003D57FD369B36000000000000000000000000B30DBE37
      7A0B7A0B3A0BB30D000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007E4F
      7E537E535E4F0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000F3117716
      781A781A7716F311000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      E07F00420000000000000000000000000000000000000000FF7F007C007C007C
      007C007C007C007C007CFF7F000000000000000000000000FF7F100010001000
      10001000100010001000FF7F000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F000000000000000000000000000000000000E07F
      0042E07F004200000000000000000000000000000000FF7F007C007C007C007C
      FF7FFF7F007C007C007C007CFF7F0000000000000000FF7F1000100010001000
      FF7FFF7F1000100010001000FF7F0000000000000000FF7F1000100010001000
      100010001000100010001000FF7F0000000000000000000000000000E07F0042
      E07F0042E07F0042000000000000000000000000FF7F007C007C007C007CFF7F
      007C007CFF7F007C007C007C007CFF7F00000000FF7F1000100010001000FF7F
      10001000FF7F1000100010001000FF7F00000000FF7F10001000100010001000
      1000100010001000100010001000FF7F00000000000000000000E07F0042E07F
      0042E07F0042E07F00420000000000000000FF7F007C007C007C007CFF7F007C
      007C007C007CFF7F007C007C007C007CFF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F0000FF7F10001000100010001000
      1000100010001000100010001000FF7F0000000000000000E07F0042E07F0042
      E07F0042E07F0042E07F0042000000000000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F00000000E07F0042E07F00420000
      0042E07F0042E07F0042E07F004200000000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F0000E07F0042E07F004200000000
      000000000000000000000042E07F00420000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F00000042E07F0042E07F00000000
      00000000000000000000E07F0042E07F0000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7FFF7F
      FF7FFF7FFF7FFF7F1000100010001000FF7F000000000042E07F0042E07F0000
      E07F0042E07F0042E07F0042E07F00000000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F0000000000000042E07F0042E07F
      0042E07F0042E07F0042E07F000000000000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7FFF7F1000100010001000FF7F1000
      100010001000FF7F1000100010001000FF7F00000000000000000042E07F0042
      E07F0042E07F0042E07F0000000000000000FF7F007C007C007CFF7F007C007C
      007C007C007C007CFF7F007C007C007CFF7FFF7F100010001000FF7F10001000
      1000100010001000FF7F100010001000FF7F0000FF7F100010001000FF7F1000
      100010001000FF7F100010001000FF7F0000000000000000000000000042E07F
      0042E07F0042E07F000000000000000000000000FF7F007C007C007C007C007C
      007C007C007C007C007C007C007CFF7F00000000FF7F10001000100010001000
      1000100010001000100010001000FF7F00000000FF7F1000100010001000FF7F
      FF7FFF7FFF7F1000100010001000FF7F00000000000000000000000000000042
      E07F0042E07F00000000000000000000000000000000FF7F007C007C007C007C
      007C007C007C007C007C007CFF7F0000000000000000FF7F1000100010001000
      100010001000100010001000FF7F0000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0042E07F0000000000000000000000000000000000000000FF7F007C007C007C
      007C007C007C007C007CFF7F000000000000000000000000FF7F100010001000
      10001000100010001000FF7F000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001700FF7F00000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F001F001F001F001F0018630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000170017001700FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F001F001F001F001F001863000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1700170017001700FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F001F001F001F001F001863000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000104200420042004200420042
      0042004200420042004200420042000000000000000000000000000000001700
      17001700FF7F17001700FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F1F001F001F001F001F001863000000001042FF7FFF7F18630040
      1863FF7FFF7FFF7FFF7FFF7F00000000000000001042E07FE07F0042E07F0042
      0042E07F0042E07F0042E07F00420000000000000000FF7FFF7FFF7F17001700
      1700FF7F0000000017001700FF7F00000000FF7F18631863186318631863FF7F
      FF7FFF7FFF7F1F001F001F001F001F001863000000001042FF7F186300400040
      0040FF7FFF7FFF7FFF7FFF7F00000000000000001042E07F0042E07F0042E07F
      00400042E07F0042E07F004200420000000000000000FF7F1042104210421700
      FF7FFF7F0000000000001700FF7F00000000007C007C007C007C007C1863FF7F
      0000FF7FFF7F1F001F001F001F001F001863000000001042FF7F004000401042
      00401863FF7FFF7FFF7FFF7F000000000000000010420042E07F0042E07F007C
      007C00400042E07F0042E07F00420000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F00000000000000001700FF7F0000007C007C007C007C007C18630000
      00000000FF7F1F001F001F001F001F001863000000001042FF7F0040FF7FFF7F
      186300401863FF7FFF7FFF7F00000000000000001042E07F0042E07F0042007C
      007C007C10420042E07F004200420000000000000000FF7F1042104210421042
      1042FF7F000000000000000000001700FF7F007C007C007C007C007C1863FF7F
      FF7F0000FF7F1F001F001F001F001F001863000000001042FF7FFF7FFF7FFF7F
      FF7FFF7F00401863FF7FFF7F000000000000000010420042E07F0042007C1042
      E07F007C007C10420042E07F00420000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7F0000000000000000000000001700007C007C007C007C007C1863FF7F
      0000FF7FFF7F1F001F001F001F001F001863000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00401863FF7F00000000000000001042E07F0042007C1042E07F
      E07FE07F007C007C1042004200420000000000000000FF7F1042104200000000
      0000FF7F0000000000000000000000000000007C007C007C007C007C1863FF7F
      FF7FFF7FFF7F1F001F001F001F001F00FF7F000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0040FF7F00000000000000001042FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F007C0040E07FE07F0000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000007C007C007C007C007C1863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001042FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FE07FE07FE07FE07F
      E07F000000000000007C004000000000000000000000FF7F1042104200000000
      000000000000000000000000000000000000007C007C007C007C007C1863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000001042FF7FFF7F00000000
      0000000000000000FF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7F
      00000000000000000000007C00400000000000000000FF7FFF7FFF7FFF7F0000
      000000000000000000000000000000000000007C007C007C007C007C1863FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000001042104210421042
      1042104210420000104210420000000000000000000000000000000000000000
      000000000000000000000000007C000000000000000000000000000000000000
      000000000000000000000000000000000000007C007C007C007C007CFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7F
      FF7FFF7F10420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007C00000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7F186300000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      E07FE07F00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F1F001F001F001F001F001F00
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000001863
      186310421042000000000000000000000000000000000000000000000000E07F
      E07F0042E07F0000000000000000000000000000000000000000000000000000
      100000000000000000000000000000000000FF7F18631F001042104210421F00
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000186318631863
      18631042104210421042000000000000000000000000000000000000E07FE07F
      0042E07F0042E07F000000000000000000000000000000000000000000001000
      000210000000000000000000000000000000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000018631863186318631F00
      1863104210421042104210421042000000000000000000000000E07FE07F0042
      00000000E07F0042E07F00000000000000000000000000000000000010000002
      000200020000000000000000000000000000FF7F1F001F001F001F001F001F00
      FF7FFF7F1F001F001F001F001F001F00FF7F186318631863186318631F001863
      186310421042000010421042104210420000000000000000E07FE07F0042E07F
      000000000042E07F0042E07F0000000000000000000000000000100000020002
      000200021000000000000000000000000000FF7F18631F001042104210421F00
      FF7FFF7F007C1F001042104210421F00FF7F1863186318631F0018631F001863
      18631042104210420000104210421042000000000000E07FE07F0042E07F0042
      00000000E07F0042E07F0042E07F00000000000000000000000000020002E003
      E00300020002100000000000000000000000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F18631863186318631F0018631863
      1863104210421042104200000000104200000000E07FE07F0042E07F0042E07F
      000000000042E07F0042E07F0042E07F000000000000000000000002E0030000
      0000E0030002000210000000000000000000FF7F1F001F001F001F001F001F00
      FF7FFF7F1F001F001F001F001F001F00FF7F00001863186318631F0018631863
      1863104210421042104200000000104200000000E07F0042E07F0042E07F0042
      00000000E07F0042E07F0042E07F004200000000000000000000E00300000000
      000000000002000200020000000000000000FF7F18631F001042104210421F00
      FF7FFF7F18631F001042104210421F00FF7F000018631863186318631863FF7F
      FF7FFF7F186310421042104210421042000000000000E07F0042E07F00420000
      000000000000E07F0042E07F0042000000000000000000000000000000000000
      00000000E003000200021000000000000000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000018631863FF7F18631863
      1863186318631863FF7F1042104200000000000000000000E07F0042E07F0042
      00000000E07F0042E07F00420000000000000000000000000000000000000000
      0000000000000000E0030002000210000000FF7F1F001F001F001F001F001F00
      FF7FFF7F1F001F001F001F001F001F00FF7F000000001863FF7F186318631863
      00400040186318631863FF7F1042000000000000000000000000E07F0042E07F
      0042E07F0042E07F004200000000000000000000000000000000000000000000
      000000000000000000000002000200020000FF7F18631F001042104210421F00
      FF7FFF7F18631F001042104210421F00FF7F0000000000000000186318631863
      00400040186318631863000000000000000000000000000000000000E07F0042
      E07F0042E07F0042000000000000000000000000000000000000000000000000
      00000000000000000000E003000200020000FF7FFF7FFF7FFF7F0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000000000000000000000001863
      186318631863000000000000000000000000000000000000000000000000E07F
      0042E07F00420000000000000000000000000000000000000000000000000000
      000000000000000000000000E00300020000FF7F1F001F001F001F001F001F00
      FF7FFF7F1F001F001F001F001F001F00FF7F0000000000000000000000000000
      1863186300000000000000000000000000000000000000000000000000000000
      E07F004200000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F007C1F001042104210421F00
      FF7FFF7F18631F001042104210421F00FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F000000008C311042104210421042
      1042104210421042104210421042104284100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008010604EE03DE03DE03DE03DE03D
      E03DE03DE03DE03DE03DE03D4A29104210420000000000000000000000420042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010001000100010001000100010000000000000000000000000000000
      000000000000000000000000000000000000E05EE07FE07FE07FE07FE07FE07F
      E07FE07FE07FE07FE07FE07FA677082110420000000000000000000000420042
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0310021002100210021002100210000000000000000000000000000000
      000000000000000000000000000000000000E05EE07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA677082108210000000000000000000000420042
      0000000000000000000000000000000000000000000000000000000000000000
      FF03FF0310021002100210021002100210000000000000000000000000001042
      FF7F000018630000000000000000000000000021E07FE07FE07FE07FE07FA656
      0000A656E07FE07FE07FE07FA635104200000000000000000000000000420042
      0000000018631042000000000000000000000000000000000000000000000000
      FF03FF0310021002100210021002100210000040004000000000FF7F1042FF7F
      1042FF7F00001863000000000000000000000000E05EE07FE07FE07FE07FE07F
      E05EE07FE07FE07FE07FA6770821082100000000000000000000000000420000
      1863186318631042104210420000000000000000000000001042104210421042
      FF03FF031002100210021002100210021000004000400000FF7F1042FF7F1042
      18631863FF7F00001863000000000000000000000021E07FE07FE07FE07F2667
      4629E07FE07FE07FE07FA6351042000000000000000000000000000018631863
      1863186318631042104210421042000000000000000000001042104210421042
      FF03FF031002100210021002100210021000004000400000FF7FFF7F1042FF7F
      186310021863FF7F0000186300000000000000000000E05EE07FE07FE07FA635
      0000A677E07FE07FA67708210821000000000000000000001863186318631863
      1863104218631042104210421042000000000000000000001042104210421042
      FF03FF031002100210021002100210021000004000400000FF7FFF7F18630000
      0000000000001863FF7F0000186300000000000000000021E07FE07FE07F8010
      0000604EE07FE07FA63510420000000000000000000018630000000018631042
      0000000018631042104200001042000000000000000000000000000000000000
      FF031000FF03FF03007CFF7FFF7FFF7F0000004000400000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F00001042FF7F000018630000000000000000E05EE07FE07F0000
      0000E03DE07FA67708210821000000000000000000001863007C000000000000
      1863FF7FFF7F1042104218631042000000000000000000000000000000000000
      1000FF03FF03007C007C007CFF7F0000000000400040000010421042FF7FFF7F
      FF7F104210421042FF7F10421863104200000000000000000021E07FE07F0000
      0000E03DE07FA63510420000000000000000000000001863007C00001863FF7F
      FF7FFF7FFF7F0000104200001042000000000000007C00000000000000000000
      00000000007C007C007C007C007C000000000040004000000000000010421042
      104200001042FF7F104218631042000000000000000000000000E05EE07FA656
      E03DA677A6770821082100000000000000000000000018631863FF7FFF7FFF7F
      FF7FFF7FFF7F18631042104210420000000000000042007C0042000000000000
      0000000000000000007C00000000000000000000000000000000000000000000
      00000000000010420000104200000000000000000000000000000021E07FE07F
      E07FE07FA63510420000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7F18631863186310420000000000000000FF7F00420042007C004200000000
      000000000000007C007C00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E05EE07F
      E07FA677082108210000000000000000000000000000FF7FFF7FFF7FFF7F1863
      186318631042000000000000000000000000FF7F004200420042007C007C007C
      007C007C007C007C000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000021E07F
      E07FA6358C310000000000000000000000000000000000001863186318631863
      104200000000000000000000000000000000FF7FFF7F004200420042007C007C
      007C007C00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E03D
      A656000000000000000000000000000000000000000000000000186310420000
      0000000000000000000000000000000000000000FF7FFF7FE07F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F00000000
      0000000000000000FF7FFF7F0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F0000000000001000
      000010000000100000000000FF7F000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F00001000100010000000
      1000000010000000100000000000FF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F10001000100010001863
      1863FF7FFF7F1000000010000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000001000104200000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      1863FF7F100010001000000000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F0000000000000000000010421000000000000000
      000000001000100010001000100000000000FF7F100010001000100010001F00
      1863FF7F100010001000000010000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010000000000000000000
      000000000000100010001000100000000000FF7F100010001F0010001F001000
      1863FF7F100010001000100000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000010000000000000000000
      000000000000000010001000100000000000FF7F1000100010001F0010001F00
      1863FF7F100010001000000010000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000010000000000000000000
      000000000000100000001000100000000000FF7F100010001F0010001F001863
      186318631F0010001000100000000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000010421000000000000000
      000010001000000000000000100000000000FF7F10001F0010001F001F001F00
      1F001000100010001000000010000000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F000000000000000000001042100010001000
      1000000000000000000000000000000000000000FF7F10001F0010001F001F00
      1863FF7F1F001000100010000000FF7F00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F100010001F0010001000
      1863186310001000100010000000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1000100010001F00
      100010001000100010000000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000424D3E000000000000003E000000
      2800000040000000400300000100010000000000001A00000000000000000000
      000000000000000000000000FFFFFF00FFF8000000000000FFE0000000000000
      FFE0000000000000FF81000000000000FF83000000000000C007000000000000
      800F000000000000801F000000000000001F000000000000001F000000000000
      001F000000000000181F000000000000181F000000000000801F000000000000
      803F000000000000E07F0000000000009FFF8001FFF100000FFF0000FFE00000
      07FF0000FFC0000083FF8001FF800000C1FF8001FF010000E0038001FE030000
      F001C003FE070000F901E007C00F0000F900E007801F0000F800F00F007F0000
      F800F81F007F0000F810F81F007F0000F800F81F377F0000FC01FE7FF67F0000
      FE01FE7FE6FF0000FF07FFFFC1FF0000F81FFE7F8001FFFFF81FFC3F0000F007
      FFFFF81F0000F007FC1FF01F0000F000F81FE00F0000F800FFFFC00780010000
      F81FF81F00000000FC1FF81F00000001FC1FF81F000080018001F81F0000C001
      C003C0070000C001E007E00F0000C181F00FF01F0000C181F81FF81F0000C1FF
      FC3FFC3F0000C1FFFE7FFE7F0000FFFF8001FEFF8000F00F0000FE3F0000F00F
      07E0FE1F0000F00F1818F00F0000F00F1818E0070000F00F2184C01F0000F00F
      2184801F0000F00F2184827F00000000218486FF00000000218487E100008001
      218487E10000C003181881810000E007181880010000F00F07E0E0070000F81F
      0000E0070000FC3F8001F81F0000FE7FC001FF3FF801FFFFDFF9FE1F08010000
      C001FE1F00018001D001FE1F00018003C001FE1F0001C007D001F81F0000E007
      C001F8010000F00FD00100000000F81FC00100000000FC3FD8810000F801FE7F
      C0010000FC3F0000D2010001FE1F0000C0030001FE1F0000D0070001FE1F0000
      D80F0801FE1FFFFFC01FF801FE3FFFFFF81FFFFFF81FC001E0078FF1E007DFF8
      C0038FF1E007C00187E10000E003D00184210000E003C00119980000E003D021
      13C80000E003C00117E80000E003D00117E80000E003C10113C88001E003D801
      19988001E003C00184218001E00FD20187E18001E00FC003C0038001E00FD007
      E007C003F80FD80FF81FF81FF81FC01FF00FF81FF01EFFFFE007E007C0040000
      C003C0038000000080018001800000000000800100000000000007E007800000
      326807E006000000128E07E07FE00000228A07E007FE0000366E07E000600000
      000007E001E0000000008001000100008001800100010000C003C00300010000
      E007E00720030000F00FF81F781FFFFF8000FC3FC7F1F81F8FF0E00797E5E007
      87E0C00397E5C00383C18001E0018061C1818001C00180E1E1878001DFFF0060
      F0070180C0011E60F81F03C0C5A51C60FC3F03C0C5A51C60F81F0180C5A51E60
      F903C001C5A50260E7878001C58581E1E7A38001C5A580E1BFA1C0039FFFC003
      DF85E4279FFFE0073FE3FC3F9FFFF81FF81FF81FA0048040E007E00700000000
      C003C00300000000800180010000000080018001000000000008000000000000
      06180000000000001E780000000000001E780000000000000618000000000000
      000800000000000080018001000000008001800100000000C003C00300000010
      E007E00700000000F81FF81F00000008FFFFC3FFC001C003FFFFE1FFD5618001
      FFFF61FFD0018001FFFF21FFD001C003FFFF01FFD001E0070000007FD001E007
      0000807FD001F00F0000F81FD001F81F0000F81FD001F81F0000FE01D001FC3F
      0000FE00D001FC3FFFFFFF80D201FC3FFFFFFF84DC03FC3FFFFFFF86D007FC3F
      FFFFFF87D80FF81FFFFFFFC3C01FF81FE7E7F9FFFF7FF01EE187E07FFC7FC004
      E007E07FF87F8000E007801FF00F8000E007801FE0070000E0070007F8030780
      E0070007F801060080018001FE417FE080018001FF6107FE0000E00087E10060
      0000E00087E101E0F81FF81881810001F81FF81080010001FC3FFE00E0070001
      FC3FFE00E0072003FE7FFF81F81F781FFC7FF81FF81FFFFFF81FF81FE007F8FF
      F81FF81FC003F87FF83FF81F8001F07FFC7FF81F8001E07FFC3FF81F0000E03F
      FC3FF81F0000E01FFC1FF81F0000C01FFC1FF81F0000860FFE0FC00300008F87
      FE07C00300001F87F307E00780013FE1E007F00F8001FFE1E007F81FC003FFF8
      E007FC3FE007FFF8F81FFE7FF81FFFFFF81FF81F8001FC7FE007E0070000F83F
      C003C0030000F83F8C0180010000FC7F8E0180110000FFFF027001900700FC7F
      023007900FF8FC7F02101F901FF8F83F02101F901FF8F83F0210079007F8F83F
      0010019007F8F83F81F180110000F83F801180010000F83FC003C0030000F83F
      E007E0070000F83FF81FF81F8001FC7FFFFFFC3FF81FF81FFFFFE007E007E007
      F00FC003C003C0038003800180018001800180018001800100008001030000E0
      00000180038001E0000003C003F007E0000003C003F007E000000180038001E0
      0000C001030000E080018001800180018001800180018001E007C003C003C003
      F00FE427E007E007FFFFFC3FF81FF81FF81FFE008007F81FE007FC008001E007
      C003FC008001C003800180008001801186610000800180190660000180030130
      06600001C007000006608001F01F000006608001E01F00000660E001E00F0000
      0660E001E00F10008661C003E00F98018001C007E00F8801C003C07FE00FC003
      E007C07FF01FE007F81FE0FFF83FF81FF81F8000F81F8000E0070000E0070000
      C0030000C0030000800100008201000080010000840100000000000000800080
      00000000018000801FF8000000E000801FF80000006000850000000000280083
      000000000000000780010000800100078001000080010007C0030000C003F57F
      E0070000E007FD7FF81F0000F81FFDFFFFFFF81F8001F81FE007E0070000E007
      E007C0030000C003C00380010000818180018801000087818001098000E00E00
      012809E01FF00E00187809F81FF81818105009F81FF81818010009E01FE00070
      800109801FE0007080018801000081E1C003800100008181E007C0030000C003
      E007E0070000E007FFFFF81F8001F81FE00F8000E1FFC001E0070000C07FDFF9
      E8870000C07FD001E0070000C07FD001E0070000C07FD001E0070000E07FD001
      E0070000FE67D001E0070000FE67D001E0070000FE67D001E0070000FE67D881
      E0070000FE47D901E0070000FE07D201E0070000FE07DC03E0070000FE1FD007
      E0070000FE1FD80FE00F0000FE7FC01F80008007FFFFFFFF00008001E19FFFFF
      00008001E13FFFFF00008001E0F7000000008001E0F7000000008003E0F70000
      0000C007E0F700000000F01F80F900000000F01F80FD00000000F01F00FE0000
      0000E01F00F800000000E00FF8DF00000000E00FF89F00000000E00FFCBFFFFF
      0000F01FFCBFFFFF0000F81FFE7FFFFFC0018001C007E7E7DFF90000C007E18F
      C0010FF0C007F007D0010FF0C007E197C0010000C007E817D0010180C007E9D7
      C00103C0C007EBF7D00107E0C00787E1C00107E0C007A7E5D88103C0C0071FF8
      C00103C0EB8F07E0D20103C0EB8FFA5FC00303C0EB8FF81FD00703C0E00FFC3F
      D80F0000E00FFE7FC01F8001F81FFE7FDFE1FFFFEFFFF1C7C7E1FFFFE7FF8003
      C7E1FFFFE7FF8001C1E1FBDFF1FF8001C1E1F3CFF1FFC003C061C003F8FFE003
      C0618001F87FE003C0010000F83FE207C0010000E03FF007C0618001F01FF80F
      C061C003F80FF81FC1E1E3C7F80FF81FC1E1F3CFFC1FF81FC7E1FBDFFE0FF81F
      CFE1FFFFFE0FF81FDFE1FFFFFF07FC3FC7FFF81F8000F81F83FFE0070000E007
      01FFC0030000C00300FF81810000800100FF81810000801901FF018000000C18
      03FF018000000E1807FF018000000F9883FF018000000F9881C7000000000E18
      8083000000000C18E001808100008019E000818100008001F800C0030000C003
      F800E0070000E007FF03F81F0000F81FF81FEFFF8001C000E007E7FF843D83FE
      C183E3FF80258000818180018005E402818100018001C000000001808001C002
      018001808001C000018000008001E00200C001808001E000006001808001B040
      006000808001000084610040E007000887E10040E0070009C0030180F807F403
      E0070000F807F607F81F8001FE67F00F8001F9FFFC7F80010000E07FF8078001
      01F8E07FF803804113C0801FF004804117F8801FE002800117F80007E0018041
      17F80007C000804117C080018000802103F88001800180310180E00000038011
      0080E000000381310000F818040780010000F810000F80010000FE00801F8001
      0000FE00F01F80018001FF81FFFF8001F87FF81FF81FF81FE01FE007E007E007
      801FC003C003C003000780018001800100078001800180010007060000600180
      80070FF81FF0018080011FF81FF801E080011FF81FF801E0800007F81FE00180
      800006000060010080188001800180018018800180018001E7F9C003C003C003
      E7F9E007E007E007FFFFF81FF81FF81F9FFFFFFFF81FFE7F9FFF0000E007FE3F
      9FFF0000C003FE1F9FFF00008001FE0F9FFF0000800100079FFF000000000003
      9FFF0000000000019FFF0000000000008F9F0000000000008003000000000001
      80030000000000038003000180010007800303FF8001FE0F800303FFC003FE1F
      800387FFE007FE3F983FFFFFF81FFE7FFCFFFFF8F81FC3FDFC3FFFF0E007C3F1
      FC3FFFE0C003C3E1FC3FFF818001C3C1FC3FFF839801C381FC3FE0071830C301
      FC3F800F1870C201FC3FA01F19F0C001F81F601F19F0C001F00F001F1870C201
      E007001F1830C301E007021F9801C381C003001F8001C3C1B001801FC003C3F1
      8001803FE007C3F98001E0FFF81FC3FDFE7FF81FE7E7E003FC3FE007E187C001
      F81FC003E007C001F00F8001E007C001E0078001E007C001C0031000E007E003
      80011860E007E007F81F1E788001E007F81F1E788001E007F81F18600000F007
      F81F10000000F007F81F8001F81FF007F81F8001F81FF007F81FC003FC3FF007
      F81FE007FE7FF007F81FF81FFE7FF81FF00F8001FC078000C0070000F0010000
      81C70180E001000080878181E001000000038001C071000002018181801F0000
      2711C183801F00002799E187C1FF00002399E187C1FF00000189F18F801F0000
      0189F99F801F00009809F81FE07900008801F81FE0010000C183FE7FF0010000
      E003FE7FF8010000F81FFFFFFE070001FE7F80008000F81FFC3F40000000E007
      F81F00000000C003F00F000000008001E007000000008001C003000000001FF8
      800100000000000000000000000000000000000000001FF0F00F0000000007E0
      F00F0000000007E0F00F000000008181F00F000000008181F00F00000000C003
      F00F00000000E007F00F00000000F81FC7E3FF03E7FFFE3FC7E3F800E3FFE007
      8001F800F1FFE0078001E000F87FC0038001E001F87FC22300008083F83FC623
      000081C7F87FFE03000083FFF83FF007000007FFFC1FE007000003FFFE0FC03F
      000001FFF80FC23F000000FFF80FC203000000FFFC0FC007000001FFFE07E007
      000083FFFF0FF00F0000C7FFFF9FFE3FFC7FF81FC0018FF1F83FE007800107E0
      F81FC003800103C0F91F818180010180801F818180018001003F0000C001C003
      107F01808001E007000101808001F00F800101808001F00FEE0001808001E007
      FE380180C001C003FE1F818180018001FE1F818180010180FE1FC003800103C0
      FF1FE007800107E0FF9FF81FC0018FF1F81FFFFFFC00F81FE007C083FC00E007
      C003C083FC00C0038001E003FC0081818801E003000081811000000000000180
      10000000000001800000000001001FF80000000001001FF81000000005010180
      1000E000050101808801C003490781818001C18340078181C003C18340FFC003
      E007E18701FFE007F81FFFFF03FFF81FDFF9C003F81F800187F18001E0070000
      87E18001C003000083E380018001101881C3800188011810C187800100000660
      C007800100000660E00F800108000180F01F800108600180F01F800110000660
      E01F8001000006608007800188010818010780018001180803C0FA1FC0030000
      07E0FC3FE0070000FFFFFE7FF81F8001FFFFF81F9FFFF81F0000E00787FFE007
      0000C00387FFC0036DA6800183FF800100008001C1FF80016DA60260E08F0000
      6DA60060E087008000000080F80703806DA60080F803018000000060F0010000
      00000220F001000000008001F021800100008001F06380018FF1C003F80FC003
      8FF1E007FC1FE007FFFFF81FFE3FF81FF9FF8007FFFFE007E07F82010000C007
      E07F82010000C007801F82010000C007801F82010000C00700078423FE7FC007
      0007C6E7FE7FC0078001F00FF81FC0078001F01FF81FC007E000F01FE007C007
      E000E01FE007C007F818E00FC001C007F810E00F8001C007FE00E00F0000C007
      FE00F01FFFFFC007FF81F81FFFFFE007FE7F800180019FFFFC7F000000008FFF
      F87F0000000087FFF07F0080000083FFE0000080000081FFC00000800000F0FF
      800001800000E07F000003F80000F807000013C00000F803800017F80000F801
      C00017F80000F801E00017C00000F801F07F13F80000F821F87F01F80000FC01
      FC7F00000000FC03FE7F80010000FE07FFF7F81FF81FFCFFFFE7F81FE007F87F
      FFC7F81FC243F07F8001F81F8E71E01F8000F81F8E71C01F0180000086618007
      018000008E71000701800000FE7F030301800000E007870101800000E007CF80
      01000000F24FFFC00000F81FFE7FFFE10180F81FFC3FFFF30180F81FF81FFFFF
      0000F81FF81FFFFF8001F81FFC3FFFFFE7FFFE3FC000F00FE3FFE0070000E007
      F1FFE0070000C383F87FC003000087E1F87FC22300000FE0F83FC62300000FF0
      F87FFE0300000FD0F83FF00700000FD0FC1FE00700000BD0FE0FC03F00000B40
      F80FC23F00000B40F80FC20300000B40FC0FC00700008341FE07E0070000C143
      FF0FF00F0000E007FF9FFE3F0000F00FC0018FF1C7E3FF03800107E0C7E3F800
      800103C08001F800800101808001E000800180018001E001C001C00300008083
      8001E007000081C78001F00F000083FF8001F00F000007FF8001E007000003FF
      C001C003000001FF80018001000000FF80010180000000FF800103C0000001FF
      800107E0000083FFC0018FF10000C7FFFC00F81FFC7FF81FFC00E007F83FE007
      FC00C003F81FC003FC008181F91F818100008181801F818100000180003F0000
      00000180107F018001001FF80001018001001FF88001018005010180EE000180
      05010180FE38018049078181FE1F818140078181FE1F818140FFC003FE1FC003
      01FFE007FF1FE00703FFF81FFF9FF81FF81F8001F81FFFFFE0070000E007C083
      C0030000C003C083800110188001E003880118108801E0030000066010000000
      0000066010000000080001800000000008600180000000001000066010000000
      000006601000E000880108188801C003800118088001C183C0030000C003C183
      E0070000E007E187F81F8001F81FFFFF9FFFF81FDFF9C00387FFE00787F18001
      87FFC00387E1800183FF800183E38001C1FF800181C38001E08F0000C1878001
      E0870080C0078001F8070380E00F8001F8030180F01F8001F0010000F01F8001
      F0010000E01F8001F021800180078001F063800101078001F80FC00303C0FA1F
      FC1FE00707E0FC3FFE3FF81FFFFFFE7FFFFFE007FFFFF81F0000C0070000E007
      0000C0070000C0030000C0076DA680010000C00700008001FE7FC0076DA60260
      FE7FC0076DA60060F81FC00700000080F81FC0076DA60080E007C00700000060
      E007C00700000220C001C007000080018001C007000080010000C0078FF1C003
      FFFFC0078FF1E007FFFFE007FFFFF81F80019FFFF9FF800700008FFFE07F8201
      000087FFE07F8201000083FF801F8201000081FF801F82010000F0FF00078423
      0000E07F0007C6E70000F8078001F00F0000F8038001F01F0000F801E000F01F
      0000F801E000E01F0000F801F818E00F0000F821F810E00F0000FC01FE00E00F
      0000FC03FE00F01F0000FE07FF81F81F8000FCFFFE7F80010000F87FFC7F0000
      0000F07FF87F00000000E01FF07F00800000C01FE000008000008007C0000080
      000000078000018000000303000003F800008701000013C00000CF80800017F8
      0000FFC0C00017F80000FFE1E00017C00000FFF3F07F13F80000FFFFF87F01F8
      0000FFFFFC7F00000000FFFFFE7F8001FFFFFC3FFFFFF81FFFFFE0070000F81F
      C3C1C0030000F81FC3C180016DA6F81FC3C180010000F81FC08180016DA60000
      C00101806DA60000C00103C000000000E00303C06DA60000F087018000000000
      F087C00100000000F08780010000F81FF9CF80010000F81FF9CFC0038FF1F81F
      FFFFE4278FF1F81FFFFFFC3FFFFFF81FFE7FF00FF00FF81FFC3FE007E007E007
      F81FC003C003C003F00F800180018001E007000000008001C003000000000000
      8001000000000000000000000000000000000000000000008001000000000000
      C003000000000000E007000000008001F00F800180018001F81FC003C003C003
      FC3FE007E007E007FE7FF00FF00FF81FFFFF0000FFFFFFFFFF9F0000E007FFFF
      FF0F0000C003FFFFFE0F0000C003800380070000C003800380230000C0038003
      80330000C003800380390000C0038003803C0000C0038003803E0000C0038003
      873F0000C0038003803F0000C003C0E7857F0000C003E1F380FF0000E007FFFB
      81FF0000FC3FFFFDFFFF0000FFFFFFFFFFFFFE7FFFFF0000FE7FFC3FFFFF0000
      F81FF81FFEFF0000E007F00FFC7F00008001E007F87F00000000C003F03F0000
      00008001F01F000000000000F30F000000000000F78F000080018001FF870000
      8001C003FFE10000C003E007FFF10000C003F00FFFF10000F81FF81FFFF90000
      FE7FFC3FFFFF0000FFFFFE7FFFFF0000C000FEFFFFFFFFFF0000F87FFF80FFFF
      0000F87FFF00FD7F0000F87FFE00101F0001F80FFE00000F8001F803E0000007
      8003F001E0000003C003C001E0000001C0078001FE010000E0078001FE030001
      E00F8001BF831883F00F80038FEFFFD7F01F800707CFFFFFF81FC01F001FFFFF
      F83FC07F007FFFFFFC7FE1FF8FFFFFFFFFFFFFFFFFFFF81FFFFFFFFCFFFFE007
      FFFFF3FFFFFFC003FFFFE1F9FFFF8001FC7FE1F3FFFF8001FD7FF0E3E7FF0000
      FD7FF847CF830000E10FFC0FDFC30000EFEFFE1FDFE30000E10FFC0FDFD30000
      FD7FF84FCF3B0000FD7FE0E3E0FF8001FC7FC1F1FFFF8001FFFFC7F8FFFFC003
      FFFFFFFFFFFFE007FFFFFFFFFFFFF81F00000000000000000000000000000000
      000000000000}
  end
  object ImageListFilial: TImageList
    Left = 312
    Top = 137
    Bitmap = {
      494C01010100CC00CC0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F10001000100010001000
      1000100010001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1000100010001000FF7F
      FF7FFF7F10001000100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      FF7F1000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      FF7F1000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      FF7F1000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F1000100010001000FF7FFF7F
      FF7FFF7FFF7F10001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      FF7F1000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F100010001000100010001000
      FF7F1000100010001000100010001000FF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F10001000100010001000
      FF7F10001000FF7F100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7F1000100010001000FF7F
      FF7FFF7FFF7FFF7F100010001000FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7F1000100010001000
      100010001000100010001000FF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7F10001000
      1000100010001000FF7FFF7F0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F81F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080010000000000008001000000000000C003000000000000
      E007000000000000F81F00000000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMT102: TPopupMenu
    Images = ImageList
    Left = 440
    Top = 154
    object N1: TMenuItem
      Tag = 1
      Action = Mt102Insert
      Default = True
      ShortCut = 45
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N19: TMenuItem
      Action = Mt102Edit
    end
    object N2: TMenuItem
      Action = MT102Delete
    end
    object N3: TMenuItem
      Action = Mt102Refresh
      ShortCut = 116
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = Mt102Accept
    end
    object N23: TMenuItem
      Caption = #199'ap et'
      ImageIndex = 14
      OnClick = N23Click
    end
    object s1: TMenuItem
      Caption = 'Se'#231'ilmi'#351'i '#231'ap et'
      ImageIndex = 14
      OnClick = s1Click
    end
    object T1: TMenuItem
      Caption = 'Tarixi d'#601'yi'#351
      ImageIndex = 22
      OnClick = T1Click
    end
  end
  object PopupMessIn: TPopupMenu
    Images = ImageList
    Left = 428
    Top = 216
    object MenuItem5: TMenuItem
      Action = MessagesInRefresh
      ShortCut = 116
    end
    object MenuItem3: TMenuItem
      Tag = 1
      Action = MessagesInEdit
      Caption = 'Redakt'#601' et'
      Default = True
    end
    object MenuItem6: TMenuItem
      Action = MessInDelete
      Caption = 'L'#601#287'v et'
    end
    object MenuItem7: TMenuItem
      Action = MessagesInAccept
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #399'vv'#601'l'#601
      OnClick = N7Click
    end
    object N6: TMenuItem
      Caption = 'Sonuna'
      OnClick = N6Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object pRINT2: TMenuItem
      Caption = #199'ap '
      Visible = False
    end
    object N8: TMenuItem
      Caption = 'Ham'#305's'#305'n'#305' se'#231
      ShortCut = 16449
      OnClick = N8Click
    end
    object N22: TMenuItem
      Caption = #214'd'#601'ni'#351' '#199'ap et'
      ImageIndex = 14
      ShortCut = 16464
      OnClick = N22Click
    end
    object N25: TMenuItem
      Caption = 'Se'#231'ilmi'#351'i '#231'ap et'
      ImageIndex = 14
      OnClick = N25Click
    end
    object Man1: TMenuItem
      Caption = 'T'#601'l'#601'bnam'#601'ni T'#601'sdiq Et'
      ImageIndex = 10
      Visible = False
      OnClick = Man1Click
    end
    object MandatLvEt1: TMenuItem
      Caption = 'T'#601'l'#601'bnam'#601'ni L'#601#287'v Et'
      ImageIndex = 1
      Visible = False
      OnClick = MandatLvEt1Click
    end
  end
  object InfoPopup: TPopupMenu
    Images = ImageList
    Left = 645
    Top = 232
    object Clear1: TMenuItem
      Caption = 'Silm'#601'k'
      ImageIndex = 1
      OnClick = Clear1Click
    end
  end
  object Popup_SingleConvert: TPopupMenu
    Images = ImageList
    Left = 765
    Top = 280
    object Convert1: TMenuItem
      Caption = 'Convert'
      ImageIndex = 13
      OnClick = Convert1Click
    end
    object ConvertAll1: TMenuItem
      Caption = 'Convert All'
      ImageIndex = 6
      OnClick = ConvertAll1Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object Sendtoarchive2: TMenuItem
      Caption = 'Send file to archive'
      ImageIndex = 8
      OnClick = Sendtoarchive2Click
    end
    object SendToArchive1: TMenuItem
      Caption = 'Send file to Archive  (All)'
      OnClick = SendToArchive1Click
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object ClearSelected1: TMenuItem
      Caption = 'Delete Selected'
      OnClick = ClearSelected1Click
    end
    object ClearList1: TMenuItem
      Caption = 'Clear List'
      OnClick = ClearList1Click
    end
  end
  object PopupMessOut: TPopupMenu
    Images = ImageList
    Left = 700
    Top = 442
    object MenuItem1: TMenuItem
      Tag = 1
      Action = MessagesOutAdd
    end
    object N5: TMenuItem
      Action = MessagesOutEdit
      Default = True
    end
    object MenuItem2: TMenuItem
      Action = MessOutDelete
    end
    object MenuItem4: TMenuItem
      Action = MessagesOutAccept
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #399'vv'#601'l'#601
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = 'Sonuna'
      OnClick = N11Click
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object N21: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      Caption = #199'ap et'
      ImageIndex = 14
      ShortCut = 16464
      OnClick = N21Click
    end
    object N9: TMenuItem
      Caption = 'Ham'#305's'#305'n'#305' se'#231
      ShortCut = 16449
      OnClick = N9Click
    end
  end
  object MainAction: TActionList
    Images = ImageList
    Left = 880
    Top = 160
    object Mt102Insert: TAction
      Category = 'XS_Batchs'
      Caption = 'Yeni'
      ImageIndex = 0
      OnExecute = Mt102InsertExecute
    end
    object MT102Delete: TAction
      Category = 'XS_Batchs'
      Caption = 'L'#601#287'v et'
      ImageIndex = 1
      OnExecute = MT102DeleteExecute
    end
    object Mt102Refresh: TAction
      Category = 'XS_Batchs'
      Caption = 'Yenil'#601
      ImageIndex = 2
      OnExecute = Mt102RefreshExecute
    end
    object Mt102Accept: TAction
      Category = 'XS_Batchs'
      Caption = 'T'#601'sdiq et'
      ImageIndex = 3
      OnExecute = Mt102AcceptExecute
    end
    object MessagesOutAdd: TAction
      Category = 'XS_Beneficiary'
      Caption = #399'lav'#601' et'
      ImageIndex = 0
      OnExecute = MessagesOutAddExecute
    end
    object MessagesOutEdit: TAction
      Category = 'XS_Beneficiary'
      Caption = 'Redakt'#601' et'
      ImageIndex = 12
      OnExecute = MessagesOutEditExecute
    end
    object MessOutDelete: TAction
      Category = 'XS_Beneficiary'
      Caption = 'L'#601#287'v et'
      ImageIndex = 1
      ShortCut = 46
      OnExecute = MessOutDeleteExecute
    end
    object MessagesOutAccept: TAction
      Category = 'XS_Beneficiary'
      Caption = 'D'#252'zg'#252'nd'#252'r'
      ImageIndex = 3
      OnExecute = MessagesOutAcceptExecute
    end
    object MessagesInConvert: TAction
      Category = 'XS_Incoming'
      Caption = '   Konvert  '
      ImageIndex = 6
      OnExecute = MessagesInConvertExecute
    end
    object MessagesInEdit: TAction
      Category = 'XS_Incoming'
      Caption = 'Redakt'#601
      ImageIndex = 12
      OnExecute = MessagesInEditExecute
    end
    object MessagesInRefresh: TAction
      Category = 'XS_Incoming'
      Caption = 'Yenil'#601
      ImageIndex = 2
      OnExecute = MessagesInRefreshExecute
    end
    object MessInDelete: TAction
      Category = 'XS_Incoming'
      Caption = 'L'#601'gv et'
      ImageIndex = 1
      ShortCut = 46
      OnExecute = MessInDeleteExecute
    end
    object MessagesInAccept: TAction
      Category = 'XS_Incoming'
      Caption = 'Yoxlan'#305'b'
      ImageIndex = 3
      OnExecute = MessagesInAcceptExecute
    end
    object MessageOutSelAll: TAction
      Category = 'XS_Beneficiary'
      Caption = 'MessageInSelAll'
      ShortCut = 16449
      OnExecute = MessageOutSelAllExecute
    end
    object MessageInSelAll: TAction
      Category = 'XS_Incoming'
      Caption = 'MessageInSelAll'
      ShortCut = 16449
      OnExecute = MessageInSelAllExecute
    end
    object Mt102Edit: TAction
      Category = 'XS_Batchs'
      Caption = 'Redakt'#601
      ImageIndex = 12
      OnExecute = Mt102EditExecute
    end
    object MessageInFileLoad: TAction
      Category = 'XS_Incoming'
      Caption = '      Fayl'#305' y'#252'kl'#601'     '
      ImageIndex = 15
      OnExecute = MessageInFileLoadExecute
    end
  end
  object PopupMenuConvert: TPopupMenu
    Left = 677
    Top = 152
    object ConvertConfirme: TMenuItem
      Caption = 'Konvert+t'#601'sdiq'
      OnClick = ConvertConfirmeClick
    end
  end
  object PopMenuArchPrint: TPopupMenu
    Left = 780
    Top = 203
    object Print1: TMenuItem
      Caption = #199'ap et'
      OnClick = Print1Click
    end
  end
  object PopMenuArc: TPopupMenu
    Images = ImageList
    Left = 556
    Top = 169
    object MenuItem15: TMenuItem
      Caption = #199'ap et'
      ImageIndex = 14
      OnClick = MenuItem15Click
    end
    object S2: TMenuItem
      Caption = 'Se'#231'ilmi'#351'i '#199'ap Et'
      ImageIndex = 14
      OnClick = S2Click
    end
    object E1: TMenuItem
      Caption = 'Excel'
      ImageIndex = 183
      OnClick = E1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList
    Left = 512
    Top = 240
    object N24: TMenuItem
      Caption = #199'ap et'
      ImageIndex = 14
      OnClick = N24Click
    end
    object N26: TMenuItem
      Caption = 'Ham'#305's'#305'n'#305' '#231'ap et'
      ImageIndex = 14
      OnClick = N26Click
    end
  end
  object ActionList1: TActionList
    Left = 160
    Top = 264
    object Konvert: TAction
      Caption = 'Konvert'
      OnExecute = KonvertExecute
    end
    object m104: TAction
      Caption = '104m'
      OnExecute = m104Execute
    end
    object Deleting: TAction
      Caption = 'Deleting'
      OnExecute = DeletingExecute
    end
  end
  object benefisiarpop: TPopupMenu
    Images = ImageList
    Left = 928
    Top = 272
    object C1: TMenuItem
      Caption = #199'ap'
      OnClick = C1Click
    end
    object H1: TMenuItem
      Caption = 'Hesab'#305' yoxla'
      OnClick = H1Click
    end
    object G1: TMenuItem
      Caption = 'Geri qaytat'
      ImageIndex = 16
      OnClick = G1Click
    end
  end
  object CMExcelExport1: TCMExcelExport
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = -11
    FontTitles.Name = 'Tahoma'
    FontTitles.Style = []
    OrientationTitles = 0
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = -11
    FontData.Name = 'Tahoma'
    FontData.Style = []
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = -11
    FontSummary.Name = 'Tahoma'
    FontSummary.Style = []
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    Left = 768
    Top = 112
  end
  object QExport4Xlsx1: TQExport4Xlsx
    About = '(About EMS AdvancedExport)'
    _Version = '4.10.0.1'
    Formats.DecimalSeparator = '.'
    Formats.ThousandSeparator = ','
    Formats.DateSeparator = '.'
    Formats.TimeSeparator = ':'
    Formats.BooleanTrue = 'true'
    Formats.BooleanFalse = 'false'
    Formats.IntegerFormat = '#,###,##'
    Formats.FloatFormat = '#,###,##'
    Formats.DateFormat = 'dd/MM/yyyy'
    Formats.TimeFormat = 'hh:mm'
    Formats.DateTimeFormat = 'dd/MM/yyyy'
    Formats.CurrencyFormat = ' #,###,##0.00'
    SheetName = 'sheet1'
    XlsxOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.HeaderStyle.Font.Color = clBlack
    XlsxOptions.HeaderStyle.Font.Height = -19
    XlsxOptions.HeaderStyle.Font.Name = 'Tahoma'
    XlsxOptions.HeaderStyle.Font.Style = []
    XlsxOptions.HeaderStyle.BackgroundColor = 8404992
    XlsxOptions.HeaderStyle.UseBackground = True
    XlsxOptions.CaptionRowStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.CaptionRowStyle.Font.Color = clBlack
    XlsxOptions.CaptionRowStyle.Font.Height = -15
    XlsxOptions.CaptionRowStyle.Font.Name = 'Calibri'
    XlsxOptions.CaptionRowStyle.Font.Style = []
    XlsxOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.DataStyle.Font.Color = clBlack
    XlsxOptions.DataStyle.Font.Height = -15
    XlsxOptions.DataStyle.Font.Name = 'Calibri'
    XlsxOptions.DataStyle.Font.Style = []
    XlsxOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    XlsxOptions.FooterStyle.Font.Color = clBlack
    XlsxOptions.FooterStyle.Font.Height = -15
    XlsxOptions.FooterStyle.Font.Name = 'Calibri'
    XlsxOptions.FooterStyle.Font.Style = []
    XlsxOptions.StripStylesList = <>
    Left = 280
    Top = 192
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    TextEncoding = UnicodeEncoding
    Codepage = '1251'
    Left = 208
    Top = 304
  end
end
