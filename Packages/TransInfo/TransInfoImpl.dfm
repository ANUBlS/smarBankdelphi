object TransInfo: TTransInfo
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 503
  ClientWidth = 847
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 457
    Top = 0
    Width = 387
    Height = 502
    Caption = #399#351'ya haqq'#305'nda m'#601'lumat'
    TabOrder = 0
    object Label8: TLabel
      Left = 5
      Top = 46
      Width = 49
      Height = 13
      Caption = #304'stehsal'#231#305':'
    end
    object Label7: TLabel
      Left = 5
      Top = 20
      Width = 73
      Height = 13
      Caption = #399#351'yan'#305'n n'#246'v'#252' :'
    end
    object Label9: TLabel
      Left = 5
      Top = 69
      Width = 68
      Height = 26
      AutoSize = False
      Caption = 'M'#601'tn: (Description)'
      WordWrap = True
    end
    object Label10: TLabel
      Left = 5
      Top = 137
      Width = 125
      Height = 13
      Caption = #399'vv'#601'lki m'#252'lkiyy'#601't'#231'in'#305'n ad'#305':'
    end
    object Label11: TLabel
      Left = 5
      Top = 158
      Width = 121
      Height = 13
      Caption = 'Haz'#305'rk'#305' m'#252'lkiyy'#601't'#231'in'#305'n ad'#305':'
    end
    object Label12: TLabel
      Left = 5
      Top = 183
      Width = 106
      Height = 13
      Caption = 'Ehtimal olunan d'#601'y'#601'ri:'
    end
    object Label13: TLabel
      Left = 5
      Top = 208
      Width = 82
      Height = 13
      Caption = #399#351'yan'#305'n statusu:'
    end
    object Label14: TLabel
      Left = 5
      Top = 237
      Width = 76
      Height = 42
      AutoSize = False
      Caption = #399#351'yan'#305'n statusuna dair '#351#601'rh:'
      WordWrap = True
    end
    object Label15: TLabel
      Left = 5
      Top = 304
      Width = 56
      Height = 13
      Caption = 'Real d'#601'y'#601'r:'
    end
    object Label16: TLabel
      Left = 5
      Top = 328
      Width = 76
      Height = 13
      Caption = #399#351'yan'#305'n '#246'l'#231#252's'#252':'
    end
    object Label17: TLabel
      Left = 5
      Top = 352
      Width = 56
      Height = 13
      Caption = #214'l'#231#252' vahidi:'
    end
    object Label18: TLabel
      Left = 5
      Top = 377
      Width = 110
      Height = 13
      Caption = 'R'#601'smi qeydiyyat tarixi:'
    end
    object Label19: TLabel
      Left = 5
      Top = 402
      Width = 123
      Height = 13
      Caption = 'R'#601'smi qeydiyyat n'#246'mr'#601'si:'
    end
    object Label20: TLabel
      Left = 5
      Top = 423
      Width = 106
      Height = 25
      AutoSize = False
      Caption = #399#351'yan'#305' eynil'#601#351'dirm'#601' imkan'#305' ver'#601'n n'#246'mr'#601':'
      WordWrap = True
    end
    object Label21: TLabel
      Left = 3
      Top = 455
      Width = 71
      Height = 13
      Caption = #399'lav'#601' qeydl'#601'r:'
    end
    object Label37: TLabel
      Left = 74
      Top = 19
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 89
      Top = 208
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLCB_mmx_transaction_item_type: TDBLookupComboBox
      Left = 82
      Top = 19
      Width = 300
      Height = 21
      KeyField = 'SYMBOL'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_transaction_item_type
      TabOrder = 0
    end
    object Memo_ItemDesc: TMemo
      Left = 82
      Top = 66
      Width = 300
      Height = 65
      Lines.Strings = (
        'M'#601's.: Ya'#351'ay'#305#351' evi')
      TabOrder = 1
    end
    object Edit_ItemMake: TEdit
      Left = 82
      Top = 43
      Width = 300
      Height = 21
      TabOrder = 2
      Text = 'm'#601's. Audi'
    end
    object Edit_previously_registered_to: TEdit
      Left = 136
      Top = 133
      Width = 246
      Height = 21
      TabOrder = 3
      Text = 'm'#601's. Con Smit'
    end
    object Edit_presently_registered_to: TEdit
      Left = 136
      Top = 158
      Width = 246
      Height = 21
      TabOrder = 4
      Text = 'm'#601's. Con Smit'
    end
    object DBLCB_MMX_TRANS_ITEM_STATUS: TDBLookupComboBox
      Left = 136
      Top = 208
      Width = 246
      Height = 21
      KeyField = 'SYMBOL'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_MMX_TRANS_ITEM_STATUS
      TabOrder = 5
    end
    object Memo_status_comments: TMemo
      Left = 82
      Top = 235
      Width = 300
      Height = 65
      TabOrder = 6
    end
    object Edit_item_size: TEdit
      Left = 136
      Top = 328
      Width = 246
      Height = 21
      Alignment = taRightJustify
      TabOrder = 7
      Text = '0'
    end
    object Edit_item_size_uom: TEdit
      Left = 136
      Top = 352
      Width = 246
      Height = 21
      TabOrder = 8
      Text = 'Km kvadrat'
    end
    object Edit_registration_number: TEdit
      Left = 136
      Top = 402
      Width = 246
      Height = 21
      TabOrder = 9
      Text = 'Avtomobilin qeydiyyat n'#246'mr'#601'si'
    end
    object Edit_Identification_number: TEdit
      Left = 136
      Top = 427
      Width = 246
      Height = 21
      TabOrder = 10
      Text = 'Avtomobilin d'#246'vl'#601't ni'#351'an n'#246'mr'#601'si'
    end
    object Memo_ItemComments: TMemo
      Left = 82
      Top = 455
      Width = 300
      Height = 40
      TabOrder = 11
    end
    object DTP_item_registration_date: TDateTimePicker
      Left = 136
      Top = 377
      Width = 246
      Height = 21
      Date = 40893.663440925930000000
      Time = 40893.663440925930000000
      TabOrder = 12
    end
    object Edit_estimated_value: TCurrencyEdit
      Left = 136
      Top = 183
      Width = 246
      Height = 21
      Alignment = taRightJustify
      TabOrder = 13
      Text = '0'
      OnKeyPress = Edit_estimated_valueKeyPress
    end
    object Edit_disposed_value: TCurrencyEdit
      Left = 136
      Top = 304
      Width = 246
      Height = 21
      Alignment = taRightJustify
      TabOrder = 14
      Text = '0'
      OnKeyPress = Edit_disposed_valueKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 0
    Width = 449
    Height = 345
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 10
      Width = 122
      Height = 26
      AutoSize = False
      Caption = 'M'#601'lumat'#305'n n'#246'v'#252':       (Report Code: CTR/STR) '
      WordWrap = True
    end
    object Label2: TLabel
      Left = 15
      Top = 43
      Width = 115
      Height = 29
      AutoSize = False
      Caption = 'M'#601'lumat'#305'n g'#246'nd'#601'rilm'#601'si '#252#231#252'n s'#601'b'#601'b (Reason) :'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 15
      Top = 111
      Width = 91
      Height = 27
      AutoSize = False
      Caption = #399'm'#601'liyyat'#305'n n'#246'v'#252': (Transmode code)'
      WordWrap = True
    end
    object Label4: TLabel
      Left = 16
      Top = 143
      Width = 103
      Height = 13
      Caption = 'Transmode comment:'
    end
    object Label5: TLabel
      Left = 14
      Top = 186
      Width = 106
      Height = 26
      AutoSize = False
      Caption = #399'm'#601'liyyat'#305'n predmeti olan v'#601'saitl'#601'rin n'#246'v'#252':'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 14
      Top = 219
      Width = 104
      Height = 13
      Caption = 'From funds comment:'
    end
    object Label28: TLabel
      Left = 15
      Top = 261
      Width = 106
      Height = 26
      AutoSize = False
      Caption = #399'm'#601'liyyat'#305'n predmeti olan v'#601'saitl'#601'rin n'#246'v'#252':'
      WordWrap = True
    end
    object Label29: TLabel
      Left = 16
      Top = 296
      Width = 92
      Height = 13
      Caption = 'To funds comment:'
    end
    object Label30: TLabel
      Left = 118
      Top = 186
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 134
      Top = 10
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 105
      Top = 111
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 120
      Top = 261
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 128
      Top = 43
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label40: TLabel
      Left = 121
      Top = 143
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label41: TLabel
      Left = 120
      Top = 219
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label42: TLabel
      Left = 110
      Top = 296
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Edit1: TEdit
      Left = 143
      Top = 8
      Width = 38
      Height = 21
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object DBLCB_mmx_fromfunds: TDBLookupComboBox
      Left = 143
      Top = 191
      Width = 300
      Height = 21
      KeyField = 'SYMBOL'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_fromfunds
      TabOrder = 0
    end
    object DBLCB_mmx_reportcode: TDBLookupComboBox
      Left = 143
      Top = 8
      Width = 300
      Height = 21
      KeyField = 'NAME'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_reportcode
      TabOrder = 1
    end
    object DBLCB_mmx_transmode: TDBLookupComboBox
      Left = 143
      Top = 111
      Width = 300
      Height = 21
      KeyField = 'NAME'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_transmode
      TabOrder = 2
    end
    object Reason_Memo: TMemo
      Left = 143
      Top = 40
      Width = 300
      Height = 65
      TabOrder = 3
    end
    object Memo_transmode_comment: TMemo
      Left = 143
      Top = 140
      Width = 300
      Height = 47
      Enabled = False
      TabOrder = 4
    end
    object Memo_fromfundsComment: TMemo
      Left = 143
      Top = 217
      Width = 300
      Height = 43
      Enabled = False
      TabOrder = 5
    end
    object DBLCB_mmx_tofunds: TDBLookupComboBox
      Left = 143
      Top = 266
      Width = 300
      Height = 21
      KeyField = 'SYMBOL'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_tofunds
      TabOrder = 6
    end
    object Memo_tofundsComment: TMemo
      Left = 143
      Top = 293
      Width = 300
      Height = 43
      Enabled = False
      TabOrder = 7
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 344
    Width = 448
    Height = 120
    Caption = #399#351'yan'#305'n yerl'#601#351'diyi '#252'nvan'
    TabOrder = 2
    object Label22: TLabel
      Left = 13
      Top = 20
      Width = 54
      Height = 13
      Caption = 'Adress tipi:'
    end
    object Label23: TLabel
      Left = 13
      Top = 44
      Width = 35
      Height = 13
      Caption = #220'nvan:'
    end
    object Label24: TLabel
      Left = 239
      Top = 69
      Width = 32
      Height = 13
      Caption = #350#601'h'#601'r:'
    end
    object Label25: TLabel
      Left = 239
      Top = 94
      Width = 60
      Height = 13
      Caption = 'Po'#231't indeksi:'
    end
    object Label26: TLabel
      Left = 13
      Top = 69
      Width = 25
      Height = 13
      Caption = #214'lk'#601':'
    end
    object Label27: TLabel
      Left = 13
      Top = 94
      Width = 35
      Height = 13
      Caption = 'Rayon:'
    end
    object Label34: TLabel
      Left = 68
      Top = 16
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 38
      Top = 66
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 281
      Top = 66
      Width = 7
      Height = 13
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLCB_mmx_contact_type: TDBLookupComboBox
      Left = 139
      Top = 16
      Width = 300
      Height = 21
      KeyField = 'SYMBOL'
      ListField = 'DESCRIPTION'
      ListSource = DM.DS_mmx_contact_type
      TabOrder = 0
    end
    object Edit_ItemAdress: TEdit
      Left = 139
      Top = 40
      Width = 300
      Height = 21
      TabOrder = 1
    end
    object DBLCB_ItemCity: TDBLookupComboBox
      Left = 290
      Top = 67
      Width = 149
      Height = 21
      KeyField = 'ID'
      ListField = 'CITY_NAME'
      ListSource = DM.DS_Cityes
      TabOrder = 2
    end
    object Edit_ItemState: TEdit
      Left = 76
      Top = 91
      Width = 155
      Height = 21
      TabOrder = 3
    end
    object Edit_ItemZip: TEdit
      Left = 312
      Top = 91
      Width = 127
      Height = 21
      MaxLength = 10
      TabOrder = 4
    end
    object DBLCB_ItemCountry: TDBLookupComboBox
      Left = 76
      Top = 64
      Width = 155
      Height = 21
      KeyField = 'SYMB'
      ListField = 'CNTR_NAME'
      ListSource = DM.DS_Countries
      TabOrder = 5
    end
  end
  object BtnOk: TBitBtn
    Left = 80
    Top = 467
    Width = 128
    Height = 34
    Caption = 'Q'#601'bul'
    DoubleBuffered = True
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      20000000000000090000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000100000069000000900000
      0027000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000007711531CFF1F8C2DFF0413
      05E7000000150000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000001C06210DF32AC14BFF2EC247FF1E89
      2CFF000000AF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000A51B9541FF32CB5BFF30C651FF2DC1
      46FF114F19FE0000005F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000003D094320FE31D16AFF35CF65FF32CB5BFF30C6
      51FF29B942FF061C09F00000001F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000002000704CF23BA65FF3DD77AFF39D370FF35CF65FF32CB
      5BFF30C651FF209635FF000200BD000000020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000680D6B3CFF40DE8AFF41DB84FF3DD77AFF39D370FF35CF
      65FF32CB5BFF2FC650FF135D20FF000000700000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000012021A10EB31D98BFF4CE298FF47DF8EFF41DB84FF3DD77AFF39D3
      70FF35CF65FF32CB5BFF2BC04CFF07250DF60000002900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000094149863FF56E9A9FF52E6A1FF4CE298FF47DF8EFF41DB84FF3DD7
      7AFF39D370FF35CF65FF32CB5BFF22A23FFF010502CB00000005000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      002E033B27FB49ECAFFF60ECB4FF59E9ABFF4CE59EFF2AE08BFF26DC81FF3FDA
      83FF3DD77AFF39D370FF35CF65FF31CA5AFF146B29FF00000080000000000000
      0000000000000000000000000000000000000000000000000000000000000003
      02BF24C591FF6FF2C5FF64EFBBFF39E9A3FF15E38EFF1FB046FF1E9432FF20DB
      7DFF3DDA82FF3DD77AFF39D370FF35CF65FF2DC756FF083012FA000000350000
      0000000000000000000000000000000000000000000000000000000000560467
      4CFF6AF6CDFF4FF2BEFF14F0ADFF0BDF97FF0D6633FF010702D1010300C6127D
      3AFF1BDD80FF3AD980FF3DD77AFF39D370FF35CF65FF24AE49FF010A04D70000
      0009000000000000000000000000000000000000000000000000000F0CDB1DE7
      B4FF1EF6BEFF02F6BFFF029471FF01160FE50000006300000002000000070000
      00A40A673BFF15DF89FF36D97DFF3DD77AFF39D370FF34CE64FF167A32FF0000
      0091000000000000000000000000000000000000000000000000001812E811DB
      87FF09A66FFF002A21F3000000800000000B0000000000000000000000000000
      000100000081044D33FE0EDF93FF30D87BFF3DD77AFF39D370FF2FCD61FF0A3C
      18FD00000043000000000000000000000000000000000000000000000063030F
      05E70000009A0000001A00000000000000000000000000000000000000000000
      0000000000000000005D013527F808D999FF2AD97BFF3DD77AFF39D370FF26B9
      55FF021006E10000001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000003F002019EC04CC98FF23DA7DFF3BD679FF37D2
      6FFF19893DFF000000A100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000026000F0CDA04B383FF1DDC80FF39D6
      78FF32D16BFF0C4A20FE00000052000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000014000403C2069164FF19DD
      82FF37D576FF29C360FF03170AEA000000170000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000007000000A5086A
      42FF17DB7FFF32D573FF1B9848FF000100B10000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010000
      0082094724FE17D174FF28D36EFF0D5829FF0000006200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000005E082A0EF81ABE5CFF1BCB66FF041F0FF100000021000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000003F061704ED1FA33EFF15A756FF000201B9000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000027030A00DB1B7926FF02140BED000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000013000000880000003D}
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BtnOkClick
  end
  object BtnCancel: TBitBtn
    Left = 232
    Top = 467
    Width = 128
    Height = 34
    Caption = #304'mtina'
    DoubleBuffered = True
    Glyph.Data = {
      36090000424D3609000000000000360000002800000018000000180000000100
      20000000000000090000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000050000
      000D000000140000001900000019000000150000000E00000007000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001000000080000001A000007380000
      377300005B9E00006DB400006FB6000064A700004783000016480000001F0000
      000B000000020000000000000000000000000000000000000000000000000000
      00000000000000000000000000030000001300001243000074AC0000BDF30000
      C0FE0000B8FE0000B4FE0000B3FE0000B6FE0000BCFE0000C4FD000097CB0000
      3363000000190000000500000000000000000000000000000000000000000000
      000000000000000000030000001A0000457B0000BDF20000C0FF0000B4FE0000
      AAFF0000A4FF0001A1FF0001A1FE0000A3FF0000A7FE0000AFFF0000BBFF0000
      C7FE00007DB00000082800000006000000000000000000000000000000000000
      0000000000020000001800005B930000C2FE0000B6FF0000AAFF0003A4FE000D
      A5FF001BA9FF0026ADFF002DB0FE002DB1FF0022ADFE000EA7FF0001A7FF0000
      B1FE0000BEFF000099D000000B2A000000040000000000000000000000000000
      00000000000E0000467B0000BCFE0000B3FE0000A9FE000BA7FE001FADFE002F
      B4FE003BBAFE0045BEFE004CC2FE0050C4FE0051C4FE004CC2FE002FB6FE0008
      A9FE0000AEFE0000B9FE00008BC4000002170000000100000000000000000000
      00040000163E0000B0F50000B3FF0000ACFE0010ACFF0326AEFF375DC2FE0041
      BBFF0052C8FF005CCDFF0063D0FE0067D2FF0063CEFE1769CAFF236AC9FF003E
      BDFE000AAEFF0000B0FF0000B7FE000054840000000800000000000000000000
      000F000071B10000B2FF0000AFFF000DAFFE0324A9FFA3B2DEFFF9FAFDFE5281
      CAFF005CC5FF0071D8FF0079DDFE0075D6FF1770C6FED4E3F4FFE2EBF7FF2463
      C0FE0035BBFF0004AFFF0000B1FE0000A8F100000D2300000001000000010000
      0F2E0000A9F90000B0FE0005B3FE0021B3FE5B72BDFEFEFEFEFEFEFEFEFEF9FB
      FDFE5289C7FE0070CBFE0081D9FE1772BFFED4E3F2FEFEFEFEFEFEFEFEFEBACA
      E5FE0040B4FE001CBBFE0000B1FE0000AEFE00004D7C00000104000000040000
      41720000ABFE0000B3FF0014BDFF0034C5FE0035AAFF8FA1CDFFFEFEFEFEFFFF
      FFFFF9FBFCFF5288BEFF1765ACFED4E2EFFFFEFEFEFEFFFFFFFFD6DEECFF184F
      ABFE004AC6FF0034C8FF0002B5FE0000AEFF000082C600000208000000070000
      65A30000ACFE0001B7FF0025C7FF0041D0FE0051D0FF0142A8FF8FA0C6FEFFFF
      FFFFFFFFFFFFF9FBFCFFDDE5EFFEFFFFFFFFFEFEFEFED6DCE9FF194CA1FF0054
      C9FE004CD3FF0037CDFF0009BCFE0000B0FF0000A2F30000080F000000080000
      78BE0000AAFE0003B9FF0030CBFF0048D3FE005BD9FF0068D8FF0047A2FE8F9B
      BEFFFFFFFFFFFFFFFFFFFEFEFEFEFFFFFFFFD6D9E6FE184393FF0059C8FF0056
      D7FE0043D2FF002FCBFF000BBFFE0000B0FF0000A5FE00001B20000000070000
      7BC40000A7FE0004B9FE0034CDFE004BD4FE005DDAFE006EDFFE0063C5FE1831
      7AFEEEEEF3FEFEFEFEFEFEFEFEFEFEFEFEFE676F9EFE003C9EFE0058D5FE0049
      D4FE0036CEFE0022C8FE0008BDFE0000AEFE0000A0FE00002526000001050000
      6DB40000A3FE0002B6FF0031CCFF0049D4FE005AD8FF035DCBFF1A489AFED4D9
      E6FFFFFFFFFFFFFFFFFFFEFEFEFEFFFFFFFFF9FAFBFE5366A4FF0338AEFF0139
      CCFE0026C9FF0014C3FF0003BBFE0000AAFF00009CFD00001F15000004020000
      538D00009DFE0000B2FE0026C7FE0F4FD4FE1A5CCCFE2751A6FED6DBEAFEFEFE
      FEFEFEFEFEFED9DEECFE9EABCEFEFEFEFEFEFEFEFEFEF9FAFCFE5B69AEFE1833
      B2FE1629C8FE0309C0FE0000B8FE0000A5FE00008BE400001905000000000000
      324C000095FE0000ABFF1F2EC7FF355FD1FE395AB4FFD8DEEDFFFEFEFEFEFFFF
      FFFFDCE1F0FF395FB1FF2751AFFE9DABD4FFFEFEFEFEFFFFFFFFFAFAFCFF666C
      B8FE2F32B9FF3333CAFF0101B3FE00009CFF000066A600001C01000000000000
      130B000081E40000A1FF1E20BEFF4961CFFE7285CAFFFAFBFDFFFEFEFEFEE0E5
      F3FF4F6EC0FF4973D4FF4D75D9FE405CBFFFA8B0DCFEFFFFFFFFFFFFFFFFB6B6
      DFFE4141BAFF3C3CCAFF0000AAFE000092FF00004F4C00000000000000000000
      0E0100004A74000093FE0404ACFE5B61D3FE5E71D2FE8E9BDAFEE2E5F6FE687E
      D0FE627CD9FE667FDFFE667CDEFE6474DAFE5A63C9FEB6B7E4FEC5C5EAFE5B5B
      C6FE6464D4FE2020BBFE00009CFE00007ACE00003D0400000000000000000000
      000000002708000075CE00009AFF2828BAFE7D80DDFF7A84DCFF7A86DCFE7B87
      DFFF7D89E1FF7D86E1FF7D83E0FE7D80DFFF7C7DDDFE7878D8FF7979D7FF7C7C
      DCFE5656CDFF0000A2FF00008DFA000064390000000000000000000000000000
      00000000000000004426000082E800009BFE4343C2FF9494E2FF9496E4FE9496
      E4FF9496E4FF9495E4FF9494E4FE9494E4FF9494E4FE9494E4FF9494E2FF7272
      D4FE0808A5FF000090FE0000776E000000000000000000000000000000000000
      000000000000000000000000582F000084E1000097FE3434B7FE9999E0FEACAC
      E8FEACACE9FEACACE9FEACACE9FEACACE9FEACACE8FEA9A9E6FE5F5FC9FE0606
      9FFE00008EFC0000827100006201000000000000000000000000000000000000
      000000000000000000000000000000006A16000082A700008FFD06069CFE4444
      BAFF7B7BD2FF9999DDFF9E9EDFFE8989D7FF5C5CC4FE1717A6FF000093FF0000
      8AD8000086400000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000833300008B9B0000
      92E6000099FE00009CFF00009CFE00009AFF000096F600008FBB0000875C0000
      7C06000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      790200008F1E0000993900009C3E0000992B00008A0800000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BtnCancelClick
  end
end
