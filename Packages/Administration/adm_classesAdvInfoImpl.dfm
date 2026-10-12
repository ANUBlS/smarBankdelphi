object frmClassesAdvInfo: TfrmClassesAdvInfo
  Left = 283
  Top = 326
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sinif'
  ClientHeight = 399
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 239
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      239
      41)
    object btnApply: TBitBtn
      Left = 73
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Yadda saxla'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnClose: TBitBtn
      Left = 157
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 239
    Height = 229
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      239
      229)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Balans hesablar'#305
    end
    object evBalAccs: TEvanescence
      Left = 8
      Top = 53
      Width = 222
      Height = 168
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
      DataSource = AdministrationData.ClsBalAcc
      ListField = 'bal_cn'
      KeyField = 'bal_cn'
    end
    object cbOpType: TDBLookupComboBox
      Left = 24
      Top = 25
      Width = 206
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = AdministrationData.opTypes
      TabOrder = 1
      OnCloseUp = cbOpTypeCloseUp
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 24
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 239
    Height = 129
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      239
      129)
    object Label2: TLabel
      Left = 8
      Top = 4
      Width = 76
      Height = 13
      Caption = 'Hesab simvollar'#305
    end
    object evFlags: TEvanescence
      Left = 8
      Top = 22
      Width = 222
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 0
      DataSource = AdministrationData.AccFlags
      ListField = 'DESCRIPTION'
      KeyField = 'SYMBOL'
    end
  end
end
