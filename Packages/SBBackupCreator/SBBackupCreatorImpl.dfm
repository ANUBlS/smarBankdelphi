object SBBackupCreatorMainForm: TSBBackupCreatorMainForm
  Left = 219
  Top = 374
  Width = 522
  Height = 109
  AutoSize = True
  Caption = 'Archive Generator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = ActiveFormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 109
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 1
      Top = 54
      Width = 520
      Height = 53
      Align = alTop
      Caption = #1040#1093#1080#1074#1083#1103#1096#1076#1080#1088#1084#1103#1085#1080#1085' '#1090#1080#1087#1080
      TabOrder = 0
      object CBExportMode: TComboBox
        Left = 9
        Top = 17
        Width = 276
        Height = 22
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          'Aktiv istifad'#601#231'inin sxemi'
          #220'mumi bazan'#305)
      end
      object Button1: TButton
        Left = 422
        Top = 17
        Width = 81
        Height = 27
        Caption = '&Yaratmaq'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 291
        Top = 6
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 520
      Height = 53
      Align = alTop
      Caption = #1040#1088#1093#1080#1074' '#1092#1072#1081#1083#1099#1085#1099#1085' '#1072#1076#1099
      TabOrder = 1
      object SBBrowse: TSpeedButton
        Left = 474
        Top = 17
        Width = 25
        Height = 24
        Hint = 'Browse ...'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = SBBrowseClick
      end
      object ArchiveFilePathEdit: TEdit
        Left = 9
        Top = 17
        Width = 457
        Height = 22
        TabOrder = 0
      end
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = 'dmp'
    FileName = 'EXPDAT.DMP'
    Filter = 'Archive Files(*.dmp)|*.dmp'
    Title = 'Save Archive File As ...'
    Left = 280
    Top = 65
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 328
    Top = 64
  end
end
