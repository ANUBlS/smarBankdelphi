object fmModEdit: TfmModEdit
  Left = 358
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Modules edit'
  ClientHeight = 305
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 269
    Align = alClient
    TabOrder = 0
    object pcModules: TPageControl
      Left = 1
      Top = 1
      Width = 422
      Height = 267
      ActivePage = tbInfo
      Align = alClient
      MultiLine = True
      TabHeight = 17
      TabOrder = 0
      OnChange = pcModulesChange
      object tbInfo: TTabSheet
        Caption = 'Модулун информасийасы'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 414
          Height = 240
          Align = alClient
          Caption = 'Модулун информасийасы'
          TabOrder = 0
          object GroupBox5: TGroupBox
            Left = 8
            Top = 176
            Width = 401
            Height = 57
            Caption = 'Ялавя'
            TabOrder = 1
            object cbInsert: TCheckBox
              Left = 14
              Top = 22
              Width = 81
              Height = 17
              Caption = 'Can Insert'
              TabOrder = 0
            end
            object cbDelete: TCheckBox
              Left = 150
              Top = 22
              Width = 81
              Height = 17
              Caption = 'Can Delete'
              TabOrder = 1
            end
            object cbUpdate: TCheckBox
              Left = 286
              Top = 22
              Width = 81
              Height = 17
              Caption = 'Can Update'
              TabOrder = 2
            end
          end
          object GroupBox6: TGroupBox
            Left = 8
            Top = 16
            Width = 401
            Height = 161
            Caption = 'Информасийа'
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 111
              Width = 43
              Height = 13
              Caption = 'Тяйиннаты'
            end
            object Label1: TLabel
              Left = 8
              Top = 62
              Width = 33
              Height = 13
              Caption = 'Classid'
            end
            object Label2: TLabel
              Left = 8
              Top = 18
              Width = 58
              Height = 13
              Caption = 'Модулун ады'
            end
            object edDescr: TEdit
              Left = 8
              Top = 125
              Width = 385
              Height = 21
              AutoSelect = False
              TabOrder = 2
            end
            object edClassId: TEdit
              Left = 8
              Top = 76
              Width = 385
              Height = 21
              AutoSelect = False
              TabOrder = 1
            end
            object edModName: TEdit
              Left = 8
              Top = 32
              Width = 385
              Height = 21
              AutoSelect = False
              CharCase = ecUpperCase
              TabOrder = 0
            end
          end
        end
      end
      object tbRights: TTabSheet
        Caption = 'Модулун щцгуглары'
        ImageIndex = 1
        object gbMainMod: TGroupBox
          Left = 0
          Top = 0
          Width = 414
          Height = 240
          Align = alClient
          Caption = 'Щцгуглар'
          TabOrder = 0
          object Label4: TLabel
            Left = 208
            Top = 0
            Width = 86
            Height = 13
            Caption = 'Базанын обйектляри'
          end
          object grObjects: TDBGrid
            Left = 208
            Top = 14
            Width = 203
            Height = 156
            Color = clMenu
            DataSource = AdministrationData.Objects
            FixedColor = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            OnDblClick = grObjectsDblClick
            OnKeyDown = grObjectsKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'OBJECT_TYPE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBJECT_NAME'
                Width = 189
                Visible = True
              end>
          end
          object grModules: TDBGrid
            Left = 8
            Top = 14
            Width = 195
            Height = 179
            Color = clWhite
            DataSource = AdministrationData.ModPrivs
            FixedColor = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Azl Sans Serif'
            TitleFont.Style = []
            OnKeyDown = grModulesKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'PRIVILEGE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TABLE_NAME'
                Width = 193
                Visible = True
              end>
          end
          object SearchEdit1: TSearchEdit
            Left = 208
            Top = 171
            Width = 201
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            TabOrder = 2
            DataSource = AdministrationData.Objects
            SearchField = 'OBJECT_NAME'
          end
          object GroupBox3: TGroupBox
            Left = 208
            Top = 192
            Width = 201
            Height = 46
            TabOrder = 3
            object BitBtn1: TBitBtn
              Left = 41
              Top = 13
              Width = 75
              Height = 25
              Caption = 'Гябул'
              TabOrder = 0
              OnClick = BitBtn1Click
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1700FF7F1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C170017001700FF7F1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1700170017001700FF7F1F7C
                1F7C1F7C1F7C1F7C00000000000000000000170017001700FF7F17001700FF7F
                1F7C1F7C1F7C1F7C0000FF7FFF7FFF7F170017001700FF7F00001F7C17001700
                FF7F1F7C1F7C1F7C0000FF7F1042104210421700FF7FFF7F00001F7C1F7C1700
                FF7F1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C
                1700FF7F1F7C1F7C0000FF7F10421042104210421042FF7F00001F7C1F7C1F7C
                1F7C1700FF7F1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00001F7C1F7C1F7C
                1F7C1F7C17001F7C0000FF7F104210421F7C1F7C1F7CFF7F00001F7C1F7C1F7C
                1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F00000000000000001F7C1F7C1F7C
                1F7C1F7C1F7C1F7C0000FF7F104210421F7C00001F7C00001F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7F000000001F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C0000000000000000000000001F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
            object btRefresh: TBitBtn
              Left = 121
              Top = 13
              Width = 75
              Height = 25
              Caption = 'Йенилямяк'
              TabOrder = 1
              OnClick = btRefreshClick
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C100010421F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C104210001F7C1F7C1F7C1F7C1F7C1000100010001000
                10001F7C1F7C1F7C1F7C10001F7C1F7C1F7C1F7C1F7C1F7C1F7C100010001000
                10001F7C1F7C1F7C1F7C10001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C10001000
                10001F7C1F7C1F7C1F7C10001F7C1F7C1F7C1F7C1F7C1F7C1F7C10001F7C1000
                10001F7C1F7C1F7C1F7C104210001F7C1F7C1F7C1F7C100010001F7C1F7C1F7C
                10001F7C1F7C1F7C1F7C1F7C104210001000100010001F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
          end
          object gbObjPrivs: TGroupBox
            Left = 9
            Top = 192
            Width = 194
            Height = 46
            TabOrder = 4
            object rbSel: TRadioButton
              Left = 16
              Top = 8
              Width = 57
              Height = 17
              Caption = 'Select'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbSelClick
            end
            object rbInsert: TRadioButton
              Left = 16
              Top = 26
              Width = 57
              Height = 17
              Caption = 'Insert'
              TabOrder = 1
              OnClick = rbSelClick
            end
            object rbDelete: TRadioButton
              Left = 104
              Top = 26
              Width = 57
              Height = 17
              Caption = 'Delete'
              TabOrder = 2
              OnClick = rbSelClick
            end
            object rbUpdate: TRadioButton
              Left = 104
              Top = 8
              Width = 57
              Height = 17
              Caption = 'Update'
              TabOrder = 3
              OnClick = rbSelClick
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 269
    Width = 424
    Height = 36
    Align = alBottom
    TabOrder = 1
    object btApply: TBitBtn
      Left = 254
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Гябул'
      ModalResult = 1
      TabOrder = 0
      OnClick = btApplyClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object brCansel: TBitBtn
      Left = 334
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Чыхыш'
      TabOrder = 1
      Kind = bkCancel
    end
    object ErBox: THintBox
      Left = 8
      Top = 8
      Width = 201
      Height = 18
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      HintStyle = hsAlert
      Timeout = 4000
      BeepOnMessage = False
    end
  end
end
