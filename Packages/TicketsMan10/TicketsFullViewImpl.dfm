object frmTicketFullView: TfrmTicketFullView
  Left = 193
  Top = 122
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tiket'
  ClientHeight = 502
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 502
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 23
      Height = 13
      Caption = '“арих'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 11
      Height = 13
      Caption = 'є'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 16
      Top = 88
      Width = 99
      Height = 13
      Caption = 'ёд€й€н банкын коду'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 128
      Width = 64
      Height = 13
      Caption = 'ёд€й€н банк'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 16
      Top = 168
      Width = 106
      Height = 13
      Caption = 'ёд€й€н банкын ¬ё»Ќ-и'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 16
      Top = 208
      Width = 136
      Height = 13
      Caption = 'ёд€й€н банкын SWIFT коду'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 16
      Top = 248
      Width = 139
      Height = 13
      Caption = 'ёд€й€н банкын мцхбир щесабы'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 16
      Top = 288
      Width = 69
      Height = 13
      Caption = 'ёд€й€н щесаб'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 16
      Top = 328
      Width = 94
      Height = 13
      Caption = 'ёд€й€н щесабын ады'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 16
      Top = 368
      Width = 111
      Height = 13
      Caption = 'ёд€й€н щесабын ¬ё»Ќ-и'
      FocusControl = DBEdit11
    end
    object Label13: TLabel
      Left = 336
      Top = 48
      Width = 83
      Height = 13
      Caption = 'јлан банкын коду'
      FocusControl = DBEdit13
    end
    object Label14: TLabel
      Left = 336
      Top = 88
      Width = 73
      Height = 13
      Caption = 'јлан банкын ады'
      FocusControl = DBEdit14
    end
    object Label15: TLabel
      Left = 336
      Top = 128
      Width = 90
      Height = 13
      Caption = 'јлан банкын ¬ё»Ќ-и'
      FocusControl = DBEdit15
    end
    object Label16: TLabel
      Left = 336
      Top = 168
      Width = 120
      Height = 13
      Caption = 'јлан банкын SWIFT коду'
      FocusControl = DBEdit16
    end
    object Label17: TLabel
      Left = 336
      Top = 208
      Width = 123
      Height = 13
      Caption = 'јлан банкын мцхбир щесабы'
      FocusControl = DBEdit17
    end
    object Label18: TLabel
      Left = 336
      Top = 248
      Width = 143
      Height = 13
      Caption = 'јлан банкын суб мцхбир щесабы'
      FocusControl = DBEdit18
    end
    object Label19: TLabel
      Left = 336
      Top = 288
      Width = 53
      Height = 13
      Caption = 'јлан щесаб'
      FocusControl = DBEdit19
    end
    object Label20: TLabel
      Left = 336
      Top = 328
      Width = 78
      Height = 13
      Caption = 'јлан щесабын ады'
      FocusControl = DBEdit20
    end
    object Label21: TLabel
      Left = 336
      Top = 368
      Width = 95
      Height = 13
      Caption = 'јлан щесабын ¬ё»Ќ-и'
      FocusControl = DBEdit21
    end
    object Label22: TLabel
      Left = 336
      Top = 408
      Width = 35
      Height = 13
      Caption = 'ћ€бл€ь'
      FocusControl = DBEdit22
    end
    object Label23: TLabel
      Left = 16
      Top = 408
      Width = 37
      Height = 13
      Caption = '“€йинаты'
      FocusControl = DBEdit23
    end
    object Label24: TLabel
      Left = 16
      Top = 448
      Width = 83
      Height = 13
      Caption = 'ялав€ информасийа'
      FocusControl = DBEdit24
    end
    object Label26: TLabel
      Left = 336
      Top = 8
      Width = 127
      Height = 13
      Caption = 'ям€лиййаты апаран истифад€чи'
      FocusControl = DBEdit26
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 24
      Width = 300
      Height = 21
      DataField = 'PDATE'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 64
      Width = 300
      Height = 21
      DataField = 'PNUM'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 104
      Width = 300
      Height = 21
      DataField = 'DBANKCODE'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 144
      Width = 300
      Height = 21
      DataField = 'DBANKNAME'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 184
      Width = 300
      Height = 21
      DataField = 'DBANKINN'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 224
      Width = 300
      Height = 21
      DataField = 'DBANKSWIFT'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 16
      Top = 264
      Width = 300
      Height = 21
      DataField = 'DBANKKACC'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 6
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 304
      Width = 300
      Height = 21
      DataField = 'DACC_NO'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 7
    end
    object DBEdit10: TDBEdit
      Left = 16
      Top = 344
      Width = 300
      Height = 21
      DataField = 'DACCNAME'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 16
      Top = 384
      Width = 300
      Height = 21
      DataField = 'DACCINN'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 9
    end
    object DBEdit13: TDBEdit
      Left = 336
      Top = 64
      Width = 300
      Height = 21
      DataField = 'KBANKCODE'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 10
    end
    object DBEdit14: TDBEdit
      Left = 336
      Top = 104
      Width = 300
      Height = 21
      DataField = 'KBANKNAME'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 11
    end
    object DBEdit15: TDBEdit
      Left = 336
      Top = 144
      Width = 300
      Height = 21
      DataField = 'KBANKINN'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 12
    end
    object DBEdit16: TDBEdit
      Left = 336
      Top = 184
      Width = 300
      Height = 21
      DataField = 'KBANKSWIFT'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 13
    end
    object DBEdit17: TDBEdit
      Left = 336
      Top = 224
      Width = 300
      Height = 21
      DataField = 'KBANKKACC'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 14
    end
    object DBEdit18: TDBEdit
      Left = 336
      Top = 264
      Width = 300
      Height = 21
      DataField = 'KBANKSUBKACC'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 15
    end
    object DBEdit19: TDBEdit
      Left = 336
      Top = 304
      Width = 300
      Height = 21
      DataField = 'KACC_NO'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 16
    end
    object DBEdit20: TDBEdit
      Left = 336
      Top = 344
      Width = 300
      Height = 21
      DataField = 'KACCNAME'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 17
    end
    object DBEdit21: TDBEdit
      Left = 336
      Top = 384
      Width = 300
      Height = 21
      DataField = 'KACCINN'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 18
    end
    object DBEdit22: TDBEdit
      Left = 336
      Top = 424
      Width = 300
      Height = 21
      DataField = 'AMMOUNT'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 19
    end
    object DBEdit23: TDBEdit
      Left = 16
      Top = 424
      Width = 300
      Height = 21
      DataField = 'DESCRIPTION'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 20
    end
    object DBEdit24: TDBEdit
      Left = 16
      Top = 464
      Width = 300
      Height = 21
      DataField = 'INFORMATION'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 21
    end
    object DBEdit26: TDBEdit
      Left = 336
      Top = 24
      Width = 300
      Height = 21
      DataField = 'TUSER'
      DataSource = DataModuleTicketMan.Tickets
      TabOrder = 22
    end
    object Button1: TButton
      Left = 528
      Top = 464
      Width = 105
      Height = 25
      Caption = 'Ѕаьла'
      TabOrder = 23
      OnClick = Button1Click
    end
  end
end
