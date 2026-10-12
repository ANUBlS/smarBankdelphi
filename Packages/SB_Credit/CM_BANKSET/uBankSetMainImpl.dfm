object frmBankSet: TfrmBankSet
  Left = 215
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bank Settings'
  ClientHeight = 385
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 738
    Height = 360
    Align = alClient
    DataSource = bSet
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clBtnFace
        Expanded = False
        FieldName = 'BANK'
        ReadOnly = True
        Title.Color = clBlack
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Caption = 'Hesab '#8470
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Ad'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INN'
        Title.Caption = 'V'#214'EN'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS'
        Title.Caption = 'Bank'#305'n '#252'nvan'#305
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BOSSNAME'
        Title.Caption = 'R'#601'hb'#601'r '#351#601'xs'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTREESTRNUM'
        Title.Caption = 'Son reester '#8470
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contrdate'
        Title.Caption = 'M'#252'q tarixi'
        Title.Color = clNavy
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 74
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 360
    Width = 738
    Height = 25
    DataSource = bSet
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 1
  end
  object BSettings: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid, cm_ip.getbankname(bankid) bank, acc_no, name, inn,' +
        ' address, bossname,lastreestrnum, contrdate'
      '  FROM cm_banksettings '
      'order by bank')
    Optimize = False
    Session = sboapiDataModule.SBSession
    Left = 248
    Top = 128
  end
  object bSet: TDataSource
    DataSet = BSettings
    Left = 208
    Top = 128
  end
end
