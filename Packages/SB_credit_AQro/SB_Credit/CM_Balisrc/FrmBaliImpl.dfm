object FrmBali: TFrmBali
  Left = 190
  Top = 214
  Width = 829
  Height = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 821
    Height = 162
    Align = alTop
    Caption = 'Мцштяри'
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Visible = False
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 817
      Height = 145
      Align = alClient
      DataSource = Bali.DataSource1
      FixedColor = clAqua
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ROWNUM'
          Title.Caption = 'С/с'
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMBEROFCREDIT'
          Title.Caption = 'Мцгавилянин №'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Azl Sans Serif'
          Font.Style = [fsBold]
          Title.Caption = 'С.А.А'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_NAME'
          Title.Caption = 'Валйута'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITLINEAMOUNT'
          Title.Caption = 'Мябляь'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'D'
          Title.Caption = 'Заминлик цзря ющтялик | Замин дурдуьу шяхс'
          Width = 294
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 162
    Width = 821
    Height = 136
    Align = alTop
    Caption = 'Шяхси ющтялик'
    Color = clCaptionText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    Visible = False
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 817
      Height = 119
      Align = alClient
      DataSource = Bali.DataSource2
      FixedColor = clAqua
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ROWNUM'
          Title.Caption = 'С/с'
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMBEROFCREDIT'
          Title.Caption = 'Мцгавилянини №'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_NAME'
          Title.Caption = 'Валйута'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITLINEAMOUNT'
          Title.Caption = 'Мябляь'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATEOFCONCLUSION'
          Title.Caption = 'Башлама тарихи'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DUEDATEFIRSTCONTRACT'
          Title.Caption = 'Битмя тарихи'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONENUMBER'
          Title.Caption = 'Телефон №'
          Width = 152
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALARY'
          Title.Caption = 'Иш йери  / Мааш'
          Width = 260
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 298
    Width = 821
    Height = 136
    Align = alTop
    Caption = 'Заминлик ющтялик '
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Azl Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object DBGrid3: TDBGrid
      Left = 2
      Top = 15
      Width = 817
      Height = 119
      Align = alClient
      DataSource = Bali.DataSource3
      FixedColor = clAqua
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Azl Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Azl Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ROWNUM'
          Title.Caption = 'С/с'
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMBEROFCREDIT'
          Title.Caption = 'Мцгавилянини №'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_NAME'
          Title.Caption = 'Валйута'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CREDITLINEAMOUNT'
          Title.Caption = 'Мябляь'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATEOFCONCLUSION'
          Title.Caption = 'Башлама тарихи'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DUEDATEFIRSTCONTRACT'
          Title.Caption = 'Битмя тарихи'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PHONENUMBER'
          Title.Caption = 'Телефон №'
          Width = 184
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Caption = 'Замин дурдуьу шяхс '
          Visible = True
        end>
    end
  end
end
