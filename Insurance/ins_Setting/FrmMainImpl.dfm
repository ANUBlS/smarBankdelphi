object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 475
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object XFGroupBox1: TXFGroupBox
    Left = 0
    Top = 0
    Width = 470
    Height = 142
    Hint = '142'
    Align = alTop
    Caption = 'S'#305#287'orta n'#246'vl'#601'ri'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 16
      Width = 466
      Height = 124
      Align = alClient
      DataSource = DMMain.DSRins_insurances
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Width = 300
          Visible = True
        end>
    end
  end
  object XFGroupBox2: TXFGroupBox
    Left = 0
    Top = 142
    Width = 470
    Height = 142
    Hint = '142'
    Align = alTop
    Caption = 'Hesab Tipl'#601'ri'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 2
      Top = 16
      Width = 466
      Height = 124
      Align = alClient
      DataSource = DMMain.DSRins_acc_types
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Width = 300
          Visible = True
        end>
    end
  end
  object XFGroupBox3: TXFGroupBox
    Left = 0
    Top = 284
    Width = 470
    Height = 142
    Hint = '142'
    Align = alTop
    Caption = 'Hesablar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 2
      Top = 49
      Width = 466
      Height = 91
      Align = alClient
      DataSource = DMMain.DSRins_acc_type_id
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TYPE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ACC_TYPE_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ACC_ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ACC_NO'
          Width = 300
          Visible = True
        end>
    end
    object XFPanel2: TXFPanel
      Left = 2
      Top = 16
      Width = 466
      Height = 33
      Align = alTop
      TabOrder = 1
      object XFButton2: TXFButton
        Left = 2
        Top = 2
        Width = 75
        Height = 25
        Caption = 'Yeni'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = XFButton2Click
      end
      object XFButton3: TXFButton
        Left = 83
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Redakte'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = XFButton3Click
      end
      object XFButton4: TXFButton
        Left = 164
        Top = 2
        Width = 75
        Height = 25
        Caption = 'Silm'#601'k'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = XFButton4Click
      end
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 426
    Width = 470
    Height = 49
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object XFButton1: TXFButton
      Left = 376
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Ba'#287'la'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = XFButton1Click
    end
  end
end
