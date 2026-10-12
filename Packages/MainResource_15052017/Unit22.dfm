object Form2: TForm2
  Left = 662
  Top = 203
  BorderIcons = [biSystemMenu]
  ClientHeight = 457
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid2: TDBGrid
    Left = 792
    Top = 352
    Width = 113
    Height = 377
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 457
    Align = alClient
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 246
      Height = 456
      Caption = #304'stifad'#601#231'ini daxil edin'
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 11
        Top = 56
        Width = 229
        Height = 349
        DataSource = DataModWares.DataSource2
        DrawingStyle = gdsGradient
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Ad'
            Visible = True
          end>
      end
      object Edit1: TEdit
        Left = 11
        Top = 24
        Width = 228
        Height = 24
        TabOrder = 1
      end
      object Button1: TButton
        Left = 11
        Top = 428
        Width = 75
        Height = 25
        Caption = 'Daxil et'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button3: TButton
        Left = 152
        Top = 424
        Width = 75
        Height = 25
        Caption = 'Sil'
        TabOrder = 3
        OnClick = Button3Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 251
      Top = 1
      Width = 249
      Height = 456
      Caption = #350#246'b'#601'ni daxil edin'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Edit2: TEdit
        Left = 15
        Top = 24
        Width = 228
        Height = 24
        TabOrder = 0
      end
      object Button2: TButton
        Left = 24
        Top = 428
        Width = 75
        Height = 25
        Caption = 'Daxil et'
        TabOrder = 1
        OnClick = Button2Click
      end
      object DBGrid3: TDBGrid
        Left = 15
        Top = 56
        Width = 231
        Height = 349
        DataSource = DataModWares.DataSource3
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = 'Ad'
            Visible = True
          end>
      end
      object Button4: TButton
        Left = 152
        Top = 424
        Width = 75
        Height = 25
        Caption = 'Sil'
        TabOrder = 3
        OnClick = Button4Click
      end
    end
  end
end
