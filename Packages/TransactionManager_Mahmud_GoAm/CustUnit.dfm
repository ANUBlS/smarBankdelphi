object FormCust: TFormCust
  Left = 0
  Top = 0
  ClientHeight = 254
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 219
    Width = 694
    Height = 35
    Align = alBottom
    TabOrder = 0
    object CBSearch: TComboBox
      Left = 8
      Top = 10
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object EditSearch: TEdit
      Left = 156
      Top = 10
      Width = 269
      Height = 21
      TabOrder = 1
      OnChange = EditSearchChange
    end
    object XFButton1: TXFButton
      Left = 521
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Qbul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = XFButton1Click
    end
    object Monexs: TXFButton
      Left = 608
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Monex'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = MonexsClick
    end
  end
  object XDBGrid1: TXDBGrid
    Left = 0
    Top = 0
    Width = 694
    Height = 219
    Align = alClient
    DataSource = DsrcCust
    GridStyle.VisualStyle = vsXPStyle
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
    TabOrder = 1
    OnDblClick = XDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FULLNAME'
        Visible = True
        Width = 160
      end
      item
        Expanded = False
        FieldName = 'SONAME'
        Visible = True
        Width = 120
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
        Width = 120
      end
      item
        Expanded = False
        FieldName = 'LASTNAME'
        Visible = True
        Width = 120
      end>
  end
  object ODS_CUSTOMERS: TOracleDataSet
    SQL.Strings = (
      'select c.id,c.name fullname,ci.soname,ci.name,ci.lastname '
      'from customers c,custinfo ci '
      'where c.cust_type <>0 and c.close_dat is null and c.id=ci.idcust'
      ''
      'order by c.id')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0050005F00560041004C005500010000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000050000000400000049004400010000000000100000004C0041005300
      54004E0041004D00450001000000000010000000460055004C004C004E004100
      4D0045000100000000000C00000053004F004E0041004D004500010000000000
      080000004E0041004D004500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 80
    Top = 56
    object ODS_CUSTOMERSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ODS_CUSTOMERSFULLNAME: TWideStringField
      FieldName = 'FULLNAME'
      Size = 360
    end
    object ODS_CUSTOMERSSONAME: TWideStringField
      FieldName = 'SONAME'
      Size = 120
    end
    object ODS_CUSTOMERSNAME: TWideStringField
      FieldName = 'NAME'
      Size = 120
    end
    object ODS_CUSTOMERSLASTNAME: TWideStringField
      FieldName = 'LASTNAME'
      Size = 120
    end
  end
  object DsrcCust: TDataSource
    DataSet = ODS_CUSTOMERS
    Left = 176
    Top = 64
  end
end
