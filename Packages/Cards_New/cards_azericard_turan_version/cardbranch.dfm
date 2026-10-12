object card_branch: Tcard_branch
  Left = 0
  Top = 0
  Caption = 'card_branch'
  ClientHeight = 305
  ClientWidth = 574
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
  object Label1: TLabel
    Left = 5
    Top = 59
    Width = 115
    Height = 17
    Caption = 'Plastik kart kodu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 5
    Top = 5
    Width = 28
    Height = 17
    Caption = 'Filial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 186
    Top = 0
    Width = 388
    Height = 305
    Align = alRight
    DataSource = DataMod_CARDS.dt_branchcode
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'BRANCHID'
        Title.Caption = 'Filial kodu'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRANCH_NAME'
        Title.Caption = 'Filial'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRANCH_CODE'
        Title.Caption = 'Filialin plastik kart kodu'
        Width = 150
        Visible = True
      end>
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 0
    Top = 24
    Width = 177
    Height = 21
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = DataMod_CARDS.filialsource
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 0
    Top = 80
    Width = 177
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 26
    Top = 120
    Width = 121
    Height = 25
    Caption = 'Yadda saxla'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 26
    Top = 184
    Width = 121
    Height = 25
    Caption = 'XML Al'
    TabOrder = 4
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 5
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 26
    Top = 225
    Width = 121
    Height = 25
    Caption = 'XML Al(Phone numbers)'
    TabOrder = 6
    Visible = False
    OnClick = Button4Click
  end
  object PopupMenu1: TPopupMenu
    Left = 248
    Top = 208
    object S1: TMenuItem
      Caption = 'Sil'
      OnClick = S1Click
    end
  end
end
