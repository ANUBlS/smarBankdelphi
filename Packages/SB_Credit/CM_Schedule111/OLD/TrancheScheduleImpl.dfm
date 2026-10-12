object TrancheScheduleForm: TTrancheScheduleForm
  Left = 292
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'TrancheScheduleForm'
  ClientHeight = 453
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 412
      Height = 58
      Align = alTop
      Caption = 'Мцгавиля щаггында'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 79
        Height = 41
        Align = alLeft
        TabOrder = 0
        object dbtCValute: TDBText
          Left = 1
          Top = 18
          Width = 77
          Height = 22
          Align = alClient
          Alignment = taCenter
          Color = clWhite
          DataField = 'CURRENCY'
          DataSource = TrancheSheduleDataMod.AboutContractsDataSrc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object stCValute: TStaticText
          Left = 1
          Top = 1
          Width = 77
          Height = 17
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = '$'
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
      end
      object Panel3: TPanel
        Left = 81
        Top = 15
        Width = 193
        Height = 41
        Align = alClient
        TabOrder = 1
        object dbtCustName: TDBText
          Left = 1
          Top = 18
          Width = 191
          Height = 22
          Align = alClient
          Color = clWhite
          DataField = 'CUSTNAME'
          DataSource = TrancheSheduleDataMod.AboutContractsDataSrc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object stCustomerName: TStaticText
          Left = 1
          Top = 1
          Width = 191
          Height = 17
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = 'Мцштяри'
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
      end
      object Panel4: TPanel
        Left = 274
        Top = 15
        Width = 136
        Height = 41
        Align = alRight
        TabOrder = 2
        object dbtCAmount: TDBText
          Left = 1
          Top = 18
          Width = 134
          Height = 22
          Align = alClient
          Alignment = taRightJustify
          Color = clWhite
          DataField = 'AMOUNT'
          DataSource = TrancheSheduleDataMod.AboutContractsDataSrc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object stCAmount: TStaticText
          Left = 1
          Top = 1
          Width = 134
          Height = 17
          Align = alTop
          Alignment = taCenter
          BorderStyle = sbsSingle
          Caption = 'Мцгавилянин мябляьи'
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
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 65
    Width = 416
    Height = 388
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object dbgTranche: TDBGrid
      Left = 2
      Top = 2
      Width = 412
      Height = 207
      Align = alTop
      DataSource = TrancheSheduleDataMod.TrancheScheduleDataSrc
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'No'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRCHAMOUNT'
          Title.Caption = 'Amount'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRCHDATE'
          Title.Caption = 'HDate'
          Width = 100
          Visible = True
        end>
    end
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 288
    Top = 16
  end
end
