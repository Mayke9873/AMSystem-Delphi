object fAjusteEstoque: TfAjusteEstoque
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Ajuste de Estoque'
  ClientHeight = 308
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  Visible = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 308
    Align = alClient
    Caption = 'pnlPrincipal'
    Padding.Left = 8
    Padding.Right = 8
    Padding.Bottom = 8
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 194
      Width = 607
      Height = 17
      Align = alBottom
      Alignment = taCenter
      Caption = 'Tipo movimenta'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 120
    end
    object pnlBotoes: TPanel
      Left = 9
      Top = 258
      Width = 607
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlBotoes'
      ShowCaption = False
      TabOrder = 4
      object pnlSair: TPanel
        Left = 422
        Top = 0
        Width = 185
        Height = 41
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlSair'
        TabOrder = 1
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 41
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
          Height = 41
          Action = acSair
          Align = alClient
          Caption = 'Sair'#13'(Esc)'
          Flat = True
          Spacing = 0
          ExplicitTop = 3
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 41
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'pnlAjustarEstoque'
        TabOrder = 0
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 41
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
          Height = 41
          Action = acAjusteEstoque
          Align = alClient
          Caption = 'Ajustar estoque'#13'(F2)'
          Flat = True
          Spacing = 0
          ExplicitLeft = 64
          ExplicitTop = 16
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
    end
    object Panel5: TPanel
      Left = 9
      Top = 1
      Width = 607
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 0
      object lblTitulo: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 8
        Width = 599
        Height = 25
        Margins.Left = 4
        Margins.Top = 8
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Alignment = taCenter
        Caption = 'Ajuste de Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 153
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 12
      Top = 211
      Width = 601
      Height = 39
      Margins.Top = 0
      Margins.Bottom = 8
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlEntradaSaida'
      ShowCaption = False
      TabOrder = 3
      object Label2: TLabel
        AlignWithMargins = True
        Left = 280
        Top = 4
        Width = 44
        Height = 31
        Hint = 'Entre Entrada/Sa'#237'da'
        Margins.Left = 12
        Margins.Top = 4
        Margins.Right = 12
        Margins.Bottom = 4
        Align = alClient
        Alignment = taCenter
        Caption = 'Alterar  (F3)'
        ParentShowHint = False
        ShowHint = True
        WordWrap = True
        ExplicitWidth = 41
        ExplicitHeight = 30
      end
      object rdEntrada: TRadioButton
        AlignWithMargins = True
        Left = 200
        Top = 3
        Width = 65
        Height = 33
        Margins.Left = 200
        Align = alLeft
        Alignment = taLeftJustify
        Caption = 'Entrada'
        Checked = True
        TabOrder = 0
        TabStop = True
        WordWrap = True
      end
      object rdSaida: TRadioButton
        Tag = 1
        AlignWithMargins = True
        Left = 339
        Top = 3
        Width = 62
        Height = 33
        Margins.Right = 200
        Align = alRight
        Caption = 'Sa'#237'da'
        TabOrder = 1
      end
    end
    object pnlDados: TPanel
      Left = 9
      Top = 38
      Width = 607
      Height = 156
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlDados'
      Padding.Left = 8
      Padding.Right = 8
      ShowCaption = False
      TabOrder = 1
      object Label3: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 588
        Height = 21
        Margins.Left = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'C'#243'd. Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 91
      end
      object pnlPesqProduto: TPanel
        Left = 8
        Top = 24
        Width = 591
        Height = 28
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlPesqProduto'
        Padding.Bottom = 4
        ParentShowHint = False
        ShowCaption = False
        ShowHint = False
        TabOrder = 0
        object pnlProduto: TPanel
          Left = 139
          Top = 0
          Width = 452
          Height = 24
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 1
          object Shape2: TShape
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 452
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Pen.Color = clMedGray
            Shape = stRoundRect
            ExplicitLeft = -2
            ExplicitTop = 1
          end
          object edProduto: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 446
            Height = 17
            Margins.Top = 4
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            OnChange = edProdutoChange
            OnKeyDown = edProdutoKeyDown
            OnKeyPress = edProdutoKeyPress
          end
        end
        object pnlIdProduto: TPanel
          Left = 0
          Top = 0
          Width = 137
          Height = 24
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          Color = clWindow
          TabOrder = 0
          object Shape9: TShape
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 137
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Pen.Color = clMedGray
            Shape = stRoundRect
            ExplicitLeft = 5
            ExplicitWidth = 92
            ExplicitHeight = 22
          end
          object edIdProduto: TEdit
            Tag = 1
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 131
            Height = 17
            Margins.Top = 4
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            OnExit = edIdProdutoExit
          end
        end
      end
      object pnlQuantidade: TPanel
        Left = 8
        Top = 103
        Width = 591
        Height = 49
        Margins.Left = 4
        Margins.Top = 8
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Quantidade'
        ShowCaption = False
        TabOrder = 2
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 591
          Height = 21
          Margins.Left = 0
          Align = alTop
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 81
        end
        object Panel9: TPanel
          Left = 0
          Top = 21
          Width = 591
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Padding.Bottom = 4
          ParentShowHint = False
          ShowCaption = False
          ShowHint = False
          TabOrder = 0
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 85
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            BevelOuter = bvNone
            Color = clWindow
            TabOrder = 0
            object Shape4: TShape
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 85
              Height = 24
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Pen.Color = clMedGray
              Shape = stRoundRect
              ExplicitTop = -3
              ExplicitWidth = 591
            end
            object edQuantidade: TEdit
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 4
              Width = 79
              Height = 17
              Margins.Top = 4
              Align = alClient
              Alignment = taRightJustify
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
        end
      end
      object Panel7: TPanel
        Left = 8
        Top = 52
        Width = 591
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Obs'
        ShowCaption = False
        TabOrder = 1
        object Label4: TLabel
          Left = 0
          Top = 0
          Width = 591
          Height = 21
          Margins.Left = 0
          Align = alTop
          Caption = 'Observa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 82
        end
        object Panel8: TPanel
          Left = 0
          Top = 21
          Width = 591
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 4
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel1'
          Padding.Bottom = 4
          ParentShowHint = False
          ShowCaption = False
          ShowHint = False
          TabOrder = 0
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 591
            Height = 24
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            Color = clWindow
            TabOrder = 0
            object Shape5: TShape
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 591
              Height = 24
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Pen.Color = clMedGray
              Shape = stRoundRect
              ExplicitLeft = 5
              ExplicitWidth = 92
              ExplicitHeight = 22
            end
            object edObs: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 4
              Width = 585
              Height = 17
              Margins.Top = 4
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              OnChange = edProdutoChange
              OnKeyPress = edProdutoKeyPress
            end
          end
        end
      end
    end
    object gdPesqProduto: TDBGrid
      Left = 17
      Top = 87
      Width = 450
      Height = 120
      DataSource = dmProdutos.dProduto
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      OnDblClick = gdPesqProdutoDblClick
      OnKeyPress = gdPesqProdutoKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end>
    end
  end
  object ActionList1: TActionList
    Left = 568
    Top = 56
    object acAjusteEstoque: TAction
      Caption = 'acAjusteEstoque'
      ShortCut = 113
      OnExecute = acAjusteEstoqueExecute
    end
    object acSair: TAction
      Caption = 'acSair'
      ShortCut = 27
      OnExecute = acSairExecute
    end
    object EntradaSaida: TAction
      Caption = 'EntradaSaida'
      ShortCut = 114
      OnExecute = EntradaSaidaExecute
    end
  end
  object tmPesquisar: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmPesquisarTimer
    Left = 560
    Top = 112
  end
end
