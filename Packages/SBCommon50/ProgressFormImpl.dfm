object ProgressForm: TProgressForm
  Left = 267
  Top = 279
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'ProgressForm'
  ClientHeight = 81
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 52
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 2
      Width = 33
      Height = 13
      Caption = 'Action:'
    end
    object Label2: TLabel
      Left = 0
      Top = 19
      Width = 29
      Height = 13
      Caption = 'Done:'
    end
    object StatusPanel: TPanel
      Left = 40
      Top = 0
      Width = 225
      Height = 17
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = 'StatusPanel - LogMessage dislays here'
      TabOrder = 0
    end
    object ProgressBar: TProgressBar
      Left = 40
      Top = 17
      Width = 225
      Height = 16
      Smooth = True
      TabOrder = 1
    end
    object TotalPBPanel: TPanel
      Left = 0
      Top = 33
      Width = 273
      Height = 19
      BevelOuter = bvNone
      Caption = 'TotalPBPanel'
      TabOrder = 2
      object Label3: TLabel
        Left = 0
        Top = 2
        Width = 27
        Height = 13
        Caption = 'Total:'
      end
      object TotalProgressBar: TProgressBar
        Left = 40
        Top = 0
        Width = 225
        Height = 16
        Smooth = True
        TabOrder = 0
      end
    end
  end
  object ControlPanel: TPanel
    Left = 88
    Top = 56
    Width = 185
    Height = 25
    BevelOuter = bvNone
    TabOrder = 1
    object CancelButton: TButton
      Left = 104
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
    end
  end
end
