object frm_Investisiya_setting: Tfrm_Investisiya_setting
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sazlama'
  ClientHeight = 382
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 382
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 487
    ExplicitHeight = 300
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 350
      Height = 380
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 485
      ExplicitHeight = 298
      object TabSheet1: TTabSheet
        Caption = #304'nvestisiya n'#246'v'#252
        ExplicitWidth = 477
        ExplicitHeight = 270
        object DBGrid1: TDBGrid
          Left = 0
          Top = 30
          Width = 342
          Height = 322
          Align = alClient
          DataSource = dmsettings.DsrInvestType
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 250
              Visible = True
            end>
        end
        object DBNavigator1: TDBNavigator
          Left = 0
          Top = 0
          Width = 342
          Height = 30
          DataSource = dmsettings.DsrInvestType
          Align = alTop
          TabOrder = 1
          ExplicitWidth = 477
        end
      end
      object TabSheet2: TTabSheet
        Caption = #304'nvestisiya m'#252'dd'#601'ti'
        ImageIndex = 1
        ExplicitWidth = 477
        ExplicitHeight = 270
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 342
          Height = 352
          Align = alClient
          DataSource = dmsettings.Dsr_İnvest_time
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 200
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Balans Hesabi'
        ImageIndex = 2
        ExplicitWidth = 477
        ExplicitHeight = 270
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 342
          Height = 137
          Align = alTop
          Caption = 'Hesab tipl'#601'ri'
          TabOrder = 0
          ExplicitWidth = 477
          object DBGrid3: TDBGrid
            Left = 2
            Top = 15
            Width = 338
            Height = 120
            Align = alClient
            Ctl3D = False
            DataSource = dmsettings.DSRins_acc_typesB
            DrawingStyle = gdsGradient
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 163
          Width = 342
          Height = 189
          Align = alBottom
          Caption = 'Balans Hesablar'#305
          TabOrder = 1
          object DBGrid4: TDBGrid
            Left = 2
            Top = 15
            Width = 338
            Height = 172
            Align = alClient
            Ctl3D = False
            DataSource = dmsettings.DSRins_acc_bal_cn
            DrawingStyle = gdsGradient
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object XDBNavigator1: TXDBNavigator
          Left = 0
          Top = 137
          Width = 342
          Height = 26
          DataSource = dmsettings.DSRins_acc_bal_cn
          Align = alTop
          TabOrder = 2
        end
      end
    end
  end
end
