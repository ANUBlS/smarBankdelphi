object ExpComingAccountForm: TExpComingAccountForm
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'G'#601'lir hesablar'#305'n sazlanmas'#305
  ClientHeight = 394
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 394
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 505
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 592
      Height = 40
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitWidth = 501
      object SpeedButton1: TSpeedButton
        Left = 2
        Top = 3
        Width = 78
        Height = 33
        Caption = #399'lav'#601' et'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 81
        Top = 3
        Width = 78
        Height = 33
        Caption = 'Redakt'#601
        Flat = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 160
        Top = 3
        Width = 78
        Height = 33
        Caption = 'Silm'#601'k'
        Flat = True
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 239
        Top = 3
        Width = 78
        Height = 33
        Caption = #199#305'x'#305#351
        Flat = True
        OnClick = SpeedButton4Click
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 42
      Width = 592
      Height = 350
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 501
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 590
        Height = 348
        Align = alClient
        Color = clSilver
        DataSource = ExpComingAccDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ValName'
            Title.Alignment = taCenter
            Title.Caption = '$'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Debit'
            Width = 183
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Kredit'
            Width = 188
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Filial'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tip'
            Title.Caption = 'K'#246#231#252'rm'#601'nin tipi'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 88
            Visible = True
          end>
      end
    end
  end
  object ExpComingAccDataSet: TOracleDataSet
    SQL.Strings = (
      'select '
      '  c.rowid,'
      '  c.id,c.debet,c.kredet,c.valute,c.branchid,c.type'
      'from '
      '  exp_type_coming c'
      '')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000000600000004000000490044000100000000000A000000440045004200
      450054000100000000000C0000004B0052004500440045005400010000000000
      0C000000560041004C0055005400450001000000000010000000420052004100
      4E00430048004900440001000000000008000000540059005000450001000000
      0000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 64
    Top = 136
    object ExpComingAccDataSetID: TFloatField
      FieldName = 'ID'
    end
    object ExpComingAccDataSetDEBET: TFloatField
      FieldName = 'DEBET'
    end
    object ExpComingAccDataSetKREDET: TFloatField
      FieldName = 'KREDET'
    end
    object ExpComingAccDataSetVALUTE: TIntegerField
      FieldName = 'VALUTE'
    end
    object ExpComingAccDataSetBRANCHID: TFloatField
      FieldName = 'BRANCHID'
    end
    object ExpComingAccDataSetTYPE: TFloatField
      FieldName = 'TYPE'
    end
    object ExpComingAccDataSetDebit: TStringField
      FieldKind = fkLookup
      FieldName = 'Debit'
      LookupDataSet = FormComingAcc.ODSDebit
      LookupKeyFields = 'ID'
      LookupResultField = 'ACC_NO'
      KeyFields = 'DEBET'
      Lookup = True
    end
    object ExpComingAccDataSetKredit: TStringField
      FieldKind = fkLookup
      FieldName = 'Kredit'
      LookupDataSet = FormComingAcc.ODSKredit
      LookupKeyFields = 'ID'
      LookupResultField = 'ACC_NO'
      KeyFields = 'KREDET'
      Lookup = True
    end
    object ExpComingAccDataSetFilial: TStringField
      FieldKind = fkLookup
      FieldName = 'Filial'
      LookupDataSet = FormComingAcc.FilialDataSet
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'BRANCHID'
      Lookup = True
    end
    object ExpComingAccDataSetValyuta: TStringField
      FieldKind = fkLookup
      FieldName = 'ValName'
      LookupDataSet = FormComingAcc.ValDataSet
      LookupKeyFields = 'VALUTE'
      LookupResultField = 'VAL_NAME'
      KeyFields = 'VALUTE'
      Lookup = True
    end
    object ExpComingAccDataSetTip: TStringField
      FieldKind = fkLookup
      FieldName = 'Tip'
      LookupDataSet = FormComingAcc.ODSSettingsType
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'TYPE'
      Lookup = True
    end
  end
  object ExpComingAccDataSource: TDataSource
    DataSet = ExpComingAccDataSet
    Left = 202
    Top = 136
  end
end
