object IncomeForm: TIncomeForm
  Left = 0
  Top = 0
  Caption = 'Sub hesab...'
  ClientHeight = 270
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 229
    Align = alClient
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 0
    object XDBGridAccounts: TXDBGrid
      Left = 2
      Top = 2
      Width = 649
      Height = 221
      Align = alClient
      DataSource = QKİmportDataMod.DSRC_FormIncomeAcc
      GridStyle.VisualStyle = vsXPStyle
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgExtendedSelect, dgInternalSelect, dgRowResize, dgRowScroll, dgHotButtons, dgTitleButtons, dgTitleHeaders, dgTitleWidthOff, dgMarkerAutoAlign, dgMarkerAutoToggle]
      TabOrder = 0
      OnDblClick = XDBGridAccountsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BAL_CN'
          Title.Caption = 'Balans '#8470
          Visible = True
          Width = 80
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
          FieldName = 'NAME'
          Title.Caption = 'Hesab'#305'n ad'#305
          Visible = True
          Width = 330
        end>
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 229
    Width = 657
    Height = 41
    Align = alBottom
    BevelInner = bvSpace
    BevelKind = bkFlat
    BevelOuter = bvSpace
    TabOrder = 1
    object XFButton1: TXFButton
      Left = 572
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
    object EditBal_Cn: TEdit
      Left = 14
      Top = 7
      Width = 67
      Height = 21
      TabOrder = 1
      OnChange = EditBal_CnChange
    end
    object EditACC_NO: TEdit
      Left = 82
      Top = 7
      Width = 182
      Height = 21
      TabOrder = 2
      OnChange = EditACC_NOChange
    end
    object EditName: TEdit
      Left = 266
      Top = 7
      Width = 231
      Height = 21
      TabOrder = 3
      OnChange = EditNameChange
    end
    object XFButton2: TXFButton
      Left = 502
      Top = 4
      Width = 67
      Height = 25
      Caption = 'Axtar'#351
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = XFButton2Click
    end
  end
  object ActionList1: TActionList
    Left = 392
    Top = 104
    object Action_Src: TAction
      Caption = 'Action_Src'
      OnExecute = Action_SrcExecute
    end
  end
end
