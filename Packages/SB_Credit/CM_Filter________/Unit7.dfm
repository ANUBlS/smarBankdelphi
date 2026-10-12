object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 254
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select*from sysdat')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 160
    Top = 88
  end
end
