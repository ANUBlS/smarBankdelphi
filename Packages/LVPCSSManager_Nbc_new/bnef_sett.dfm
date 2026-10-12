object Bn_Sett: TBn_Sett
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Benefisiar_settings'
  ClientHeight = 470
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object grid_opcodes: TDBGrid
    Left = 0
    Top = 41
    Width = 481
    Height = 429
    Align = alClient
    DataSource = DataMod.Dt_opcodes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = grid_opcodesTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Alignment = taCenter
        Title.Caption = 'Kod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = 'T'#601'yinat'
        Width = 300
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 481
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 112
    ExplicitTop = 8
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = #399'lav'#601' et'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 80
    object S1: TMenuItem
      Caption = 'Sil'
      OnClick = S1Click
    end
  end
end
