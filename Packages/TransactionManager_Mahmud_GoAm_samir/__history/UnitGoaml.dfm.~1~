object FormGoaml: TFormGoaml
  Left = 0
  Top = 0
  ClientHeight = 404
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 363
    Width = 1006
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 306
    ExplicitWidth = 185
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1006
    Height = 363
    Align = alClient
    DataSource = Dsrc_goa
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'REPORT_CODE'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSMODE_CODE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITBALANCE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITBALANCE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITACCNO'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITACCNO'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITAMOUNT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITAMOUNT'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBITRATE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITRATE'
        Width = 80
        Visible = True
      end>
  end
  object Ods_Goa: TOracleDataSet
    SQL.Strings = (
      
        'select i.report_code,i.transmode_code ,m.* from MMMM m,mmx_trans' +
        'info  i where m.id=i.transid')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000B000000160000005200450050004F00520054005F0043004F004400
      45000100000000001C0000005400520041004E0053004D004F00440045005F00
      43004F0044004500010000000000040000004900440001000000000018000000
      44004500420049005400420041004C0041004E00430045000100000000001A00
      0000430052004500440049005400420041004C0041004E004300450001000000
      000014000000440045004200490054004100430043004E004F00010000000000
      160000004300520045004400490054004100430043004E004F00010000000000
      160000004400450042004900540041004D004F0055004E005400010000000000
      1800000043005200450044004900540041004D004F0055004E00540001000000
      0000120000004400450042004900540052004100540045000100000000001400
      00004300520045004400490054005200410054004500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 128
    Top = 88
    object Ods_GoaREPORT_CODE: TWideStringField
      FieldName = 'REPORT_CODE'
      Size = 80
    end
    object Ods_GoaTRANSMODE_CODE: TIntegerField
      FieldName = 'TRANSMODE_CODE'
    end
    object Ods_GoaID: TFloatField
      FieldName = 'ID'
    end
    object Ods_GoaDEBITBALANCE: TFloatField
      FieldName = 'DEBITBALANCE'
    end
    object Ods_GoaCREDITBALANCE: TFloatField
      FieldName = 'CREDITBALANCE'
    end
    object Ods_GoaDEBITACCNO: TWideStringField
      FieldName = 'DEBITACCNO'
      Size = 448
    end
    object Ods_GoaCREDITACCNO: TWideStringField
      FieldName = 'CREDITACCNO'
      Size = 448
    end
    object Ods_GoaDEBITAMOUNT: TFloatField
      FieldName = 'DEBITAMOUNT'
    end
    object Ods_GoaCREDITAMOUNT: TFloatField
      FieldName = 'CREDITAMOUNT'
    end
    object Ods_GoaDEBITRATE: TFloatField
      FieldName = 'DEBITRATE'
    end
    object Ods_GoaCREDITRATE: TFloatField
      FieldName = 'CREDITRATE'
    end
  end
  object Dsrc_goa: TDataSource
    DataSet = Ods_Goa
    Left = 216
    Top = 88
  end
end
