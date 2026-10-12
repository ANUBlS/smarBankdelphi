object CommissionForm: TCommissionForm
  Left = 64
  Top = 12
  Caption = 'CommissionForm'
  ClientHeight = 492
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Azl Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 925
    Height = 492
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 925
      Height = 408
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitHeight = 407
      object GridCommission: TDBGrid
        Left = 0
        Top = 0
        Width = 925
        Height = 408
        Align = alClient
        DataSource = TransactionDataModule.CommissionData
        DrawingStyle = gdsGradient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Azl Sans Serif'
        TitleFont.Style = []
        OnDblClick = GridCommissionDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Title.Caption = #399'm'#601'liyyat'#305'n ad'#305
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBITACCOUNT'
            Title.Caption = 'Debet'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'DEBITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CREDITACCOUNT'
            Title.Caption = 'Kredit'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'CREDITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ADEBITACCOUNT'
            Title.Caption = 'Komissiya Debet'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'ADEBITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACREDITACCOUNT'
            Title.Caption = 'Komissiya Kredit'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clSilver
            Expanded = False
            FieldName = 'ACREDITCURRENCY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Azl Sans Serif'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = '$'
            Title.Color = clNavy
            Title.Font.Charset = RUSSIAN_CHARSET
            Title.Font.Color = clNavy
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 30
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 457
      Width = 925
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DesignSize = (
        925
        35)
      object ButtonRefresh: TButton
        Left = 757
        Top = 6
        Width = 81
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'Yenil'#601
        TabOrder = 0
        OnClick = ButtonRefreshClick
      end
      object ButtonClose: TButton
        Left = 842
        Top = 6
        Width = 81
        Height = 27
        Anchors = [akTop, akRight]
        Caption = 'Ba'#287'la'
        TabOrder = 1
        OnClick = ButtonCloseClick
      end
      object Button3: TButton
        Left = 672
        Top = 6
        Width = 81
        Height = 27
        Anchors = [akTop, akRight]
        Caption = #399'lav'#601
        TabOrder = 2
        OnClick = Button3Click
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 408
      Width = 925
      Height = 49
      Align = alBottom
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 2
      ExplicitTop = 407
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 921
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = #399'm'#601'liyyat'#305'n t'#601'yinat'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          921
          23)
        object DBEdit1: TDBEdit
          Left = 110
          Top = 0
          Width = 812
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          DataField = 'ASSIGNMENT'
          DataSource = TransactionDataModule.CommissionData
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 2
        Top = 25
        Width = 921
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Komissiya '#601'm'#601'liyyat'#305'n'#305'n t'#601'yinat'#305':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          921
          22)
        object DBEdit2: TDBEdit
          Left = 168
          Top = 0
          Width = 754
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          Color = clSilver
          DataField = 'COMMISIONASSIGNMENT'
          DataSource = TransactionDataModule.CommissionData
          TabOrder = 0
        end
      end
    end
  end
end
