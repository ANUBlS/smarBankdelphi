object NewDepositsFrmContractReport: TNewDepositsFrmContractReport
  Left = 340
  Top = 294
  BorderIcons = [biSystemMenu]
  ClientHeight = 173
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object XFLabel1: TXFLabel
    Left = 8
    Top = 6
    Width = 96
    Height = 14
    Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#1095#1072#1087#1099
  end
  object XFGroupBox1: TXFGroupBox
    Left = 6
    Top = 24
    Width = 220
    Height = 98
    TabOrder = 0
    object XFRadioButton1: TXFRadioButton
      Left = 32
      Top = 32
      Width = 113
      Height = 17
      Caption = #1049#1072#1090#1099#1088#1099#1084
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object XFRadioButton2: TXFRadioButton
      Left = 32
      Top = 64
      Width = 113
      Height = 17
      Caption = #1071#1084#1072#1085#1103#1090#1080#1085' '#1075#1072#1081#1090#1072#1088#1099#1083#1084#1072#1089#1099' '#1094#1079#1088#1103
      TabOrder = 1
    end
  end
  object XFButton1: TXFButton
    Left = 68
    Top = 140
    Width = 75
    Height = 25
    Caption = 'OK'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = XFButton1Click
  end
  object XFButton2: TXFButton
    Left = 151
    Top = 139
    Width = 75
    Height = 25
    Caption = #1063#1099#1093#1099#1096
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = XFButton2Click
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
    Left = 176
    Top = 40
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
    Left = 152
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
    Left = 152
    Top = 48
  end
end
