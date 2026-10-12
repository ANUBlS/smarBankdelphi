object frmAvto: TfrmAvto
  Left = 114
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Avtomobiles'
  ClientHeight = 243
  ClientWidth = 910
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 910
    Height = 243
    Align = alClient
    Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083' '#1097#1072#1075#1075#1099#1085#1076#1072' '#1084#1103#1083#1091#1084#1072#1090#1083#1072#1088
    TabOrder = 0
    ExplicitLeft = 9
    ExplicitHeight = 272
    object XFPanel1: TXFPanel
      Left = 2
      Top = 16
      Width = 906
      Height = 177
      Align = alClient
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitHeight = 161
      object DBGrid1: TDBGrid
        Left = 2
        Top = 2
        Width = 898
        Height = 169
        Align = alClient
        DataSource = DModuleKorporativ.DSMotorkasco
        DrawingStyle = gdsGradient
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'AvtoMarks'
            Title.Caption = #1052#1072#1088#1082#1072
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AvtoModels'
            Title.Caption = #1052#1086#1076#1077#1083
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KORPORATIV_INS_SUM'
            Title.Caption = #1057#1099#1100#1086#1088#1090#1072' '#1084#1103#1073#1083#1103#1100#1080
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DRIVECOST'
            Title.Caption = #1040#1074#1090#1086'. '#1076#1103#1081#1103#1088#1080
            Title.Color = clNavy
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BENEFICIARY'
            Title.Caption = #1060#1072#1081#1076#1072#1101#1102#1090#1094#1088#1103#1085
            Title.Color = clNavy
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AvtoColors'
            Title.Caption = #1056#1103#1085#1101#1080
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'avtotype'
            Title.Caption = #1058#1080#1087#1080
            Title.Color = clNavy
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDOUTPUTYEAR'
            PickList.Strings = (
              '1976'
              '1977'
              '1978'
              '1979'
              '1980'
              '1981'
              '1982'
              '1983'
              '1984'
              '1985'
              '1986'
              '1987'
              '1988'
              '1989'
              '1990'
              '1991'
              '1992'
              '1993'
              '1994'
              '1995'
              '1996'
              '1997'
              '1998'
              '1999'
              '2000'
              '2001'
              '2002'
              '2003'
              '2004'
              '2005'
              '2006'
              '2007'
              '2008'
              '2009'
              '2010'
              '2011'
              '2012'
              '2013'
              '2014'
              '2015'
              '2016'
              '2017'
              '2018'
              '2019'
              '2020')
            Title.Caption = #1041#1091#1088#1072#1093#1099#1083#1099#1096' '#1080#1083#1080
            Title.Color = clNavy
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDSTATENUM'
            Title.Caption = #1044#1102#1074#1083#1103#1090' '#8470' -'#1089#1080
            Title.Color = clNavy
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNDERFRAMENUM'
            Title.Caption = #1064#1072#1089#1089#1080' '#8470' -'#1089#1080
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDBANNUM'
            Title.Caption = #1041#1072#1085' '#8470' -'#1089#1080
            Title.Color = clNavy
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INSUREDENGINENUM'
            Title.Caption = #1052#1094#1097#1103#1088#1088#1080#1082' '#8470#1089#1080
            Title.Color = clNavy
            Width = 70
            Visible = True
          end>
      end
    end
    object XFPanel2: TXFPanel
      Left = 2
      Top = 193
      Width = 906
      Height = 48
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 179
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 10
        Width = 380
        Height = 27
        DataSource = DModuleKorporativ.DSMotorkasco
        Flat = True
        TabOrder = 0
      end
    end
  end
end
