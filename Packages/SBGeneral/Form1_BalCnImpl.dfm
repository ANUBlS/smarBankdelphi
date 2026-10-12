object FormBalCn1: TFormBalCn1
  Left = 0
  Top = 0
  ClientHeight = 444
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 148
    Align = alTop
    BevelKind = bkFlat
    TabOrder = 0
    object XDBGrid1: TXDBGrid
      Left = 1
      Top = 1
      Width = 756
      Height = 120
      Align = alTop
      DataSource = DataAcc.DSRC_bal_spr_parts1
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'PART'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARTNAME'
          Visible = True
          Width = 650
        end>
    end
    object Edit1: TEdit
      Left = 1
      Top = 121
      Width = 756
      Height = 22
      Align = alClient
      TabOrder = 0
      OnChange = Edit1Change
      ExplicitHeight = 21
    end
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 148
    Width = 762
    Height = 148
    Align = alClient
    BevelKind = bkFlat
    TabOrder = 1
    object XDBGrid2: TXDBGrid
      Left = 1
      Top = 1
      Width = 756
      Height = 120
      Align = alTop
      DataSource = DataAcc.DSRC_bal_spr_groups1
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      Columns = <
        item
          Expanded = False
          FieldName = 'GRP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRPNAME'
          Visible = True
          Width = 650
        end>
    end
    object Edit2: TEdit
      Left = 1
      Top = 121
      Width = 756
      Height = 22
      Align = alClient
      TabOrder = 1
      OnChange = Edit2Change
      ExplicitHeight = 21
    end
  end
  object XFPanel3: TXFPanel
    Left = 0
    Top = 296
    Width = 762
    Height = 148
    Align = alBottom
    TabOrder = 2
    object XDBGrid3: TXDBGrid
      Left = 1
      Top = 1
      Width = 760
      Height = 120
      Align = alTop
      DataSource = DataAcc.Dsrc_bal_spr3
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      OnDblClick = XDBGrid3DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BAL_CN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BALNAME'
          Visible = True
          Width = 650
        end>
    end
    object Edit3: TEdit
      Left = 1
      Top = 121
      Width = 685
      Height = 26
      Align = alClient
      TabOrder = 1
      OnChange = Edit3Change
      ExplicitHeight = 21
    end
    object XFButton1: TXFButton
      Left = 686
      Top = 121
      Width = 75
      Height = 26
      Align = alRight
      Caption = 'Q'#601'bul'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = XFButton1Click
    end
  end
end
