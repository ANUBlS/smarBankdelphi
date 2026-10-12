object trans_acc: Ttrans_acc
  Left = 0
  Top = 0
  Caption = 'Tranzit hesablar'
  ClientHeight = 356
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 112
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Sil'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 10
    Width = 75
    Height = 25
    Caption = #399'lav'#601' et'
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 618
    Height = 315
    Align = alClient
    DataSource = DataMod.DataSource1
    DrawingStyle = gdsGradient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MAIN_ACC'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANZIT_ACC'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSIT_ACC_NAME'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 41
    Align = alTop
    TabOrder = 3
    object Button3: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = #399'lav'#601' et'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 112
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Sil'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
end
