object FrmReserve: TFrmReserve
  Left = 0
  Top = 0
  Caption = 'FrmReserve'
  ClientHeight = 475
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 488
    Height = 113
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 488
    Height = 35
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitWidth = 426
    object Button1: TButton
      Left = 230
      Top = 6
      Width = 75
      Height = 25
      Caption = #399'lav'#601' et'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 309
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Sil'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 390
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 113
    Width = 488
    Height = 327
    Align = alClient
    DataSource = AddReserve.DataSource3
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FIL'
        Title.Caption = 'Filal'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HES'
        Title.Caption = 'Hesab'
        Width = 162
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'XERHES'
        Title.Caption = 'X'#601'rc hesab'#305
        Width = 184
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet1
    Left = 32
    Top = 56
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'Adi ehtiyatlar '#252'zre hesablar'#39'as name from dual'
      'union'
      
        'select 2 as id ,'#39'M'#601'qs'#601'dli ehtiyatlar '#252'zre hesablar'#39'as name from ' +
        'dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 120
    Top = 56
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'select 1 as id ,'#39'Adi ehtiyatlar '#252'zre hesablar'#39'as name from dual'
      'union'
      
        'select 2 as id ,'#39'M'#601'qs'#601'dli ehtiyatlar '#252'zre hesablar'#39'as name from ' +
        'dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      05000000020000000400000049004400010000000000080000004E0041004D00
      4500010000000000}
    AutoCalcFields = False
    Session = sboapiDataModule.SBSession
    Active = True
    Left = 104
    Top = 176
  end
end
