object PrepareFile_Form: TPrepareFile_Form
  Left = 302
  Top = 128
  BorderIcons = [biSystemMenu]
  Caption = 'Fayl'#305'n yarad'#305'lmas'#305
  ClientHeight = 473
  ClientWidth = 749
  Color = clBtnFace
  Constraints.MinHeight = 489
  Constraints.MinWidth = 593
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  DesignSize = (
    749
    473)
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 423
    Width = 749
    Height = 10
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object Button_file: TBitBtn
    Left = 520
    Top = 442
    Width = 147
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'XML Fayl'#305'n'#305' yarat'
    DoubleBuffered = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000C0C0
      C0008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000080800000000000C0C0C000C0C0C000C0C0
      C00080808000808080008080800000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0008080800080808000808080008080800000000000FF00FF00FF00FF00FF00
      FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0
      C0008080800080808000808080008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000000000000000C0C0C000808080000000000000000000C0C0
      C0008080800080808000000000008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000FF00000000000000000000000000C0C0C000FFFFFF00FFFF
      FF008080800080808000C0C0C0008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000FF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000080808000000000008080800000000000FF00FF00FF00FF000000
      0000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000808080008080800080808000FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C000C0C0C0008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C0008080
      800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000C0C0C0008080800000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = Button_fileClick
  end
  object BitBtn1: TBitBtn
    Left = 673
    Top = 441
    Width = 68
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #199#305'x'#305#351
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 330
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 749
      Height = 156
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object GridReadyBatchs: TDBGrid
        Left = 1
        Top = 1
        Width = 747
        Height = 154
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = DS_ReadyBatchs
        DrawingStyle = gdsClassic
        FixedColor = 8404992
        GradientEndColor = clBlack
        GradientStartColor = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnTitleClick = GridReadyBatchsTitleClick
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
            Title.Caption = #8470
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
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Tarix'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Debet'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Alignment = taCenter
            Title.Caption = '$'
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
            Title.Caption = 'Debet M'#601'bl'#601#287
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Kurs'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Qeydiyyat '#8470
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 101
            Visible = True
          end>
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 156
      Width = 749
      Height = 33
      ButtonHeight = 28
      Caption = 'ToolBar1'
      Color = clBtnFace
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esRaised
      ParentColor = False
      TabOrder = 0
      object But_tosend: TSpeedButton
        Left = 0
        Top = 0
        Width = 29
        Height = 28
        Flat = True
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
        Top = 0
        Width = 26
        Height = 28
        Flat = True
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
        OnClick = All_to_sendClick
      end
      object ToolButton1: TToolButton
        Left = 55
        Top = 0
        Width = 34
        Caption = 'ToolButton1'
        Style = tbsDivider
      end
      object But_noSend: TSpeedButton
        Left = 89
        Top = 0
        Width = 26
        Height = 28
        Flat = True
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
      object ToolButton2: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object All_to_Nosend: TSpeedButton
        Left = 123
        Top = 0
        Width = 26
        Height = 28
        Flat = True
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
    object Panel12: TPanel
      Left = 0
      Top = 189
      Width = 749
      Height = 141
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 2
      object GridSendingBatchs: TDBGrid
        Left = 1
        Top = 1
        Width = 747
        Height = 139
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        DataSource = DS_SendingBatchs
        DrawingStyle = gdsClassic
        FixedColor = 8404992
        GradientEndColor = clBlack
        GradientStartColor = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            Title.Caption = #8470
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
            FieldName = 'TRANSDATE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Caption = 'Tarix'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Debet'
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Alignment = taCenter
            Title.Caption = '$'
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
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial AzLat'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Debet M'#601'bl'#601#287
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Kurs'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
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
            Title.Caption = 'Qeydiyyat '#8470
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 101
            Visible = True
          end>
      end
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 361
    Width = 749
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 320
      Height = 31
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' G'#246'nd'#601'r'#601'n '#304#351'trak'#231#305':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Edit_sender: TEdit
        Left = 139
        Top = 4
        Width = 178
        Height = 22
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 320
      Top = 0
      Width = 425
      Height = 31
      Align = alLeft
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' Alan '#304#351'trak'#231#305':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        425
        31)
      object Edit_receiver: TEdit
        Left = 91
        Top = 4
        Width = 330
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
        Text = 'NABZAZ2XXXXX'
      end
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 330
    Width = 749
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 321
      Height = 31
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = #220'mumi fayl'#305'n qeydiyyat '#8470':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 299
        Top = 3
        Width = 21
        Height = 24
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Edit_reference: TEdit
        Left = 144
        Top = 4
        Width = 155
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 16
        ParentFont = False
        TabOrder = 0
        OnKeyPress = Edit_referenceKeyPress
      end
    end
    object Panel11: TPanel
      Left = 321
      Top = 0
      Width = 424
      Height = 31
      Align = alLeft
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' Fayl'#305'n Tipi:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        424
        31)
      object Edit1: TEdit
        Left = 90
        Top = 3
        Width = 330
        Height = 22
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '150'
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 392
    Width = 749
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 320
      Height = 31
      Align = alLeft
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' Paket '#246'd'#601'ni'#351'l'#601'rin say'#305':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Edit_count: TEdit
        Left = 139
        Top = 4
        Width = 178
        Height = 22
        CharCase = ecUpperCase
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 320
      Top = 0
      Width = 429
      Height = 31
      Align = alClient
      Alignment = taLeftJustify
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = ' M'#601'bl'#601#287':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        429
        31)
      object CurrencyEdit1: TCurrencyEdit
        Left = 91
        Top = 3
        Width = 330
        Height = 21
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clSilver
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
    end
  end
  object but_batch: TBitBtn
    Left = 8
    Top = 439
    Width = 149
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1061#1052#1051' '#1060#1072#1081#1083#1099#1085#1099' '#1049#1072#1088#1072#1090'+batch'
    DoubleBuffered = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000808000008080000000000000000000C0C0
      C0008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF000080800000000000C0C0C000C0C0C000C0C0
      C00080808000808080008080800000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C0008080800080808000808080008080800000000000FF00FF00FF00FF00FF00
      FF0000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C00080808000C0C0
      C0008080800080808000808080008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000000000000000C0C0C000808080000000000000000000C0C0
      C0008080800080808000000000008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000FF00000000000000000000000000C0C0C000FFFFFF00FFFF
      FF008080800080808000C0C0C0008080800000000000FF00FF00FF00FF000000
      0000C0C0C0000000FF0000000000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000080808000000000008080800000000000FF00FF00FF00FF000000
      0000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0C0C000808080008080800080808000FF00FF00FF00FF00FF00FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C000C0C0C0008080800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C0008080
      800000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000C0C0C0008080800000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    ParentDoubleBuffered = False
    TabOrder = 7
    Visible = False
    OnClick = but_batchClick
  end
  object SendingBatchs: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.id, a.f_id, a.opercode, a.acc_id, a.client_name, a.clie' +
        'nt_code,'
      
        '       a.trans_ref, a.amount, a.val_acc, a.transdate, a.send, a.' +
        'status,'
      
        '       a.filial, a.transaction_id, a.client_inn, a.userid, a.acc' +
        '_no,'
      
        '       a.val_name, a.format,to_char(sysdate,'#39'HHMI'#39') as times,to_' +
        'char(sysdate,'#39'YYMMDDHHMI'#39') as datetime,'
      
        '       to_char(a.todat,'#39'YYMMDD'#39') as todat,to_char(sysdate,'#39'YYMMD' +
        'D'#39') as fromdat,a.maxpmtnum,'
      
        '       a.frequency,a.colltnamt,a.types,a.relatedref,a.mndtst,a.m' +
        'emo1,a.memo2'
      ''
      '  FROM xs_sendingbatchs a ')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001F00000004000000490044000100000000000800000046005F004900
      4400010000000000100000004F0050004500520043004F004400450001000000
      00000C0000004100430043005F00490044000100000000001600000043004C00
      490045004E0054005F004E0041004D0045000100000000001600000043004C00
      490045004E0054005F0043004F00440045000100000000001200000054005200
      41004E0053005F005200450046000100000000000C00000041004D004F005500
      4E0054000100000000000E000000560041004C005F0041004300430001000000
      0000120000005400520041004E00530044004100540045000100000000000800
      0000530045004E0044000100000000000C000000530054004100540055005300
      0100000000000C000000460049004C00490041004C000100000000001C000000
      5400520041004E00530041004300540049004F004E005F004900440001000000
      00001400000043004C00490045004E0054005F0049004E004E00010000000000
      0C0000005500530045005200490044000100000000000C000000410043004300
      5F004E004F0001000000000010000000560041004C005F004E0041004D004500
      0100000000000C00000046004F0052004D00410054000100000000000A000000
      540049004D004500530001000000000010000000440041005400450054004900
      4D0045000100000000000A00000054004F004400410054000100000000000E00
      0000460052004F004D00440041005400010000000000120000004D0041005800
      50004D0054004E0055004D000100000000001200000046005200450051005500
      45004E00430059000100000000001200000043004F004C004C0054004E004100
      4D0054000100000000000A000000540059005000450053000100000000001400
      0000520045004C0041005400450044005200450046000100000000000C000000
      4D004E0044005400530054000100000000000A0000004D0045004D004F003100
      0100000000000A0000004D0045004D004F003200010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 216
    object SendingBatchsID: TFloatField
      FieldName = 'ID'
    end
    object SendingBatchsF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object SendingBatchsOPERCODE: TWideStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object SendingBatchsACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object SendingBatchsCLIENT_NAME: TWideStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object SendingBatchsCLIENT_CODE: TWideStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object SendingBatchsTRANS_REF: TWideStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object SendingBatchsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object SendingBatchsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object SendingBatchsTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object SendingBatchsSEND: TIntegerField
      FieldName = 'SEND'
    end
    object SendingBatchsSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object SendingBatchsFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object SendingBatchsTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object SendingBatchsCLIENT_INN: TWideStringField
      FieldName = 'CLIENT_INN'
      Size = 30
    end
    object SendingBatchsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object SendingBatchsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object SendingBatchsVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object SendingBatchsFORMAT: TWideStringField
      FieldName = 'FORMAT'
      Size = 10
    end
    object SendingBatchsTIMES: TWideStringField
      FieldName = 'TIMES'
      Size = 75
    end
    object SendingBatchsDATETIME: TWideStringField
      FieldName = 'DATETIME'
      Size = 75
    end
    object SendingBatchsTODAT: TWideStringField
      FieldName = 'TODAT'
      Size = 75
    end
    object SendingBatchsFROMDAT: TWideStringField
      FieldName = 'FROMDAT'
      Size = 75
    end
    object SendingBatchsMAXPMTNUM: TFloatField
      FieldName = 'MAXPMTNUM'
    end
    object SendingBatchsFREQUENCY: TWideStringField
      FieldName = 'FREQUENCY'
      Size = 10
    end
    object SendingBatchsCOLLTNAMT: TFloatField
      FieldName = 'COLLTNAMT'
    end
    object SendingBatchsTYPES: TFloatField
      FieldName = 'TYPES'
    end
    object SendingBatchsRELATEDREF: TWideStringField
      FieldName = 'RELATEDREF'
      Size = 50
    end
    object SendingBatchsMNDTST: TWideStringField
      FieldName = 'MNDTST'
    end
    object SendingBatchsMEMO1: TWideMemoField
      FieldName = 'MEMO1'
      BlobType = ftWideMemo
    end
    object SendingBatchsMEMO2: TWideMemoField
      FieldName = 'MEMO2'
      BlobType = ftWideMemo
    end
  end
  object ReadyBatchs: TOracleDataSet
    SQL.Strings = (
      'Select'
      '    *'
      'From'
      '  xs_ReadyBatchs'
      ''
      'order by :Title')
    Optimize = False
    Variables.Data = {
      04000000010000000C0000003A005400490054004C0045000100000003000000
      69640000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001300000004000000490044000100000000000800000046005F004900
      4400010000000000100000004F0050004500520043004F004400450001000000
      00000C0000004100430043005F00490044000100000000001600000043004C00
      490045004E0054005F004E0041004D0045000100000000001600000043004C00
      490045004E0054005F0043004F00440045000100000000001200000054005200
      41004E0053005F005200450046000100000000000C00000041004D004F005500
      4E0054000100000000000E000000560041004C005F0041004300430001000000
      0000120000005400520041004E00530044004100540045000100000000000800
      0000530045004E0044000100000000000C000000530054004100540055005300
      0100000000000C000000460049004C00490041004C000100000000001C000000
      5400520041004E00530041004300540049004F004E005F004900440001000000
      00001400000043004C00490045004E0054005F0049004E004E00010000000000
      0C0000005500530045005200490044000100000000000C000000410043004300
      5F004E004F0001000000000010000000560041004C005F004E0041004D004500
      0100000000000C00000046004F0052004D0041005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 48
    Top = 80
    object ReadyBatchsID: TFloatField
      FieldName = 'ID'
    end
    object ReadyBatchsF_ID: TFloatField
      FieldName = 'F_ID'
    end
    object ReadyBatchsOPERCODE: TWideStringField
      FieldName = 'OPERCODE'
      Size = 6
    end
    object ReadyBatchsACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object ReadyBatchsCLIENT_NAME: TWideStringField
      FieldName = 'CLIENT_NAME'
      Size = 70
    end
    object ReadyBatchsCLIENT_CODE: TWideStringField
      FieldName = 'CLIENT_CODE'
      Size = 70
    end
    object ReadyBatchsTRANS_REF: TWideStringField
      FieldName = 'TRANS_REF'
      Size = 16
    end
    object ReadyBatchsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      currency = True
    end
    object ReadyBatchsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object ReadyBatchsTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object ReadyBatchsSEND: TIntegerField
      FieldName = 'SEND'
    end
    object ReadyBatchsSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object ReadyBatchsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 28
    end
    object ReadyBatchsVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 10
    end
    object ReadyBatchsFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object ReadyBatchsTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object ReadyBatchsCLIENT_INN: TWideStringField
      FieldName = 'CLIENT_INN'
      Size = 120
    end
    object ReadyBatchsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object ReadyBatchsFORMAT: TWideStringField
      FieldName = 'FORMAT'
      Size = 40
    end
  end
  object DS_ReadyBatchs: TDataSource
    DataSet = ReadyBatchs
    Left = 88
    Top = 80
  end
  object DS_SendingBatchs: TDataSource
    DataSet = SendingBatchs
    Left = 152
    Top = 216
  end
  object Convert_pack: TOraclePackage
    Session = sboapiDataModule.SBSession
    PackageName = 'XS_CONTROL'
    Left = 490
    Top = 13
  end
  object xs_batchs: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*,to_char(trunc(a.transdate), '#39'yymmdd'#39')  as dat'
      '  FROM xs_sendingbatchs a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001C00000004000000490044000100000000000800000046005F004900
      4400010000000000100000004F0050004500520043004F004400450001000000
      00000C0000004100430043005F00490044000100000000001600000043004C00
      490045004E0054005F004E0041004D0045000100000000001600000043004C00
      490045004E0054005F0043004F00440045000100000000001200000054005200
      41004E0053005F005200450046000100000000000C00000041004D004F005500
      4E0054000100000000000E000000560041004C005F0041004300430001000000
      0000120000005400520041004E00530044004100540045000100000000000800
      0000530045004E0044000100000000000C000000530054004100540055005300
      0100000000000C000000460049004C00490041004C000100000000001C000000
      5400520041004E00530041004300540049004F004E005F004900440001000000
      00001400000043004C00490045004E0054005F0049004E004E00010000000000
      0C0000005500530045005200490044000100000000000C000000410043004300
      5F004E004F0001000000000010000000560041004C005F004E0041004D004500
      0100000000000C00000046004F0052004D004100540001000000000006000000
      4400410054000100000000000A00000054004F00440041005400010000000000
      120000004D004100580041004D004F0055004E0054000100000000000A000000
      540059005000450053000100000000001200000043004F004C004C0054004E00
      41004D005400010000000000120000004600520045005100550045004E004300
      590001000000000014000000520045004C004100540045004400520045004600
      010000000000120000004D004100580050004D0054004E0055004D0001000000
      00000C0000004D004E004400540053005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 280
    Top = 88
    object xs_batchsID: TFloatField
      FieldName = 'ID'
    end
    object xs_batchsOPERCODE: TWideStringField
      FieldName = 'OPERCODE'
      Size = 24
    end
    object xs_batchsACC_ID: TFloatField
      FieldName = 'ACC_ID'
    end
    object xs_batchsCLIENT_NAME: TWideStringField
      FieldName = 'CLIENT_NAME'
      Size = 280
    end
    object xs_batchsCLIENT_CODE: TWideStringField
      FieldName = 'CLIENT_CODE'
      Size = 280
    end
    object xs_batchsTRANS_REF: TWideStringField
      FieldName = 'TRANS_REF'
      Size = 64
    end
    object xs_batchsAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object xs_batchsVAL_ACC: TIntegerField
      FieldName = 'VAL_ACC'
    end
    object xs_batchsTRANSDATE: TDateTimeField
      FieldName = 'TRANSDATE'
    end
    object xs_batchsSEND: TIntegerField
      FieldName = 'SEND'
    end
    object xs_batchsSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object xs_batchsFILIAL: TFloatField
      FieldName = 'FILIAL'
    end
    object xs_batchsTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object xs_batchsCLIENT_INN: TWideStringField
      FieldName = 'CLIENT_INN'
      Size = 120
    end
    object xs_batchsUSERID: TFloatField
      FieldName = 'USERID'
    end
    object xs_batchsACC_NO: TWideStringField
      FieldName = 'ACC_NO'
      Size = 448
    end
    object xs_batchsVAL_NAME: TWideStringField
      FieldName = 'VAL_NAME'
      Size = 160
    end
    object xs_batchsFORMAT: TWideStringField
      FieldName = 'FORMAT'
      Size = 40
    end
    object xs_batchsDAT: TWideStringField
      FieldName = 'DAT'
      Size = 75
    end
    object xs_batchsRELATEDREF: TWideStringField
      FieldName = 'RELATEDREF'
      Size = 50
    end
  end
  object Messages: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.id, a.f_id, a.opercode, a.acc_id, a.client_name, a.clie' +
        'nt_code,'
      
        '       a.trans_ref, a.amount, a.val_acc,a.transdate , a.send, a.' +
        'status,'
      
        '       a.filial, a.transaction_id, a.client_inn, a.userid, a.acc' +
        '_no,'
      
        '       a.val_name, a.format,to_char(trunc(a.transdate), '#39'yymmdd'#39 +
        ')  as dat'
      '  FROM xs_readybatchs a')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      050000001400000004000000490044000100000000000800000046005F004900
      4400010000000000100000004F0050004500520043004F004400450001000000
      00000C0000004100430043005F00490044000100000000001600000043004C00
      490045004E0054005F004E0041004D0045000100000000001600000043004C00
      490045004E0054005F0043004F00440045000100000000001200000054005200
      41004E0053005F005200450046000100000000000C00000041004D004F005500
      4E0054000100000000000E000000560041004C005F0041004300430001000000
      0000120000005400520041004E00530044004100540045000100000000000800
      0000530045004E0044000100000000000C000000530054004100540055005300
      0100000000000C000000460049004C00490041004C000100000000001C000000
      5400520041004E00530041004300540049004F004E005F004900440001000000
      00001400000043004C00490045004E0054005F0049004E004E00010000000000
      0C0000005500530045005200490044000100000000000C000000410043004300
      5F004E004F0001000000000010000000560041004C005F004E0041004D004500
      0100000000000C00000046004F0052004D004100540001000000000006000000
      440041005400010000000000}
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 344
    Top = 88
  end
  object DataTemp: TOracleDataSet
    Optimize = False
    Cursor = crSQLWait
    Session = sboapiDataModule.SBSession
    Left = 416
    Top = 88
  end
  object Sendingxs: TOracleDataSet
    Optimize = False
    Left = 608
    Top = 104
  end
  object countbenef: TOracleDataSet
    SQL.Strings = (
      'select * from xs_beneficiary where BatchId=:xid')
    Optimize = False
    Variables.Data = {
      0400000001000000080000003A00580049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      050000001500000004000000490044000100000000000E000000420041005400
      4300480049004400010000000000160000005200450043005F00420041004E00
      4B005F0049004400010000000000200000005200450043005F00420041004E00
      4B005F005300550042005F004100430043000100000000001A00000043004C00
      490045004E0054005F004100430043005F004E004F0001000000000016000000
      43004C00490045004E0054005F004E0041004D00450001000000000016000000
      43004C00490045004E0054005F0043004F004400450001000000000014000000
      43004C00490045004E0054005F0049004E004E00010000000000120000005200
      45004D00490054005F0049004E00460001000000000012000000540052004100
      4E0053005F0043004F0044000100000000000E0000004100440044005F004900
      4E00460001000000000010000000560041004C005F0044004100540045000100
      000000000E000000560041004C005F0043004F0044000100000000001C000000
      4D004500530053005F005200450046004500520045004E004300450001000000
      00000C00000041004D004F0055004E0054000100000000001000000042004E00
      460043004F0055004E0054000100000000000C00000053005400410054005500
      53000100000000001C0000005400520041004E00530041004300540049004F00
      4E005F00490044000100000000000C0000005500530045005200490044000100
      000000001E00000046005400520041004E00530041004300540049004F004E00
      5F00490044000100000000001E00000041005400520041004E00530041004300
      540049004F004E005F0049004400010000000000}
    Session = sboapiDataModule.SBSession
    Left = 584
    Top = 32
    object countbenefID: TFloatField
      FieldName = 'ID'
    end
    object countbenefBATCHID: TFloatField
      FieldName = 'BATCHID'
    end
    object countbenefREC_BANK_ID: TFloatField
      FieldName = 'REC_BANK_ID'
    end
    object countbenefREC_BANK_SUB_ACC: TWideStringField
      FieldName = 'REC_BANK_SUB_ACC'
      Size = 112
    end
    object countbenefCLIENT_ACC_NO: TWideStringField
      FieldName = 'CLIENT_ACC_NO'
      Size = 136
    end
    object countbenefCLIENT_NAME: TWideStringField
      FieldName = 'CLIENT_NAME'
      Size = 280
    end
    object countbenefCLIENT_CODE: TWideStringField
      FieldName = 'CLIENT_CODE'
      Size = 280
    end
    object countbenefCLIENT_INN: TWideStringField
      FieldName = 'CLIENT_INN'
      Size = 120
    end
    object countbenefREMIT_INF: TWideStringField
      FieldName = 'REMIT_INF'
      Size = 580
    end
    object countbenefTRANS_COD: TIntegerField
      FieldName = 'TRANS_COD'
    end
    object countbenefADD_INF: TWideStringField
      FieldName = 'ADD_INF'
      Size = 428
    end
    object countbenefVAL_DATE: TDateTimeField
      FieldName = 'VAL_DATE'
    end
    object countbenefVAL_COD: TIntegerField
      FieldName = 'VAL_COD'
    end
    object countbenefMESS_REFERENCE: TWideStringField
      FieldName = 'MESS_REFERENCE'
      Size = 64
    end
    object countbenefAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object countbenefBNFCOUNT: TIntegerField
      FieldName = 'BNFCOUNT'
    end
    object countbenefSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object countbenefTRANSACTION_ID: TFloatField
      FieldName = 'TRANSACTION_ID'
    end
    object countbenefUSERID: TFloatField
      FieldName = 'USERID'
    end
    object countbenefFTRANSACTION_ID: TFloatField
      FieldName = 'FTRANSACTION_ID'
    end
    object countbenefATRANSACTION_ID: TFloatField
      FieldName = 'ATRANSACTION_ID'
    end
  end
end
