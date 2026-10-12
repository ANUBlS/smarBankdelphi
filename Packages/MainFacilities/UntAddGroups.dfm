object FrmAddGroups: TFrmAddGroups
  Left = 274
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Adding new group'
  ClientHeight = 180
  ClientWidth = 410
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
    Width = 410
    Height = 180
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 408
      Height = 44
      Align = alTop
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 185
        Height = 42
        Align = alLeft
        TabOrder = 0
        object EGroupName: TEdit
          Left = 1
          Top = 19
          Width = 182
          Height = 21
          TabOrder = 0
        end
        object StaticText1: TStaticText
          Left = 1
          Top = 1
          Width = 183
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'Групун ады'
          Color = clNavy
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel4: TPanel
        Left = 186
        Top = 1
        Width = 221
        Height = 42
        Align = alClient
        TabOrder = 1
        object StaticText2: TStaticText
          Left = 1
          Top = 1
          Width = 219
          Height = 17
          Align = alTop
          Alignment = taCenter
          Caption = 'Амортизасийа %  '
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
        object EGroupAmortTAX: TEdit
          Left = 145
          Top = 19
          Width = 73
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 2
          OnKeyPress = EGroupAmortNBKeyPress
        end
        object StaticText3: TStaticText
          Left = 1
          Top = 18
          Width = 42
          Height = 23
          Align = alLeft
          Anchors = [akTop, akRight, akBottom]
          AutoSize = False
          Caption = ' НБ'
          Color = clNavy
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 3
        end
        object EGroupAmortNB: TEdit
          Left = 45
          Top = 19
          Width = 65
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnKeyPress = EGroupAmortNBKeyPress
        end
        object StaticText4: TStaticText
          Left = 112
          Top = 18
          Width = 31
          Height = 39
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = ' Верэи'
          Color = clNavy
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 4
        end
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 45
      Width = 408
      Height = 134
      Align = alClient
      TabOrder = 1
      object StaticText5: TStaticText
        Left = 1
        Top = 1
        Width = 406
        Height = 17
        Align = alTop
        Alignment = taCenter
        Caption = 'Ясас вясаит цчцн щесаблар'
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
      object Panel6: TPanel
        Left = 1
        Top = 18
        Width = 203
        Height = 115
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 203
          Height = 42
          Align = alTop
          TabOrder = 0
          object StaticText6: TStaticText
            Left = 1
            Top = 1
            Width = 201
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Ясас вясаит'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CBMainAccount: TComboBox
            Left = 3
            Top = 20
            Width = 199
            Height = 21
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = CBMainAccountChange
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 42
          Width = 203
          Height = 42
          Align = alTop
          TabOrder = 1
          object StaticText7: TStaticText
            Left = 1
            Top = 1
            Width = 201
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Амортизасийа / Кредит'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CBAmortAccount: TComboBox
            Left = 3
            Top = 20
            Width = 199
            Height = 21
            Anchors = [akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = CBMainAccountChange
          end
        end
      end
      object Panel7: TPanel
        Left = 204
        Top = 18
        Width = 203
        Height = 115
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 203
          Height = 42
          Align = alTop
          TabOrder = 0
          object StaticText8: TStaticText
            Left = 1
            Top = 1
            Width = 201
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Хярж / Дебет'
            Color = clSilver
            ParentColor = False
            TabOrder = 1
          end
          object CBExpAccount: TComboBox
            Left = 2
            Top = 20
            Width = 198
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBMainAccountChange
          end
        end
        object Panel11: TPanel
          Left = 0
          Top = 42
          Width = 203
          Height = 42
          Align = alTop
          TabOrder = 1
          object StaticText9: TStaticText
            Left = 1
            Top = 1
            Width = 201
            Height = 17
            Align = alTop
            Alignment = taCenter
            Caption = 'Алгы - Сатгы / Зяряр'
            Color = clSilver
            ParentColor = False
            TabOrder = 0
          end
          object CBSaleAccount: TComboBox
            Left = 2
            Top = 20
            Width = 198
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            OnChange = CBMainAccountChange
          end
        end
        object Button1: TButton
          Left = 45
          Top = 88
          Width = 75
          Height = 25
          Action = ActionCommit
          TabOrder = 2
        end
        object Button2: TButton
          Left = 126
          Top = 88
          Width = 75
          Height = 25
          Action = ActionCancel
          TabOrder = 3
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 192
    Top = 13
    object ActionCommit: TAction
      Caption = 'Гябул'
      OnExecute = ActionCommitExecute
      OnUpdate = ActionCommitUpdate
    end
    object ActionCancel: TAction
      Caption = 'Имтина'
      OnExecute = ActionCancelExecute
    end
  end
end
