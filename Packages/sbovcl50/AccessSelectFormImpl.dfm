object AccessSelectForm: TAccessSelectForm
  Left = 222
  Top = 112
  Caption = 'AccessSelectForm'
  ClientHeight = 224
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 198
    Width = 309
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      309
      26)
    object Button1: TButton
      Left = 158
      Top = 1
      Width = 75
      Height = 25
      Action = Accept
      Anchors = [akTop, akRight]
      Default = True
      TabOrder = 0
    end
    object Button2: TButton
      Left = 234
      Top = 1
      Width = 75
      Height = 25
      Action = Cancel
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 309
    Height = 198
    Align = alClient
    Caption = #1065#1091#1075#1091#1075#1083#1072#1088#1099#1085' '#1089#1077#1095#1080#1083#1084#1103#1089#1080
    TabOrder = 1
    object AccessCB: TCheckListBox
      Left = 2
      Top = 15
      Width = 305
      Height = 181
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 264
    Top = 8
    object Accept: TAction
      Caption = #1071#1083#1072#1074#1103' '#1077#1090
      OnExecute = AcceptExecute
    end
    object Cancel: TAction
      Caption = #1048#1084#1090#1080#1085#1072
      OnExecute = CancelExecute
    end
  end
  object AccessData: TOracleDataSet
    SQL.Strings = (
      'select * from security_access$'
      'where ID in ('
      '  select access#'
      '  from SECURITY_TYPED_ACCESS'
      '  where Type# = ('
      '    select type# from security_sid$'
      '    where ID = :sid'
      '  )'
      ')'
      'and not (ID in ('
      '    select distinct sla.access#'
      '    from security_sid_link_access sla'
      '    where link# = :LinkID'
      '  ))'
      ' ')
    Optimize = False
    Variables.Data = {
      0400000002000000080000003A00530049004400030000000000000000000000
      0E0000003A004C0049004E004B0049004400030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      05000000040000000400000049004400010000000000080000004E0041004D00
      4500010000000000160000004400450053004300520049005000540049004F00
      4E000100000000001000000050004100520045004E0054004900440001000000
      0000}
    Session = sboapiDataModule.SBSession
    AfterOpen = AccessDataAfterOpen
    Left = 144
    Top = 56
    object AccessDataID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object AccessDataNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 32
    end
    object AccessDataDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Required = True
      Size = 256
    end
  end
end
