object FrmDelWares: TFrmDelWares
  Left = 282
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Delete Wares'
  ClientHeight = 132
  ClientWidth = 411
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 132
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 409
      Height = 61
      Align = alTop
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 1
        Top = 1
        Width = 407
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'ўесабдан силинм€'
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 1
        Top = 18
        Width = 200
        Height = 42
        Align = alLeft
        TabOrder = 1
        object StaticText2: TStaticText
          Left = 1
          Top = 1
          Width = 198
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = '„ыхарылма нюмр€си є'
          Color = clSilver
          ParentColor = False
          TabOrder = 1
        end
        object EOut_num: TEdit
          Left = 1
          Top = 19
          Width = 197
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 0
          Text = '1'
        end
      end
      object Panel4: TPanel
        Left = 201
        Top = 18
        Width = 207
        Height = 42
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Azl Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object StaticText3: TStaticText
          Left = 1
          Top = 1
          Width = 205
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = '„ыхарылма тарихи:'
          Color = clSilver
          ParentColor = False
          TabOrder = 0
        end
        object DTPOUT: TDateTimePicker
          Left = 187
          Top = 19
          Width = 20
          Height = 21
          Anchors = [akTop, akRight]
          CalAlignment = dtaLeft
          Date = 37535.4351971296
          Time = 37535.4351971296
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
          TabStop = False
          OnChange = DTPOUTChange
        end
        object EOffDate: TEdit
          Left = 1
          Top = 19
          Width = 184
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object ECause_out: TEdit
      Left = 2
      Top = 80
      Width = 407
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'ўесабдан силинир'
    end
    object StaticText4: TStaticText
      Left = 1
      Top = 62
      Width = 409
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = '„ыхарылма с€б€бл€ри:'
      Color = clSilver
      ParentColor = False
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 3
      Top = 103
      Width = 203
      Height = 17
      Caption = '¬€саит щесабдан силиндикд€н сонра екранда €кс олунмасын '
      Checked = True
      Color = clSilver
      ParentColor = False
      State = cbChecked
      TabOrder = 3
      Visible = False
    end
    object Button3: TButton
      Left = 333
      Top = 104
      Width = 75
      Height = 25
      Caption = '»мтина'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 256
      Top = 104
      Width = 75
      Height = 25
      Caption = '√€бул'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
end
