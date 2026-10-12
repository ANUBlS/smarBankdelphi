object CO_TransTypeIncOut: TCO_TransTypeIncOut
  Left = 398
  Top = 237
  BorderStyle = bsDialog
  Caption = 'CO_TransTypeIncOut'
  ClientHeight = 380
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SettingsBrowser: TDBGrid
    Left = 0
    Top = 0
    Width = 915
    Height = 294
    Align = alTop
    Color = clWhite
    DataSource = CO_DataMod.CO_In_data
    DrawingStyle = gdsGradient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = SettingsBrowserDblClick
    Columns = <
      item
        Color = clGray
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #399'm'#601'liyyat'#305'n ad'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITACCOUNT'
        Title.Caption = 'Debet'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'DEBITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITACCOUNT'
        Title.Caption = 'Kredit'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 119
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'CREDITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADEBT'
        Title.Caption = 'Komissiya debet'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'ADEBITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACREDIT'
        Title.Caption = 'Komissiya kredit'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 122
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'ACREDITCURRENCY'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 294
    Width = 915
    Height = 49
    Align = alTop
    AutoSize = True
    BevelInner = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Panel5: TPanel
      Left = 2
      Top = 2
      Width = 911
      Height = 23
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' '#399'm'#601'liyyat'#305'n t'#601'yinat'#305':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        911
        23)
      object DBEditAssignment: TDBEdit
        Left = 110
        Top = 0
        Width = 802
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'ASSIGNMENT'
        DataSource = CO_DataMod.CO_In_data
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 2
      Top = 25
      Width = 911
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Komissiya '#601'm'#601'liyyat'#305'n'#305'n t'#601'yinat'#305':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        911
        22)
      object DBEditComissionAssignment: TDBEdit
        Left = 169
        Top = 0
        Width = 744
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clSilver
        DataField = 'COMMISIONASSIGNMENT'
        DataSource = CO_DataMod.CO_In_data
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 343
    Width = 915
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      915
      35)
    object ButtonRefresh: TButton
      Left = 747
      Top = 6
      Width = 81
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Yenil'#601
      TabOrder = 0
      OnClick = ButtonRefreshClick
    end
    object ButtonClose: TButton
      Left = 832
      Top = 6
      Width = 81
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Ba'#287'la'
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
    object BtnAdd: TButton
      Left = 662
      Top = 9
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #399'lav'#601
      TabOrder = 2
      OnClick = BtnAddClick
    end
  end
end
