object frmTuning: TfrmTuning
  Left = 272
  Top = 134
  BorderStyle = bsDialog
  Caption = 'Sazlama'
  ClientHeight = 346
  ClientWidth = 191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 27
    Width = 191
    Height = 319
    Align = alClient
    DataSource = MOrdDataMod.DataSrcMemorial
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 191
    Height = 27
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 2
      Top = 2
      Width = 187
      Height = 23
      DataSource = MOrdDataMod.DataSrcMemorial
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
    end
  end
end
