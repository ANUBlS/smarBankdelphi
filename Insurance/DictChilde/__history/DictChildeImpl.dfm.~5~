object fmDictChilde: TfmDictChilde
  Left = 192
  Top = 106
  Width = 783
  Height = 540
  Caption = 'fmDictChilde'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 783
    Height = 540
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '%s'
      object Splitter1: TSplitter
        Left = 0
        Top = 225
        Width = 775
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 826
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 225
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbgMain: TDBGrid
          Left = 0
          Top = 27
          Width = 775
          Height = 198
          Align = alClient
          DataSource = DSMain
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 775
          Height = 27
          DataSource = DSMain
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 228
        Width = 775
        Height = 283
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object dbgChilde: TDBGrid
          Left = 0
          Top = 27
          Width = 775
          Height = 256
          Align = alClient
          DataSource = DSChilde
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
        end
        object DBNavigator2: TDBNavigator
          Left = 0
          Top = 0
          Width = 775
          Height = 27
          DataSource = DSChilde
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
    end
  end
  object DSMain: TDataSource
    DataSet = ODSMain
    Left = 196
    Top = 136
  end
  object DSChilde: TDataSource
    DataSet = ODSChilde
    Left = 196
    Top = 284
  end
  object ODSMain: TOracleDataSet
    SQL.Strings = (
      'select m.rowid, m.* from :maintable m')
    Optimize = False
    Variables.Data = {
      0400000001000000140000003A004D00410049004E005400410042004C004500
      010000000000000000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = ODSMainAfterPost
    Left = 236
    Top = 136
  end
  object ODSChilde: TOracleDataSet
    Optimize = False
    Master = ODSMain
    Session = sboapiDataModule.SBSession
    Left = 236
    Top = 284
  end
end
