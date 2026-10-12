object BriefcaseForm: TBriefcaseForm
  Left = 106
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'BriefcaseForm'
  ClientHeight = 295
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 295
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object GroupBox1: TPanel
      Left = 2
      Top = 2
      Width = 319
      Height = 291
      Align = alLeft
      TabOrder = 0
      object GroupBox6: TGroupBox
        Left = 1
        Top = 1
        Width = 317
        Height = 231
        Align = alTop
        TabOrder = 0
        object ReportNameList: TDBGrid
          Left = 9
          Top = 16
          Width = 298
          Height = 171
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Щесабатын ады'
              Width = 280
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 232
        Width = 317
        Height = 58
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object GroupBox7: TGroupBox
          Left = 2
          Top = 2
          Width = 143
          Height = 54
          Align = alLeft
          Caption = 'Истифадячи'
          TabOrder = 0
          object cbUsers: TDBLookupComboboxEh
            Left = 8
            Top = 16
            Width = 125
            Height = 21
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = BriefcaseDataMod.UsersDataSrc
            TabOrder = 0
            Visible = True
          end
        end
        object rgPR: TRadioGroup
          Left = 145
          Top = 2
          Width = 170
          Height = 54
          Align = alLeft
          Caption = 'Просроченных рассчитать'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'по ОДБ'
            'по Схемам')
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object Panel2: TPanel
      Left = 321
      Top = 2
      Width = 413
      Height = 291
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object GroupBox9: TGroupBox
        Left = 2
        Top = 187
        Width = 409
        Height = 65
        Align = alTop
        TabOrder = 2
        object Label6: TLabel
          Left = 6
          Top = 14
          Width = 40
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Район:'
        end
        object Label7: TLabel
          Left = 155
          Top = 14
          Width = 34
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Кянд:'
        end
        object Label8: TLabel
          Left = 6
          Top = 42
          Width = 41
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Мцштяри:'
        end
        object cbDistricts: TDBLookupComboboxEh
          Left = 52
          Top = 12
          Width = 103
          Height = 21
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BriefcaseDataMod.DistrictsDataSrc
          TabOrder = 0
          Visible = True
          OnChange = cbDistrictsChange
        end
        object cbVillages: TDBLookupComboboxEh
          Left = 193
          Top = 12
          Width = 103
          Height = 21
          DropDownBox.Sizable = True
          Enabled = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BriefcaseDataMod.VillagesDataSrc
          ParentFont = False
          TabOrder = 1
          Visible = True
          OnChange = cbVillagesChange
        end
        object cbCustomers: TDBLookupComboboxEh
          Left = 53
          Top = 38
          Width = 244
          Height = 21
          DropDownBox.Sizable = True
          Enabled = False
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'NAME'
          ListSource = BriefcaseDataMod.CustomersDataSrc
          TabOrder = 2
          Visible = True
        end
        object chLeavePogash: TCheckBox
          Left = 304
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Погашенных пропустить'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 2
        Width = 409
        Height = 79
        Align = alTop
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 2
          Top = 15
          Width = 200
          Height = 62
          Align = alLeft
          Caption = 'Hesabat dюvrц'
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 16
            Width = 77
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Дюврцн яввяли:'
          end
          object Label2: TLabel
            Left = 8
            Top = 40
            Width = 77
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Дюврцн сону:'
          end
          object RPBegin: TDateTimePicker
            Left = 94
            Top = 12
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 38286.6550482176
            Time = 38286.6550482176
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object RPEnd: TDateTimePicker
            Left = 94
            Top = 37
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 38286.6552148843
            Time = 38286.6552148843
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 202
          Top = 15
          Width = 205
          Height = 62
          Align = alClient
          Caption = 'Кредитлярин верилмя тарихи'
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 16
            Width = 77
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Дюврцн яввяли:'
          end
          object Label4: TLabel
            Left = 8
            Top = 40
            Width = 77
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Дюврцн сону:'
          end
          object KDBegin: TDateTimePicker
            Left = 94
            Top = 12
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 38286.6550482176
            Time = 38286.6550482176
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 0
          end
          object KDEnd: TDateTimePicker
            Left = 94
            Top = 37
            Width = 97
            Height = 21
            CalAlignment = dtaLeft
            Date = 38286.6552148843
            Time = 38286.6552148843
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 1
          end
        end
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 81
        Width = 409
        Height = 106
        Align = alTop
        TabOrder = 1
        object GroupBox8: TGroupBox
          Left = 202
          Top = 54
          Width = 205
          Height = 48
          Caption = 'Кредит мябляьи (man)'
          TabOrder = 0
          object Label9: TLabel
            Left = 100
            Top = 20
            Width = 8
            Height = 13
            AutoSize = False
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCreditIntervalBegin: TMaskEdit
            Left = 4
            Top = 18
            Width = 94
            Height = 21
            EditMask = '999 999 999 999;1;_'
            MaxLength = 15
            TabOrder = 0
            Text = '000 000 000 000'
          end
          object edCreditIntervalEnd: TMaskEdit
            Left = 108
            Top = 18
            Width = 92
            Height = 21
            EditMask = '999 999 999 999;1;_'
            MaxLength = 15
            TabOrder = 1
            Text = '999 999 999 999'
          end
        end
        object GroupBox10: TGroupBox
          Left = 6
          Top = 8
          Width = 196
          Height = 45
          Caption = 'Фаизин артмасы'
          TabOrder = 1
          object Label10: TLabel
            Left = 95
            Top = 18
            Width = 8
            Height = 13
            AutoSize = False
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPercentArtmaBegin: TMaskEdit
            Left = 8
            Top = 16
            Width = 80
            Height = 21
            BiDiMode = bdLeftToRight
            EditMask = '000,0 %;1;_'
            MaxLength = 7
            ParentBiDiMode = False
            TabOrder = 0
            Text = '000,0 %'
          end
          object edPercentArtmaEnd: TMaskEdit
            Left = 108
            Top = 15
            Width = 80
            Height = 21
            EditMask = '000,0 %;1;_'
            MaxLength = 7
            TabOrder = 1
            Text = '100,0 %'
          end
        end
        object GroupBox11: TGroupBox
          Left = 202
          Top = 8
          Width = 205
          Height = 45
          Caption = 'Кредитини типи вя истигамяти:'
          TabOrder = 2
          object cbCreditTypes: TDBLookupComboboxEh
            Left = 7
            Top = 16
            Width = 90
            Height = 21
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'TYPEDESC'
            ListSource = BriefcaseDataMod.BPTypesDataSrc
            TabOrder = 0
            Visible = True
          end
          object cbCreditDirection: TDBLookupComboboxEh
            Left = 104
            Top = 16
            Width = 89
            Height = 21
            DropDownBox.Sizable = True
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'PURPOSEDESC'
            ListSource = BriefcaseDataMod.BPPurposesDataSrc
            TabOrder = 1
            Visible = True
          end
        end
        object GroupBox12: TGroupBox
          Left = 6
          Top = 54
          Width = 196
          Height = 48
          Caption = 'Погашение фаизи'
          TabOrder = 3
          object Label11: TLabel
            Left = 95
            Top = 20
            Width = 8
            Height = 13
            AutoSize = False
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Azl Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edPercentPogashBegin: TMaskEdit
            Left = 8
            Top = 18
            Width = 80
            Height = 21
            BiDiMode = bdLeftToRight
            EditMask = '000,0 %;1;_'
            MaxLength = 7
            ParentBiDiMode = False
            TabOrder = 0
            Text = '000,0 %'
          end
          object edPercentPogashEnd: TMaskEdit
            Left = 108
            Top = 17
            Width = 80
            Height = 21
            EditMask = '000,0 %;1;_'
            MaxLength = 7
            TabOrder = 1
            Text = '100,0 %'
          end
        end
      end
      object btnSubmit: TBitBtn
        Left = 246
        Top = 259
        Width = 75
        Height = 25
        Caption = 'Гябул'
        Default = True
        TabOrder = 3
        OnClick = btnSubmitClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object btnCancel: TBitBtn
        Left = 328
        Top = 259
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Баьла'
        ModalResult = 2
        TabOrder = 4
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  object Localizer: TNLSLocalizer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Left = 16
    Top = 192
  end
end
