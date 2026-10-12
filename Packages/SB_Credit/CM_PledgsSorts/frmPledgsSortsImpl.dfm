object frmPledgsSorts: TfrmPledgsSorts
  Left = 341
  Top = 154
  BorderIcons = [biSystemMenu]
  ClientHeight = 306
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 310
    Height = 308
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 29
      Width = 306
      Height = 277
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = PledgsortsDatSrc
      Flat = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = RUSSIAN_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbNeverShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = 'Ad'#305
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 281
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 306
      Height = 27
      DataSource = PledgsortsDatSrc
      Align = alTop
      Flat = True
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 233
    Top = 309
    Width = 80
    Height = 27
    Caption = #1041#1072#1100#1083#1072
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object PledgsortsDatSrc: TDataSource
    DataSet = Pledgsorts
    Left = 16
    Top = 144
  end
  object Pledgsorts: TOracleDataSet
    SQL.Strings = (
      'SELECT rowid,id, name'
      '  FROM cm_pledgsorts')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    AfterPost = PledgsortsAfterPost
    Left = 48
    Top = 144
    object PledgsortsID: TFloatField
      FieldName = 'ID'
    end
    object PledgsortsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 80
    end
  end
end
