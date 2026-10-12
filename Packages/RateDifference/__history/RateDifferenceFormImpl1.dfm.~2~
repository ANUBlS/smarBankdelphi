object RateDifferenceForm: TRateDifferenceForm
  Left = 288
  Top = 328
  Width = 418
  Height = 304
  Caption = 'RateDifferenceForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 418
    Height = 27
    Caption = 'ToolBar1'
    DrawingStyle = dsGradient
    EdgeBorders = [ebBottom]
    GradientEndColor = clSilver
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 22
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 27
    Width = 418
    Height = 277
    Align = alClient
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 24
    Top = 80
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select'
      '  t.*,'
      '  ad.acc_no as DebitAccNo,'
      '  ac.Acc_No as CreditAccNo'
      'from'
      '  temptranz t,'
      '  account ad,'
      '  account ac'
      'where'
      '  (ad.ID = t.DebetID)'
      '  and (ac.ID = t.CreditID)')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 80
  end
end
