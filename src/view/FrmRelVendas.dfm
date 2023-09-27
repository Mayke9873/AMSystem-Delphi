object fRelVendas: TfRelVendas
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fRelVendas'
  ClientHeight = 270
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Padding.Top = 4
    Padding.Bottom = 4
    ShowCaption = False
    TabOrder = 0
    object SkLabel1: TSkLabel
      AlignWithMargins = True
      Left = 3
      Top = 8
      Width = 522
      Height = 24
      Margins.Top = 4
      Align = alTop
      TextSettings.Font.Families = 'Segoe UI Semibold'
      TextSettings.Font.Size = 18.000000000000000000
      TextSettings.Font.Weight = Semibold
      TextSettings.HorzAlign = Center
      Words = <
        item
          Caption = 'Relat'#243'rio de Vendas'
          Font.Families = 'Segoe UI Semibold'
          StyledSettings = [Size, Style, FontColor]
        end>
      ExplicitLeft = 6
      ExplicitTop = 0
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 221
      Width = 522
      Height = 42
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlBotoes'
      Padding.Left = 8
      Padding.Right = 8
      ShowCaption = False
      TabOrder = 0
      object Panel4: TPanel
        Left = 8
        Top = 0
        Width = 185
        Height = 42
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnlAjustarEstoque'
        TabOrder = 0
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 42
          Align = alClient
          Brush.Color = 16768858
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 112
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnAjustarEstoque: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 42
          Action = acImprimir
          Align = alClient
          DisabledImageName = 'btnImprimir'
          Caption = 'Imprimir'#13'(F2)'
          Flat = True
          Spacing = 0
          ExplicitTop = 3
          ExplicitHeight = 311
        end
      end
      object pnlSair: TPanel
        Left = 329
        Top = 0
        Width = 185
        Height = 42
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlSair'
        TabOrder = 1
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 42
          Align = alClient
          Brush.Color = 16768858
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 88
          ExplicitTop = 8
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnSair: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 42
          Action = acSair
          Align = alClient
          Caption = 'Sair'#13'(Esc)'
          Flat = True
          Spacing = 0
          ExplicitTop = 3
          ExplicitHeight = 41
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 35
      Width = 528
      Height = 183
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlPrincipal'
      ShowCaption = False
      TabOrder = 1
      object SkLabel2: TSkLabel
        Left = 105
        Top = 66
        Width = 131
        Height = 21
        TextSettings.Font.Size = 16.000000000000000000
        Words = <
          item
            Caption = 'Per'#237'odo de vendas'
          end>
      end
      object DatePicker1: TDatePicker
        Left = 105
        Top = 88
        Date = 45190.000000000000000000
        DateFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 0
      end
      object DatePicker2: TDatePicker
        Left = 273
        Top = 88
        Date = 45190.000000000000000000
        DateFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 273
        Top = 70
        Width = 53
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
  end
  object ActionList1: TActionList
    Left = 448
    Top = 51
    object acImprimir: TAction
      Caption = 'Imprimir'
      ShortCut = 113
      OnExecute = acImprimirExecute
    end
    object acSair: TAction
      Caption = 'acSair'
      ShortCut = 27
      OnExecute = acSairExecute
    end
  end
end
