object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 369
  ClientWidth = 1189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object XFPanel1: TXFPanel
    Left = 0
    Top = 0
    Width = 1189
    Height = 369
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 41
    object XDBGrid1: TXDBGrid
      Left = 2
      Top = 2
      Width = 1185
      Height = 365
      Align = alClient
      DataSource = NewDataModDepositsContract.DSAccno
      GridStyle.VisualStyle = vsXPStyle
      TabOrder = 0
      Columns = <
        item
          CheckBox = True
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = '#'
          Visible = True
          Width = 50
        end
        item
          Expanded = False
          FieldName = 'CUSTOMERID'
          Title.Alignment = taCenter
          Title.Caption = 'M'#252#351't'#601'ri '#304'd-si'
          Visible = True
          Width = 80
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Depozit Hesab'#305'n Ad'#305
          Visible = True
          Width = 200
        end
        item
          Expanded = False
          FieldName = 'NAMEACCNO'
          Title.Alignment = taCenter
          Title.Caption = 'Hesab'#305'n Ad'#305
          Visible = True
          Width = 200
        end
        item
          Expanded = False
          FieldName = 'ACCNO'
          Title.Alignment = taCenter
          Title.Caption = 'Hesab'#305'n No-si'
          Visible = True
          Width = 190
        end
        item
          Expanded = False
          FieldName = 'OLD_BALCN'
          Title.Alignment = taCenter
          Title.Caption = 'K'#246'hn'#601' Balans'
          Visible = True
          Width = 70
        end
        item
          Expanded = False
          FieldName = 'NEW_BALCN'
          Title.Alignment = taCenter
          Title.Caption = 'T'#601'z'#601' Balans'
          Visible = True
          Width = 70
        end
        item
          Expanded = False
          FieldName = 'VAL_ID'
          Title.Alignment = taCenter
          Title.Caption = '$'
          Visible = True
          Width = 40
        end
        item
          Expanded = False
          FieldName = 'FILIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Filial'
          Visible = True
          Width = 100
        end
        item
          Expanded = False
          FieldName = 'OPENDAT'
          Title.Alignment = taCenter
          Title.Caption = 'A'#231#305'lma Tarixi'
          Visible = True
          Width = 70
        end>
    end
  end
end
