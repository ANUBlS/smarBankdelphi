object StoredFileDialogForm: TStoredFileDialogForm
  Left = 335
  Top = 221
  BorderStyle = bsToolWindow
  Caption = 'Enter stored file name'
  ClientHeight = 69
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 48
    Height = 13
    Caption = 'File name:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 43
    Width = 351
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object CommitButton: TButton
      Left = 198
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Ok'
      Default = True
      TabOrder = 0
      OnClick = CommitButtonClick
    end
    object CancelButton: TButton
      Left = 275
      Top = 1
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      TabOrder = 1
    end
  end
  object FileNameEdit: TEdit
    Left = 96
    Top = 8
    Width = 249
    Height = 21
    TabOrder = 0
  end
end
