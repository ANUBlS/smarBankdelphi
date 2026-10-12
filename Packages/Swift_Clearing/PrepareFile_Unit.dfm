object PrepareFile_Form: TPrepareFile_Form
  Left = 319
  Top = 147
  Width = 551
  Height = 457
  Caption = 'Faylin yaradilmasi'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 393
    Width = 543
    Height = 13
    Align = alTop
    Min = 0
    Max = 100
    TabOrder = 0
    Visible = False
  end
  object But_cancel: TBitBtn
    Left = 415
    Top = 409
    Width = 63
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Ôàéëû Éàðàò'
    TabOrder = 1
    OnClick = But_cancelClick
  end
  object BitBtn1: TBitBtn
    Left = 478
    Top = 409
    Width = 63
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = '×ûõûø'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 543
    Height = 306
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object GridMT102: TDBGrid
      Left = 0
      Top = 167
      Width = 543
      Height = 139
      TabStop = False
      Align = alClient
      Color = clBtnFace
      DataSource = ToSend_DataSource
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'ID'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '¹'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSDATE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Caption = 'Òàðèõ'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACC_NO'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'ÄÅÁÅÒ'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 103
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'VAL_NAME'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 28
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'AMOUNT'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Äåáåò Ìÿáëÿü'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'CurrencyRate'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Caption = 'Êóðñ'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Visible = False
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TRANS_REF'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'ÃÅÉÄÈÉÉÀÒ ¹'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 101
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 139
      Width = 543
      Height = 28
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esLowered
      TabOrder = 1
      object But_tosend: TSpeedButton
        Left = 0
        Top = 2
        Width = 29
        Height = 22
        Glyph.Data = {
          C2010000424DC20100000000000036000000280000000B0000000B0000000100
          1800000000008C010000C40E0000C40E00000000000000000000ACC2AC5BA25B
          569C565BA05B59A05950A0504EA44E48A24842A0423A973A7DA97D00000089C2
          891789172D942D26922623932336A636079D0707A50700A50000930040954000
          000095CA95369C3641A1411E911E6AB86AF4FAF45BC55B08AF0812B51203A503
          43A14300000098CC9843A2433C9E3C6EB76EFBFDFBFFFFFFF8FDF85EC95E0FB0
          0F0EA50E48A1480000009ACD9A44A2448FC78FFFFFFFC2E1C2E3F2E3CEEBCEFF
          FFFF6CCB6C11A0114CA24C0000009CCD9C54A954D1E8D1ADD5AD4BA44BE0F0E0
          4DAF4DB5DDB5CFE9CF279E274F9E4F0000009FCF9F58AB5866B16649A24958A9
          58EAF4EA57AD573FA33F46A746299429549B54000000A3D1A361B0616EB66E5B
          AC5B66B166EAF4EA60AF604AA64A42A3422B932B559B55000000A7D3A779BC79
          87C4876DB66D71B771E3F1E360AF6049A4493FA03F2690264F984F000000B6DB
          B679BC797EBF7E63B26355AA554DA54D379B372994291B8E1B017E014F984F00
          0000B7BBB7C0E4C0A9D4A9A5D2A5A0CFA098CB9894C9948EC78E89C48985C285
          AAC0AA000000}
        OnClick = But_tosendClick
      end
      object All_to_send: TSpeedButton
        Left = 29
        Top = 2
        Width = 26
        Height = 22
        Enabled = False
        Glyph.Data = {
          F6020000424DF6020000000000003600000028000000150000000B0000000100
          180000000000C0020000C40E0000C40E00000000000000000000ACC2AC5BA25B
          569C565BA05B59A05950A0504EA44E48A24842A0423A973A7DA97D5BA25B569C
          565BA05B59A05950A0504EA44E48A24842A0423A973A7DA97D0089C289178917
          2D942D26922623932336A636079D0707A50700A5000093004095401789172D94
          2D26922623932336A636079D0707A50700A5000093004095400095CA95369C36
          41A1411E911E6AB86AF4FAF45BC55B08AF0812B51203A50343A143369C3641A1
          411E911E6AB86AF4FAF45BC55B08AF0812B51203A50343A1430098CC9843A243
          3C9E3C6EB76EFBFDFBFFFFFFF8FDF85EC95E0FB00F0EA50E48A14843A2433C9E
          3C6EB76EFBFDFBFFFFFFF8FDF85EC95E0FB00F0EA50E48A148009ACD9A44A244
          8FC78FFFFFFFC2E1C2E3F2E3CEEBCEFFFFFF6CCB6C11A0114CA24C44A2448FC7
          8FFFFFFFC2E1C2E3F2E3CEEBCEFFFFFF6CCB6C11A0114CA24C009CCD9C54A954
          D1E8D1ADD5AD4BA44BE0F0E04DAF4DB5DDB5CFE9CF279E274F9E4F54A954D1E8
          D1ADD5AD4BA44BE0F0E04DAF4DB5DDB5CFE9CF279E274F9E4F009FCF9F58AB58
          66B16649A24958A958EAF4EA57AD573FA33F46A746299429549B5458AB5866B1
          6649A24958A958EAF4EA57AD573FA33F46A746299429549B5400A3D1A361B061
          6EB66E5BAC5B66B166EAF4EA60AF604AA64A42A3422B932B559B5561B0616EB6
          6E5BAC5B66B166EAF4EA60AF604AA64A42A3422B932B559B5500A7D3A779BC79
          87C4876DB66D71B771E3F1E360AF6049A4493FA03F2690264F984F79BC7987C4
          876DB66D71B771E3F1E360AF6049A4493FA03F2690264F984F00B6DBB679BC79
          7EBF7E63B26355AA554DA54D379B372994291B8E1B017E014F984F79BC797EBF
          7E63B26355AA554DA54D379B372994291B8E1B017E014F984F00B7BBB7C0E4C0
          A9D4A9A5D2A5A0CFA098CB9894C9948EC78E89C48985C285AAC0AAC0E4C0A9D4
          A9A5D2A5A0CFA098CB9894C9948EC78E89C48985C285AAC0AA00}
        Visible = False
        OnClick = All_to_sendClick
      end
      object ToolButton1: TToolButton
        Left = 55
        Top = 2
        Width = 18
        Caption = 'ToolButton1'
        Style = tbsDivider
      end
      object But_noSend: TSpeedButton
        Left = 73
        Top = 2
        Width = 26
        Height = 22
        Glyph.Data = {
          C2010000424DC20100000000000036000000280000000B0000000B0000000100
          1800000000008C010000C40E0000C40E00000000000000000000AAC0AA85C285
          89C4898EC78E94C99498CB98A0CFA0A5D2A5A9D4A9C0E4C0B7BBB70000004F98
          4F017E011B8E1B299429379B374DA54D55AA5563B2637EBF7E79BC79B6DBB600
          00004F984F2690263FA03F49A44960AF60E3F1E371B7716DB66D87C48779BC79
          A7D3A7000000559B552B932B42A3424AA64A60AF60EAF4EA66B1665BAC5B6EB6
          6E61B061A3D1A3000000549B5429942946A7463FA33F57AD57EAF4EA58A95849
          A24966B16658AB589FCF9F0000004F9E4F279E27CFE9CFB5DDB54DAF4DE0F0E0
          4BA44BADD5ADD1E8D154A9549CCD9C0000004CA24C11A0116CCB6CFFFFFFCEEB
          CEE3F2E3C2E1C2FFFFFF8FC78F44A2449ACD9A00000048A1480EA50E0FB00F5E
          C95EF8FDF8FFFFFFFBFDFB6EB76E3C9E3C43A24398CC9800000043A14303A503
          12B51208AF085BC55BF4FAF46AB86A1E911E41A141369C3695CA950000004095
          4000930000A50007A507079D0736A6362393232692262D942D17891789C28900
          00007DA97D3A973A42A04248A2484EA44E50A05059A0595BA05B569C565BA25B
          ACC2AC000000}
        OnClick = But_noSendClick
      end
      object All_to_Nosend: TSpeedButton
        Left = 99
        Top = 2
        Width = 26
        Height = 22
        Glyph.Data = {
          F6020000424DF6020000000000003600000028000000150000000B0000000100
          180000000000C0020000C40E0000C40E00000000000000000000AAC0AA85C285
          89C4898EC78E94C99498CB98A0CFA0A5D2A5A9D4A9C0E4C0AAC0AA85C28589C4
          898EC78E94C99498CB98A0CFA0A5D2A5A9D4A9C0E4C0B7BBB7004F984F017E01
          1B8E1B299429379B374DA54D55AA5563B2637EBF7E79BC794F984F017E011B8E
          1B299429379B374DA54D55AA5563B2637EBF7E79BC79B6DBB6004F984F269026
          3FA03F49A44960AF60E3F1E371B7716DB66D87C48779BC794F984F2690263FA0
          3F49A44960AF60E3F1E371B7716DB66D87C48779BC79A7D3A700559B552B932B
          42A3424AA64A60AF60EAF4EA66B1665BAC5B6EB66E61B061559B552B932B42A3
          424AA64A60AF60EAF4EA66B1665BAC5B6EB66E61B061A3D1A300549B54299429
          46A7463FA33F57AD57EAF4EA58A95849A24966B16658AB58549B5429942946A7
          463FA33F57AD57EAF4EA58A95849A24966B16658AB589FCF9F004F9E4F279E27
          CFE9CFB5DDB54DAF4DE0F0E04BA44BADD5ADD1E8D154A9544F9E4F279E27CFE9
          CFB5DDB54DAF4DE0F0E04BA44BADD5ADD1E8D154A9549CCD9C004CA24C11A011
          6CCB6CFFFFFFCEEBCEE3F2E3C2E1C2FFFFFF8FC78F44A2444CA24C11A0116CCB
          6CFFFFFFCEEBCEE3F2E3C2E1C2FFFFFF8FC78F44A2449ACD9A0048A1480EA50E
          0FB00F5EC95EF8FDF8FFFFFFFBFDFB6EB76E3C9E3C43A24348A1480EA50E0FB0
          0F5EC95EF8FDF8FFFFFFFBFDFB6EB76E3C9E3C43A24398CC980043A14303A503
          12B51208AF085BC55BF4FAF46AB86A1E911E41A141369C3643A14303A50312B5
          1208AF085BC55BF4FAF46AB86A1E911E41A141369C3695CA9500409540009300
          00A50007A507079D0736A6362393232692262D942D17891740954000930000A5
          0007A507079D0736A6362393232692262D942D17891789C289007DA97D3A973A
          42A04248A2484EA44E50A05059A0595BA05B569C565BA25B7DA97D3A973A42A0
          4248A2484EA44E50A05059A0595BA05B569C565BA25BACC2AC00}
        OnClick = All_to_NosendClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 543
      Height = 139
      TabStop = False
      Align = alTop
      Color = clBtnFace
      DataSource = NoSend_DataSource
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Color = clSilver
          Expanded = False
          FieldName = 'ID'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '¹'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRANSDATE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          Title.Caption = 'Òàðèõ'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Azl Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'ACC_NO'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'ÄÅÁÅÒ'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 103
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'VAL_NAME'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Caption = '$'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 28
          Visible = True
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'AMOUNT'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Äåáåò Ìÿáëÿü'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Color = clSilver
          Expanded = False
          FieldName = 'CurrencyRate'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Caption = 'Êóðñ'
          Title.Color = clNavy
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Visible = False
        end
        item
          Color = clWhite
          Expanded = False
          FieldName = 'TRANS_REF'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial AzLat'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'ÃÅÉÄÈÉÉÀÒ ¹'
          Title.Color = clNavy
          Title.Font.Charset = RUSSIAN_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'Arial AzLat'
          Title.Font.Style = []
          Width = 101
          Visible = True
        end>
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 335
    Width = 543
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 29
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Ýþíäÿðÿí Èøòèðàê÷û:'
      TabOrder = 0
      object Edit_sender: TEdit
        Left = 129
        Top = 4
        Width = 165
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 13
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 297
      Top = 0
      Width = 246
      Height = 29
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Àëàí Èøòèðàê÷û:'
      TabOrder = 1
      object Edit_receiver: TEdit
        Left = 78
        Top = 4
        Width = 165
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 13
        TabOrder = 0
        Text = 'NABZAZ2XXXXX'
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 306
    Width = 543
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 29
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Öìóìè ôàéëûí ãåéäèééàò ¹:'
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 276
        Top = 4
        Width = 19
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Edit_reference: TEdit
        Left = 129
        Top = 4
        Width = 146
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        MaxLength = 16
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel11: TPanel
      Left = 297
      Top = 0
      Width = 246
      Height = 29
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Ôàéëûí Òèïè:'
      TabOrder = 1
      object Edit1: TEdit
        Left = 78
        Top = 3
        Width = 165
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
        Text = '150'
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 364
    Width = 543
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 29
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Ïàêåò þäÿíèøëÿðèí ñàéû:'
      TabOrder = 0
      object Edit_count: TEdit
        Left = 129
        Top = 4
        Width = 165
        Height = 21
        CharCase = ecUpperCase
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 297
      Top = 0
      Width = 246
      Height = 29
      Align = alClient
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = ' Ìÿáëÿü:'
      TabOrder = 1
      object CurrencyEdit1: TCurrencyEdit
        Left = 78
        Top = 3
        Width = 164
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object ToSend: TOracleDataSet
    SQL.Strings = (
      'select'
      '                   h.*,'
      '                   a.acc_no,'
      '                   v.val_name              '
      'from'
      #9'   hox102_out h,'
      #9'   account a,'
      #9'   avalute v'
      'where'
      '                   h.acc_id = a.id and'
      '                   v.valute=h.val_acc and'
      '                  (transdate>=:BeginDate and'
      '                   transdate<=:EndDate)and'
      '                   (h.send=1)and'
      '                  (h.status=1)')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 40
    Top = 216
    object ToSendID: TFloatField
      FieldName = 'ID'
    end
    object ToSendF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object ToSendOPERCODE: TStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object ToSendACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object ToSendCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object ToSendCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object ToSendTRANS_REF: TStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object ToSendAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object ToSendVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ToSendTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object ToSendSEND: TIntegerField
      FieldName = 'SEND'
    end
    object ToSendSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ToSendACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object ToSendVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object NoSend: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '                   h.*,'
      '                   a.acc_no,'
      '                   v.val_name'
      'from'
      #9'           hox102_out h,'
      '                   account a,'
      '           '#9'   avalute v'
      'where'
      '                   h.acc_id = a.id and'
      '                   v.valute=h.val_acc and'
      '                  (transdate>=:BeginDate and'
      '                   transdate<=:EndDate)and'
      '                   ((h.send is null)or(h.send=0))and'
      
        '                  (h.status=1)and (hoxpack.CheckForFile(h.id,1) ' +
        '=1)'
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Variables.Data = {
      03000000020000000A0000003A424547494E444154450C000000000000000000
      0000080000003A454E44444154450C0000000000000000000000}
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 136
    Top = 88
    object NoSendID: TFloatField
      FieldName = 'ID'
    end
    object NoSendF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object NoSendOPERCODE: TStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object NoSendACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object NoSendCLIENT_NAME: TStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object NoSendCLIENT_CODE: TStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object NoSendTRANS_REF: TStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object NoSendAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object NoSendVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object NoSendTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object NoSendSEND: TIntegerField
      FieldName = 'SEND'
    end
    object NoSendSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object NoSendACC_NO: TStringField
      FieldName = 'ACC_NO'
    end
    object NoSendVAL_NAME: TStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
  end
  object NoSend_DataSource: TDataSource
    DataSet = NoSend
    Left = 88
    Top = 80
  end
  object ToSend_DataSource: TDataSource
    DataSet = ToSend
    Left = 88
    Top = 216
  end
  object Convert_pack: TOraclePackage
    Session = sboapiDataModule.SBSession
    Debug = False
    PackageName = 'HOXPACK'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 218
    Top = 189
  end
  object MT102: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '                   h.*,'
      '                   a.acc_no,'
      '                   v.val_name'
      'from'
      #9'           hox102_out h,'
      '                   account a,'
      '           '#9'   avalute v'
      'where'
      '                   h.acc_id = a.id and'
      '                   v.valute=h.val_acc and'
      '                   ((h.send is null)or(h.send=0))and'
      
        '                  (h.status=1)and (hoxpack.CheckForFile(h.id,1) ' +
        '=1)'
      ''
      ' '
      ' '
      ''
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 280
    Top = 88
  end
  object Messages: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '                   h.*,'
      '                   a.acc_no,'
      '                   v.val_name'
      'from'
      #9'           hox102_out h,'
      '                   account a,'
      '           '#9'   avalute v'
      'where'
      '                   h.acc_id = a.id and'
      '                   v.valute=h.val_acc and'
      '                   ((h.send is null)or(h.send=0))and'
      
        '                  (h.status=1)and (hoxpack.CheckForFile(h.id,1) ' +
        '=1)'
      ''
      ' '
      ' '
      ''
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 328
    Top = 88
  end
  object ForAll: TOracleDataSet
    SQL.Strings = (
      ''
      'select'
      '                   h.*,'
      '                   a.acc_no,'
      '                   v.val_name'
      'from'
      #9'           hox102_out h,'
      '                   account a,'
      '           '#9'   avalute v'
      'where'
      '                   h.acc_id = a.id and'
      '                   v.valute=h.val_acc and'
      '                   ((h.send is null)or(h.send=0))and'
      
        '                  (h.status=1)and (hoxpack.CheckForFile(h.id,1) ' +
        '=1)'
      ''
      ' '
      ' '
      ''
      ' ')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = sboapiDataModule.SBSession
    DesignActivation = False
    Active = False
    Left = 416
    Top = 88
  end
end
