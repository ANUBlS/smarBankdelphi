object frmAbonAddEdit: TfrmAbonAddEdit
  Left = 372
  Top = 188
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 339
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 297
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 15
      Height = 13
      Caption = 'Ады'
      FocusControl = edName
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 70
      Height = 13
      Caption = 'Гейдиййат тарихи'
      FocusControl = edReg
    end
    object Label4: TLabel
      Left = 136
      Top = 48
      Width = 47
      Height = 13
      Caption = 'Сяняд типи'
      FocusControl = edDocType
    end
    object Label5: TLabel
      Left = 264
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Сянядин №'
      FocusControl = edDoc
    end
    object Label6: TLabel
      Left = 8
      Top = 88
      Width = 34
      Height = 13
      Caption = 'Цнваны'
      FocusControl = edAddr
    end
    object Label7: TLabel
      Left = 8
      Top = 128
      Width = 42
      Height = 13
      Caption = 'Телефону'
      FocusControl = edPhon
    end
    object Label8: TLabel
      Left = 152
      Top = 128
      Width = 49
      Height = 13
      Caption = 'Иш телефону'
      FocusControl = edWPhon
    end
    object Label11: TLabel
      Left = 256
      Top = 180
      Width = 90
      Height = 13
      Caption = 'Гябуледижилярин сайы'
      FocusControl = edReciever
    end
    object Label12: TLabel
      Left = 200
      Top = 208
      Width = 55
      Height = 13
      Caption = 'Эялмя вахты'
      FocusControl = edEngTime
    end
    object Label13: TLabel
      Left = 8
      Top = 208
      Width = 46
      Height = 13
      Caption = 'Мцщяндис'
      FocusControl = edEngineer
    end
    object Label14: TLabel
      Left = 320
      Top = 208
      Width = 56
      Height = 13
      Caption = 'Битирмя вайты'
      FocusControl = edDone
    end
    object Label16: TLabel
      Left = 104
      Top = 260
      Width = 30
      Height = 13
      Caption = 'Sтатус'
      FocusControl = edStatus
    end
    object Label1: TLabel
      Left = 296
      Top = 128
      Width = 66
      Height = 13
      Caption = 'Mobil телефону'
      FocusControl = edMobPhone
    end
    object Label9: TLabel
      Left = 40
      Top = 8
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 88
      Top = 48
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 192
      Top = 48
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 56
      Top = 88
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 352
      Top = 176
      Width = 17
      Height = 13
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edName: TEdit
      Left = 8
      Top = 24
      Width = 329
      Height = 21
      TabOrder = 0
    end
    object edReg: TDateTimePicker
      Left = 8
      Top = 64
      Width = 112
      Height = 21
      CalAlignment = dtaLeft
      Date = 39185.5133065625
      Time = 39185.5133065625
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object edDocType: TDBLookupComboBox
      Left = 136
      Top = 64
      Width = 113
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModCable.dsDocTypes
      TabOrder = 2
    end
    object edDoc: TEdit
      Left = 264
      Top = 64
      Width = 169
      Height = 21
      TabOrder = 3
    end
    object edAddr: TEdit
      Left = 8
      Top = 104
      Width = 425
      Height = 21
      TabOrder = 4
    end
    object edPhon: TEdit
      Left = 8
      Top = 144
      Width = 140
      Height = 21
      TabOrder = 5
    end
    object edWPhon: TEdit
      Left = 152
      Top = 144
      Width = 140
      Height = 21
      TabOrder = 6
    end
    object edAccRoof: TCheckBox
      Left = 8
      Top = 176
      Width = 73
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Дама чыхыш'
      TabOrder = 7
    end
    object edSignal: TCheckBox
      Left = 120
      Top = 176
      Width = 89
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Sигнализасийа'
      TabOrder = 8
    end
    object edReciever: TEdit
      Left = 368
      Top = 176
      Width = 64
      Height = 21
      TabOrder = 9
    end
    object edEngTime: TDateTimePicker
      Left = 200
      Top = 224
      Width = 112
      Height = 21
      CalAlignment = dtaLeft
      Date = 39185.5136693403
      Time = 39185.5136693403
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 10
    end
    object edEngineer: TDBLookupComboBox
      Left = 8
      Top = 224
      Width = 184
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModCable.dsEngineers
      TabOrder = 11
    end
    object edDone: TDateTimePicker
      Left = 320
      Top = 224
      Width = 112
      Height = 21
      CalAlignment = dtaLeft
      Date = 39185.5136695139
      Time = 39185.5136695139
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 12
    end
    object edVAT: TCheckBox
      Left = 8
      Top = 256
      Width = 57
      Height = 21
      Alignment = taLeftJustify
      Caption = 'ЯДВ'
      TabOrder = 13
    end
    object edStatus: TDBLookupComboBox
      Left = 144
      Top = 256
      Width = 113
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = DataModCable.dsStatuses
      TabOrder = 14
    end
    object edMobPhone: TEdit
      Left = 296
      Top = 144
      Width = 140
      Height = 21
      TabOrder = 15
    end
    object ChBoxForeigner: TCheckBox
      Left = 341
      Top = 24
      Width = 91
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Харижи вятяндаш'
      TabOrder = 16
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 297
    Width = 451
    Height = 42
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Йаддаша йаз'
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 360
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Баьла'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
