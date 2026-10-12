object FormTransacationManager: TFormTransacationManager
  Left = 0
  Top = 0
  Caption = 'FormTransacationManager'
  ClientHeight = 452
  ClientWidth = 798
  Color = clBtnFace
  TransparentColorValue = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMenu
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 798
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 79
    Caption = 'ToolBar1'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'Redakt'#601' etm'#601'k'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 79
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 87
      Top = 0
      Caption = 'T'#601'sdiq etm'#601'k'
      ImageIndex = 1
    end
    object ToolButton4: TToolButton
      Left = 166
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 174
      Top = 0
      Caption = #304'nkar etm'#601'k'
      ImageIndex = 2
    end
    object ToolButton6: TToolButton
      Left = 253
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 261
      Top = 0
      Caption = 'L'#601#287'v etm'#601'k'
      ImageIndex = 3
    end
  end
  object XFPanel1: TXFPanel
    Left = 0
    Top = 29
    Width = 798
    Height = 41
    Align = alTop
    Caption = 'XFPanel1'
    TabOrder = 1
    ExplicitTop = 24
  end
  object XFPanel2: TXFPanel
    Left = 0
    Top = 70
    Width = 798
    Height = 382
    Align = alClient
    Caption = 'XFPanel2'
    TabOrder = 2
    ExplicitLeft = 16
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object XDBGrid1: TXDBGrid
      Left = 1
      Top = 1
      Width = 796
      Height = 380
      Align = alClient
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
    end
  end
end
