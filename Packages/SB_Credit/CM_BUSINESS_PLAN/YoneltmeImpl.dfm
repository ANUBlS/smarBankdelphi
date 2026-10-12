object YoneltmeFrm: TYoneltmeFrm
  Left = 0
  Top = 0
  ClientHeight = 288
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 263
    Width = 867
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 0
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 867
    Height = 263
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = DataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = 'M'#252#351't'#601'ri ad'#305
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'WHEREFROM'
        Footers = <>
        Title.Caption = 'Hardan'
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'AMMOUNT'
        Footers = <>
        Title.Caption = 'M'#601'bl'#601#287
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        Title.Caption = 'Tarix'
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select rowid,a.* from cm_yonetme a where creditid=:creditid'
      'order by id')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A00430052004500440049005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000000400000049004400010000000000080000004E0041004D00
      45000100000000001200000057004800450052004500460052004F004D000100
      000000000E00000041004D004D004F0055004E00540001000000000010000000
      4300520045004400490054004900440001000000000006000000440041005400
      010000000000}
    OnApplyRecord = OracleDataSet1ApplyRecord
    Session = sboapiDataModule.SBSession
    Left = 338
    Top = 19
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 150
    end
    object OracleDataSet1WHEREFROM: TWideStringField
      FieldName = 'WHEREFROM'
      Size = 150
    end
    object OracleDataSet1AMMOUNT: TFloatField
      FieldName = 'AMMOUNT'
    end
    object OracleDataSet1CREDITID: TFloatField
      FieldName = 'CREDITID'
    end
    object OracleDataSet1DAT: TDateTimeField
      FieldName = 'DAT'
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 410
    Top = 19
  end
end
