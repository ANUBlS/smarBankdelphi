object Form1: TForm1
  Left = 0
  Top = 0
  ClientHeight = 71
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 359
    Height = 41
    Align = alTop
    Caption = 'Birg'#601' borcalan'#305' se'#231'in'
    TabOrder = 0
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 3
      Top = 17
      Width = 352
      Height = 21
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = CUPaymentDataModule.DSRC_CUST_COMBİNED
      TabOrder = 0
    end
  end
  object XFBitBtn1: TXFBitBtn
    Left = 206
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Q'#601'bul '
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = XFBitBtn1Click
    Gradient.EndColor = clAppWorkSpace
  end
  object XFBitBtn2: TXFBitBtn
    Left = 283
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = XFBitBtn2Click
    Gradient.EndColor = clGrayText
  end
end
