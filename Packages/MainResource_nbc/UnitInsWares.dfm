object FormInsert: TFormInsert
  Left = 311
  Top = 164
  BorderStyle = bsDialog
  Caption = 'FormInsert'
  ClientHeight = 400
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 400
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GBoxPublic: TGroupBox
      Left = 2
      Top = 2
      Width = 319
      Height = 45
      Caption = '¬€саитин ады '
      TabOrder = 0
      object Edit_Wares_Name: TEdit
        Left = 3
        Top = 20
        Width = 312
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit_Wares_NameKeyPress
      end
    end
    object GroupBoxFXM: TGroupBox
      Left = 2
      Top = 48
      Width = 121
      Height = 41
      Caption = '‘айдалы хидм€т мцдд€ти'
      TabOrder = 1
      object CBoxFXM: TComboBox
        Left = 4
        Top = 15
        Width = 113
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = '4'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13')
      end
    end
    object GroupBoxSector: TGroupBox
      Left = 123
      Top = 48
      Width = 198
      Height = 41
      Caption = '—ахланылдыьы бюлм€'
      TabOrder = 2
      object Edit_Keeping_Sec: TEdit
        Left = 4
        Top = 15
        Width = 190
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBoxInvDate: TGroupBox
      Left = 3
      Top = 89
      Width = 244
      Height = 42
      Caption = 'ƒахилолма тарихи'
      TabOrder = 3
      object DTP_Inv_Date: TDateTimePicker
        Left = 3
        Top = 16
        Width = 239
        Height = 21
        CalAlignment = dtaLeft
        Date = 38820.2391962963
        Time = 38820.2391962963
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBoxAmortDate: TGroupBox
      Left = 247
      Top = 89
      Width = 241
      Height = 42
      Caption = 'јмортизасийа тарихи'
      TabOrder = 4
      object DTP_Amort_Date: TDateTimePicker
        Left = 3
        Top = 16
        Width = 234
        Height = 21
        CalAlignment = dtaLeft
        Date = 38820.2396656019
        Time = 38820.2396656019
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
    end
    object GroupBoxNB: TGroupBox
      Left = 3
      Top = 133
      Width = 245
      Height = 197
      Caption = 'ћилли Ѕанк '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label_First_Price: TLabel
        Left = 6
        Top = 16
        Width = 48
        Height = 13
        Caption = '»лкин д€й€р'
      end
      object Label_Balance_Price: TLabel
        Left = 6
        Top = 64
        Width = 53
        Height = 13
        Caption = '√алыг д€й€р'
      end
      object Label_All_Amort: TLabel
        Left = 6
        Top = 111
        Width = 94
        Height = 13
        Caption = '…ыьылмыш амортизасийа'
      end
      object Label_Amort: TLabel
        Left = 6
        Top = 156
        Width = 82
        Height = 13
        Caption = 'јйлыг амортизасийа'
      end
      object Edit_First_Price: TEdit
        Left = 3
        Top = 34
        Width = 239
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Balance_Price: TEdit
        Left = 3
        Top = 82
        Width = 238
        Height = 21
        TabOrder = 1
        OnChange = Edit_Balance_PriceChange
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_All_Amort: TEdit
        Left = 2
        Top = 128
        Width = 239
        Height = 21
        TabOrder = 2
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Amort: TEdit
        Left = 2
        Top = 173
        Width = 239
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = Edit_First_PriceKeyPress
      end
    end
    object GroupBoxNL: TGroupBox
      Left = 249
      Top = 133
      Width = 239
      Height = 197
      Caption = '¬ерэи'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object Label_Tax_First_Price: TLabel
        Left = 6
        Top = 17
        Width = 112
        Height = 13
        Caption = '»лин €вв€лин€ галыг д€й€ри'
      end
      object Label_Tax_Balance_Price: TLabel
        Left = 7
        Top = 66
        Width = 53
        Height = 13
        Caption = '√алыг д€й€р'
      end
      object LabelTax_All_Amort: TLabel
        Left = 6
        Top = 112
        Width = 94
        Height = 13
        Caption = '…ыьылмыш амортизасийа'
      end
      object LabelTax_Amort: TLabel
        Left = 6
        Top = 158
        Width = 82
        Height = 13
        Caption = 'јйлыг амортизасийа'
      end
      object Edit_Tax_First_Price: TEdit
        Left = 3
        Top = 34
        Width = 232
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Tax_Balance_Price: TEdit
        Left = 3
        Top = 81
        Width = 232
        Height = 21
        TabOrder = 1
        OnChange = Edit_Tax_Balance_PriceChange
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Tax_All_Amort: TEdit
        Left = 3
        Top = 128
        Width = 232
        Height = 21
        TabOrder = 2
        OnKeyPress = Edit_First_PriceKeyPress
      end
      object Edit_Tax_Amort: TEdit
        Left = 3
        Top = 173
        Width = 232
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = Edit_First_PriceKeyPress
      end
    end
    object BtnOk: TBitBtn
      Left = 416
      Top = 337
      Width = 67
      Height = 60
      Caption = '√€бул ет....'
      TabOrder = 7
      OnClick = BtnOkClick
    end
    object GroupBoxAction: TGroupBox
      Left = 4
      Top = 332
      Width = 410
      Height = 65
      Caption = '√ейд'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object Image: TImage
        Left = 381
        Top = 8
        Width = 25
        Height = 25
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF606060
          404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3F3F3F404040404040FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020203F3F3FFFFFFF404040
          404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040
          40606060404040AFAFAFFFFFFF404040808080808080404040FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF2020206F6F6FAFAFAFFFFFFFFFFFFFFFFFFFAFAFAF
          6F6F6F404040808080606060FFFFFFFFFFFFFFFFFFFFFFFF3F3F3FEFEFEFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5F808080606060FF
          FFFFFFFFFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFEFAFAFFF0000EFAFAFFFFFFF
          FFFFFFFFFFFFFFFFFF5F5F5F808080404040404040EFEFEFFFFFFFFFFFFFFFFF
          FFFFFFFFEFAFAFFF0000EFAFAFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF40404080
          8080AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6F6F6F808080BFBFBFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000EFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F80
          8080BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFEFAFAFEFAFAFEF6F6FFF0000FFBFBF
          FFFFFFFFFFFFFFFFFFFFFFFF7F7F7F606060707070FFFFFFFFFFFFFFFFFFFFFF
          FFFF0000FF0000EFEFEFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF50505020
          2020202020CFCFCFFFFFFFFFFFFFFFFFFFEF3030EFEFEFFFBFBFFF0000EF3030
          FFFFFFFFFFFFFFFFFFAFAFAF000000FFFFFFFFFFFF202020DFDFDFFFFFFFFFFF
          FFEFEFEFFF7F7FFF7F7FFF7F7FEFEFEFFFFFFFFFFFFFBFBFBF000000FFFFFFFF
          FFFFFFFFFFFFFFFF202020AFAFAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EFEFEFAFAFAF202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040
          40707070BFBFBFBFBFBFBFBFBF707070404040FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Stretch = True
      end
      object MemoAction: TMemo
        Left = 4
        Top = 14
        Width = 357
        Height = 42
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            '¬€саит йени дахил олунурса дахилолма тарихи амортизасийа тарихин' +
            '€ б€раб€рдир!'
          
            '¬€саит йени дахил олунурса илин €вв€лин€ галыг д€й€ри  илкин д€й' +
            '€р€ б€раб€рдир!')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBoxInv_No: TGroupBox
      Left = 322
      Top = 48
      Width = 165
      Height = 41
      Caption = 'Inventar є'
      TabOrder = 9
      object Edit_Inv_No: TEdit
        Left = 5
        Top = 15
        Width = 155
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 323
      Top = 2
      Width = 164
      Height = 45
      Caption = '»стифад€чи'
      TabOrder = 10
      object Edit_User: TEdit
        Left = 4
        Top = 20
        Width = 156
        Height = 21
        TabOrder = 0
      end
    end
  end
  object NLSLocalizer: TNLSLocalizer
    Caption = '¬€саитин €лав€ едилм€си'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    Left = 432
    Top = 136
  end
end
