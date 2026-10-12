object Datamod_law: TDatamod_law
  Left = 0
  Top = 0
  ClientHeight = 311
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainSclst: TOracleDataSet
    SQL.Strings = (
      'select 88 from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000400000038003800010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 96
    Top = 48
  end
  object datsrc_mainlst: TDataSource
    DataSet = MainSclst
    Left = 48
    Top = 48
  end
end
