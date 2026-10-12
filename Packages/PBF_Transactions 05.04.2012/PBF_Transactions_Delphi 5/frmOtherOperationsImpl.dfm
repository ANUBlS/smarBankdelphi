object frmOtherOperations: TfrmOtherOperations
  Left = 468
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'frmOtherOperations'
  ClientHeight = 120
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 115
    Top = 2
    Width = 63
    Height = 13
    Caption = 'ёд€ниш нювц:'
  end
  object Label2: TLabel
    Left = 3
    Top = 41
    Width = 38
    Height = 13
    Caption = 'ћ€бл€ь:'
  end
  object Label4: TLabel
    Left = 6
    Top = 3
    Width = 23
    Height = 13
    Caption = '“арих'
  end
  object Label3: TLabel
    Left = 118
    Top = 41
    Width = 40
    Height = 13
    Caption = '“€йинаты:'
  end
  object ComboBox1: TComboBox
    Left = 114
    Top = 19
    Width = 169
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
    Items.Strings = (
      'AZERCELL'
      'BAKCELL'
      'GAS'
      'LIGHT'
      'NAR'
      'WATER'
      'SUMLIGHT')
  end
  object DBEditEh1: TDBEditEh
    Left = 3
    Top = 57
    Width = 106
    Height = 21
    DataField = 'AMOUNT'
    DataSource = dmpbf_transaction.PBFOperationsds
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object BitBtn1: TBitBtn
    Left = 74
    Top = 86
    Width = 75
    Height = 25
    Caption = '√€бул'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 162
    Top = 86
    Width = 75
    Height = 25
    Caption = '»мтина'
    ModalResult = 2
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 4
    Top = 19
    Width = 106
    Height = 21
    CalAlignment = dtaLeft
    Date = 40139.5161877894
    Time = 40139.5161877894
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 115
    Top = 57
    Width = 170
    Height = 21
    DataField = 'NAME'
    DataSource = dmpbf_transaction.PBFOperationsds
    TabOrder = 3
  end
end
