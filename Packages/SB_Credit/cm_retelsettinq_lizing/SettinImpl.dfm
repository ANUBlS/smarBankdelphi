object FrmSetting: TFrmSetting
  Left = 0
  Top = 0
  ClientHeight = 716
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 504
    Height = 136
    Align = alTop
    Caption = '  M'#252#351't'#601'rinin tipi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 500
      Height = 94
      Align = alClient
      DataSource = DmRt.SrcPersons
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'persons'
          Title.Caption = 'M'#252#351't'#601'rinin tipi'
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rezdents'
          Title.Caption = 'Rezdent'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vid'
          Title.Caption = 'M'#252'lkiyy'#601't n'#246'v'#252
          Width = 159
          Visible = True
        end>
    end
    object XDBNavigator4: TXDBNavigator
      Left = 2
      Top = 109
      Width = 500
      Height = 25
      DataSource = DmRt.SrcPersons
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alBottom
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 136
    Width = 504
    Height = 139
    Align = alTop
    Caption = '  Kredit m'#601'hsullar'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object XDBNavigator2: TXDBNavigator
      Left = 2
      Top = 112
      Width = 500
      Height = 25
      DataSource = DmRt.SrcPersonLink
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alBottom
      TabOrder = 0
      OnClick = XDBNavigator2Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 500
      Height = 97
      Align = alClient
      DataSource = DmRt.SrcPersonLink
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Color = clWhite
          Expanded = False
          FieldName = 'KOD'
          Title.Color = clBlue
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          PopupMenu = PopupMenu1
          Title.Caption = 'M'#601'hsulun ad'#305' '
          Title.Color = clBlue
          Width = 216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sal'
          Title.Caption = 'Sat'#305#351' n'#246'v'#252
          Width = 118
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 275
    Width = 504
    Height = 118
    Align = alTop
    Caption = '  Valyutalar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 500
      Height = 101
      Align = alClient
      DataSource = DmRt.DSrcMeh
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'VALUTE'
          ReadOnly = True
          Title.Caption = '$'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALU_NAME'
          Title.Caption = 'Ad'#305
          Width = 262
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 393
    Width = 504
    Height = 114
    Align = alTop
    Caption = 'Period'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object XDBNavigator3: TXDBNavigator
      Left = 2
      Top = 87
      Width = 500
      Height = 25
      DataSource = DmRt.PeriodSrc
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alBottom
      TabOrder = 0
    end
    object DBGrid4: TDBGrid
      Left = 2
      Top = 15
      Width = 500
      Height = 72
      Align = alClient
      DataSource = DmRt.PeriodSrc
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'PERIOD'
          Title.Caption = '  Kreditin periodu'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pername'
          Title.Caption = 'Peiodun ad'#305
          Visible = True
        end>
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 507
    Width = 504
    Height = 209
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = '  &Faizl'#601'r'
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 496
        Height = 181
        Align = alClient
        Caption = '  M'#601'bl'#601#287#601' g'#246'r'#601' % l'#601'rin sazlan'#305'lmas'#305
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object XDBGrid1: TXDBGrid
          Left = 2
          Top = 15
          Width = 492
          Height = 139
          Align = alClient
          DataSource = DmRt.DsrcPercent
          GridStyle.VisualStyle = vsXPStyle
          TabOrder = 0
          TitleLinesCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'BPER'
              Title.Alignment = taCenter
              Title.Caption = 'Ba'#351'lan'#287#305'c   m'#601'bl'#601#287
              Visible = True
              Width = 70
            end
            item
              Expanded = False
              FieldName = 'EPER'
              Title.Alignment = taCenter
              Title.Caption = 'Son m'#601'bl'#601#287
              Visible = True
              Width = 57
            end
            item
              Expanded = False
              FieldName = 'FAIZ'
              Title.Alignment = taCenter
              Title.Caption = 'Fiaz d'#601'r'#601'c'#601'si'
              Visible = True
              Width = 62
            end
            item
              Expanded = False
              FieldName = 'GECFAIZ'
              Title.Alignment = taCenter
              Title.Caption = 'Gecikm'#601' faizi'
              Visible = True
              Width = 58
            end
            item
              Expanded = False
              FieldName = 'PENYA'
              Title.Alignment = taCenter
              Title.Caption = 'C'#601'rim'#601' faizi'
              Visible = True
              Width = 59
            end
            item
              Expanded = False
              FieldName = 'KOMISSIA'
              Title.Caption = 'R'#601'siml'#601#351'm'#601' komissionu'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AYLIQFAIZ'
              Title.Caption = '1 ayl'#305'q xid haqq'#305
              Visible = True
              Width = 66
            end>
        end
        object XDBNavigator1: TXDBNavigator
          Left = 2
          Top = 154
          Width = 492
          Height = 25
          DataSource = DmRt.DsrcPercent
          VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
          Align = alBottom
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '  &Hesablar'
      ImageIndex = 1
      object GroupBox6: TGroupBox
        Left = 0
        Top = 0
        Width = 496
        Height = 181
        Align = alClient
        Caption = 'Valyutalara g'#246'r'#601' balans hesablar'#305'n'#305'n  sazlan'#305'lmas'#305
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object XDBGrid2: TXDBGrid
          Left = 2
          Top = 15
          Width = 492
          Height = 164
          Align = alClient
          DataSource = DmRt.DsrcRtAcc
          GridStyle.VisualStyle = vsXPStyle
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
          TabOrder = 0
          TitleLinesCount = 3
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = 'T'#601'yinat'#305
              Visible = True
              Width = 165
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'BAL_ACC'
              Title.Alignment = taCenter
              Title.Caption = 'Q'#305'sa. m balans hesablar'#305
              Visible = True
              Width = 97
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UBAL_ACC'
              Title.Caption = 'Uzun.m balans hesablar'#305
              Visible = True
              Width = 105
            end>
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 104
    object lavet1: TMenuItem
      Caption = 'Kredit  '#351'ablonunu daxil et  '
      OnClick = lavet1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Mqavilninxapnsazla1: TMenuItem
      Caption = 'M'#252'qavil'#601'nin '#231'ap'#305'n'#305' sazla '
      OnClick = Mqavilninxapnsazla1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Ehtiyyathesablarnn1: TMenuItem
      Caption = 'Ehtiyyat hesablar'#305'n'#305'n sazlan'#305'lmas'#305
      OnClick = Ehtiyyathesablarnn1Click
    end
  end
end
