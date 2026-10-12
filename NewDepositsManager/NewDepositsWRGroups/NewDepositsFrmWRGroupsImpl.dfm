object NewDepositsFrmWRGroups: TNewDepositsFrmWRGroups
  Left = 0
  Top = 0
  Caption = 'M'#252'qavil'#601'lini Qrupla'#351'd'#305'rmaq'
  ClientHeight = 622
  ClientWidth = 514
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 622
    Align = alClient
    BevelInner = bvRaised
    BevelKind = bkTile
    BevelOuter = bvLowered
    TabOrder = 0
    object XFPanel2: TXFPanel
      Left = 2
      Top = 2
      Width = 239
      Height = 573
      Align = alLeft
      BevelInner = bvRaised
      BevelKind = bkTile
      BevelOuter = bvLowered
      TabOrder = 0
      object XDBGridContractType: TXDBGrid
        Left = 2
        Top = 2
        Width = 320
        Height = 565
        Align = alLeft
        DataSource = NewDepositsDMWRGroups.DMtypesDataSrc
        GridStyle.VisualStyle = vsXPStyle
        TabOrder = 0
        OnKeyPress = XDBGridContractTypeKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TYPE'
            Title.Alignment = taCenter
            Title.Caption = 'Depozitin tipi'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
            Width = 201
          end>
      end
    end
    object XFPanel3: TXFPanel
      Left = 2
      Top = 575
      Width = 506
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelKind = bkTile
      BevelOuter = bvLowered
      TabOrder = 1
      object XFButton1: TXFButton
        Left = 395
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Ba'#287'la'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = XFButton1Click
      end
    end
    object XFPanel4: TXFPanel
      Left = 241
      Top = 2
      Width = 267
      Height = 573
      Align = alClient
      BevelInner = bvRaised
      BevelKind = bkTile
      BevelOuter = bvLowered
      TabOrder = 2
      object XDBGridAllContract: TXDBGrid
        Left = 2
        Top = 2
        Width = 259
        Height = 295
        Align = alTop
        DataSource = NewDepositsDMWRGroups.DmWrTemplatesDataSrc
        GridStyle.VisualStyle = vsXPStyle
        TabOrder = 0
        OnDblClick = XDBGridAllContractDblClick
        OnKeyPress = XDBGridAllContractKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = 'B'#252't'#252'n M'#252'qavil'#601'l'#601'r'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
            Width = 210
          end>
      end
      object XFPanel5: TXFPanel
        Left = 2
        Top = 298
        Width = 259
        Height = 269
        Align = alBottom
        BevelInner = bvRaised
        BevelKind = bkTile
        BevelOuter = bvLowered
        TabOrder = 1
        object XDBGridSelectedContract: TXDBGrid
          Left = 2
          Top = 2
          Width = 320
          Height = 261
          Align = alLeft
          DataSource = NewDepositsDMWRGroups.DmWrGroupsDataSrc
          GridStyle.VisualStyle = vsXPStyle
          TabOrder = 0
          OnDblClick = XDBGridSelectedContractDblClick
          OnKeyDown = XDBGridSelectedContractKeyDown
          OnKeyPress = XDBGridSelectedContractKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'TempName'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Visible = True
              Width = 218
            end>
        end
      end
    end
  end
end
