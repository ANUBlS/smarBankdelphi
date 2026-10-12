object krinfo: Tkrinfo
  Left = 394
  Top = 773
  Caption = 'Kredit Info'
  ClientHeight = 183
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object MainGrid: TDBGridEh
    Left = 0
    Top = 41
    Width = 798
    Height = 142
    Align = alClient
    AllowedOperations = []
    DataSource = DataSrcCM_ACTIVE
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Azl Sans Serif'
    FooterFont.Style = []
    FrozenCols = 4
    HorzScrollBar.Tracking = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDblClickOptimizeColWidth]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'Azl Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'NUMBEROFCREDIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'CONTRACTACCNO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 105
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'VAL_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 27
        WordWrap = False
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 174
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYINTERESTRATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'REST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 114
      end
      item
        EditButtons = <>
        FieldName = 'INTERESTREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'DUEREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'DUEINTERESTREST'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'CREDITLINEAMOUNT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'INITIALAMOUNT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 99
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYOVERDUERATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        Color = clSilver
        EditButtons = <>
        FieldName = 'ANNUALYPENALTYRATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'DATEOFCONCLUSION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'DUEDATEFIRSTCONTRACT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'PURPOSEOFCREDIT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'STOPCALCDATE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'OBLIGATION'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'PLEDGEPRICE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 81
      end
      item
        EditButtons = <>
        FieldName = 'DUEDATELASTCONTRACT'
        Footers = <>
        Title.Color = clNavy
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'BOOROWERREST'
        Footers = <>
        Title.Color = clNavy
        Title.TitleButton = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'INTERESTACCNO'
        Footers = <>
        Title.Color = clNavy
      end
      item
        EditButtons = <>
        FieldName = 'DUELOANACCNO'
        Footers = <>
        Title.Color = clNavy
      end
      item
        EditButtons = <>
        FieldName = 'LOANACCNO'
        Footers = <>
        Title.Color = clNavy
      end
      item
        EditButtons = <>
        FieldName = 'PENALTYREST'
        Footers = <>
        Title.Caption = #1055#1077#1085#1080#1081#1072
        Title.Color = clNavy
        Title.TitleButton = True
      end>
  end
  object CM_ACTIVE: TOracleDataSet
    SQL.Strings = (
      'select *'
      '  from'
      '    cm_active where id=:ids'
      '  '
      ' ')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00490044005300030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0500000026000000040000004900440001000000000010000000430055005200
      520045004E00430059000100000000001400000042004F004F0052004F005700
      4500520049004400010000000000200000004300520045004400490054004C00
      49004E00450041004D004F0055004E0054000100000000002600000041004E00
      4E00550041004C00590049004E00540045005200450053005400520041005400
      45000100000000001A00000049004E0049005400490041004C0041004D004F00
      55004E0054000100000000002400000041004E004E00550041004C0059004F00
      5600450052004400550045005200410054004500010000000000240000004100
      4E004E00550041004C005900500045004E0041004C0054005900520041005400
      45000100000000002000000044004100540045004F00460043004F004E004300
      4C005500530049004F004E000100000000002800000044005500450044004100
      540045004600490052005300540043004F004E00540052004100430054000100
      000000002600000044005500450044004100540045004C004100530054004300
      4F004E00540052004100430054000100000000001C0000004E0055004D004200
      450052004F0046004300520045004400490054000100000000001E0000005000
      5500520050004F00530045004F00460043005200450044004900540001000000
      000010000000550053005200470052004F005500500001000000000010000000
      4200520041004E00430048004900440001000000000008000000550053004900
      44000100000000001800000043005500530054004F004D004500520054005900
      5000450001000000000014000000430052004500440049005400540059005000
      45000100000000001800000050004500520053004F004E0041004C0054005900
      5000450001000000000018000000530054004F005000430041004C0043004400
      4100540045000100000000000800000052004500530054000100000000001800
      000049004E005400450052004500530054005200450053005400010000000000
      0E00000044005500450052004500530054000100000000001E00000044005500
      450049004E005400450052004500530054005200450053005400010000000000
      16000000500045004E0041004C00540059005200450053005400010000000000
      1200000052004500530045005200560045004900440001000000000018000000
      4400550045005200450053004500520056004500490044000100000000001400
      00004F0042004C00490047004100540049004F004E0001000000000016000000
      50004C0045004400470045005000520049004300450001000000000010000000
      50004C004500440047004500490044000100000000001A00000043004F004E00
      540052004100430054004100430043004E004F00010000000000180000004200
      4F004F0052004F00570045005200520045005300540001000000000010000000
      560041004C005F004E0041004D004500010000000000080000004E0041004D00
      45000100000000001A00000049004E0054004500520045005300540041004300
      43004E004F00010000000000180000004400550045004C004F0041004E004100
      430043004E004F00010000000000120000004C004F0041004E00410043004300
      4E004F0001000000000014000000520045004700490053005400520059004E00
      4F00010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 56
    Top = 160
    object CM_ACTIVEID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object CM_ACTIVECURRENCY: TFloatField
      Alignment = taCenter
      FieldName = 'CURRENCY'
      Required = True
    end
    object CM_ACTIVEBOOROWERID: TFloatField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' ID '#1089#1080
      FieldName = 'BOOROWERID'
      Required = True
    end
    object CM_ACTIVECREDITLINEAMOUNT: TFloatField
      DisplayLabel = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1103#1073#1083#1103#1100#1080
      FieldName = 'CREDITLINEAMOUNT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEANNUALYINTERESTRATE: TFloatField
      DisplayLabel = '% '#1076#1103#1088#1103#1078#1103#1089#1080
      FieldName = 'ANNUALYINTERESTRATE'
      Required = True
      DisplayFormat = '#,##0.0000'
    end
    object CM_ACTIVEINITIALAMOUNT: TFloatField
      DisplayLabel = #1042#1077#1088#1080#1083#1084#1080#1096' '#1084#1103#1073#1083#1103#1100
      FieldName = 'INITIALAMOUNT'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEANNUALYOVERDUERATE: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082#1084#1103' % '
      FieldName = 'ANNUALYOVERDUERATE'
      Required = True
      DisplayFormat = '#,##0.0000'
    end
    object CM_ACTIVEANNUALYPENALTYRATE: TFloatField
      DisplayLabel = #1046#1103#1088#1080#1084#1103' %'
      FieldName = 'ANNUALYPENALTYRATE'
      Required = True
      DisplayFormat = '#,##0.0000'
    end
    object CM_ACTIVEDATEOFCONCLUSION: TDateTimeField
      DisplayLabel = #1040#1095#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DATEOFCONCLUSION'
      Required = True
    end
    object CM_ACTIVEDUEDATEFIRSTCONTRACT: TDateTimeField
      DisplayLabel = '('#1048'.'#1052')'#1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DUEDATEFIRSTCONTRACT'
      Required = True
    end
    object CM_ACTIVEDUEDATELASTCONTRACT: TDateTimeField
      DisplayLabel = '('#1057'.'#1052')'#1041#1072#1100#1083#1072#1085#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'DUEDATELASTCONTRACT'
    end
    object CM_ACTIVENUMBEROFCREDIT: TStringField
      DisplayLabel = #8470
      FieldName = 'NUMBEROFCREDIT'
      Size = 32
    end
    object CM_ACTIVEPURPOSEOFCREDIT: TStringField
      DisplayLabel = #1058#1103#1081#1080#1085#1072#1090#1099
      FieldName = 'PURPOSEOFCREDIT'
      Size = 128
    end
    object CM_ACTIVEUSRGROUP: TFloatField
      FieldName = 'USRGROUP'
      Required = True
    end
    object CM_ACTIVEBRANCHID: TFloatField
      DisplayLabel = #1060#1080#1083#1080#1072#1083' ID '#1089#1080
      FieldName = 'BRANCHID'
      Required = True
    end
    object CM_ACTIVEUSID: TFloatField
      DisplayLabel = #1048#1089#1090#1080#1092#1072#1076#1103#1095#1080' ID '#1089#1080
      FieldName = 'USID'
      Required = True
    end
    object CM_ACTIVESTOPCALCDATE: TDateTimeField
      DisplayLabel = #1065#1077#1089#1072#1073#1083#1072#1085#1084#1072#1085#1099#1085' '#1076#1072#1081#1072#1085#1076#1099#1088#1099#1083#1084#1072' '#1090#1072#1088#1080#1093#1080
      FieldName = 'STOPCALCDATE'
    end
    object CM_ACTIVEREST: TFloatField
      DisplayLabel = '('#1071'.'#1041') '#1043#1072#1083#1099#1075
      FieldName = 'REST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEINTERESTREST: TFloatField
      DisplayLabel = '('#1060'.'#1041') '#1043#1072#1083#1099#1075
      FieldName = 'INTERESTREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEDUEREST: TFloatField
      DisplayLabel = '('#1069'.'#1041') '#1043#1072#1083#1099#1075
      FieldName = 'DUEREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEDUEINTERESTREST: TFloatField
      DisplayLabel = '('#1069'.'#1060'.'#1041') '#1043#1072#1083#1099#1075
      FieldName = 'DUEINTERESTREST'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEPENALTYREST: TFloatField
      FieldName = 'PENALTYREST'
    end
    object CM_ACTIVERESERVEID: TFloatField
      DisplayLabel = #1045#1097#1090#1080#1081#1081#1072#1090' ID '#1089#1080
      FieldName = 'RESERVEID'
      Required = True
    end
    object CM_ACTIVEOBLIGATION: TFloatField
      DisplayLabel = #1070#1097#1076#1103#1083#1080#1082
      FieldName = 'OBLIGATION'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEPLEDGEPRICE: TFloatField
      DisplayLabel = #1069#1080#1088#1086#1074#1091#1085' '#1076#1103#1081#1103#1088#1080
      FieldName = 'PLEDGEPRICE'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object CM_ACTIVEPLEDGEID: TFloatField
      FieldName = 'PLEDGEID'
      Required = True
    end
    object CM_ACTIVECONTRACTACCNO: TStringField
      DisplayLabel = #1065#1077#1089#1072#1073' '#8470
      FieldName = 'CONTRACTACCNO'
    end
    object CM_ACTIVEVAL_NAME: TStringField
      Alignment = taCenter
      DisplayLabel = '$'
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object CM_ACTIVENAME: TStringField
      DisplayLabel = #1052#1094#1096#1090#1103#1088#1080
      FieldName = 'NAME'
      Size = 64
    end
    object CM_ACTIVEDUERESERVEID: TFloatField
      DisplayLabel = #1069#1077#1078#1080#1082'.'#1045#1097#1090#1080#1081#1081#1072#1090' ID '#1089#1080
      FieldName = 'DUERESERVEID'
    end
    object CM_ACTIVECUSTOMERTYPE: TFloatField
      FieldName = 'CUSTOMERTYPE'
      Required = True
    end
    object CM_ACTIVECREDITTYPE: TFloatField
      FieldName = 'CREDITTYPE'
      Required = True
    end
    object CM_ACTIVEPERSONALTYPE: TFloatField
      FieldName = 'PERSONALTYPE'
      Required = True
    end
    object CM_ACTIVEBOOROWERREST: TFloatField
      DisplayLabel = #1046#1072#1088#1080' '#1065#1077#1089#1072#1073#1099#1085' '#1075#1072#1083#1099#1100#1099
      FieldName = 'BOOROWERREST'
      DisplayFormat = '#,#0.00'
    end
    object CM_ACTIVEINTERESTACCNO: TStringField
      DisplayLabel = #1060#1072#1080#1079' '#1065#1077#1089#1072#1073#1099#1085#1099#1085' '#8470'-'#1089#1080
      FieldName = 'INTERESTACCNO'
    end
    object CM_ACTIVEDUELOANACCNO: TStringField
      DisplayLabel = #1069#1077#1078#1080#1082#1084#1080#1096' '#1097#1077#1089#1072#1073#1099#1085#1099#1085' '#8470'-'#1089#1080
      FieldName = 'DUELOANACCNO'
    end
    object CM_ACTIVELOANACCNO: TStringField
      DisplayLabel = #1057#1089#1091#1076#1072' '#1065#1077#1089#1072#1073#1099#1085#1099#1085' '#8470#1089#1080
      FieldName = 'LOANACCNO'
    end
  end
  object DataSrcCM_ACTIVE: TDataSource
    DataSet = CM_ACTIVE
    Left = 88
    Top = 160
  end
end
