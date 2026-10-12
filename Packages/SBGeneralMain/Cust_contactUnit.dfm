object Cust_contact: TCust_contact
  Left = 0
  Top = 0
  ClientHeight = 470
  ClientWidth = 938
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
  object XFPanel2: TXFPanel
    Left = 0
    Top = 80
    Width = 938
    Height = 349
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 0
    ExplicitTop = 74
    ExplicitWidth = 853
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 2
      Width = 930
      Height = 341
      Align = alClient
      DataSource = DataSource1
      GridStyle.VisualStyle = vsXPStyle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
      TabOrder = 0
      OnDblClick = XDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CUST_ID'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RELATIVE_FULLNAME'
          Title.Alignment = taCenter
          Title.Caption = 'Ad soyad'
          Visible = True
          Width = 200
        end
        item
          Expanded = False
          FieldName = 'RELATIVE_DEGREE'
          Title.Alignment = taCenter
          Title.Caption = 'Qohumluq d'#601'r'#601'c'#601'si'
          Visible = True
          Width = 185
        end
        item
          Expanded = False
          FieldName = 'RELATIVE_WORK'
          Title.Alignment = taCenter
          Title.Caption = #304#351' yeri'
          Visible = True
          Width = 189
        end
        item
          Expanded = False
          FieldName = 'RELATIVE_TASK'
          Title.Alignment = taCenter
          Title.Caption = 'V'#601'zif'#601'si'
          Visible = True
          Width = 180
        end
        item
          Expanded = False
          FieldName = 'RELATIVE_SALARY'
          Title.Alignment = taCenter
          Title.Caption = 'Maa'#351
          Visible = True
          Width = 80
        end>
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 429
    Width = 938
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 2
    ExplicitTop = 374
    ExplicitWidth = 853
    object XFButton1: TXFButton
      Left = 589
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 670
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Redakt'#601
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
    object XFButton3: TXFButton
      Left = 751
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sil'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = XFButton3Click
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 80
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkFlat
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = -2
    object Ad: TXFLabel
      Left = 7
      Top = 14
      Width = 48
      Height = 13
      Caption = 'Ad soyad '
    end
    object Telfon: TXFLabel
      Left = 7
      Top = 41
      Width = 30
      Height = 13
      Caption = #304#351' yeri'
    end
    object Ünvan: TXFLabel
      Left = 357
      Top = 41
      Width = 36
      Height = 13
      Caption = 'V'#601'zif'#601'si'
    end
    object Label1: TLabel
      Left = 357
      Top = 14
      Width = 94
      Height = 13
      Caption = 'Qohumluq d'#601'r'#601'c'#601'si '
      Transparent = True
    end
    object XFLabel1: TXFLabel
      Left = 842
      Top = 14
      Width = 25
      Height = 13
      Caption = 'Maa'#351
    end
    object Edit1: TEdit
      Left = 61
      Top = 38
      Width = 276
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 61
      Top = 11
      Width = 276
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 465
      Top = 38
      Width = 345
      Height = 21
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 465
      Top = 11
      Width = 345
      Height = 21
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 819
      Top = 38
      Width = 106
      Height = 21
      TabOrder = 4
      OnKeyPress = Edit5KeyPress
    end
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      
        'select rowid,a.*from customer_relatives a where a.cust_id=:v_cus' +
        'tid')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0056005F004300550053005400490044000500
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000000700000004000000490044000100000000000E000000430055005300
      54005F004900440001000000000022000000520045004C004100540049005600
      45005F00460055004C004C004E0041004D0045000100000000001E0000005200
      45004C00410054004900560045005F0044004500470052004500450001000000
      00001A000000520045004C00410054004900560045005F0057004F0052004B00
      0100000000001A000000520045004C00410054004900560045005F0054004100
      53004B000100000000001E000000520045004C00410054004900560045005F00
      530041004C00410052005900010000000000}
    Session = sboapiDataModule.SBSession
    Left = 272
    Top = 184
    object OracleDataSet1ID: TFloatField
      FieldName = 'ID'
    end
    object OracleDataSet1CUST_ID: TFloatField
      FieldName = 'CUST_ID'
    end
    object OracleDataSet1RELATIVE_FULLNAME: TWideStringField
      FieldName = 'RELATIVE_FULLNAME'
      Size = 2500
    end
    object OracleDataSet1RELATIVE_DEGREE: TWideStringField
      FieldName = 'RELATIVE_DEGREE'
      Size = 2500
    end
    object OracleDataSet1RELATIVE_WORK: TWideStringField
      FieldName = 'RELATIVE_WORK'
      Size = 2500
    end
    object OracleDataSet1RELATIVE_TASK: TWideStringField
      FieldName = 'RELATIVE_TASK'
      Size = 250
    end
    object OracleDataSet1RELATIVE_SALARY: TFloatField
      FieldName = 'RELATIVE_SALARY'
    end
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 184
    Top = 184
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      
        'insert into customer_relatives  (cust_id,relative_fullname,relat' +
        'ive_degree,relative_work,relative_task,relative_salary)'
      '                                values'
      
        '                              (:v_custid,:v_relative_fullname,:v' +
        '_relative_degree,:v_relative_work,:v_relative_task,:v_relative_s' +
        'alary)')
    Optimize = False
    Variables.Data = {
      0400000006000000120000003A0056005F004300550053005400490044000500
      00000000000000000000280000003A0056005F00520045004C00410054004900
      560045005F00460055004C004C004E0041004D00450005000000000000000000
      0000240000003A0056005F00520045004C00410054004900560045005F004400
      45004700520045004500050000000000000000000000200000003A0056005F00
      520045004C00410054004900560045005F0057004F0052004B00050000000000
      000000000000200000003A0056005F00520045004C0041005400490056004500
      5F005400410053004B00050000000000000000000000240000003A0056005F00
      520045004C00410054004900560045005F00530041004C004100520059000500
      00000000000000000000}
    Session = sboapiDataModule.SBSession
    Left = 352
    Top = 160
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'update customer_relatives set'
      ''
      'cust_id=:v_custid,'
      'relative_fullname=:v_relative_fullname,'
      'relative_degree=:v_relative_degree,'
      'relative_work=:v_relative_work,'
      'relative_task=:v_relative_task,'
      'relative_salary=:v_relative_salary'
      '                           '
      'where id=:v_id')
    Optimize = False
    Variables.Data = {
      0400000007000000120000003A0056005F004300550053005400490044000500
      00000000000000000000280000003A0056005F00520045004C00410054004900
      560045005F00460055004C004C004E0041004D00450005000000000000000000
      0000240000003A0056005F00520045004C00410054004900560045005F004400
      45004700520045004500050000000000000000000000200000003A0056005F00
      520045004C00410054004900560045005F0057004F0052004B00050000000000
      000000000000200000003A0056005F00520045004C0041005400490056004500
      5F005400410053004B00050000000000000000000000240000003A0056005F00
      520045004C00410054004900560045005F00530041004C004100520059000500
      000000000000000000000A0000003A0056005F00490044000500000000000000
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 480
    Top = 136
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      'delete customer_relatives where id=:v_id')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    Session = sboapiDataModule.SBSession
    Left = 608
    Top = 120
  end
end
