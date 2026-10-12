object frmContractReport: TfrmContractReport
  Left = 387
  Top = 286
  Width = 262
  Height = 198
  Caption = 'frmContractReport'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 7
    Width = 97
    Height = 16
    Caption = 'ћцгавил€нин чары'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 22
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 21
    Top = 32
    Width = 205
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 24
      Top = 24
      Width = 76
      Height = 17
      Caption = '…атырым'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 24
      Top = 56
      Width = 155
      Height = 17
      Caption = 'яман€тин гайтарылмасы цзр€'
      TabOrder = 1
    end
  end
  object BitBtn2: TBitBtn
    Left = 150
    Top = 128
    Width = 75
    Height = 25
    Caption = '„ыхыш'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
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
    Variables.Data = {
      0300000001000000070000003A434F4E54494403000000040000003902000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000280000000200000049440100000000000A000000434F4E5452414354
      4E4F010000000000080000004F50454E4441544501000000000009000000434C
      4F53454441544501000000000006000000414D4F554E540100000000000C0000
      00434F4E545241435454595045010000000000080000004252414E4348494401
      00000000000C000000504552534F4E414C545950450100000000000800000049
      4E5445524553540100000000000A000000434C49454E54545950450100000000
      000D000000434F4E545241435441434349440100000000000B000000434C4945
      4E5441434349440100000000000D000000494E54455245535441434349440100
      000000000C000000464143544943414C44454254010000000000140000004641
      43544943414C494E544552455354444542540100000000001200000043414C43
      554C4154494F4E454E41424C45440100000000000F0000004C41535450524F43
      4553534441544501000000000013000000544F54414C43414C434544494E5445
      524553540100000000000D000000434F4E54524143544143434E4F0100000000
      000B000000434C49454E544143434E4F0100000000000D000000494E54455245
      53544143434E4F01000000000010000000434F4E545241435443555252454E43
      590100000000000E000000434C49454E5443555252454E435901000000000010
      000000494E54455245535443555252454E43590100000000000F000000434F4E
      54524143544143434E414D450100000000000D000000434C49454E544143434E
      414D450100000000000F000000494E5445524553544143434E414D4501000000
      000012000000434F4E545241435443555252454E435949440100000000000600
      00005354415455530100000000000A0000004C41535457434441544501000000
      00000400000049445F3101000000000003000000494423010000000000050000
      0048444154450100000000000E000000464143544943414C444542545F310100
      000000000C000000494E544552455354444542540100000000000B0000004F56
      455244554544454254010000000000130000004F564552445545494E54455245
      535444454254010000000000040000005452494401000000000007000000494E
      54545249440100000000000F0000004F564552445545494E5445524553540100
      00000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 96
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
    Variables.Data = {
      0300000001000000070000003A434F4E54494403000000040000003902000000
      000000}
    QBEDefinition.QBEFieldDefs = {
      04000000250000000200000049440100000000000A000000434F4E5452414354
      4E4F010000000000080000004F50454E4441544501000000000009000000434C
      4F53454441544501000000000006000000414D4F554E540100000000000C0000
      00434F4E545241435454595045010000000000080000004252414E4348494401
      00000000000C000000504552534F4E414C545950450100000000000800000049
      4E5445524553540100000000000A000000434C49454E54545950450100000000
      000D000000434F4E545241435441434349440100000000000B000000434C4945
      4E5441434349440100000000000D000000494E54455245535441434349440100
      000000000C000000464143544943414C44454254010000000000140000004641
      43544943414C494E544552455354444542540100000000001200000043414C43
      554C4154494F4E454E41424C45440100000000000F0000004C41535450524F43
      4553534441544501000000000013000000544F54414C43414C434544494E5445
      524553540100000000000D000000434F4E54524143544143434E4F0100000000
      000B000000434C49454E544143434E4F0100000000000D000000494E54455245
      53544143434E4F01000000000010000000434F4E545241435443555252454E43
      590100000000000E000000434C49454E5443555252454E435901000000000010
      000000494E54455245535443555252454E43590100000000000F000000434F4E
      54524143544143434E414D450100000000000D000000434C49454E544143434E
      414D450100000000000F000000494E5445524553544143434E414D4501000000
      000012000000434F4E545241435443555252454E435949440100000000000600
      00005354415455530100000000000A0000004C41535457434441544501000000
      00000400000049445F3101000000000003000000494423010000000000050000
      00484441544501000000000005000000544F54414C0100000000000700000052
      45534552564501000000000004000000545249440100000000000F0000004F56
      4552445545494E544552455354010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 48
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
    Variables.Data = {
      0300000001000000070000003A434F4E54494405000000040000003536390000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000040000004E414D450100000000000800000043415445474F
      52590100000000000400000054595045010000000000}
    Session = sboapiDataModule.SBSession
    Left = 224
    Top = 128
  end
end
