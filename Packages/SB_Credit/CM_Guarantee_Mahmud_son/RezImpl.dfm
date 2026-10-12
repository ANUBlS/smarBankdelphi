object RezFrm: TRezFrm
  Left = 0
  Top = 0
  ClientHeight = 205
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 180
    Width = 218
    Height = 25
    DataSource = GurDm.RezSrc
    VisibleButtons = [nbPrior, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 176
    ExplicitWidth = 232
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 218
    Height = 180
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = GurDm.RezSrc
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    RowDetailPanel.Color = clBtnFace
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Title.Caption = 'Tarix'
        Width = 104
      end
      item
        EditButtons = <>
        FieldName = 'AMMOUNT'
        Footers = <>
        Title.Caption = 'M'#601'bl'#601#287
        Width = 81
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
