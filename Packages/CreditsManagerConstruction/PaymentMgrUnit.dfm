object PaymentAddForm: TPaymentAddForm
  Left = 479
  Top = 157
  BorderIcons = [biSystemMenu]
  Caption = 'PaymentForm'
  ClientHeight = 141
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 210
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 305
    Top = 104
    Width = 75
    Height = 25
    Caption = #304'mtina'
    DoubleBuffered = True
    ModalResult = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 402
    Height = 42
    Align = alTop
    Caption = #399'm'#601'liyyat tarixi'
    TabOrder = 2
    object Label1: TLabel
      Left = 197
      Top = 16
      Width = 88
      Height = 13
      Caption = #1070#1076#1103#1085#1080#1096' '#1084#1103#1073#1083#1103#1100':'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DTPOpDate: TDateTimePicker
      Left = 9
      Top = 14
      Width = 186
      Height = 21
      Date = 38995.716761608800000000
      Time = 38995.716761608800000000
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditPayAmt: TEdit
      Left = 286
      Top = 12
      Width = 108
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '0'
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 42
    Width = 402
    Height = 46
    Align = alTop
    Caption = 'T'#601'yinat'
    TabOrder = 3
    object SearchEdit1: TSearchEdit
      Left = 3
      Top = 41
      Width = 186
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'SearchEdit1'
      Visible = False
      Partnership = DBViewComboBox1
      DataSource = OrderForm.CashDatSrc
      SearchField = 'ACC_NO'
    end
    object DBViewComboBox1: TDBViewComboBox
      Left = 56
      Top = 14
      Width = 343
      Height = 21
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'DBViewComboBox1 - DescriptionDataSet { NAME }'
      OnChange = DBViewComboBox1Change
      ListSource = DatModConstruction.DescriptionDataSet
      ListFields = 'NAME'
      FieldInterval = 5
      DropDownOnEnter = False
    end
    object Edit1: TEdit
      Left = 9
      Top = 15
      Width = 42
      Height = 21
      TabOrder = 2
    end
  end
end
