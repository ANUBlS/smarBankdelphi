object Form3: TForm3
  Left = 331
  Top = 231
  Width = 415
  Height = 254
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 220
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 17
      Width = 407
      Height = 41
      Align = alTop
      AutoSize = True
      TabOrder = 0
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 405
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ёд€й€н,алан ш€хс:'
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object EIssuedBy: TEdit
        Left = 2
        Top = 19
        Width = 400
        Height = 21
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object StaticText1: TStaticText
      Left = 0
      Top = 0
      Width = 407
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'ћ€дахил / ћ€хариж ќрдерин€ ялав€л€р'
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 0
      Top = 58
      Width = 407
      Height = 43
      Align = alTop
      TabOrder = 2
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 202
        Height = 41
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText3: TStaticText
          Left = 1
          Top = 1
          Width = 200
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = '—€н€дин ады:'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object EPersonDoc: TEdit
          Left = 2
          Top = 19
          Width = 200
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel5: TPanel
        Left = 208
        Top = 1
        Width = 198
        Height = 41
        Align = alRight
        BevelOuter = bvLowered
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object StaticText4: TStaticText
          Left = 1
          Top = 1
          Width = 196
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'ўарадан,н€ вахт верилиб'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object EFromWhen: TEdit
          Left = 2
          Top = 19
          Width = 196
          Height = 21
          TabOrder = 1
        end
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 101
      Width = 407
      Height = 43
      Align = alTop
      TabOrder = 3
      object Panel7: TPanel
        Left = 1
        Top = 1
        Width = 202
        Height = 41
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object StaticText5: TStaticText
          Left = 1
          Top = 1
          Width = 200
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = '—ерийасы:'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object ESeria: TEdit
          Left = 2
          Top = 19
          Width = 200
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel8: TPanel
        Left = 208
        Top = 1
        Width = 198
        Height = 41
        Align = alRight
        BevelOuter = bvLowered
        TabOrder = 1
        object StaticText6: TStaticText
          Left = 1
          Top = 1
          Width = 196
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'Ќюмр€си:'
          Color = clSilver
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object EDocNumber: TEdit
          Left = 2
          Top = 19
          Width = 196
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 207
      Top = 170
      Width = 62
      Height = 25
      Action = ActionInsert
      Caption = 'ялав€'
      Default = True
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 273
      Top = 170
      Width = 62
      Height = 25
      Action = ActionUpdate
      Caption = '–едакт€'
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 339
      Top = 170
      Width = 62
      Height = 25
      Action = ActionDelete
      Caption = '—ил'
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn3Click
    end
    object DBLookupCashInfo: TDBLookupComboBox
      Left = 1
      Top = 145
      Width = 402
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'ISSUEDBY'
      ListSource = DataBrowseCashInfo
      ParentFont = False
      TabOrder = 7
      OnClick = DBLookupCashInfoClick
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 192
      Width = 121
      Height = 21
      DataField = 'ID'
      DataSource = CO_DataMod.TransactionsData
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object Edit1: TEdit
      Left = 136
      Top = 200
      Width = 249
      Height = 21
      TabOrder = 9
      Text = 'Edit1'
      Visible = False
    end
  end
  object ActionList1: TActionList
    Left = 456
    Top = 280
    object ActionInsert: TAction
      Caption = 'ялав€'
    end
    object ActionUpdate: TAction
      Caption = '–едакт€'
    end
    object ActionDelete: TAction
      Caption = '—ил'
    end
  end
  object BrowseCashInfo: TOracleDataSet
    SQL.Strings = (
      'SELECT '
      '       issuedby,'
      '       max(id) as id, '
      '       max(person_doc) as person_doc, '
      '       max(seria) as seria, '
      '       max(docnumber) as docnumber, '
      '       max(fromwhen) as fromwhen'
      'FROM cashinfo '
      'group by issuedby'
      'order by issuedby')
    QBEDefinition.QBEFieldDefs = {
      0400000006000000080000004953535545444259010000000000020000004944
      0100000000000A000000504552534F4E5F444F43010000000000050000005345
      52494101000000000009000000444F434E554D42455201000000000008000000
      46524F4D5748454E010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 72
    Top = 168
    object BrowseCashInfoISSUEDBY: TStringField
      FieldName = 'ISSUEDBY'
      Size = 100
    end
    object BrowseCashInfoID: TFloatField
      FieldName = 'ID'
    end
    object BrowseCashInfoPERSON_DOC: TStringField
      FieldName = 'PERSON_DOC'
      Size = 40
    end
    object BrowseCashInfoSERIA: TStringField
      FieldName = 'SERIA'
      Size = 40
    end
    object BrowseCashInfoDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 40
    end
    object BrowseCashInfoFROMWHEN: TStringField
      FieldName = 'FROMWHEN'
      Size = 100
    end
  end
  object DataBrowseCashInfo: TDataSource
    DataSet = BrowseCashInfo
    Left = 32
    Top = 168
  end
  object OPCash: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'SB_cashreport'
    Left = 112
    Top = 168
  end
end
