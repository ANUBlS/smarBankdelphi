object FormWitch: TFormWitch
  Left = 0
  Top = 225
  Caption = 'FormWitch'
  ClientHeight = 520
  ClientWidth = 982
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = -1
    Width = 1042
    Height = 203
    Color = clBtnFace
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    GradientEndColor = clBlack
    GradientStartColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'F'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Arial AzLat'
        Title.Font.Style = []
        Width = 19
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'TRANSDATE'
        Title.Alignment = taCenter
        Title.Caption = 'Tarix'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clWhite
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Alignment = taCenter
        Title.Caption = 'Debet'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 190
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'VAL_NAME'
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 28
        Visible = True
      end
      item
        Color = clWhite
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'Debet M'#601'bl'#601#287
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'TRANS_REF'
        Title.Alignment = taCenter
        Title.Caption = 'Qeydiyyat '#8470
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USERNAME'
        Title.Alignment = taCenter
        Title.Caption = 'Modifikator'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUSERID'
        Title.Alignment = taCenter
        Title.Caption = 'F.Verifikator'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VUSERID'
        Title.Alignment = taCenter
        Title.Caption = 'Verifikator'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AUSERID'
        Title.Alignment = taCenter
        Title.Caption = 'Avtorizator'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 208
    Width = 1043
    Height = 306
    Color = clBtnFace
    DataSource = DataSource2
    DrawingStyle = gdsGradient
    GradientEndColor = clBlack
    GradientStartColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Color = clSilver
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        Visible = False
      end
      item
        Expanded = False
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Azl Sans Serif'
        Title.Font.Style = []
        Width = 20
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'VAL_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Tarix'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clWhite
        Expanded = False
        FieldName = 'CLIENT_ACC_NO'
        Title.Alignment = taCenter
        Title.Caption = 'Kredit'
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 190
        Visible = True
      end
      item
        Alignment = taCenter
        Color = clSilver
        Expanded = False
        FieldName = 'VAL_NAME'
        Title.Alignment = taCenter
        Title.Caption = '$'
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'Kredit M'#601'bl'#601#287
        Title.Color = 8404992
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 160
        Visible = True
      end
      item
        Alignment = taRightJustify
        Color = clSilver
        Expanded = False
        FieldName = 'MESS_REFERENCE'
        Title.Alignment = taCenter
        Title.Caption = 'Qeydiyyat '#8470
        Title.Color = 8404992
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 106
        Visible = True
      end>
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select'
      '  x.*, x.rowid,'
      '  a.acc_no,'
      '  a.name,'
      '  v.val_name'
      'from'
      '  XS_BATCHS x ,'
      '  account a, '
      '  avalute v'
      'where'
      '  x.acc_id = a.id and'
      '  v.valute=a.val_acc and'
      '  (x.transdate>=:BeginDate and x.transdate<=:EndDate)'
      '')
    Optimize = False
    Variables.Data = {
      0400000002000000140000003A0042004500470049004E004400410054004500
      0C0000000000000000000000100000003A0045004E0044004400410054004500
      0C0000000000000000000000}
    Cursor = crSQLWait
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 152
    Top = 80
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select'
      '    x.rowid,'
      '    x.*,'
      '    v.val_name,'
      '    b.name as BankName'
      'from'
      '    XS_BENEFICIARY X,'
      '    avalute v,'
      '    BankM b'
      'where'
      '   (x.batchID=:id)and'
      '   (x.val_cod=v.valute)'
      '  and (x.rec_bank_id=b.id)')
    Optimize = False
    Variables.Data = {
      0400000001000000060000003A00490044000500000004000000323239000000
      0000}
    Cursor = crSQLWait
    Master = OracleDataSet1
    MasterFields = 'ID'
    QueryAllRecords = False
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 184
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = OracleDataSet2
    Left = 280
    Top = 80
  end
end
