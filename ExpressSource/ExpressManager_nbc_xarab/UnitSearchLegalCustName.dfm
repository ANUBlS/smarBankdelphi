object FormSearchLegalCustName: TFormSearchLegalCustName
  Left = 0
  Top = 0
  Caption = #350#601'xsin axtar'#305#351#305
  ClientHeight = 470
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 525
    Height = 431
    Align = alClient
    Color = clWhite
    DataSource = ExpDataModule.SendDataSource
    DrawingStyle = gdsGradient
    GradientEndColor = clMedGray
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
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GENERALNAME'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'rinin Ad'#305
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_TYPE_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'M'#252#351't'#601'rinin tipi'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 525
    Height = 39
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 428
    object EditName: TEdit
      Left = 106
      Top = 6
      Width = 239
      Height = 21
      TabOrder = 0
      OnExit = EditIDExit
      OnKeyPress = EditIDKeyPress
    end
    object EditCust_Type: TEdit
      Left = 346
      Top = 6
      Width = 94
      Height = 21
      TabOrder = 1
      OnExit = EditIDExit
      OnKeyPress = EditIDKeyPress
    end
    object Button1: TButton
      Left = 446
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Q'#601'bul'
      TabOrder = 2
      OnClick = Button1Click
    end
    object EditID: TEdit
      Left = 13
      Top = 6
      Width = 93
      Height = 21
      TabOrder = 3
      OnExit = EditIDExit
      OnKeyPress = EditIDKeyPress
    end
  end
end
