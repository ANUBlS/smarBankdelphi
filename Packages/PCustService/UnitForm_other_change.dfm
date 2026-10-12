object Form_other_change: TForm_other_change
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 193
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 395
    Height = 193
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 350
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select*from cust_other_info_list where inf_id=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0500000003000000080000004E0041004D004500010000000000040000004900
      44000100000000000C00000049004E0046005F0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 152
    Top = 40
    object OracleDataSet1NAME: TWideStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 240
    Top = 48
  end
end
