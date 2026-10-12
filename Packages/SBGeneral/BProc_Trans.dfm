object frmBTrans: TfrmBTrans
  Left = 314
  Top = 302
  ClientHeight = 361
  ClientWidth = 823
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 823
    Height = 317
    Align = alClient
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TRDATE'
        Title.Caption = #1058#1072#1088#1080#1093
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBTACC'
        Title.Caption = #1044#1077#1073#1077#1090
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KREDACC'
        Title.Caption = #1050#1088#1077#1076#1080#1090
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NATAMOUNT'
        Title.Caption = #1052#1103#1073#1083#1103#1100
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRDESCRIPTION'
        Title.Caption = #1058#1103#1081#1080#1085#1072#1090
        Title.Color = clNavy
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNavy
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 251
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 823
    Height = 44
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      823
      44)
    object Button1: TButton
      Left = 732
      Top = 9
      Width = 81
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1041#1072#1100#1083#1072
      ModalResult = 2
      TabOrder = 0
    end
    object Button2: TButton
      Left = 638
      Top = 9
      Width = 80
      Height = 27
      Anchors = [akTop, akRight]
      Caption = #1058#1103#1089#1076#1080#1075' '#1077#1090
      ModalResult = 1
      TabOrder = 1
    end
  end
end
