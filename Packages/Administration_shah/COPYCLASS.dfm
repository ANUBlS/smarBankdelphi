object CLSCOPY: TCLSCOPY
  Left = 390
  Top = 271
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'COPY CLASSES'
  ClientHeight = 214
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 174
    Top = 25
    Width = 47
    Height = 13
    Caption = 'S'#304'N'#304'FL'#399'R'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 249
    Top = 25
    Width = 81
    Height = 13
    Caption = 'YEN'#304' S'#304'NF'#304'N ADI'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 249
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Ba'#287'la'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 146
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Yadda saxla'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object clsnew: TEdit
    Left = 249
    Top = 57
    Width = 200
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object clsold: TDBViewComboBox
    Left = 21
    Top = 57
    Width = 200
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    ListSource = AdministrationData.Classes
    ListFields = 'OBJ'
    FieldInterval = 5
    DropDownOnEnter = False
  end
end
