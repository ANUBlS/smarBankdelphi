object SettingFrm: TSettingFrm
  Left = 0
  Top = 0
  ClientHeight = 631
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 39
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 477
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 509
      Height = 37
      Align = alClient
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'PK'#350
        'PK'#350' Afto'
        #304'cra')
      ParentFont = False
      TabOrder = 0
      OnClick = RadioGroup1Click
      ExplicitLeft = 2
      ExplicitTop = -4
      ExplicitWidth = 498
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 39
    Width = 511
    Height = 181
    Align = alTop
    Caption = 'M'#252't'#601'x'#601'sisl'#601'r'
    TabOrder = 1
    ExplicitWidth = 477
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 507
      Height = 139
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = PRDataModule.DataSource8
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Width = 25
        end
        item
          EditButtons = <>
          FieldName = 'users'
          Footers = <>
          Width = 204
        end
        item
          EditButtons = <>
          FieldName = 'PLAN'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'E_FAIZ'
          Footers = <>
          Title.Caption = #399'.B bonus %'
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'F_FAIZ'
          Footers = <>
          Title.Caption = 'F.B bonus %'
          Width = 70
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 154
      Width = 507
      Height = 25
      DataSource = PRDataModule.DataSource8
      Align = alBottom
      TabOrder = 1
      OnClick = DBNavigator1Click
      ExplicitWidth = 473
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 220
    Width = 511
    Height = 211
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 477
    object DBGridEh2: TDBGridEh
      Left = 2
      Top = 15
      Width = 507
      Height = 169
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = PRDataModule.DataSource10
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          Width = 276
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 184
      Width = 507
      Height = 25
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 473
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 431
    Width = 511
    Height = 196
    Align = alTop
    Caption = 'Kredit M'#601'hsullar'#305
    TabOrder = 3
    ExplicitWidth = 477
    object DBGridEh3: TDBGridEh
      Left = 2
      Top = 15
      Width = 507
      Height = 154
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = PRDataModule.DataSource13
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'mehsul'
          Footers = <>
          Title.Caption = 'Kreditin tipi'
          Width = 325
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBNavigator3: TDBNavigator
      Left = 2
      Top = 169
      Width = 507
      Height = 25
      DataSource = PRDataModule.DataSource13
      Align = alBottom
      TabOrder = 1
      OnClick = DBNavigator1Click
      ExplicitWidth = 473
    end
  end
end
