object FFSForm: TFFSForm
  Left = 327
  Top = 146
  BorderIcons = [biSystemMenu]
  Caption = 'Axtar'#305#351
  ClientHeight = 156
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 500
    Height = 122
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '  '#1040#1093#1090#1072#1088#1099#1096'  '
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 492
        Height = 92
        Align = alTop
        Caption = #1040#1093#1090#1072#1088#1099#1096
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 24
          Width = 49
          Height = 14
          Caption = #1065#1072#1088#1072#1076#1072' : '
        end
        object Label2: TLabel
          Left = 5
          Top = 62
          Width = 43
          Height = 14
          Caption = #1053#1103#1081#1080'    : '
        end
        object CBSearchWhere: TDBLookupComboboxEh
          Left = 57
          Top = 19
          Width = 346
          Height = 22
          DropDownBox.Sizable = True
          EditButtons = <>
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'FIELDNAME'
          ListField = 'FIELDDESC'
          ListSource = SFDataModule.DSEnabledFieldsData
          ParentFont = False
          TabOrder = 0
          Visible = True
        end
        object CmbBoxFindWhat: TComboBox
          Left = 57
          Top = 54
          Width = 311
          Height = 22
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnKeyPress = CmbBoxFindWhatKeyPress
        end
        object BitBtnFindNext: TBitBtn
          Left = 390
          Top = 52
          Width = 84
          Height = 27
          Caption = #1040#1093#1090#1072#1088
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitBtnFindNextClick
        end
      end
    end
  end
  object BitBtn2: TBitBtn
    Left = 410
    Top = 129
    Width = 81
    Height = 27
    Caption = '&'#1041#1072#1101#1083#1072
    DoubleBuffered = True
    Kind = bkClose
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
  end
end
