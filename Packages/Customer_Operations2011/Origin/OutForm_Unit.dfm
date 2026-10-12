object OutForm: TOutForm
  Left = 250
  Top = 270
  BorderStyle = bsDialog
  Caption = 'ям€лиййат'
  ClientHeight = 362
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 30
    Width = 659
    Height = 125
    Align = alTop
    TabOrder = 2
    object HeaderControl1: THeaderControl
      Left = 2
      Top = 15
      Width = 655
      Height = 17
      DragReorder = False
      Sections = <
        item
          ImageIndex = -1
          Text = 'ƒ≈Ѕ≈“'
          Width = 327
        end
        item
          ImageIndex = -1
          Text = ' –≈ƒ»“'
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
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label2: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
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
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 0
          Top = 0
          Width = 321
          Height = 21
          Enabled = False
          KeyField = 'NAME'
          ListField = 'NAME'
          ListSource = CO_DataMod.ACC_data_
          TabOrder = 0
          OnClick = DBLookupComboBox1Click
        end
        object DBEdit1: TDBEdit
          Left = 0
          Top = 0
          Width = 301
          Height = 21
          Color = clSilver
          DataField = 'NAME'
          DataSource = CO_DataMod.ACC_data_
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
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 168
          Top = 0
          Width = 153
          Height = 21
          Enabled = False
          KeyField = 'ACC_NO'
          ListField = 'ACC_NO'
          ListSource = CO_DataMod.ACC_data_
          TabOrder = 0
          OnClick = DBLookupComboBox2Click
        end
        object DBEdit2: TDBEdit
          Left = 169
          Top = 0
          Width = 133
          Height = 21
          Color = clSilver
          DataField = 'ACC_NO'
          DataSource = CO_DataMod.ACC_data_
          Enabled = False
          TabOrder = 1
        end
        object DebtAccSearchEdit: TSearchEdit
          Left = 0
          Top = 0
          Width = 169
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = DebtAccSearchEditChange
          DataSource = CO_DataMod.ACC_data_
          SearchField = 'acc_no'
        end
        object acc_id_: TEdit
          Left = 80
          Top = 0
          Width = 88
          Height = 21
          TabOrder = 3
          Visible = False
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
        object valcode: TEdit
          Left = 0
          Top = 0
          Width = 81
          Height = 21
          Enabled = False
          TabOrder = 0
          OnChange = valcodeChange
        end
        object editvalute: TComboBox
          Left = 80
          Top = 0
          Width = 145
          Height = 21
          Color = clSilver
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          OnChange = editvaluteChange
        end
        object editrate: TEdit
          Left = 223
          Top = 0
          Width = 95
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 2
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
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Caption = '√алыг:'
          end
          object Label4: TLabel
            Left = 146
            Top = 3
            Width = 53
            Height = 13
            Caption = '≈квивалент:'
          end
          object c_ostat: TLabel
            Left = 35
            Top = 4
            Width = 35
            Height = 13
            Caption = 'c_ostat'
          end
          object c_pok_ostat: TLabel
            Left = 202
            Top = 3
            Width = 59
            Height = 13
            Caption = 'c_pok_ostat'
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
          Width = 321
          Height = 21
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 0
          Top = 0
          Width = 305
          Height = 21
          Color = clSilver
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
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 157
          Top = 0
          Width = 165
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 159
          Top = 0
          Width = 144
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 1
        end
        object CreditAccSearchEdit: TSearchEdit
          Left = 0
          Top = 0
          Width = 159
          Height = 21
          Enabled = False
          TabOrder = 2
          OnChange = CreditAccSearchEditChange
          DataSource = CO_DataMod.ACC_Data
          SearchField = 'acc_no'
        end
        object acc_id: TEdit
          Left = 80
          Top = 0
          Width = 73
          Height = 21
          TabOrder = 3
          Visible = False
          OnChange = acc_idChange
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
        object valcode_: TEdit
          Left = 0
          Top = 0
          Width = 77
          Height = 21
          Enabled = False
          TabOrder = 0
          OnChange = valcode_Change
        end
        object editvalute_: TComboBox
          Left = 79
          Top = 0
          Width = 149
          Height = 21
          Color = clSilver
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          OnChange = editvalute_Change
        end
        object editrate_: TEdit
          Left = 226
          Top = 0
          Width = 93
          Height = 21
          Color = clSilver
          Enabled = False
          TabOrder = 2
        end
        object Edit1: TEdit
          Left = 88
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 3
          Text = 'Edit1'
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 155
    Width = 659
    Height = 64
    Align = alTop
    Caption = 'ћ€бл€ьл€р'
    TabOrder = 0
    object Panel3: TPanel
      Left = 4
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = 'ƒебет м€бл€ь'
      TabOrder = 0
      object debtvalue: TEdit
        Tag = 1
        Left = 79
        Top = 2
        Width = 241
        Height = 19
        TabOrder = 0
        Text = '0'
        OnChange = debtvalueChange
        OnKeyPress = debtvalueKeyPress
      end
    end
    object Panel12: TPanel
      Left = 328
      Top = 15
      Width = 326
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  редит м€бл€ь'
      TabOrder = 1
      object creditvalue: TEdit
        Tag = 1
        Left = 76
        Top = 2
        Width = 245
        Height = 19
        TabOrder = 0
        Text = '0'
        OnChange = Edit2Change
        OnKeyPress = creditvalueKeyPress
      end
    end
    object Panel13: TPanel
      Left = 2
      Top = 38
      Width = 652
      Height = 23
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' ћилли валйутада еквивалент'
      TabOrder = 2
      object Ekv: TEdit
        Left = 208
        Top = 1
        Width = 241
        Height = 20
        Enabled = False
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 219
    Width = 659
    Height = 64
    Align = alTop
    Caption = 'ћ€луматлар'
    TabOrder = 3
    object Panel14: TPanel
      Left = 2
      Top = 38
      Width = 655
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  онвертасийа т€йинаты'
      TabOrder = 1
      object ConvertationSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        KeyField = 'ID'
        ListField = 'FULLPATH'
        ListSource = CO_DataMod.ConvertationSymbolsData
        TabOrder = 0
        TabStop = False
      end
      object SearchEdit2: TSearchEdit
        Left = 118
        Top = 0
        Width = 73
        Height = 21
        Enabled = False
        TabOrder = 1
        DataSource = CO_DataMod.ConvertationSymbolsData
        SearchField = 'id'
      end
      object DBEdit7: TDBEdit
        Left = 192
        Top = 0
        Width = 441
        Height = 21
        Color = clSilver
        DataField = 'FULLPATH'
        DataSource = CO_DataMod.ConvertationSymbolsData
        Enabled = False
        TabOrder = 2
      end
    end
    object Panel15: TPanel
      Left = 2
      Top = 15
      Width = 655
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = '  асса символу'
      TabOrder = 0
      object CashSymbolLookUp: TDBLookupComboBox
        Left = 192
        Top = 1
        Width = 460
        Height = 21
        Color = clSilver
        DataField = 'INBALANCECHAR'
        KeyField = 'SYMBOL'
        ListField = 'NAME'
        ListSource = CO_DataMod.CashSymbolsData
        TabOrder = 0
        TabStop = False
      end
      object SearchEdit3: TSearchEdit
        Left = 118
        Top = 0
        Width = 72
        Height = 21
        Enabled = False
        TabOrder = 1
        DataSource = CO_DataMod.CashSymbolsData
        SearchField = 'symbol '
      end
      object DBEdit8: TDBEdit
        Left = 193
        Top = 0
        Width = 440
        Height = 21
        Color = clSilver
        DataField = 'NAME'
        DataSource = CO_DataMod.CashSymbolsData
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object Panel16: TPanel
    Left = 0
    Top = 282
    Width = 657
    Height = 23
    Alignment = taLeftJustify
    BevelInner = bvLowered
    Caption = ' ям€лиййатын т€йинаты'
    TabOrder = 4
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 194
      Top = 0
      Width = 460
      Height = 21
      Enabled = False
      KeyField = 'NAME'
      ListField = 'NAME'
      ListSource = CO_DataMod.Trdestinationdata
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Left = 195
      Top = 0
      Width = 441
      Height = 21
      DataField = 'NAME'
      DataSource = CO_DataMod.Trdestinationdata
      Enabled = False
      TabOrder = 1
    end
    object SearchEdit1: TSearchEdit
      Left = 120
      Top = 0
      Width = 74
      Height = 21
      Enabled = False
      TabOrder = 2
      DataSource = CO_DataMod.Trdestinationdata
      SearchField = 'id'
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 659
    Height = 30
    Align = alTop
    TabOrder = 5
    object Label5: TLabel
      Left = 8
      Top = 9
      Width = 77
      Height = 13
      Caption = 'ям€лиййатын тарихи'
    end
    object Label6: TLabel
      Left = 216
      Top = 9
      Width = 67
      Height = 13
      Caption = 'ям€лиййатын є'
    end
    object Label7: TLabel
      Left = 383
      Top = 9
      Width = 61
      Height = 13
      Caption = 'ям€лиййат типи'
    end
    object TransDate: TDateTimePicker
      Left = 96
      Top = 7
      Width = 105
      Height = 21
      CalAlignment = dtaLeft
      Date = 38125.6610020023
      Time = 38125.6610020023
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
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
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 504
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'NAME'
      ListField = 'NAME'
      ListSource = CO_DataMod.OperationTypesData
      TabOrder = 2
    end
    object DBEdit9: TDBEdit
      Left = 505
      Top = 8
      Width = 127
      Height = 21
      DataField = 'NAME'
      DataSource = CO_DataMod.OperationTypesData
      Enabled = False
      TabOrder = 3
    end
    object SearchEdit4: TSearchEdit
      Left = 448
      Top = 8
      Width = 56
      Height = 21
      Enabled = False
      TabOrder = 4
      OnChange = SearchEdit4Change
      DataSource = CO_DataMod.OperationTypesData
      SearchField = 'ID'
    end
  end
  object Panel17: TPanel
    Left = 0
    Top = 327
    Width = 659
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object ButtonApply: TButton
      Tag = 1
      Left = 421
      Top = 4
      Width = 75
      Height = 25
      Caption = '&√€бул'
      Enabled = False
      TabOrder = 1
      OnClick = ButtonApplyClick
      OnKeyPress = ButtonApplyKeyPress
    end
    object ButtonCancel: TButton
      Left = 501
      Top = 4
      Width = 75
      Height = 25
      Caption = '&»мтина'
      Enabled = False
      TabOrder = 0
      OnClick = ButtonCancelClick
    end
    object ButtonClose: TButton
      Left = 581
      Top = 4
      Width = 75
      Height = 25
      Caption = '„ыхыш'
      TabOrder = 2
      OnClick = ButtonCloseClick
    end
  end
  object commission_id: TEdit
    Left = 40
    Top = 305
    Width = 121
    Height = 21
    TabOrder = 6
    Visible = False
  end
  object NLSLocalizer1: TNLSLocalizer
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsItalic]
    Left = 184
    Top = 306
  end
end
