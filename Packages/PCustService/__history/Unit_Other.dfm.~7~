object Form_other: TForm_other
  Left = 0
  Top = 0
  Align = alCustom
  AutoSize = True
  BorderIcons = [biSystemMenu]
  ClientHeight = 428
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel2: TXFPanel
    Left = 0
    Top = 284
    Width = 899
    Height = 144
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    ExplicitTop = 331
    object XFButton1: TXFButton
      Left = 808
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object Memo1: TMemo
      Left = 0
      Top = 6
      Width = 777
      Height = 132
      Enabled = False
      TabOrder = 1
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 0
    Width = 899
    Height = 284
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitHeight = 324
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 2
      Width = 895
      Height = 280
      Align = alClient
      DataSource = DataSource2
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      OnCellClick = XDBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Sah'#601'nin  ad'#305
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
          Width = 216
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'T'#601'yinat'#305
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
          Width = 591
        end>
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select*from cust_other_information')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 88
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select rowid ,a.* from  cust_other_info_add a where custid=:v_id'
      'order by id asc')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      050000000400000004000000490044000100000000000C000000430055005300
      540049004400010000000000080000004E0041004D0045000100000000001600
      00004400450053004300520049005000540049004F004E00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 192
    Top = 80
    object OracleDataSet2ID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OracleDataSet2CUSTID: TFloatField
      FieldName = 'CUSTID'
    end
    object OracleDataSet2NAME: TWideStringField
      FieldName = 'NAME'
      Size = 3000
    end
    object OracleDataSet2DESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 2000
    end
  end
  object DataSource1: TDataSource
    Left = 312
    Top = 136
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 160
    Top = 144
  end
end
