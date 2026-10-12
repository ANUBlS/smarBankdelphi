object fmBalSettings: TfmBalSettings
  Left = 293
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Sazlama'
  ClientHeight = 458
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 421
    Height = 428
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Баланс щесаблары'
      object Splitter1: TSplitter
        Left = 0
        Top = 209
        Width = 413
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 413
        Height = 209
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 25
          Width = 413
          Height = 184
          Align = alClient
          DataSource = InsDataMod.DSAcc_types
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Caption = 'Щесаб адлары'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 413
          Height = 25
          DataSource = InsDataMod.DSAcc_types
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 212
        Width = 413
        Height = 188
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 25
          Width = 413
          Height = 163
          Align = alClient
          DataSource = InsDataMod.DSBal_cn
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Azl Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Color = clWhite
              Expanded = False
              FieldName = 'BAL_CN'
              Title.Caption = 'Баланс щесаблары'
              Title.Color = clNavy
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Azl Sans Serif'
              Title.Font.Style = []
              Width = 377
              Visible = True
            end>
        end
        object DBNavigator2: TDBNavigator
          Left = 0
          Top = 0
          Width = 413
          Height = 25
          DataSource = InsDataMod.DSBal_cn
          Align = alTop
          Flat = True
          TabOrder = 1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 428
    Width = 421
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 264
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 344
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
