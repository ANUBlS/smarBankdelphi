object RejectForm: TRejectForm
  Left = 0
  Top = 0
  Caption = 'RejectForm'
  ClientHeight = 163
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 313
    Height = 121
    TabOrder = 0
  end
  object Button1: TButton
    Left = 112
    Top = 130
    Width = 75
    Height = 25
    Caption = 'Imtina'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 8
    Top = 134
    Width = 41
    Height = 21
    TabOrder = 2
    Text = 'Edit6'
    Visible = False
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 248
    Top = 112
  end
end
