object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Yeni taninma'
  ClientHeight = 203
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 162
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object XFLabel1: TXFLabel
      Left = 18
      Top = 8
      Width = 37
      Height = 14
      Caption = 'M'#601'bl'#601#287
    end
    object XFLabel2: TXFLabel
      Left = 251
      Top = 60
      Width = 70
      Height = 14
      Caption = 'Kredit hesab'#305
    end
    object XFLabel3: TXFLabel
      Left = 18
      Top = 57
      Width = 67
      Height = 14
      Caption = 'Debit hesab'#305
    end
    object XFLabel4: TXFLabel
      Left = 18
      Top = 108
      Width = 40
      Height = 14
      Caption = 'T'#601'yinat'
    end
    object CMCurrencyEdit1: TCMCurrencyEdit
      Left = 18
      Top = 28
      Width = 121
      Height = 22
      TabOrder = 0
      Text = '0'
    end
    object Edit1: TEdit
      Left = 18
      Top = 128
      Width = 401
      Height = 22
      TabOrder = 1
      Text = 'Edit1'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 18
      Top = 80
      Width = 213
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DMPayment.dsrotherdbhesab
      TabOrder = 2
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 251
      Top = 80
      Width = 157
      Height = 22
      KeyField = 'ID'
      ListField = 'ACC_NO'
      ListSource = DMPayment.dsrotherkdhesab
      TabOrder = 3
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 162
    Width = 425
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 227
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ok'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object XFButton2: TXFButton
      Left = 308
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = XFButton2Click
    end
  end
end
