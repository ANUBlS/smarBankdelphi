object FrmQuery: TFrmQuery
  Left = 368
  Top = 111
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Calculate Amortization'
  ClientHeight = 279
  ClientWidth = 247
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 247
    Height = 179
    Align = alTop
    TabOrder = 0
    object SpeedButton3: TSpeedButton
      Left = 152
      Top = 152
      Width = 43
      Height = 22
      Caption = 'Имтина'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 105
      Top = 152
      Width = 43
      Height = 22
      Caption = 'Гябул'
      Flat = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton1: TSpeedButton
      Left = 199
      Top = 152
      Width = 43
      Height = 22
      Caption = 'Ялавя..'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 245
      Height = 44
      Align = alTop
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 1
        Top = 1
        Width = 243
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Сон амортизасийа тарихи'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object ELastClosedMonth: TEdit
        Left = 1
        Top = 20
        Width = 243
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 53
      Width = 245
      Height = 44
      Align = alTop
      TabOrder = 1
      object StaticText2: TStaticText
        Left = 1
        Top = 1
        Width = 243
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Щесабланажаг амортизасийа тарихи'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object DTPNewCloseDate: TDateTimePicker
        Left = 133
        Top = 20
        Width = 21
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CalAlignment = dtaLeft
        Date = 37540.6901359491
        Time = 37540.6901359491
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DTPNewCloseDateChange
      end
      object ENewCloseDate: TEdit
        Left = 2
        Top = 20
        Width = 130
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 2
      end
      object SpinEditDays: TSpinEdit
        Left = 155
        Top = 20
        Width = 47
        Height = 22
        MaxValue = 365
        MinValue = 1
        TabOrder = 3
        Value = 1
        OnKeyPress = SpinEditDaysKeyPress
      end
      object StaticText3: TStaticText
        Left = 204
        Top = 20
        Width = 39
        Height = 17
        Caption = '-эцнлцк'
        Color = clSilver
        ParentColor = False
        TabOrder = 4
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 105
      Width = 245
      Height = 44
      Align = alTop
      TabOrder = 2
      object StaticText4: TStaticText
        Left = 1
        Top = 1
        Width = 243
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Апарылажаг ямялиййатын тарихи'
        Color = clSilver
        ParentColor = False
        TabOrder = 0
      end
      object EOperationDate: TEdit
        Left = 1
        Top = 20
        Width = 219
        Height = 21
        TabOrder = 1
      end
      object DTPOperationDate: TDateTimePicker
        Left = 222
        Top = 20
        Width = 21
        Height = 21
        CalAlignment = dtaLeft
        Date = 37861.7849230556
        Time = 37861.7849230556
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
        OnChange = DTPOperationDateChange
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 97
      Width = 245
      Height = 8
      Align = alTop
      BevelInner = bvSpace
      Color = clNavy
      TabOrder = 3
    end
    object Panel6: TPanel
      Left = 1
      Top = 45
      Width = 245
      Height = 8
      Align = alTop
      BevelInner = bvSpace
      Color = clNavy
      TabOrder = 4
    end
  end
  object NotesMemo: TMemo
    Left = 0
    Top = 200
    Width = 247
    Height = 79
    Align = alTop
    Color = clMenu
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
  object TranzProgressBar: TProgressBar
    Left = 0
    Top = 179
    Width = 247
    Height = 21
    Align = alTop
    Min = 0
    Max = 100
    TabOrder = 2
    Visible = False
  end
end
