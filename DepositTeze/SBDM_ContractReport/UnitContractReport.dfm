object frmContractReport: TfrmContractReport
  Left = 340
  Top = 294
  BorderIcons = [biSystemMenu]
  ClientHeight = 155
  ClientWidth = 201
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 8
    Top = 3
    Width = 128
    Height = 17
    Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1095#1072#1087#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 9
    Top = 123
    Width = 80
    Height = 27
    Caption = 'OK'
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 22
    Width = 193
    Height = 92
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 26
      Top = 26
      Width = 82
      Height = 18
      Caption = #1049#1072#1090#1099#1088#1099#1084
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 26
      Top = 60
      Width = 158
      Height = 19
      Caption = #1071#1084#1072#1085#1103#1090#1080#1085' '#1075#1072#1081#1090#1072#1088#1099#1083#1084#1072#1089#1099' '#1094#1079#1088#1103
      TabOrder = 1
    end
  end
  object BitBtn2: TBitBtn
    Left = 102
    Top = 123
    Width = 81
    Height = 27
    Caption = #1063#1099#1093#1099#1096
    DoubleBuffered = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object ODSDepozitWithDraw: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    C.ID'
      '   ,C.ContractNo'
      '   ,C.OpenDate'
      '   ,C.CloseDate'
      '   ,C.Amount'
      '   ,i.interest'
      '   ,oi.overdueinterest as overdueinterest'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ContractAccID) as' +
        ' ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ClientAccID) as C' +
        'lientAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.InterestAccID) as' +
        ' InterestAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ContractAccID) as Con' +
        'tractAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(CA.ContractAcc' +
        'ID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ClientAccID) as Clien' +
        'tAccName'
      '   ,p.*'
      '  From'
      '   SBCM_Contracts C'
      '  ,SBCM_Contract_Accounts CA'
      '  ,sbcm_interests i'
      '  ,sbcm_payments p'
      '  ,sbcm_overdueinterests oi'
      '  Where'
      '    C.Type# = ('
      '       Select ID from'
      '              SBCM_CONTRACT_TYPES'
      '              Where upper(Name) = '#39'DEPOSIT'#39
      '               )'
      '           And C.ID = CA.ID#'
      '           And i.id# = C.ID'
      '           and oi.id#=c.id'
      '           and C.ID=p.id#'
      '           and C.ID=:ContID')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000400
      00003902000000000000}
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 56
  end
  object ODSDepozitMoney: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    C.ID'
      '   ,C.ContractNo'
      '   ,C.OpenDate'
      '   ,C.CloseDate'
      '   ,C.Amount'
      '   ,i.interest'
      '   ,oi.overdueinterest as overdueinterest'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ContractAccID) as' +
        ' ContractAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.ClientAccID) as C' +
        'lientAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccNoFromID(CA.InterestAccID) as' +
        ' InterestAccNo'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ContractAccID) as Con' +
        'tractAccName'
      
        '   ,SBCM_Stored_Programs.SBCMGetCurrencyShortName(CA.ContractAcc' +
        'ID)as ContractCurrency'
      
        '   ,SBCM_Stored_Programs.SBCMGetAccName(CA.ClientAccID) as Clien' +
        'tAccName'
      '   ,t.*'
      '  From'
      '   SBCM_Contracts C'
      '  ,SBCM_Contract_Accounts CA'
      '  ,sbcm_interests i'
      '  ,sbcm_tranches t'
      '  ,sbcm_overdueinterests oi'
      '  Where'
      '    C.Type# = ('
      '       Select ID from'
      '              SBCM_CONTRACT_TYPES'
      '              Where upper(Name) = '#39'DEPOSIT'#39
      '               )'
      '           And C.ID = CA.ID#'
      '           And i.id# = C.ID'
      '           and oi.id#=c.id'
      '           and C.ID=t.id#'
      '           and C.ID=:ContID'
      '')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400030000000400
      00003902000000000000}
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 8
  end
  object ODSContarcts: TOracleDataSet
    SQL.Strings = (
      ''
      'SELECT per.NAME, cat.CATEGORY, dt.TYPE'
      '  FROM sbcm_persons per,'
      '       sbcm_categories cat,'
      '       sbcm_deposit_types dt,'
      '       sbcm_contracts c'
      ' WHERE per.ID = c.personaltype'
      '   AND cat.ID = c.clienttype'
      '   AND dt.ID = c.contracttype'
      '   AND c.ID =:ContID')
    Optimize = False
    Variables.Data = {
      04000000010000000E0000003A0043004F004E00540049004400050000000400
      00003536390000000000}
    Session = sboapiDataModule.SBSession
    Left = 104
    Top = 88
  end
end
