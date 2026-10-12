object BalanceFrm: TBalanceFrm
  Left = 0
  Top = 0
  Caption = 'Balans hesablar'#305'n'#305'n sazlan'#305'lmas'#305
  ClientHeight = 460
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCanResize = FormCanResize
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 296
    Height = 100
    Align = alTop
    DataSource = DmBudcet.StatusDSrc
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = 'Balans hesab'#305'n'#305'n tipi'
        Width = 243
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 100
    Width = 296
    Height = 335
    Align = alTop
    DataSource = DmBudcet.BalSrc
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BAL_CN'
        Title.Caption = 'Balans hesablar'#305
        Width = 242
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 435
    Width = 296
    Height = 25
    DataSource = DmBudcet.BalSrc
    VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alTop
    TabOrder = 2
  end
end
