object frmNewTicket: TfrmNewTicket
  Left = 242
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Yeni tiket'
  ClientHeight = 329
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 302
    Height = 288
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 298
      Height = 139
      Align = alTop
      Caption = 'Кючцрян щесаб'
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 56
        Width = 18
        Height = 13
        Caption = 'Ады:'
        FocusControl = edAccName
      end
      object Label6: TLabel
        Left = 8
        Top = 96
        Width = 34
        Height = 13
        Caption = 'ВЮИН-и:'
        FocusControl = edAccInn
      end
      object Label3: TLabel
        Left = 8
        Top = 16
        Width = 41
        Height = 13
        Caption = 'Нюмряси:'
        FocusControl = edAccName
      end
      object edAccName: TDBEdit
        Left = 4
        Top = 72
        Width = 290
        Height = 21
        DataField = 'DACCNAME'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 1
        OnChange = edStrAmountChange
      end
      object edAccInn: TDBEdit
        Left = 4
        Top = 112
        Width = 290
        Height = 21
        DataField = 'DACCINN'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 2
        OnChange = edStrAmountChange
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 4
        Top = 32
        Width = 290
        Height = 21
        DataField = 'DACC_NO'
        DataSource = DataModuleTicketMan.AllTickets
        KeyField = 'ACC_NO'
        ListField = 'ACC_NO'
        ListSource = DataModuleTicketMan.Account
        TabOrder = 0
        OnExit = DBEdit4Change
      end
    end
    object GroupBox3: TGroupBox
      Left = 2
      Top = 241
      Width = 298
      Height = 45
      Align = alTop
      Caption = 'Мябляь'
      TabOrder = 2
      object Label16: TLabel
        Left = 8
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Тарих:'
      end
      object Label17: TLabel
        Left = 164
        Top = 22
        Width = 11
        Height = 13
        Caption = '№'
        FocusControl = DBEdit2
      end
      object DBEdit2: TDBEdit
        Left = 180
        Top = 18
        Width = 109
        Height = 21
        DataField = 'PNUM'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 1
        OnChange = edStrAmountChange
      end
      object edTicketDate: TDateTimePicker
        Left = 38
        Top = 18
        Width = 117
        Height = 21
        CalAlignment = dtaLeft
        Date = 38869.6590420602
        Time = 38869.6590420602
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnChange = edTicketDateChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 141
      Width = 298
      Height = 100
      Align = alTop
      Caption = 'Мябляь'
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 17
        Width = 45
        Height = 13
        Caption = 'Рягямля:'
        FocusControl = edAmmount
      end
      object Label1: TLabel
        Left = 8
        Top = 56
        Width = 36
        Height = 13
        Caption = 'Йазы иля:'
        FocusControl = edAmmount
      end
      object edAmmount: TDBEdit
        Left = 4
        Top = 33
        Width = 290
        Height = 21
        DataField = 'AMMOUNT'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 0
        OnChange = edStrAmountChange
        OnKeyPress = edAmmountKeyPress
      end
      object edStrAmount: TEdit
        Left = 4
        Top = 72
        Width = 290
        Height = 21
        ReadOnly = True
        TabOrder = 1
        OnChange = edStrAmountChange
      end
    end
  end
  object Panel2: TPanel
    Left = 302
    Top = 0
    Width = 305
    Height = 288
    Align = alRight
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object GroupBox5: TGroupBox
      Left = 2
      Top = 2
      Width = 301
      Height = 184
      Align = alTop
      Caption = 'Бенефисар'
      TabOrder = 0
      object Label7: TLabel
        Left = 8
        Top = 16
        Width = 74
        Height = 13
        Caption = 'Бенефисар банк:'
      end
      object Label8: TLabel
        Left = 8
        Top = 56
        Width = 81
        Height = 13
        Caption = 'Щесабын нюмярси:'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 8
        Top = 96
        Width = 18
        Height = 13
        Caption = 'Ады:'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 8
        Top = 136
        Width = 31
        Height = 13
        Caption = 'ВЮИН-и'
        FocusControl = DBEdit10
      end
      object DBLookupComboboxEh1: TDBLookupComboBox
        Left = 4
        Top = 32
        Width = 290
        Height = 21
        DataField = 'KBANKFILIAL'
        DataSource = DataModuleTicketMan.AllTickets
        KeyField = 'ID'
        ListField = 'BNAME'
        ListSource = DataModuleTicketMan.BankM
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 4
        Top = 72
        Width = 290
        Height = 21
        DataField = 'KACC_NO'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 1
        OnChange = edStrAmountChange
      end
      object DBEdit9: TDBEdit
        Left = 4
        Top = 112
        Width = 290
        Height = 21
        DataField = 'KACCNAME'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 2
        OnChange = edStrAmountChange
      end
      object DBEdit10: TDBEdit
        Left = 4
        Top = 152
        Width = 290
        Height = 21
        DataField = 'KACCINN'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 3
        OnChange = edStrAmountChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 186
      Width = 301
      Height = 100
      Align = alTop
      Caption = 'Ялавя'
      TabOrder = 1
      object Label14: TLabel
        Left = 8
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Тяйинаты:'
        FocusControl = DBEdit4
      end
      object Label15: TLabel
        Left = 8
        Top = 56
        Width = 86
        Height = 13
        Caption = 'Ялавя информасийа:'
        FocusControl = DBEdit5
      end
      object DBEdit4: TDBEdit
        Left = 4
        Top = 32
        Width = 290
        Height = 21
        DataField = 'DESCRIPTION'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 0
        OnChange = edStrAmountChange
      end
      object DBEdit5: TDBEdit
        Left = 4
        Top = 72
        Width = 290
        Height = 21
        DataField = 'INFORMATION'
        DataSource = DataModuleTicketMan.AllTickets
        TabOrder = 1
        OnChange = edStrAmountChange
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 288
    Width = 607
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object btnSave: TButton
      Left = 430
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Йаддаша йаз'
      Enabled = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object Button2: TButton
      Left = 518
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Баьла'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
