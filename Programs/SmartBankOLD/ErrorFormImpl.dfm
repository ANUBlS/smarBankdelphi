object ErrorForm: TErrorForm
  Left = 281
  Top = 251
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'ErrorForm'
  ClientHeight = 198
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DetailsMemo: TMemo
    Left = 0
    Top = 109
    Width = 361
    Height = 89
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 361
    Height = 78
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object MessageMemo: TMemo
      Left = 33
      Top = 0
      Width = 328
      Height = 78
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'MessageMemo')
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 33
      Height = 78
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 33
        Height = 33
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040606060808080808080808080
          606060404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2020202020
          6020209F0000BF0000BF0000BF20209F404080808080606060202020FFFFFFFF
          FFFFFFFFFFFFFFFF00002020209F0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF20209F606080808080202020FFFFFFFFFFFF0000200000DF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000DF606080606060FF
          FFFFFFFFFF00007F0000FF0000FF3F3FFF0000FF0000FF0000FF0000FF0000FF
          3F3FFF0000FF0000FF20209F8080804040400000400000FF0000FF3F3FFFFFFF
          FFBFBFFF0000FF0000FF0000FFBFBFFFFFFFFF3F3FFF0000FF0000FF40408060
          606000007F0000FF0000FF0000FFBFBFFFFFFFFFBFBFFF0000FFBFBFFFFFFFFF
          BFBFFF0000FF0000FF0000FF20209F8080800000BF0000FF0000FF0000FF0000
          FFBFBFFFFFFFFFFFFFFFFFFFFFBFBFFF0000FF0000FF0000FF0000FF0000BF80
          80800000BF0000FF0000FF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFF0000FF
          0000FF0000FF0000FF0000FF0000BF8080800000BF0000FF0000FF0000FF0000
          FFBFBFFFFFFFFFFFFFFFFFFFFFBFBFFF0000FF0000FF0000FF0000FF0000BF60
          606000007F0000FF0000FF0000FFBFBFFFFFFFFFBFBFFF0000FFBFBFFFFFFFFF
          BFBFFF0000FF0000FF0000FF20209F4040400000400000FF0000FF3F3FFFFFFF
          FFBFBFFF0000FF0000FF0000FFBFBFFFFFFFFF3F3FFF0000FF0000FF202060FF
          FFFFFFFFFF00007F0000FF0000FF3F3FFF0000FF0000FF0000FF0000FF0000FF
          3F3FFF0000FF0000FF20209F202020FFFFFFFFFFFF0000200000DF0000FF0000
          FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000DF000020FFFFFFFF
          FFFFFFFFFFFFFFFF00002000007F0000FF0000FF0000FF0000FF0000FF0000FF
          0000FF00007F000020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          4000007F0000BF0000BF0000BF00007F000040FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Stretch = True
        Transparent = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 78
    Width = 361
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object OkButton: TButton
      Left = 80
      Top = 4
      Width = 90
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object DetailsButton: TButton
      Left = 182
      Top = 4
      Width = 107
      Height = 25
      Caption = 'Техники информасиййа'
      TabOrder = 1
      OnClick = DetailsButtonClick
    end
  end
end
