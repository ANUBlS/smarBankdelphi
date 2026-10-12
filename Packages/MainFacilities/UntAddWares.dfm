object FrmAddWares: TFrmAddWares
  Left = 150
  Top = 138
  ActiveControl = ENAME
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Adding new wares'
  ClientHeight = 347
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel
    Left = 6
    Top = 230
    Width = 58
    Height = 13
    Caption = 'Амортизасийа'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 347
    Align = alClient
    TabOrder = 0
    object TitlePanel: TPanel
      Left = 1
      Top = 1
      Width = 600
      Height = 41
      Align = alTop
      BevelOuter = bvLowered
      Caption = 'Ясас вясаитлярин ялавя олунмасы'
      Color = clGray
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 1
      Top = 42
      Width = 300
      Height = 304
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object SpeedButton3: TSpeedButton
        Left = 275
        Top = 279
        Width = 23
        Height = 22
        Caption = 'OK'
        Visible = False
        OnClick = SpeedButton3Click
      end
      object Label1: TLabel
        Left = 1
        Top = 280
        Width = 43
        Height = 13
        Caption = 'Бал дяй'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 139
        Top = 280
        Width = 39
        Height = 13
        Caption = 'Йыь ам'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Ясас вясаитин ады:'
        TabOrder = 0
        object ENAME: TEdit
          Left = 92
          Top = 1
          Width = 207
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 25
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Сахланылан бюлмя'
        TabOrder = 1
        object CBDepartments: TComboBox
          Left = 108
          Top = 2
          Width = 190
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 0
          OnChange = CBDepartmentsChange
          OnClick = CBDepartmentsClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 50
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Файдалы хидмят мюддяти:'
        TabOrder = 2
        object EFXM: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 75
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Инвентар №:'
        TabOrder = 3
        object EInventar: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 100
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Инвентарлашма тарихи:'
        TabOrder = 4
        object DTPINVENTAR_DATE: TDateTimePicker
          Left = 183
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CalAlignment = dtaLeft
          Date = 37514.7187411343
          Time = 37514.7187411343
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 125
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Илкин дяйяри:'
        TabOrder = 5
        object EFIRST_PRICE: TEdit
          Left = 184
          Top = 2
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 150
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Баланс дяйяри:'
        TabOrder = 6
        object EBALANCE_PRICE: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 175
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Йыьылмыш амортизасийа'
        TabOrder = 7
        object EAccrualAmort: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 200
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Амортизасийа( НБ ) %'
        TabOrder = 8
        object EAMORTNB: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel13: TPanel
        Left = 0
        Top = 250
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Истещсалчы завод'
        TabOrder = 10
        object EPRODUCER_PLANE: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 225
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Амортизасийа( Верэи ) %'
        TabOrder = 9
        object EAMORTTAX: TEdit
          Left = 184
          Top = 1
          Width = 115
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 46
        Top = 278
        Width = 90
        Height = 21
        TabOrder = 11
        Text = '0'
        Visible = False
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 177
        Top = 278
        Width = 95
        Height = 21
        TabOrder = 12
        Text = '0'
        Visible = False
      end
    end
    object Panel15: TPanel
      Left = 301
      Top = 42
      Width = 300
      Height = 304
      Align = alClient
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 2
      object Panel24: TPanel
        Left = 0
        Top = 25
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Дахилолма №'
        TabOrder = 3
        object EIN_NUM: TEdit
          Left = 165
          Top = 1
          Width = 135
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnKeyPress = EFXMKeyPress
        end
      end
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Дахилолма тарихи:'
        TabOrder = 2
        object DTPIN_DATE: TDateTimePicker
          Left = 166
          Top = 2
          Width = 135
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          CalAlignment = dtaLeft
          Date = 37514.7187411343
          Time = 37514.7187411343
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 50
        Width = 300
        Height = 106
        Align = alTop
        Caption = 'Ясаслы тямир '
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Panel16: TPanel
          Left = 2
          Top = 65
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Ясаслы тямир №'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object SpeedButton1: TSpeedButton
            Left = 258
            Top = 2
            Width = 37
            Height = 22
            Anchors = [akTop, akRight]
            Caption = 'Ok'
            Flat = True
            OnClick = SpeedButton1Click
          end
          object EREPAIR_NUM: TEdit
            Left = 172
            Top = 2
            Width = 84
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnKeyPress = EFXMKeyPress
          end
        end
        object Panel17: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Тарихи:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DTPREPAIR: TDateTimePicker
            Left = 173
            Top = 1
            Width = 124
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CalAlignment = dtaLeft
            Date = 37514.7187411343
            Time = 37514.7187411343
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
        object Panel18: TPanel
          Left = 2
          Top = 40
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Мябляьи:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object EREPAIR_SUMMA: TEdit
            Left = 169
            Top = 2
            Width = 127
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnKeyPress = EFXMKeyPress
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 156
        Width = 300
        Height = 94
        Align = alTop
        Caption = 'Модернляшдирмя '
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Panel19: TPanel
          Left = 2
          Top = 65
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Нюмряси №'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object SpeedButton2: TSpeedButton
            Left = 259
            Top = 2
            Width = 37
            Height = 22
            Anchors = [akTop, akRight]
            Caption = 'Ok'
            Flat = True
            OnClick = SpeedButton2Click
          end
          object EMODERN_NUM: TEdit
            Left = 176
            Top = 2
            Width = 81
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnKeyPress = EFXMKeyPress
          end
        end
        object Panel20: TPanel
          Left = 2
          Top = 40
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Мябляьи:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object EMODERN_SUMMA: TEdit
            Left = 169
            Top = 2
            Width = 127
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnKeyPress = EFXMKeyPress
          end
        end
        object Panel21: TPanel
          Left = 2
          Top = 15
          Width = 296
          Height = 25
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Тарихи:'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object DTPMODERN: TDateTimePicker
            Left = 170
            Top = 1
            Width = 127
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            CalAlignment = dtaLeft
            Date = 37514.7187411343
            Time = 37514.7187411343
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
        end
        object EMODER5N_NUM: TEdit
          Left = 104
          Top = 188
          Width = 113
          Height = 21
          TabOrder = 3
        end
      end
      object Panel22: TPanel
        Left = 0
        Top = 250
        Width = 300
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = ' Йени бюлмя'
        TabOrder = 4
        object SpeedButton5: TSpeedButton
          Left = 261
          Top = 1
          Width = 37
          Height = 22
          Anchors = [akTop, akRight]
          Caption = 'Ok'
          Flat = True
          OnClick = SpeedButton5Click
        end
        object EDepartment: TEdit
          Left = 138
          Top = 1
          Width = 121
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
      end
      object ButtonCommit: TButton
        Left = 146
        Top = 278
        Width = 75
        Height = 25
        Action = ActionCommit
        TabOrder = 5
      end
      object ButtonCancel: TButton
        Left = 223
        Top = 278
        Width = 75
        Height = 25
        Action = ActionCancel
        TabOrder = 6
      end
    end
  end
  object MainActionList: TActionList
    Left = 153
    Top = 9
    object ActionCommit: TAction
      Caption = 'Йаддаша йаз'
      OnExecute = ActionCommitExecute
      OnUpdate = ActionCommitUpdate
    end
    object ActionCancel: TAction
      Caption = 'Имтина'
      OnExecute = ActionCancelExecute
    end
  end
end
