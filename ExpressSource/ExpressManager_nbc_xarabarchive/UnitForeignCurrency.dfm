object FormForeignCurrency: TFormForeignCurrency
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Foreign Currency'
  ClientHeight = 172
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 172
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 28
      Width = 293
      Height = 27
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 9
        Top = 7
        Width = 65
        Height = 13
        Caption = 'Hesab'#305'n ad'#305
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLCBAccount: TDBLookupComboBox
        Left = 80
        Top = 3
        Width = 209
        Height = 21
        KeyField = 'ID'
        ListField = 'ACC_NO'
        ListSource = FormPaymentsCredit.DSAccNo
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 55
      Width = 293
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 9
        Top = 8
        Width = 105
        Height = 13
        Caption = 'Komissiya m'#601'bl'#601#287'i'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CmCurForeginEdit: TCMCurrencyEdit
        Left = 130
        Top = 3
        Width = 160
        Height = 21
        TabOrder = 0
        Text = '0'
      end
    end
    object Button1: TButton
      Left = 70
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Yadda'#351'a yaz'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 151
      Top = 139
      Width = 75
      Height = 25
      Caption = #304'mtina'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 293
      Height = 27
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 9
        Top = 7
        Width = 25
        Height = 13
        Caption = #214'lk'#601
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBLCBCountry: TDBLookupComboBox
        Left = 38
        Top = 3
        Width = 252
        Height = 21
        KeyField = 'ID'
        ListField = 'CNTR_NAME'
        ListSource = FormPaymentsCredit.DSCountry
        TabOrder = 0
        OnClick = DBLCBCountryClick
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 105
      Width = 293
      Height = 28
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object DBLCBReport: TDBLookupComboBox
        Left = 2
        Top = 2
        Width = 289
        Height = 21
        Align = alTop
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = ExpDataModule.DSExpReport
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 83
      Width = 293
      Height = 22
      Align = alTop
      BevelInner = bvRaised
      BevelKind = bkSoft
      Caption = 'T'#601'yinat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
end
