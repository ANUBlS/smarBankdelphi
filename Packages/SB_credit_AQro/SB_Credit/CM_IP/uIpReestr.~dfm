object frmReestr: TfrmReestr
  Left = 297
  Top = 193
  Width = 490
  Height = 342
  BorderIcons = [biSystemMenu]
  Caption = 'Reestr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 461
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Ìöøòÿðèëÿð'
  end
  object evActive: TEvanescence
    Left = 0
    Top = 24
    Width = 476
    Height = 255
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    DataSource = ActiveCrd
    ListField = 'NAME'
    KeyField = 'ID'
  end
  object Button1: TButton
    Left = 314
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '×àï'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 402
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Áàüëà'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ActiveCrd: TDataSource
    DataSet = ODSActiveCrd
    Left = 104
    Top = 96
  end
  object ODSActiveCrd: TOracleDataSet
    SQL.Strings = (
      'select id, name, numberofcredit from cm_active'
      'order by 3')
    Session = CMDataModule.CMSession
    Left = 144
    Top = 96
  end
end
