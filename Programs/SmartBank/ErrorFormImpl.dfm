object ErrorForm: TErrorForm
  Left = 281
  Top = 251
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'ErrorForm'
  ClientHeight = 213
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object DetailsMemo: TMemo
    Left = 0
    Top = 117
    Width = 389
    Height = 96
    Align = alTop
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Azl Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 84
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object MessageMemo: TMemo
      Left = 36
      Top = 0
      Width = 353
      Height = 84
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'MessageMemo')
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 36
      Height = 84
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 36
        Height = 36
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
    Top = 84
    Width = 389
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object OkButton: TButton
      Left = 86
      Top = 4
      Width = 97
      Height = 27
      Caption = 'Ok'
      TabOrder = 0
      OnClick = OkButtonClick
    end
    object DetailsButton: TButton
      Left = 196
      Top = 4
      Width = 115
      Height = 27
      Caption = 'Texniki informasiya'
      TabOrder = 1
      OnClick = DetailsButtonClick
    end
  end
end
