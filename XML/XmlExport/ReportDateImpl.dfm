object ReportDateForm: TReportDateForm
  Left = 331
  Top = 266
  ActiveControl = CBDay
  BorderStyle = bsDialog
  Caption = 'Swith Report Date'
  ClientHeight = 102
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 460
    Height = 65
    Align = alTop
    Caption = 'Switch Report Date : '
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 456
      Height = 48
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 27
        Top = 15
        Width = 25
        Height = 13
        Caption = 'Day :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 102
        Top = 8
        Width = 2
        Height = 25
        Shape = bsRightLine
      end
      object Label2: TLabel
        Left = 124
        Top = 15
        Width = 36
        Height = 13
        Caption = 'Month :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 287
        Top = 8
        Width = 2
        Height = 25
        Shape = bsRightLine
      end
      object Label3: TLabel
        Left = 323
        Top = 15
        Width = 28
        Height = 13
        Caption = 'Year :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object CBDay: TComboBox
        Left = 55
        Top = 11
        Width = 45
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31')
      end
      object CBMonth: TComboBox
        Left = 164
        Top = 11
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'January'
          'February'
          'March'
          'April'
          'May'
          'June'
          'July'
          'August'
          'September'
          'October'
          'November'
          'December')
      end
      object CBYear: TComboBox
        Left = 366
        Top = 11
        Width = 70
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          '2001'
          '2002'
          '2003'
          '2004'
          '2005'
          '2006'
          '2007'
          '2008'
          '2009'
          '2010')
      end
    end
  end
  object btnOK: TButton
    Left = 303
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 383
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
