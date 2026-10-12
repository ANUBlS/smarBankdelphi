object FormEdit: TFormEdit
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 428
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 387
    Width = 628
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelKind = bkSoft
    TabOrder = 0
    object XFLabel3: TXFLabel
      Left = 6
      Top = 10
      Width = 11
      Height = 13
      Caption = 'ID'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object XFLableTRid: TXFLabel
      Left = 27
      Top = 11
      Width = 3
      Height = 13
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object XFButton1: TXFButton
      Left = 545
      Top = 5
      Width = 66
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 387
    Align = alClient
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 1
    object XFPanel3: TXFPanel
      Left = 2
      Top = 49
      Width = 620
      Height = 47
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelKind = bkFlat
      Caption = ' '#399'. t'#601'snifat kodu:'
      TabOrder = 0
      object XFLabel2: TXFLabel
        Left = 99
        Top = 11
        Width = 6
        Height = 13
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBLC_MMX_reportcode: TDBLookupComboBox
        Left = 192
        Top = 10
        Width = 421
        Height = 21
        KeyField = 'NAME'
        ListField = 'DESCRIPTION'
        ListSource = Dsrc_mmx_reportcode
        TabOrder = 0
        OnCloseUp = DBLC_MMX_reportcodeCloseUp
      end
      object Editreportcode: TEdit
        Left = 118
        Top = 10
        Width = 74
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyPress = EditreportcodeKeyPress
      end
    end
    object XFPanel4: TXFPanel
      Left = 2
      Top = 2
      Width = 620
      Height = 47
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      BevelKind = bkFlat
      Caption = ' '#399'm'#601'liyyat'#305'n n'#246'v'#252':'
      TabOrder = 1
      object XFLabel1: TXFLabel
        Left = 99
        Top = 11
        Width = 6
        Height = 13
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EditTransModeCode: TEdit
        Left = 118
        Top = 11
        Width = 74
        Height = 21
        TabOrder = 0
        OnKeyPress = EditTransModeCodeKeyPress
      end
      object DBLC_MMX_Transmode: TDBLookupComboBox
        Left = 192
        Top = 11
        Width = 421
        Height = 21
        KeyField = 'NAME'
        ListField = 'DESCRIPTION'
        ListSource = DS_MMX_TRANSMODE
        TabOrder = 1
        OnCloseUp = DBLC_MMX_TransmodeCloseUp
      end
    end
    object XFGroupBox1: TXFGroupBox
      Left = 2
      Top = 160
      Width = 620
      Height = 221
      Align = alClient
      Caption = 'Monex'
      TabOrder = 2
      object XFPanel5: TXFPanel
        Left = 2
        Top = 15
        Width = 616
        Height = 60
        Align = alTop
        BevelKind = bkSoft
        TabOrder = 0
        object XFLabel4: TXFLabel
          Left = 9
          Top = 15
          Width = 19
          Height = 13
          Caption = 'Ad'#305':'
        end
        object XFLabel5: TXFLabel
          Left = 268
          Top = 15
          Width = 36
          Height = 13
          Caption = 'Soyad'#305':'
        end
        object MonexName: TXFLabel
          Left = 93
          Top = 38
          Width = 3
          Height = 13
        end
        object Editname: TEdit
          Left = 31
          Top = 10
          Width = 231
          Height = 21
          TabOrder = 0
        end
        object Editlastname: TEdit
          Left = 303
          Top = 10
          Width = 235
          Height = 21
          TabOrder = 1
        end
        object XFButton2: TXFButton
          Left = 543
          Top = 26
          Width = 66
          Height = 25
          Caption = 'Q'#601'bul'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = XFButton2Click
        end
      end
      object XDBGrid1: TXDBGrid
        Left = 2
        Top = 75
        Width = 616
        Height = 144
        Align = alClient
        DataSource = dsrc_monex
        GridStyle.VisualStyle = vsXPStyle
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
        TabOrder = 1
        OnCellClick = XDBGrid1CellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Ad'#305
            Visible = True
            Width = 200
          end
          item
            Expanded = False
            FieldName = 'LAST_NAME'
            Title.Caption = 'Soyad'#305
            Visible = True
            Width = 213
          end>
      end
    end
    object XFGroupBox2: TXFGroupBox
      Left = 2
      Top = 96
      Width = 620
      Height = 64
      Align = alTop
      Caption = 'M'#252#351't'#601'ri'
      TabOrder = 3
      object XFLabel6: TXFLabel
        Left = 89
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Debit M'#252#351't'#601'ri'
      end
      object XFLabel7: TXFLabel
        Left = 400
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Kredit M'#252#351't'#601'ri'
      end
      object Editdbtid: TEdit
        Left = 7
        Top = 33
        Width = 80
        Height = 21
        TabOrder = 0
        OnKeyPress = EditdbtidKeyPress
      end
      object Editcredid: TEdit
        Left = 316
        Top = 33
        Width = 80
        Height = 21
        TabOrder = 1
        OnKeyPress = EditcredidKeyPress
      end
      object DBEditdname: TDBEdit
        Left = 88
        Top = 33
        Width = 216
        Height = 21
        DataField = 'NAME'
        DataSource = dsrc_custdb
        TabOrder = 2
      end
      object DBEditkname: TDBEdit
        Left = 397
        Top = 33
        Width = 216
        Height = 21
        DataField = 'NAME'
        DataSource = dsrc_custcr
        TabOrder = 3
      end
    end
  end
  object ODS_MMX_TRANSMODE: TOracleDataSet
    SQL.Strings = (
      'select * from mmx_transmode')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 112
    Top = 8
    object ODS_MMX_TRANSMODEID: TIntegerField
      FieldName = 'ID'
    end
    object ODS_MMX_TRANSMODENAME: TIntegerField
      FieldName = 'NAME'
    end
    object ODS_MMX_TRANSMODEDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 400
    end
  end
  object Ods_mmx_reportcode: TOracleDataSet
    SQL.Strings = (
      'select*from mmx_reportcode order by id')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000030000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E00010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 216
    Top = 5
    object Ods_mmx_reportcodeID: TIntegerField
      FieldName = 'ID'
    end
    object Ods_mmx_reportcodeNAME: TWideStringField
      FieldName = 'NAME'
    end
    object Ods_mmx_reportcodeDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 600
    end
  end
  object Dsrc_mmx_reportcode: TDataSource
    DataSet = Ods_mmx_reportcode
    Left = 296
    Top = 7
  end
  object DS_MMX_TRANSMODE: TDataSource
    DataSet = ODS_MMX_TRANSMODE
    Left = 352
    Top = 8
  end
  object ods_trinf: TOracleDataSet
    SQL.Strings = (
      
        'select transid , transmode_code, report_code,monex_id,dcustid,cc' +
        'ustid from mmx_transinfo  where transid=:v_trid')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0056005F005400520049004400030000000000
      000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000060000000E0000005400520041004E00530049004400010000000000
      1C0000005400520041004E0053004D004F00440045005F0043004F0044004500
      010000000000160000005200450050004F00520054005F0043004F0044004500
      010000000000100000004D004F004E00450058005F0049004400010000000000
      0E00000044004300550053005400490044000100000000000E00000043004300
      55005300540049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 40
    Top = 24
    object ods_trinfTRANSID: TFloatField
      FieldName = 'TRANSID'
    end
    object ods_trinfTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object ods_trinfREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 80
    end
    object ods_trinfMONEX_ID: TFloatField
      FieldName = 'MONEX_ID'
    end
    object ods_trinfDCUSTID: TFloatField
      FieldName = 'DCUSTID'
    end
    object ods_trinfCCUSTID: TFloatField
      FieldName = 'CCUSTID'
    end
  end
  object OP_MMXX: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'MMX'
    Left = 488
    Top = 16
  end
  object ods_monex: TOracleDataSet
    SQL.Strings = (
      'select * from cust_monex'
      ' order by id desc')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000120000004C004100530054005F004E0041004D0045000100
      0000000008000000460055004C004C00010000000000}
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 480
    Top = 240
    object ods_monexID: TFloatField
      FieldName = 'ID'
    end
    object ods_monexNAME: TWideStringField
      FieldName = 'NAME'
      Size = 200
    end
    object ods_monexLAST_NAME: TWideStringField
      FieldName = 'LAST_NAME'
      Size = 200
    end
  end
  object dsrc_monex: TDataSource
    DataSet = ods_monex
    Left = 384
    Top = 248
  end
  object ods_custdb: TOracleDataSet
    SQL.Strings = (
      
        'select c.id , decode(c.name,null,i.name||i.lastname||i.soname,c.' +
        'name)as name from customers c,custinfo i where c.id=i.idcust and' +
        ' c.id=:v_custid'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0056005F004300550053005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 312
    Top = 88
    object ods_custdbID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ods_custdbNAME: TWideStringField
      FieldName = 'NAME'
      Size = 360
    end
  end
  object ods_custcr: TOracleDataSet
    SQL.Strings = (
      
        'select c.id , decode(c.name,null,i.name||i.lastname||i.soname,c.' +
        'name)as name from customers c,custinfo i where c.id=i.idcust and' +
        ' c.id=:v_custid'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000120000003A0056005F004300550053005400490044000300
      00000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 88
    object ods_custcrID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ods_custcrNAME: TWideStringField
      FieldName = 'NAME'
      Size = 360
    end
  end
  object dsrc_custdb: TDataSource
    DataSet = ods_custdb
    Left = 264
    Top = 96
  end
  object dsrc_custcr: TDataSource
    DataSet = ods_custcr
    Left = 472
    Top = 96
  end
  object odsmon: TOracleDataSet
    SQL.Strings = (
      
        'select id||'#39'-'#39'||name||'#39'-'#39'||last_name as full from cust_monex whe' +
        're id=:v_id'
      ''
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000A0000003A0056005F004900440003000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {050000000100000008000000460055004C004C00010000000000}
    Session = sboapiDataModule.SBSession
    Left = 480
    Top = 152
    object odsmonFULL: TWideStringField
      FieldName = 'FULL'
      Size = 504
    end
  end
  object ods_bankinfo: TOracleDataSet
    SQL.Strings = (
      'select swift from bankinfo')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {05000000010000000A00000053005700490046005400010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 552
    Top = 88
    object ods_bankinfoSWIFT: TWideStringField
      FieldName = 'SWIFT'
      Size = 320
    end
  end
end
