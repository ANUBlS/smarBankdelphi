object Pep_change: TPep_change
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 337
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 13
    Width = 18
    Height = 16
    Caption = 'Ad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 317
    Top = 13
    Width = 40
    Height = 16
    Caption = 'Soyad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 60
    Top = 8
    Width = 190
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 365
    Top = 8
    Width = 190
    Height = 21
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 0
    Top = 36
    Width = 586
    Height = 255
    Align = alBottom
    ReadOnly = True
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 291
    Width = 586
    Height = 46
    Align = alBottom
    TabOrder = 3
    object Button1: TButton
      Left = 394
      Top = 6
      Width = 80
      Height = 35
      Caption = 'Yoxla'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 480
      Top = 6
      Width = 80
      Height = 35
      Caption = 'ba'#287'la'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select tax_regcode from bankinfo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      0500000001000000160000005400410058005F0052004500470043004F004400
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 200
    Top = 152
    object OracleDataSet1TAX_REGCODE: TWideStringField
      FieldName = 'TAX_REGCODE'
      Size = 50
    end
  end
end
