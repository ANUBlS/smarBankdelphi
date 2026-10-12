object FormAccounts: TFormAccounts
  Left = 0
  Top = 0
  Caption = 'Hesablar'
  ClientHeight = 238
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 201
    Width = 718
    Height = 37
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 625
      Top = 9
      Width = 94
      Height = 25
      Caption = 'Q'#601'bul ( insert )'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditACC_NO_SEARCH: TEdit
      Left = 25
      Top = 9
      Width = 160
      Height = 21
      TabOrder = 1
      OnKeyPress = EditACC_NO_SEARCHKeyPress
    end
    object EditACC_NO: TEdit
      Left = 186
      Top = 9
      Width = 200
      Height = 21
      TabOrder = 2
      OnKeyPress = EditACC_NOKeyPress
    end
    object EditName: TEdit
      Left = 388
      Top = 9
      Width = 231
      Height = 21
      TabOrder = 3
      OnKeyPress = EditNameKeyPress
    end
  end
  object XDBGridAccounts: TDBGrid
    Left = 0
    Top = 0
    Width = 718
    Height = 201
    Align = alClient
    DataSource = PaymentDataMod.DSAccounts
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = XDBGridAccountsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ACC_NO_SEARCH'
        Title.Caption = 'Hesab '#8470' (axtar'#305#351' '#252#231#252'n)'
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACC_NO'
        Title.Caption = 'Hesab '#8470
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Hesab'#305'n ad'#305
        Width = 300
        Visible = True
      end>
  end
end
