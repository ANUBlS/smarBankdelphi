object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 136
    Top = 8
    Width = 473
    Height = 169
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object OraLogon1: TOraLogon
    Session = OracleSession1
    Retries = 3
    Left = 48
    Top = 16
  end
  object OracleSession1: TOracleSession
    Left = 40
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 8
    Top = 16
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select *from cm_portfolio')
    Session = OracleSession1
    Left = 8
    Top = 64
  end
end
