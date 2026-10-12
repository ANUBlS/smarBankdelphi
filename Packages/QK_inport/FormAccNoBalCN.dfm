object FormAccNo_BalCN: TFormAccNo_BalCN
  Left = 0
  Top = 0
  Caption = 'Sub hesab...'
  ClientHeight = 270
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 229
    Align = alClient
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 0
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 2
      Width = 766
      Height = 221
      Align = alClient
      DataSource = QKİmportDataMod.DSRC_ACCOUNT
      GridStyle.VisualStyle = vsXPStyle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
      TabOrder = 0
      OnDblClick = XDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BAL_CN1'
          Title.Caption = 'Balans '#8470
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACC_NO'
          Title.Caption = 'Hesab '#8470
          Visible = True
          Width = 180
        end
        item
          Expanded = False
          FieldName = 'OLD_ACC_NO'
          Title.Caption = 'ISIN Kod'
          Visible = True
          Width = 153
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'Hesab'#305'n ad'#305
          Visible = True
          Width = 340
        end>
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 229
    Width = 774
    Height = 41
    Align = alBottom
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 710
      Top = 3
      Width = 56
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object EditAcc_no: TEdit
      Left = 74
      Top = 7
      Width = 182
      Height = 21
      TabOrder = 1
      OnChange = EditAcc_noChange
    end
    object EditAcc_name: TEdit
      Left = 437
      Top = 7
      Width = 217
      Height = 21
      TabOrder = 2
      OnChange = EditAcc_nameChange
    end
    object XFButton2: TXFButton
      Left = 656
      Top = 3
      Width = 52
      Height = 25
      Caption = 'Axtar'#305#351
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = XFButton2Click
    end
    object EditBal_Cn: TEdit
      Left = 6
      Top = 7
      Width = 67
      Height = 21
      TabOrder = 4
      OnChange = EditBal_CnChange
    end
    object Edit_isin: TEdit
      Left = 258
      Top = 7
      Width = 177
      Height = 21
      TabOrder = 5
      OnChange = Edit_isinChange
    end
  end
  object ActionList_acc: TActionList
    Left = 392
    Top = 104
    object Action_Src: TAction
      Caption = 'Action_Src'
      OnExecute = Action_SrcExecute
    end
  end
end
