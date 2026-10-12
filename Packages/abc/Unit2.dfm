object sa: Tsa
  Left = 0
  Top = 0
  Width = 435
  Height = 321
  Caption = 'sa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 56
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Button1: TButton
    Left = 80
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 56
    Top = 29
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select SAMELYDATE from customers order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000100000014000000530041004D0045004C0059004400410054004500
      010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 32
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 112
    Top = 248
  end
end
