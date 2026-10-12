object ConclusionForm: TConclusionForm
  Left = 357
  Top = 102
  ActiveControl = CMSearchEditLoacAccs
  BorderIcons = [biSystemMenu]
  ClientHeight = 506
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 470
    Width = 647
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object LblAvtAcc: TLabel
      Left = 93
      Top = 11
      Width = 140
      Height = 15
      Cursor = crHandPoint
      Caption = 'F3 - '#1065#1077#1089#1072#1073#1083#1072#1088' '#1081#1072#1088#1072#1090#1084#1072#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LblAvtAccClick
    end
    object RefreshListLbl: TLabel
      Left = 2
      Top = 11
      Width = 85
      Height = 15
      Cursor = crHandPoint
      Caption = 'F5 -'#1049#1077#1085#1080#1083#1103#1084#1103#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = RefreshListLblClick
    end
    object LblAvtSearch: TLabel
      Left = 240
      Top = 12
      Width = 135
      Height = 15
      Cursor = crHandPoint
      Caption = 'F2 -'#1040#1074#1090#1086#1084#1072#1090#1080#1082' '#1072#1093#1090#1072#1088#1099#1096
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 236
      Top = 6
      Width = 141
      Height = 28
      Caption = 'Girovlar v'#601' zaminl'#601'r'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFDDC2C2B63D3DC43B3BC33A3AC33939C33939C339
        39C33A3AC43B3BB84444E6D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5CFCFD62C2CFE2727FF2525
        FF2424FF2323FF2424FF2525FF2626D63131EAD8D8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8
        5757FD4A4AFE4B4BFE4949FF4A4AFE4949FE4A4AFE4A4ACC5656FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCA9090EB6362FF7171FE7070FE7070FE6F6FFE7070F66969C9
        8282FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D6D5C96F6FFC9696FE9898FE9898FE98
        98FE9999D97778DBBDBEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA8D0A896CD9697CE9796CE9697CE9797CD9795CA947A8053C88E88
        D2B2BBB7AFBEBAAFBED3A4AAC58E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4FAE4F1DC21D1FC61F1EC61E1FC61F1FC51F1E
        C51F1FB92647978465D0E46AE2F26AE1F262B5CC808FB99192CB9191CB9191CB
        9191CB9292CB9191CB9B9BCAFFFFFFFFFFFFFFFFFF89C4893BCA3B44D94443D8
        4344D94444D94442D84536C17E63E1EC6AD4F4393AD7393BD76CE0F7368CD11E
        25C62121C81F1FC71F1FC71F1FC71E1EC73737ABFFFFFFFFFFFFFFFFFFCAE1CA
        58BF586CE06C6DE06D6CE06D6CE16D60D67353CECD73F3FC6CDAF664BEF064C0
        F072E9FA5ED5EF3455D23C3DD83A3BD73A3AD73B3BD73838D35A5AB6FFFFFFFF
        FFFFFFFFFFFFFFFF85C18589DD8A98EA9997EA9897EA9972CD9E59C9D56EE7F0
        72F2FB74F4FE73F5FE74F5FE6DEDFA4883D95B5BDE595ADE5959DD5A5ADD4E4E
        D08585C2FFFFFFFFFFFFFFFFFFFFFFFFD7E8D780BF8593D7B87ED0C27FD2C255
        93991D58853D7591E9616180D8E197CED5E9626178EDF7569EDE7B7CE47A7CE5
        797AE47B7BE46262C6BABAD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FC5CF5ED5
        E569E2F568E3F52F7DA802349305348F253A7A43829A77CBD48DD7DF75F0FA63
        AEE1979CEA949BE99A9CEA9899E77474BBECECF4FFFFFFFFFFFFFFFFFFFFFFFF
        BADFEE67DDEF6CD7F6393AD7393AD73A86B305369405389B0537990B3B883176
        935CC5D069E2ED4DB2DA63BAE463BFE56FB1E17C8ECCB1B2D3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF81D0E571F0FB72EEFC6FE4F96FE5FA53B8D11444921545A1
        1443A01443A015429224588731779551C2D971EEFC71EBFB6DEAF95CB7D9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE6EEF55196B653AEC07FCAD47DE8F180E6EE83
        D2DC3779A43A61A9456BB4446AB3436AB43D63AB2C65955DBAE2393AD7393AD7
        64BBEF6BE8F796D4E8FFFFFFFFFFFFFFFFFFFFFFFFD0DAE72D5493234E8EE860
        60689FB38CCAD2E9626263D2E35682A86C84AD728BB56281AD4784AA5ECCDD71
        E6F969CEF36AD2F56FE1F875F5FE6ED5EAFFFFFFFFFFFFFFFFFFFFFFFFD4DCE8
        3355962B4D95284B93245590459AB369DDE768E0F0B1D9E9FFFFFFFFFFFF7DB3
        CA5ECDDA6FE9F274F2FB75F4FD74F5FF76F4FD76F6FF67E0F1C1E2F0FFFFFFFF
        FFFFFFFFFFEAEEF44D6DA33654993554993455982C569337769D4997B3D0E4EF
        FFFFFFFFFFFF6CC1CE33AEB74CAAB2E962618BD4DB7EE7F0E9626191D8DF69E6
        F5B2DDECFFFFFFFFFFFFFFFFFFFFFFFF9BAECB4D6AA45D76AD5D76AD5E77AE4E
        6CA56785B0FFFFFFFFFFFFFFFFFF5BD9DF30F2F42EE1E44FB3B958AAB16ED6DE
        9DC8CE86E2E969E8F6A9D9EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FB1CD768F
        B87B92BA778FB9839BBFDBE3EDFFFFFFFFFFFFFFFFFF60DBE136FCFD35FEFE33
        FAFA29D4D93CB1BA61D4DC71F0F868E4F4B3DDEDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9EDF4DAE1ECE0E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CDB
        E03AF8F93DFEFE3DFEFE3CFCFC30DCE133B1B94CB6BD57BCCCCCE6F0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBBE7EB46E4E851FEFE50FEFE50FEFE4EFDFD4AF1F33ED5DA55BC
        C7ECF7F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89D9DF61E7EA7DFCFC81FEFE7FFEFE
        76F9F95DDDE2B9E6EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3DDE279
        D3DA7AD8DE79D7DD7ED4DBC1E7EBFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object btnSave: TButton
      Left = 384
      Top = 6
      Width = 81
      Height = 28
      Caption = #1043#1077#1081#1076' '#1077#1090
      TabOrder = 0
      OnClick = SaveChangesExecute
    end
    object btnCancel: TButton
      Left = 468
      Top = 6
      Width = 81
      Height = 28
      Caption = #1048#1084#1090#1080#1085#1072' '#1077#1090
      TabOrder = 1
      OnClick = DismisChangesExecute
    end
    object btnClose: TButton
      Left = 558
      Top = 6
      Width = 81
      Height = 28
      Caption = #1041#1072#1100#1083#1072
      TabOrder = 2
      OnClick = CloseFormExecute
    end
    object HBConclusion: TCMHintBox
      Left = 9
      Top = 8
      Width = 188
      Height = 22
      AutoSize = True
      BevelOuter = bvNone
      Caption = 'HBConclusion'
      Color = clYellow
      TabOrder = 3
      Visible = False
      HintStyle = hsAlert
      Timeout = 4000
      BeepOnMessage = False
    end
    object Bitpost: TBitBtn
      Left = 472
      Top = 2
      Width = 87
      Height = 32
      Caption = #1058#1103#1089#1090#1080#1075' '#1077#1090
      DoubleBuffered = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFEFFFEFEFEFEFAFCFAD6E6D691BE915499543084302880282780
        2730843054995491BE91D6E7D6FAFCFAFEFEFEFEFFFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFFFEFCFEFCDAEADA76AE762A822A1C821C2C932C
        3DA23D44A74443A7433EA23E2C942C1C821C2A822A76AE76DAEADAFCFEFCFEFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEF9FCF9B0D0B033883310811021
        9B212DA82D30AB3030AB3032AC3230AB3031AC312FAB2F2DA82D219B21108110
        338833B1D1B1F9FCF9FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFF9FCF99EC59E1C7D
        1C058705089A08089B08079B07089C08099D09099C09089B08089C08089C0807
        9B07079B07089A080587051C7D1C9EC59EF9FCF9FFFFFFFFFFFFFFFFFFFCFEFC
        B0D0B01C7D1C048B04029802019801029902019A010199010C9D0C37AE3719A2
        19039A03009900019A01019901029802029802048B041C7D1CB0D0B0FCFEFCFF
        FFFFFEFFFEDAE9DA338733048704029802019801019901019A010199010C9D0C
        87CE87E8F6E8B0DEB017A217019901009900019A010299020198010298020487
        04338733DAE9DAFEFFFEF9FCF976AD76067C0603970301980101990101990103
        9A03079B0771C571EFF8EFF9FCF9F5FAF571C671049A04009900009800029902
        019801029802039703067C0676AD76F9FCF9D5E6D5248024038E030298020198
        01019901029A02079B0758BC58E7F5E7F9FDF9F4FAF4FBFDFBD5EED52AAA2A02
        9A02019A01029902019901029802029802038E03248024D5E6D591BD91067906
        02960201980101990100990003990340B340D8EFD8F8FCF8B7E1B75BBD5BD6EE
        D6F8FCF88ED18E089C0801990101990100980001990101980102960205780591
        BD915298520282020298020199010099000299022AA92AC8E9C8F8FBF8C7E8C7
        2CAA2C089C086DC46DF5FBF5E3F3E340B240029902039A03009800029A020199
        010298020182015398532D822D028A020299020199010299021BA31BB2DFB2F9
        FCF9E4F3E464C0642EAA2E2FAB2F40B240CEEBCEF9FCF9AEDEAE21A5210E9E0E
        049A04029A02019901029902018A012D822D1F7C1F028D02059A0515A11537AF
        37A8DCA8F7FCF7EEF8EE94D49461BF615EBE5E5EBE5E5FBF5F8FD28FF2FAF2F4
        FBF492D39253B95343B4432EAB2E15A115059A05018C01217C211F7C1F109310
        38AE384FB74F9BD69BF4FAF4F2F9F2A0D8A05ABC5A56BA5655BA5557BB5756BA
        565FBE5FBEE4BEF9FCF9D9EFD96BC36B56BA5656BA564EB74E37AE370E910E21
        7D212E832E329D324FB84F4EB84E95D495E9F6E9ABDDAB57BB5750B8504EB84E
        4EB84E4FB84F4FB84F51B85172C772E7F5E7F9FDF9A5DBA552B95250B8504DB7
        4D4EB74E319D312E832E53985327912746B44646B4464DB74D65C1654FB74F48
        B54846B44645B44546B44647B54745B44549B5494AB64AA1D9A1F7FCF7E6F5E6
        69C26949B54946B44646B44626912654995491BD911981193CAE3C3EB13E3EB1
        3E3FB13F3EB13E40B2403EB13E3DB13D3DB13D3FB23F3DB03D40B2403FB13F56
        BA56D5EED5FAFDFAB2DFB247B5473FB13F3DAE3D18801891BD91D6E7D6298229
        2D9F2D37AE3736AE3637AF3736AD3637AF3736AE3635AD3536AD3638AE3835AD
        3537AF3736AE3638AE3881CC81F4FBF4EEF8EE70C57038AF382EA02E298229D6
        E7D6FAFCFA76AE761883182EA92E2EAA2E2EAB2E2FAB2F30AB302FAB2F2FAB2F
        2FAB2F30AB302FAB2F30AB302FAB2F30AC303DB13DBEE5BEFAFDFAACDDAC33AB
        3319831976AE76FAFCFAFFFFFFDBEADB3588351C901C27A72726A72626A82628
        A82826A72626A72626A72627A82725A72528A82825A72526A72628A92857BA57
        B3E0B36AC26A1D911D368936DBEADBFFFFFFFFFFFFFDFEFDB0D0B01E7E1E1994
        191FA31F1EA41E20A5201FA51F1FA51F1FA51F20A5201FA51F20A5201FA51F1F
        A51F1FA41F20A42025A6251B941B1F7E1FB0D0B0FDFEFDFFFFFFFFFFFFFFFFFF
        FAFCFA9DC59D1F7E1F128D1218A01817A11717A11717A11717A21718A11816A0
        1618A21817A11716A11616A11618A018138D13207E209EC69EFAFCFAFFFFFFFF
        FFFFFFFFFFFFFFFFFEFFFEFAFCFAB0D0B03488340C7F0C0E930E0F9C0F0F9E0F
        0F9F0F109F100F9E0F109F100F9E0F0F9C0F0E930E0C7F0C348834B0D0B0FAFC
        FAFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFDFEFDDBEADB76AE7625
        8025097B09058405068C06068F06058E05068C06058405097B0925802576AE76
        DBEADBFDFEFDFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
        FEFEFEFEFAFCFAD5E6D591BD915298522D832D1F7C1F1F7C1F2D832D52985291
        BD91D5E6D5FAFCFAFEFEFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 4
      Visible = False
      OnClick = BitpostClick
    end
    object BitCancel: TBitBtn
      Left = 562
      Top = 2
      Width = 83
      Height = 34
      Caption = #1048#1085#1082#1072#1088' '#1077#1090
      DoubleBuffered = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFF719BE6
        4B83E04C84E05086E14F86E15086E04F86E14F86E15086E04F85DF4F84DE4F84
        DE4F85DF5086E15086E05086E15086E04F85E04F86E14C84E04C83E0729CE6FF
        FFFF6895E44896E95FBBF65EBBF65DBAF65EBBF75EBAF65FBBF65EBBF65DBAF6
        5CB7F35AAFE959B0EA5EB8F35EBAF65DBAF65EBAF75FBAF65EBAF75EBAF65EBB
        F65EBAF64796E96895E45388E14DB0F455CAFE54CAFE55CBFF55CBFF55CBFF56
        CBFE55CAFE51C0F133708B1C38441C3946387C9952C4F654CAFE55CBFF56CBFE
        55CBFF56CBFE54CAFE55CAFE4CAFF45388E180A6E93A94EA40C2FE3FC4FE40C5
        FF3FC4FE3FC4FE3FC4FE3EC2FC2E8EB8060E1103060702050609151B339DCB3E
        C2FC3EC3FD40C5FE3FC4FE3FC5FE3FC4FE40C2FE3A91E985A9E9FFFFFF4887E2
        3CB3F83DC3FE3CC4FF3CC4FE3BC4FE3DC4FE3BC2FD2E97C507161C0407080205
        050C212A32A4D53BC2FD3BC3FD3EC5FF3BC4FE3DC4FF3DC3FE3CB1F64B88E2FF
        FFFFFFFFFF89ACEA3995EA3CC1FE3CC3FE3CC4FF3BC4FE3CC4FE3BC2FD3ABEF8
        2A89B21950681A546D2D93BF3AC0FA3BC2FD3BC3FE3DC5FF3CC4FF3DC3FE3CC1
        FE3992E992B3ECFBFCFFFFFFFFFFFFFF4A87E23BB2F73CC3FE3CC4FF3AC3FE3D
        C4FE3BC3FE3BC3FE3BC1FC3DC1FA3AC0FA3DC2FC3BC3FE3BC3FE3BC3FE3DC4FF
        3CC4FF3CC3FE3BB0F6518BE3FFFFFFFFFFFFFFFFFFFFFFFF8EB0EB3A95EA3CC1
        FE3CC3FE3CC4FF3EC4FE3CC4FF3CC4FF38B4EA287EA22A8AB33BBDF63CC4FF3C
        C4FF3DC5FF3DC4FE3BC3FE3CC0FD3991E997B6EDFBFDFFFFFFFFFFFFFFFFFFFF
        FFFFFF4E8AE33CB2F73CC3FE3CC4FF3DC4FE3BC2FD3CC2FC236F91040B0D0613
        192F94C13CC2FD3BC2FD3CC3FE3DC4FE3CC3FE3BAEF5528BE3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFCFF91B2EC3894EA3CC1FE3CC4FE40C5FF4DC7FD5FC9F7
        254A5A0407080306083D768E61CDFC4CC7FD3FC5FF3DC4FE3CC0FD398FE797B6
        EDFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D89E23CB1F74AC7FE68
        D1FF7BD6FE79CDF2223A440506070304043B63747ED6FC7AD6FE66D0FF49C7FE
        3CAEF6518BE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFF91B2
        EC4395E972D1FE7CD7FE7BD6FD73C8ED1A2C340405060304052E4F5D79D2F97B
        D6FD7BD7FE70D0FD4292E897B6EDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF528AE268BEF777D5FE76D4FE69BDE21321270405060203
        04223B4670CAF276D4FE77D5FE67BCF6558BE2FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFF92B2EC4E98E970D1FD70D3FD5FB2D6
        0E191E04050503040418293168C3EA70D3FD70D0FD4D95E898B7EDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF528AE260
        BBF66CD1FD55A6CA091013040505020303101D235CB4DB6CD1FD5EB9F5548BE3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFDFF90B2EB4996E865CCFC4C9ABC060A0C0405050202030B131651A5CB65
        CCFC4894E796B6EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5089E157B8F5448EAF05080A0405050203
        03070B0E4A9BC057B6F4548AE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFF8FB0EA4595E73D87AA
        05090B040606030505080E12479BC24592E696B5ECFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5089E04092C70E1F27040608030506122832459CD7538AE1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFBFCFF90B1EB4191E53D97C127637D2660793C95BF408FE497
        B6ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F89E247B3F54BC6FD4BC6
        FD46B0F4538BE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFF91B2EC
        3D92E846C2FC46C2FC3D8FE697B6EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF538AE23C9FEE3C9EEE578DE3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFBED1F46090E46090E3C1D4F4FDFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 5
      Visible = False
      OnClick = BitCancelClick
    end
  end
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 647
    Height = 470
    ActivePage = tbCreditAccounts
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object tbCust: TTabSheet
      Caption = '&M'#252#351't'#601'ri'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label39: TLabel
          Left = 12
          Top = 8
          Width = 63
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 220
          Top = 8
          Width = 41
          Height = 15
          Caption = 'ID - '#1089#1080' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CustIDEdit: TDBEdit
          Tag = 1
          Left = 266
          Top = 3
          Width = 81
          Height = 23
          TabStop = False
          DataField = 'BOOROWERID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          TabOrder = 0
          OnKeyPress = BranchCBEhKeyPress
        end
        object DBLookupComboboxEh19: TDBLookupComboboxEh
          Tag = 1
          Left = 383
          Top = 4
          Width = 251
          Height = 23
          TabStop = False
          DataField = 'BOOROWERID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleConcl.DataSrcCustomer
          TabOrder = 1
          Visible = True
          OnChange = DBLookupComboboxEh19Change
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel62: TPanel
        Tag = 1
        Left = 0
        Top = 121
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label135: TLabel
          Left = 15
          Top = 8
          Width = 144
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1092#1103#1072#1083#1080#1081#1081#1103#1090'i'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label136: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label144: TLabel
          Left = 149
          Top = 9
          Width = 49
          Height = 15
          Caption = 'KOD - u :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label148: TLabel
          Left = 294
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLookupComboboxEh30: TDBLookupComboboxEh
          Tag = 1
          Left = 323
          Top = 4
          Width = 311
          Height = 23
          DataField = 'ACTIVITIES'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = DataModuleConcl.DataSrcActivities
          TabOrder = 0
          Visible = True
          OnChange = DBLookupComboboxEh30Change
          OnClick = DBLookupComboboxEh30Click
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh30KeyValueChanged
        end
        object CMSearchEdit14: TCMSearchEdit
          Tag = 1
          Left = 199
          Top = 3
          Width = 87
          Height = 23
          TabOrder = 1
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'ACTIVITIES'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'BANK_KOD'
          ListSource = DataModuleConcl.DataSrcActivities
          ErrorColor = clRed
          BeepOnNotFound = False
        end
      end
      object Panel63: TPanel
        Tag = 1
        Left = 0
        Top = 60
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label137: TLabel
          Left = 14
          Top = 8
          Width = 209
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1090#1080#1087#1080' ('#1052#1094#1083#1082#1080#1081#1081#1103#1090' '#1085#1102#1074#1094')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label138: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label158: TLabel
          Left = 177
          Top = 9
          Width = 49
          Height = 15
          Caption = 'KOD - u :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label159: TLabel
          Left = 294
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLookupComboboxEh29: TDBLookupComboboxEh
          Tag = 1
          Left = 323
          Top = 5
          Width = 311
          Height = 23
          DataField = 'ACTIVITIES_TYPE'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleConcl.EstateType
          TabOrder = 0
          Visible = True
          OnChange = DBLookupComboboxEh29Change
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
        object CMSearchEdit16: TCMSearchEdit
          Tag = 1
          Left = 225
          Top = 3
          Width = 61
          Height = 23
          TabOrder = 1
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'ACTIVITIES_TYPE'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'KODU'
          ListSource = DataModuleConcl.EstateType
          ErrorColor = clRed
          BeepOnNotFound = False
        end
      end
      object Panel64: TPanel
        Tag = 1
        Left = 0
        Top = 90
        Width = 639
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object Label139: TLabel
          Left = 14
          Top = 8
          Width = 121
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1089#1077#1082#1090#1086#1088#1091
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label140: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label143: TLabel
          Left = 150
          Top = 9
          Width = 49
          Height = 15
          Caption = 'KOD - u :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label147: TLabel
          Left = 294
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLookupComboboxEh28: TDBLookupComboboxEh
          Tag = 1
          Left = 323
          Top = 4
          Width = 311
          Height = 23
          DataField = 'CREDITACT'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleConcl.creditcat
          TabOrder = 0
          Visible = True
          OnChange = DBLookupComboboxEh28Change
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh28KeyValueChanged
        end
        object CMSearchEdit13: TCMSearchEdit
          Tag = 1
          Left = 199
          Top = 3
          Width = 87
          Height = 23
          TabOrder = 1
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'CREDITACT'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'KOD'
          ListSource = DataModuleConcl.creditcat
          ErrorColor = clRed
          BeepOnNotFound = False
        end
      end
      object Panel8: TPanel
        Tag = 1
        Left = 0
        Top = 181
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 6
        object Label12: TLabel
          Left = 14
          Top = 8
          Width = 143
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1082#1072#1090#1077#1075#1086#1081#1072#1089#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboboxEh2: TDBLookupComboboxEh
          Tag = 1
          Left = 137
          Top = 3
          Width = 354
          Height = 23
          DataField = 'PERSONALTYPE'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPION'
          ListSource = DataModuleConcl.DataSrcPersonTypes
          TabOrder = 0
          Visible = True
          OnChange = DBLookupComboboxEh2Change
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel65: TPanel
        Tag = 1
        Left = 0
        Top = 151
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 5
        object Label141: TLabel
          Left = 15
          Top = 8
          Width = 173
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' '#1092#1103#1072#1083#1080#1081#1081#1103#1090' '#1085#1102#1074#1094
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label142: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label145: TLabel
          Left = 150
          Top = 9
          Width = 49
          Height = 15
          Caption = 'KOD - u :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label149: TLabel
          Left = 294
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLookupComboboxEh31: TDBLookupComboboxEh
          Tag = 1
          Left = 323
          Top = 4
          Width = 311
          Height = 23
          DataField = 'CUSTOMERTYPE'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'DESCRIPTION'
          ListSource = DataModuleConcl.DataSrcClientCategories
          TabOrder = 0
          Visible = True
          OnChange = DBLookupComboboxEh31Change
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh31KeyValueChanged
        end
        object CMSearchEdit15: TCMSearchEdit
          Tag = 1
          Left = 199
          Top = 3
          Width = 87
          Height = 23
          TabOrder = 1
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'CUSTOMERTYPE'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'KODU'
          ListSource = DataModuleConcl.DataSrcClientCategories
          ErrorColor = clRed
          BeepOnNotFound = False
        end
      end
      object Panel51: TPanel
        Tag = 1
        Left = 0
        Top = 30
        Width = 639
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label10: TLabel
          Left = 14
          Top = 8
          Width = 104
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' cinsi'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label64: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label91: TLabel
          Left = 303
          Top = 10
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label153: TLabel
          Left = 313
          Top = 9
          Width = 162
          Height = 15
          Caption = #1041#1086#1088#1078#1072#1083#1072#1085#1099#1085' banka  aidiyat'#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DBLookupComboboxEh33: TDBLookupComboboxEh
          Tag = 1
          Left = 98
          Top = 4
          Width = 152
          Height = 23
          DataField = 'BOOROWERID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          Enabled = False
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'sex_cust'
          ListSource = DataModuleConcl.custSrc
          TabOrder = 0
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
        object DBLookupComboboxEh34: TDBLookupComboboxEh
          Tag = 1
          Left = 451
          Top = 4
          Width = 183
          Height = 23
          DataField = 'BOOROWERID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          Enabled = False
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = DataModuleConcl.PrinadSrc
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
    end
    object tbCredit: TTabSheet
      Caption = '&Kredit'
      ImageIndex = 1
      OnEnter = tbCreditEnter
      object Panel10: TPanel
        Left = 324
        Top = -2
        Width = 317
        Height = 449
        BevelInner = bvLowered
        Color = clBtnHighlight
        ParentBackground = False
        TabOrder = 0
        object Panel11: TPanel
          Tag = 1
          Left = 2
          Top = 2
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label16: TLabel
            Left = 18
            Top = 6
            Width = 48
            Height = 15
            Caption = #1042#1072#1083#1081#1091#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Tag = 1
            Left = 74
            Top = 3
            Width = 234
            Height = 23
            DataField = 'CURRENCY'
            DataSource = DataModuleConcl.DataSrcCreditProps
            KeyField = 'CURRID'
            ListField = 'CURRNAME'
            ListSource = DataModuleConcl.DataSrcCurrencys
            TabOrder = 0
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel12: TPanel
          Tag = 1
          Left = 2
          Top = 32
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object Label18: TLabel
            Left = 18
            Top = 6
            Width = 76
            Height = 15
            Caption = #1049'/'#1052' '#1084#1084#1103#1073#1083#1103#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNumberEditEh1: TDBNumberEditEh
            Tag = 1
            Left = 146
            Top = 4
            Width = 162
            Height = 23
            currency = True
            DataField = 'CREDITLINEAMOUNT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel13: TPanel
          Tag = 1
          Left = 2
          Top = 62
          Width = 313
          Height = 31
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 2
          object Label20: TLabel
            Left = 18
            Top = 6
            Width = 97
            Height = 15
            Caption = #1048#1083#1083#1080#1082' '#1092#1072#1080#1079#1080' (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNumberEditEh2: TDBNumberEditEh
            Tag = 1
            Left = 146
            Top = 3
            Width = 162
            Height = 23
            currency = True
            DataField = 'ANNUALYINTERESTRATE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DecimalPlaces = 4
            EditButtons = <>
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel14: TPanel
          Tag = 1
          Left = 2
          Top = 93
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 3
          object Label22: TLabel
            Left = 18
            Top = 6
            Width = 157
            Height = 15
            Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1073#1086#1088#1078' '#1092#1072#1080#1079#1080' (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label23: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNumberEditEh4: TDBNumberEditEh
            Tag = 1
            Left = 146
            Top = 4
            Width = 162
            Height = 23
            currency = True
            DataField = 'ANNUALYOVERDUERATE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DecimalPlaces = 4
            EditButtons = <>
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel16: TPanel
          Tag = 1
          Left = 2
          Top = 153
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 5
          object Label26: TLabel
            Left = 18
            Top = 8
            Width = 106
            Height = 15
            Caption = 'Komission faizi (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNumberEditEh11: TDBNumberEditEh
            Tag = 1
            Left = 146
            Top = 3
            Width = 162
            Height = 23
            currency = True
            DataField = 'ANNUALBANKRATE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel19: TPanel
          Tag = 1
          Left = 2
          Top = 183
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 6
          object Label2: TLabel
            Left = 18
            Top = 6
            Width = 120
            Height = 15
            Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1058#1103#1089#1085#1080#1092#1072#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label31: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh8: TDBLookupComboboxEh
            Tag = 1
            Left = 112
            Top = 4
            Width = 198
            Height = 23
            DataField = 'RESERVEID'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'FullDesc'
            ListSource = DataModuleConcl.DataSrcReserves
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel21: TPanel
          Tag = 1
          Left = 2
          Top = 243
          Width = 313
          Height = 31
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 8
          object Label33: TLabel
            Left = 18
            Top = 9
            Width = 104
            Height = 15
            Caption = #1070#1076#1103#1084#1103' '#1072#1087#1072#1088#1099#1083#1099#1088
          end
          object Label84: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh9: TDBLookupComboboxEh
            Tag = 1
            Left = 112
            Top = 4
            Width = 198
            Height = 23
            DataField = 'AUTOPAYMENT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'DESCRIPTION'
            ListSource = DataModuleConcl.DataSrcAutoPayment
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel32: TPanel
          Tag = 2
          Left = 2
          Top = 274
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 9
          object Label71: TLabel
            Left = 18
            Top = 10
            Width = 138
            Height = 15
            Caption = #1069#1077#1078#1080#1082#1076#1080#1088#1084#1103' '#1072#1087#1072#1088#1099#1083#1099#1088
          end
          object Label86: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh10: TDBLookupComboboxEh
            Tag = 1
            Left = 115
            Top = 4
            Width = 195
            Height = 23
            DataField = 'AUTOEXPIRE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'DESCRIPTION'
            ListSource = DataModuleConcl.DataSrcAutoExpire
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel33: TPanel
          Tag = 1
          Left = 2
          Top = 213
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 7
          object Label3: TLabel
            Left = 17
            Top = 8
            Width = 116
            Height = 15
            Caption = #1050#1088#1077#1076#1080#1090' '#1069#1077#1078'.'#1058#1103#1089#1085#1080#1092'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object DBLookupComboboxEh13: TDBLookupComboboxEh
            Tag = 1
            Left = 122
            Top = 4
            Width = 188
            Height = 23
            DataField = 'DUERESERVEID'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'FullDesc'
            ListSource = DataModuleConcl.DataSrcReserves
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel44: TPanel
          Tag = 2
          Left = 2
          Top = 304
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 10
          object Label56: TLabel
            Left = 18
            Top = 8
            Width = 130
            Height = 15
            Caption = #1065#1077#1089#1072#1073#1083#1072#1084#1072' '#1072#1087#1072#1088#1099#1083#1099#1088
          end
          object Label60: TLabel
            Left = 4
            Top = 8
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh25: TDBLookupComboboxEh
            Tag = 1
            Left = 116
            Top = 4
            Width = 194
            Height = 23
            DataField = 'INTCALCMETHOD'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'DESCRIPTION'
            ListSource = DataModuleConcl.DatSrcCalcIntMethod
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel36: TPanel
          Tag = 1
          Left = 2
          Top = 123
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 4
          object Label79: TLabel
            Left = 18
            Top = 8
            Width = 109
            Height = 15
            Caption = #1046#1103#1088#1080#1084#1103' '#1092#1072#1080#1079#1080' (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label80: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBNumberEditEh5: TDBNumberEditEh
            Tag = 1
            Left = 146
            Top = 3
            Width = 162
            Height = 23
            currency = True
            DataField = 'ANNUALYPENALTYRATE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DecimalPlaces = 4
            EditButtons = <>
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel37: TPanel
          Tag = 1
          Left = 2
          Top = 387
          Width = 313
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 12
          object Label102: TLabel
            Left = 6
            Top = 8
            Width = 55
            Height = 15
            Caption = #1058#1103#1081#1080#1085#1072#1090#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEdit3: TDBEdit
            Tag = 2
            Left = 52
            Top = 5
            Width = 257
            Height = 23
            Color = clInfoBk
            DataField = 'PURPOSEOFCREDIT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            TabOrder = 0
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel38: TPanel
          Tag = 1
          Left = 2
          Top = 334
          Width = 313
          Height = 53
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 11
          object Label32: TLabel
            Left = 18
            Top = 6
            Width = 154
            Height = 14
            Caption = 'Kreditin maliy'#601'l'#601#351'm'#601' m'#601'nb'#601'yi'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label81: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh5: TDBLookupComboboxEh
            Tag = 1
            Left = 8
            Top = 27
            Width = 302
            Height = 23
            DataField = 'USRGROUP'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'DESCRIPTION'
            ListSource = DataModuleConcl.DataSrcUsrGroups
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 1
        Width = 320
        Height = 539
        BevelInner = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Panel3: TPanel
          Tag = 1
          Left = 2
          Top = 2
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 44
            Height = 15
            Caption = #1060#1080#1083#1080#1072#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BranchCBEh: TDBLookupComboboxEh
            Tag = 1
            Left = 44
            Top = 5
            Width = 268
            Height = 23
            DataField = 'BRANCHID'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = DataModuleConcl.DataSrcBranches
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel4: TPanel
          Tag = 1
          Left = 2
          Top = 93
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          Color = clSilver
          ParentBackground = False
          TabOrder = 3
          object Label4: TLabel
            Left = 14
            Top = 9
            Width = 91
            Height = 15
            Caption = #1052#1094#1075#1072#1074#1080#1083#1103#1085#1080#1085' '#8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit1: TDBEdit
            Tag = 1
            Left = 145
            Top = 3
            Width = 167
            Height = 22
            DataField = 'NUMBEROFCREDIT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel5: TPanel
          Tag = 1
          Left = 2
          Top = 153
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          Color = clSilver
          TabOrder = 4
          object Label6: TLabel
            Left = 14
            Top = 8
            Width = 126
            Height = 14
            Caption = 'M'#252'qavil'#601'nin a'#231#305'lma tarixi'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBDateTimeEditEh1: TDBDateTimeEditEh
            Tag = 1
            Left = 182
            Top = 3
            Width = 130
            Height = 22
            Hint = 'dd/mm/yyyy'
            DataField = 'DATEOFCONCLUSION'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel6: TPanel
          Tag = 1
          Left = 2
          Top = 183
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          Color = clSilver
          TabOrder = 5
          object Label8: TLabel
            Left = 14
            Top = 8
            Width = 116
            Height = 15
            Caption = #1041#1072#1100#1083#1072#1085#1072#1078#1072#1100#1099' '#1090#1072#1088#1080#1093
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBDateTimeEditEh2: TDBDateTimeEditEh
            Tag = 1
            Left = 182
            Top = 3
            Width = 130
            Height = 22
            Hint = 'dd/mm/yyyy'
            DataField = 'DUEDATEFIRSTCONTRACT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnKeyPress = DBDateTimeEditEh2KeyPress
          end
        end
        object Panel9: TPanel
          Tag = 1
          Left = 2
          Top = 213
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 7
          object Label14: TLabel
            Left = 14
            Top = 8
            Width = 83
            Height = 15
            Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1090#1080#1087#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh4: TDBLookupComboboxEh
            Tag = 1
            Left = 93
            Top = 5
            Width = 219
            Height = 23
            Ctl3D = True
            DataField = 'CREDITTYPE'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'DESCRIPTION'
            ListSource = DataModuleConcl.DataSrcCreditTypes
            ParentCtl3D = False
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel43: TPanel
          Tag = 1
          Left = 2
          Top = 123
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 6
          object Label98: TLabel
            Left = 14
            Top = 8
            Width = 158
            Height = 15
            Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1084#1094#1076#1076#1103#1090#1080' '#1072#1081#1083#1072#1088#1083#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label99: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EditPeriodCredit: TDBEditEh
            Tag = 1
            Left = 180
            Top = 4
            Width = 130
            Height = 23
            DataField = 'PERIODCONTRACTS'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnChange = EditPeriodCreditChange
            OnKeyPress = EditPeriodCreditKeyPress
          end
        end
        object Panel72: TPanel
          Tag = 1
          Left = 0
          Top = 471
          Width = 316
          Height = 32
          BevelInner = bvLowered
          Enabled = False
          TabOrder = 12
          Visible = False
          DesignSize = (
            316
            32)
          object Label162: TLabel
            Left = 5
            Top = 8
            Width = 132
            Height = 15
            Caption = #1060#1072#1080#1079#1076#1103#1085' '#1102#1076#1103#1085#1080#1096' '#1101#1094#1085#1094':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBLookupComboboxEh37: TDBLookupComboboxEh
            Left = 179
            Top = 4
            Width = 134
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PAYINTDAY'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = DataModuleConcl.PayIntSrc
            TabOrder = 0
            Visible = True
          end
        end
        object Panel74: TPanel
          Tag = 1
          Left = 2
          Top = 444
          Width = 316
          Height = 32
          BevelInner = bvLowered
          Enabled = False
          TabOrder = 13
          Visible = False
          DesignSize = (
            316
            32)
          object Label164: TLabel
            Left = 5
            Top = 9
            Width = 188
            Height = 15
            Caption = #1071#1089#1072#1089#1076#1072#1085' '#1075#1072#1081#1090#1072#1088#1099#1083#1084#1072' '#1102#1097#1090#1103#1083#1080#1081#1080' :'
          end
          object DBLookupComboboxEh36: TDBLookupComboboxEh
            Left = 179
            Top = 4
            Width = 134
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PAYPERIOD'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = DataModuleConcl.DataSourc
            TabOrder = 0
            Visible = True
          end
        end
        object Panel66: TPanel
          Tag = 1
          Left = 2
          Top = 243
          Width = 316
          Height = 31
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 8
          object Label150: TLabel
            Left = 13
            Top = 9
            Width = 160
            Height = 15
            Caption = #1050#1088#1077#1076#1080#1090#1080#1085' '#1074#1077#1088#1080#1083#1084#1103'  '#1084#1103#1075#1089#1103#1076#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label151: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBLookupComboboxEh32: TDBLookupComboboxEh
            Tag = 1
            Left = 143
            Top = 4
            Width = 169
            Height = 23
            DataField = 'AIM_ID'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = DataModuleConcl.AIM_Src
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel56: TPanel
          Tag = 1
          Left = 2
          Top = 274
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          Color = clSilver
          TabOrder = 9
          object Label160: TLabel
            Left = 5
            Top = 8
            Width = 145
            Height = 14
            Caption = 'K inspektorunun ad'#305' soyad'#305
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object DBLookupComboboxEh35: TDBLookupComboboxEh
            Tag = 1
            Left = 145
            Top = 4
            Width = 167
            Height = 23
            DataField = 'EXPERTID'
            DataSource = DataModuleConcl.DataSrcCreditProps
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = DataModuleConcl.ExpertSrc
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
            OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
          end
        end
        object Panel7: TPanel
          Tag = 1
          Left = 2
          Top = 32
          Width = 316
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object Label11: TLabel
            Left = 14
            Top = 8
            Width = 104
            Height = 14
            Caption = 'Kredit '#601'riz'#601'sinin  '#8470
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEditEh1: TDBEditEh
            Tag = 1
            Left = 166
            Top = 4
            Width = 146
            Height = 23
            DataField = 'NUMBEROFBANKCREDIT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object Panel15: TPanel
          Tag = 1
          Left = 2
          Top = 62
          Width = 316
          Height = 31
          Align = alTop
          BevelInner = bvLowered
          Color = clSilver
          TabOrder = 2
          object Label25: TLabel
            Left = 14
            Top = 8
            Width = 111
            Height = 14
            Caption = 'Kredit '#601'riz'#601'sinin tarixi'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 4
            Top = 9
            Width = 6
            Height = 18
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -15
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBDateTimeEditEh3: TDBDateTimeEditEh
            Tag = 1
            Left = 182
            Top = 4
            Width = 130
            Height = 22
            Hint = 'dd/mm/yyyy'
            DataField = 'ERIZEDAT'
            DataSource = DataModuleConcl.DataSrcCreditProps
            EditButtons = <>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = dtkDateEh
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnKeyPress = BranchCBEhKeyPress
          end
        end
        object GroupBox5: TGroupBox
          Left = 2
          Top = 359
          Width = 316
          Height = 78
          Align = alTop
          Caption = 'Krediti t'#601'stiq ed'#601'n komit'#601',protokolunun'
          Color = clCream
          Ctl3D = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 11
          object Panel17: TPanel
            Tag = 1
            Left = 2
            Top = 16
            Width = 312
            Height = 30
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label29: TLabel
              Left = 14
              Top = 8
              Width = 42
              Height = 14
              Caption = 'N'#246'mr'#601'si'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBEditEh5: TDBEditEh
              Tag = 1
              Left = 143
              Top = 3
              Width = 165
              Height = 22
              DataField = 'PROTNUM'
              DataSource = DataModuleConcl.DataSrcCreditProps
              EditButtons = <>
              TabOrder = 0
              Visible = True
              OnKeyPress = BranchCBEhKeyPress
            end
          end
          object Panel20: TPanel
            Tag = 1
            Left = 2
            Top = 46
            Width = 312
            Height = 30
            Align = alTop
            BevelInner = bvLowered
            Color = clSilver
            TabOrder = 1
            object Label48: TLabel
              Left = 14
              Top = 8
              Width = 28
              Height = 14
              Caption = 'Tarixi'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object DBDateTimeEditEh4: TDBDateTimeEditEh
              Tag = 1
              Left = 143
              Top = 3
              Width = 165
              Height = 22
              Hint = 'dd/mm/yyyy'
              DataField = 'PROTDAT'
              DataSource = DataModuleConcl.DataSrcCreditProps
              EditButtons = <>
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Kind = dtkDateEh
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Visible = True
              OnKeyPress = BranchCBEhKeyPress
            end
          end
        end
        object Panel18: TPanel
          Tag = 1
          Left = 2
          Top = 304
          Width = 316
          Height = 55
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 10
          object Label30: TLabel
            Left = 5
            Top = 8
            Width = 203
            Height = 14
            Caption = 'Krediti  t'#246'vsiy'#601' ed'#601'n '#351#601'xsin Ad'#305' soyad'#305
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object DBEdit2: TDBEdit
            Tag = 1
            Left = 5
            Top = 26
            Width = 307
            Height = 22
            DataField = 'TOVSIYEEDEN'
            DataSource = DataModuleConcl.DataSrcCreditProps
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnKeyPress = BranchCBEhKeyPress
          end
        end
      end
    end
    object tbCreditAccounts: TTabSheet
      Caption = '&Hesablar'
      ImageIndex = 2
      object Panel22: TPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 639
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label34: TLabel
          Left = 12
          Top = 8
          Width = 82
          Height = 15
          Caption = #1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 132
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label38: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object DBLookupComboboxEh6: TDBLookupComboboxEh
          Tag = 1
          Left = 380
          Top = 3
          Width = 250
          Height = 23
          TabStop = False
          DataField = 'LOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcLoanAccs
          TabOrder = 0
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
        object CMSearchEditLoacAccs: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 1
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          OnKeyUp = CMSearchEditLoacAccsKeyUp
          DataField = 'LOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcLoanAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
      end
      object Panel24: TPanel
        Tag = 1
        Left = 0
        Top = 28
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label43: TLabel
          Left = 12
          Top = 8
          Width = 74
          Height = 15
          Caption = #1046#1072#1088#1080'  '#1097#1077#1089#1072#1073
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 132
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label46: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit1: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'BOOROWERACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcCustAccs
          ErrorColor = clRed
          BeepOnNotFound = True
        end
        object DBLookupComboboxEh11: TDBLookupComboboxEh
          Tag = 1
          Left = 380
          Top = 3
          Width = 250
          Height = 23
          TabStop = False
          DataField = 'BOOROWERACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcCustAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel25: TPanel
        Tag = 1
        Left = 0
        Top = 82
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 3
        object Label47: TLabel
          Left = 5
          Top = 8
          Width = 152
          Height = 15
          Caption = #1052#1103#1075#1089#1103#1076#1083#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 134
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label50: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit3: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 4
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'PRIMARYPURRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcSReserveAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh12: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'PRIMARYPURRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcSReserveAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel26: TPanel
        Tag = 1
        Left = 0
        Top = 109
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 4
        object Label51: TLabel
          Left = 12
          Top = 8
          Width = 77
          Height = 15
          Caption = #1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label53: TLabel
          Left = 134
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label54: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEditPercent: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 2
          Width = 195
          Height = 23
          TabOrder = 0
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'INTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcInterests
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 2
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'INTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcInterests
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel27: TPanel
        Tag = 1
        Left = 0
        Top = 136
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 5
        object Label55: TLabel
          Left = 4
          Top = 8
          Width = 145
          Height = 15
          Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1089#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label57: TLabel
          Left = 134
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label58: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit5: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'DUELOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcDueLoanAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh14: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'DUELOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcDueLoanAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel28: TPanel
        Tag = 1
        Left = 0
        Top = 163
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 6
        object Label59: TLabel
          Left = 4
          Top = 8
          Width = 150
          Height = 15
          Caption = #1069#1077#1078'. '#1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label62: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit6: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'SECONDARYRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcPReserveAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh15: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'SECONDARYRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcPReserveAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel29: TPanel
        Tag = 1
        Left = 0
        Top = 216
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 8
        object Label63: TLabel
          Left = 12
          Top = 8
          Width = 143
          Height = 15
          Caption = #1069#1077#1078#1080#1082#1084#1080#1096' '#1092#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label65: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label66: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit7: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'DUEINTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcDueInterests
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh16: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'DUEINTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcDueInterests
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel30: TPanel
        Tag = 1
        Left = 0
        Top = 243
        Width = 639
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 9
        object Label44: TLabel
          Left = 12
          Top = 8
          Width = 110
          Height = 15
          Caption = #1041'.'#1050'. '#1069#1080#1088#1086#1074' '#1065#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label68: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label69: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit8: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'OUTCOLLATERALACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcOUTCollatralAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh17: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'OUTCOLLATERALACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcOUTCollatralAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel31: TPanel
        Tag = 1
        Left = 0
        Top = 271
        Width = 639
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 10
        object Label70: TLabel
          Left = 12
          Top = 8
          Width = 129
          Height = 15
          Caption = #1041'.'#1050'. '#1070#1097#1076#1103#1083#1080#1082' '#1065#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label72: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label73: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit9: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'OUTGUARANTEEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcOUTOUTObligationAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh18: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'OUTGUARANTEEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcOUTOUTObligationAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel34: TPanel
        Left = 0
        Top = 355
        Width = 639
        Height = 29
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 13
        object Label67: TLabel
          Left = 11
          Top = 9
          Width = 95
          Height = 15
          Caption = #1050'.'#1061'.'#1070'.'#1052' '#1045#1097#1090#1080#1081#1072#1090
        end
        object Label74: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label75: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit2: TCMSearchEdit
          Tag = 3
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = CMSearchEdit2KeyPress
          DataField = 'CRDLINEOBLACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.CrdLineoblAccsDataSrc
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh20: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'CRDLINEOBLACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.CrdLineoblAccsDataSrc
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel40: TPanel
        Left = 0
        Top = 299
        Width = 639
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 11
        object Label87: TLabel
          Left = 12
          Top = 9
          Width = 106
          Height = 15
          Caption = #1041'.'#1050'. '#1057#1089#1091#1076#1072' '#1097#1077#1089#1072#1073#1099
        end
        object Label88: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label89: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit10: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'OUTLOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.OutLoanAccsDatSrc
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh22: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'OUTLOANACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.OutLoanAccsDatSrc
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel35: TPanel
        Left = 0
        Top = 327
        Width = 639
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 12
        object Label76: TLabel
          Left = 12
          Top = 9
          Width = 101
          Height = 15
          Caption = #1041'.'#1050'. '#1060#1072#1080#1079' '#1097#1077#1089#1072#1073#1099
        end
        object Label77: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label78: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit4: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'OUTINTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcOUTInterestAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh21: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'OUTINTERESTACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcOUTInterestAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel41: TPanel
        Tag = 1
        Left = 0
        Top = 190
        Width = 639
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 7
        object Label90: TLabel
          Left = 4
          Top = 8
          Width = 145
          Height = 15
          Caption = #1069#1077#1078'.'#1052#1103#1075'.'#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label92: TLabel
          Left = 135
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label93: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit11: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'SECONDARYPURRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcSReserveAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh23: TDBLookupComboboxEh
          Tag = 1
          Left = 381
          Top = 3
          Width = 249
          Height = 23
          TabStop = False
          DataField = 'SECONDARYPURRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcSReserveAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
      object Panel42: TPanel
        Tag = 1
        Left = 0
        Top = 55
        Width = 639
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label94: TLabel
          Left = 12
          Top = 8
          Width = 119
          Height = 15
          Caption = #1040#1076#1080' '#1077#1097#1090#1080#1081#1072#1090' '#1097#1077#1089#1072#1073#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label95: TLabel
          Left = 4
          Top = 9
          Width = 6
          Height = 18
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -15
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label96: TLabel
          Left = 134
          Top = 8
          Width = 13
          Height = 15
          Caption = #8470
        end
        object Label97: TLabel
          Left = 354
          Top = 8
          Width = 29
          Height = 15
          Caption = #1040#1076#1099' :'
        end
        object CMSearchEdit12: TCMSearchEdit
          Tag = 1
          Left = 153
          Top = 3
          Width = 195
          Height = 23
          TabOrder = 0
          OnExit = CMSearchEditLoacAccsExit
          OnKeyPress = BranchCBEhKeyPress
          DataField = 'PRIMARYRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          KeyField = 'ID'
          ListField = 'ACCNO'
          ListSource = DataModuleConcl.DataSrcPReserveAccs
          ErrorColor = clRed
          BeepOnNotFound = False
        end
        object DBLookupComboboxEh24: TDBLookupComboboxEh
          Tag = 1
          Left = 380
          Top = 3
          Width = 250
          Height = 23
          TabStop = False
          DataField = 'PRIMARYRESERVEACCID'
          DataSource = DataModuleConcl.DataSrcCreditProps
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'CLIENTNAME'
          ListSource = DataModuleConcl.DataSrcPReserveAccs
          TabOrder = 1
          Visible = True
          OnKeyPress = BranchCBEhKeyPress
          OnKeyValueChanged = DBLookupComboboxEh19KeyValueChanged
        end
      end
    end
    object tbAdvancedInf: TTabSheet
      Caption = '&'#399'lav'#601' informasya'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel45: TPanel
        Left = 0
        Top = 0
        Width = 639
        Height = 440
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 2
          Top = 2
          Width = 635
          Height = 218
          Align = alTop
          Caption = #1052#1094#1096#1090#1103#1088#1080' '#1097#1072#1075#1075#1099#1085#1076#1072
          TabOrder = 0
          object Panel46: TPanel
            Left = 2
            Top = 17
            Width = 631
            Height = 43
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 250
              Top = 2
              Width = 172
              Height = 39
              Align = alLeft
              BiDiMode = bdLeftToRight
              Caption = #1052#1094#1096#1090#1103#1088#1080#1085#1080#1085' '#1048#1044' - '#1089#1080
              Color = clCream
              Ctl3D = True
              ParentBackground = False
              ParentBiDiMode = False
              ParentColor = False
              ParentCtl3D = False
              TabOrder = 1
              object DBEditEh3: TDBEditEh
                Tag = 1
                Left = 5
                Top = 13
                Width = 162
                Height = 23
                DataField = 'BOORID'
                DataSource = DataModuleConcl.DataSrcCreditProps
                EditButtons = <>
                TabOrder = 0
                Visible = True
                OnKeyDown = DBEditEh3KeyDown
                OnKeyPress = DBEditEh3KeyPress
              end
            end
            object GroupBox4: TGroupBox
              Left = 2
              Top = 2
              Width = 248
              Height = 39
              Align = alLeft
              Caption = #1070#1083#1082#1103'  :                              '#1055#1080#1085#1050#1086#1076' : '
              TabOrder = 0
              object DBLookupComboboxEh27: TDBLookupComboboxEh
                Tag = 1
                Left = 3
                Top = 13
                Width = 133
                Height = 23
                DataField = 'COUNTRYCODE'
                DataSource = DataModuleConcl.DataSrcCreditProps
                DropDownBox.Sizable = True
                EditButtons = <>
                KeyField = 'CODE'
                ListField = 'NAME'
                ListSource = DataModuleConcl.DataSrcContrys
                TabOrder = 0
                Visible = True
                OnKeyPress = BranchCBEhKeyPress
              end
              object DBEditEh7: TDBEditEh
                Tag = 1
                Left = 139
                Top = 12
                Width = 103
                Height = 23
                DataField = 'PINCODE'
                DataSource = DataModuleConcl.DataSrcCreditProps
                EditButtons = <>
                TabOrder = 1
                Visible = True
                OnChange = DBEditEh7Change
                OnKeyDown = DBEditEh7KeyDown
                OnKeyPress = DBEditEh7KeyPress
              end
            end
            object Bancruptey_rg: TRadioGroup
              Left = 422
              Top = 2
              Width = 207
              Height = 39
              Align = alClient
              Caption = #1052#1094#1092#1083#1080#1089#1086#1083#1084#1072' '#1089#1090#1072#1090#1091#1089#1091' :'
              Columns = 2
              Items.Strings = (
                #1052#1094#1092#1083#1080#1089' '#1076#1077#1081#1080#1083
                #1052#1094#1092#1083#1080#1089#1076#1080#1088)
              TabOrder = 2
              OnClick = Bancruptey_rgClick
            end
          end
          object Panel47: TPanel
            Left = 2
            Top = 60
            Width = 631
            Height = 49
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 1
            TabStop = True
            object GroupBox8: TGroupBox
              Left = 423
              Top = 2
              Width = 206
              Height = 45
              Align = alClient
              Caption = #1058#1077#1083#1077#1092#1086#1085' :'
              TabOrder = 2
              object DBEditEh4: TDBEditEh
                Tag = 1
                Left = 3
                Top = 15
                Width = 195
                Height = 23
                DataField = 'PHONENUMBER'
                DataSource = DataModuleConcl.DataSrcCreditProps
                EditButtons = <>
                TabOrder = 0
                Visible = True
                OnKeyPress = BranchCBEhKeyPress
              end
            end
            object GroupBox9: TGroupBox
              Left = 2
              Top = 2
              Width = 248
              Height = 45
              Align = alLeft
              Caption = #1040#1076#1088#1077#1089#1089'  :'
              TabOrder = 0
              object DBEditEh6: TDBEditEh
                Tag = 1
                Left = 3
                Top = 15
                Width = 238
                Height = 23
                DataField = 'ADDRESS'
                DataSource = DataModuleConcl.DataSrcCreditProps
                EditButtons = <>
                TabOrder = 0
                Visible = True
                OnKeyPress = BranchCBEhKeyPress
              end
            end
            object GroupBox10: TGroupBox
              Left = 250
              Top = 2
              Width = 173
              Height = 45
              Align = alLeft
              Caption = #1048#1096' '#1081#1077#1088#1080' / '#1042#1103#1079#1080#1092#1103#1089#1080' / '#1071#1084#1103#1082' '#1097#1072#1075#1075#1099
              TabOrder = 1
              object DBEditEh2: TDBEditEh
                Tag = 1
                Left = 4
                Top = 15
                Width = 165
                Height = 23
                DataField = 'SALARY'
                DataSource = DataModuleConcl.DataSrcCreditProps
                EditButtons = <>
                TabOrder = 0
                Visible = True
                OnKeyPress = BranchCBEhKeyPress
              end
            end
          end
          object GroupBox2: TGroupBox
            Left = 2
            Top = 109
            Width = 631
            Height = 107
            Align = alClient
            Caption = #1058#1103#1089#1080#1089#1095#1080#1083#1103#1088' '
            TabOrder = 2
            object Panel48: TPanel
              Left = 2
              Top = 17
              Width = 627
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 0
              object Label106: TLabel
                Left = 9
                Top = 9
                Width = 10
                Height = 15
                Caption = '1.'
              end
              object Label107: TLabel
                Left = 34
                Top = 9
                Width = 46
                Height = 15
                Caption = #1048#1044' - '#1089#1080' :'
              end
              object Label108: TLabel
                Left = 250
                Top = 8
                Width = 29
                Height = 15
                Caption = #1040#1076#1099' :'
              end
              object DBEdit4: TDBEdit
                Tag = 1
                Left = 73
                Top = 3
                Width = 162
                Height = 23
                DataField = 'FIRSTOWNERID'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 0
                OnKeyPress = BranchCBEhKeyPress
              end
              object DBEdit5: TDBEdit
                Tag = 1
                Left = 281
                Top = 3
                Width = 341
                Height = 23
                DataField = 'FIRSTOWNERNAME'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 1
                OnKeyPress = BranchCBEhKeyPress
              end
            end
            object Panel49: TPanel
              Left = 2
              Top = 47
              Width = 627
              Height = 30
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 1
              object Label109: TLabel
                Left = 9
                Top = 9
                Width = 10
                Height = 15
                Caption = '2.'
              end
              object Label110: TLabel
                Left = 34
                Top = 9
                Width = 46
                Height = 15
                Caption = #1048#1044' - '#1089#1080' :'
              end
              object Label111: TLabel
                Left = 249
                Top = 10
                Width = 29
                Height = 15
                Caption = #1040#1076#1099' :'
              end
              object DBEdit6: TDBEdit
                Tag = 1
                Left = 73
                Top = 4
                Width = 162
                Height = 23
                DataField = 'SECONDOWNERID'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 0
                OnKeyPress = BranchCBEhKeyPress
              end
              object DBEdit7: TDBEdit
                Tag = 1
                Left = 281
                Top = 4
                Width = 341
                Height = 23
                DataField = 'SECONDOWNERNAME'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 1
                OnKeyPress = BranchCBEhKeyPress
              end
            end
            object Panel50: TPanel
              Left = 2
              Top = 77
              Width = 627
              Height = 32
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 2
              object Label112: TLabel
                Left = 9
                Top = 9
                Width = 10
                Height = 15
                Caption = '3.'
              end
              object Label113: TLabel
                Left = 34
                Top = 9
                Width = 46
                Height = 15
                Caption = #1048#1044' - '#1089#1080' :'
              end
              object Label114: TLabel
                Left = 249
                Top = 10
                Width = 29
                Height = 15
                Caption = #1040#1076#1099' :'
              end
              object DBEdit8: TDBEdit
                Tag = 1
                Left = 73
                Top = 4
                Width = 162
                Height = 23
                DataField = 'THIRDOWNERID'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 0
                OnKeyPress = BranchCBEhKeyPress
              end
              object DBEdit9: TDBEdit
                Tag = 4
                Left = 281
                Top = 4
                Width = 341
                Height = 23
                DataField = 'THIRDOWNERNAME'
                DataSource = DataModuleConcl.DataSrcCreditProps
                TabOrder = 1
                OnKeyPress = BranchCBEhKeyPress
              end
            end
          end
        end
        object GroupBox6: TGroupBox
          Left = 2
          Top = 220
          Width = 635
          Height = 181
          Align = alTop
          Caption = #399'lav'#601' m'#601'lumat'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object DBMemo1: TDBMemo
            Left = 2
            Top = 16
            Width = 631
            Height = 163
            Align = alClient
            DataField = 'INFO'
            DataSource = DataModuleConcl.DataSrcCreditProps
            TabOrder = 0
          end
        end
      end
    end
  end
end
