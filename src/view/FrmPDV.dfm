object fPDV: TfPDV
  Left = 0
  Top = 0
  Caption = 'PDV'
  ClientHeight = 682
  ClientWidth = 1006
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1006
    Height = 682
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlPrincipal'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1002
    ExplicitHeight = 681
    object pnlBotoes: TPanel
      Left = 0
      Top = 602
      Width = 1006
      Height = 80
      Align = alBottom
      Caption = 'pnlBotoes'
      Padding.Left = 4
      Padding.Top = 8
      Padding.Right = 4
      Padding.Bottom = 4
      ShowCaption = False
      TabOrder = 2
      ExplicitTop = 601
      ExplicitWidth = 1002
      object pnlFuncoes: TPanel
        Left = 816
        Top = 9
        Width = 185
        Height = 66
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlFuncoes'
        ShowCaption = False
        TabOrder = 5
        ExplicitLeft = 812
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 1
          ExplicitTop = -3
          ExplicitWidth = 183
          ExplicitHeight = 82
        end
        object btnFuncoes: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Action = acMaisAtalhos
          Align = alClient
          Flat = True
          ExplicitTop = -3
        end
      end
      object pnlSair: TPanel
        Left = 745
        Top = 9
        Width = 185
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 4
        object Shape4: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 80
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnSair: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Action = acSair
          Align = alClient
          Caption = 'Sair'#13'(Esc)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 6
          ExplicitTop = -3
          ExplicitHeight = 84
        end
      end
      object pnlPesqProduto: TPanel
        Left = 375
        Top = 9
        Width = 185
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 2
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 96
          ExplicitTop = 56
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnBuscaProduto: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Caption = 'Pesquisar produto'#13'(F4)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnBuscaProdutoClick
          ExplicitLeft = 6
          ExplicitTop = -3
        end
      end
      object pnlFinalizar: TPanel
        Left = 190
        Top = 9
        Width = 185
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 1
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 112
          ExplicitTop = 64
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnFinalizar: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Action = acFinalizar
          Align = alClient
          Caption = 'Finalizar Venda'#13'(F3)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = -6
          ExplicitTop = -3
          ExplicitHeight = 84
        end
      end
      object pnlSalvar: TPanel
        Left = 5
        Top = 9
        Width = 185
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 0
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 128
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnSalvar: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Action = acSalvar
          Align = alClient
          Caption = 'Salvar'#13'(F2)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitTop = -3
          ExplicitHeight = 84
        end
      end
      object pnlExcluirProduto: TPanel
        Left = 560
        Top = 9
        Width = 185
        Height = 66
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 3
        object Shape11: TShape
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Align = alClient
          Brush.Color = clSkyBlue
          Pen.Style = psClear
          Shape = stRoundRect
          ExplicitLeft = 80
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object btnExcluirProduto: TSpeedButton
          Left = 0
          Top = 0
          Width = 185
          Height = 66
          Action = acExcluirProd
          Align = alClient
          Caption = 'Excluir produto'#13'(F5)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = -6
          ExplicitTop = -3
        end
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 1006
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Caixa Aberto'
      Color = 16768858
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Padding.Left = 8
      Padding.Right = 4
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 1002
      object pnlComanda: TPanel
        Left = 812
        Top = 0
        Width = 190
        Height = 65
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlComanda'
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        ShowCaption = False
        TabOrder = 0
        ExplicitLeft = 808
        object lblComanda: TLabel
          Left = 4
          Top = 4
          Width = 182
          Height = 21
          Align = alTop
          Caption = 'Comanda:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ExplicitWidth = 75
        end
        object pnlEdtComanda: TPanel
          Left = 4
          Top = 25
          Width = 182
          Height = 36
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlEdtComanda'
          ShowCaption = False
          TabOrder = 0
          object shpComanda: TShape
            Left = 0
            Top = 0
            Width = 182
            Height = 36
            Align = alClient
            Brush.Style = bsClear
            Shape = stRoundRect
            ExplicitLeft = 128
            ExplicitTop = 16
            ExplicitWidth = 65
            ExplicitHeight = 65
          end
          object edtComanda: TEdit
            AlignWithMargins = True
            Left = 2
            Top = 4
            Width = 178
            Height = 30
            Margins.Left = 2
            Margins.Top = 4
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = 16768858
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TextHint = 'N'#186' comanda'
            OnKeyDown = edtComandaKeyDown
          end
        end
      end
    end
    object pnlCentral: TPanel
      Left = 0
      Top = 65
      Width = 1006
      Height = 537
      Align = alClient
      Caption = 'pnlProdutos'
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 1002
      ExplicitHeight = 536
      DesignSize = (
        1006
        537)
      object pnlGrid: TPanel
        Left = 1
        Top = 1
        Width = 724
        Height = 535
        Align = alClient
        Caption = 'pnlProdutos'
        Padding.Left = 4
        Padding.Top = 4
        Padding.Right = 4
        Padding.Bottom = 4
        ShowCaption = False
        TabOrder = 1
        ExplicitWidth = 720
        ExplicitHeight = 534
        object CheckDBGrid1: TCheckDBGrid
          Left = 5
          Top = 5
          Width = 714
          Height = 525
          Align = alClient
          BorderStyle = bsNone
          DataSource = DS
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          AllowAppend = False
          Columns = <
            item
              Expanded = False
              FieldName = 'codProduto'
              Title.Caption = 'C'#243'digo'
              Width = 90
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'Item'
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            item
              Expanded = False
              FieldName = 'prodDescricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 320
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            item
              Expanded = False
              FieldName = 'prodQtd'
              Title.Alignment = taRightJustify
              Title.Caption = 'Qtde.'
              Width = 62
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            item
              Expanded = False
              FieldName = 'prodUnit'
              Title.Alignment = taRightJustify
              Title.Caption = 'Unit.'
              Width = 80
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end
            item
              Expanded = False
              FieldName = 'prodTotal'
              Title.Alignment = taRightJustify
              Title.Caption = 'Total'
              Width = 80
              Visible = True
              ValueChecked = 'T'
              ValueUnchecked = 'F'
            end>
        end
      end
      object pnlLateral: TPanel
        Left = 725
        Top = 1
        Width = 280
        Height = 535
        Align = alRight
        Caption = 'pnlLateral'
        Padding.Left = 4
        Padding.Top = 8
        Padding.Right = 4
        Padding.Bottom = 12
        ShowCaption = False
        TabOrder = 2
        ExplicitLeft = 721
        ExplicitHeight = 534
        object pnlTotal: TPanel
          AlignWithMargins = True
          Left = 9
          Top = 448
          Width = 262
          Height = 70
          Margins.Left = 4
          Margins.Top = 10
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 4
          ExplicitTop = 447
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 21
            Align = alTop
            Caption = 'Total da Compra'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 113
          end
          object Shape6: TShape
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 1
            ExplicitTop = 27
            ExplicitWidth = 270
            ExplicitHeight = 55
          end
          object pnlTotalCompra: TPanel
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            BevelOuter = bvNone
            Padding.Left = 4
            Padding.Top = 10
            Padding.Right = 4
            Padding.Bottom = 12
            ShowCaption = False
            TabOrder = 0
            object lbTotalCompra: TLabel
              Left = 4
              Top = 10
              Width = 254
              Height = 27
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Alignment = taCenter
              Caption = 'R$ 9,32'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitWidth = 72
              ExplicitHeight = 30
            end
          end
        end
        object pnlSubTotal: TPanel
          AlignWithMargins = True
          Left = 9
          Top = 364
          Width = 262
          Height = 70
          Margins.Left = 4
          Margins.Top = 10
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 3
          ExplicitTop = 363
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 21
            Align = alTop
            Caption = 'Sub Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 63
          end
          object Shape7: TShape
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 1
            ExplicitTop = 27
            ExplicitWidth = 270
            ExplicitHeight = 55
          end
          object Panel3: TPanel
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel11'
            Padding.Left = 4
            Padding.Top = 10
            Padding.Right = 4
            Padding.Bottom = 12
            ShowCaption = False
            TabOrder = 0
            object lblSubTotal: TLabel
              Left = 4
              Top = 10
              Width = 254
              Height = 27
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Alignment = taCenter
              Caption = 'R$ 3,30'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitWidth = 72
              ExplicitHeight = 30
            end
          end
        end
        object pnlQtde: TPanel
          AlignWithMargins = True
          Left = 9
          Top = 280
          Width = 262
          Height = 70
          Margins.Left = 4
          Margins.Top = 10
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 2
          ExplicitTop = 279
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 21
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
          object Shape8: TShape
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 1
            ExplicitTop = 27
            ExplicitWidth = 270
            ExplicitHeight = 55
          end
          object Panel12: TPanel
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel11'
            Padding.Left = 2
            Padding.Top = 8
            Padding.Right = 2
            Padding.Bottom = 4
            ShowCaption = False
            TabOrder = 0
            object edtQtde: TEdit
              Left = 2
              Top = 8
              Width = 258
              Height = 37
              Align = alClient
              Alignment = taCenter
              BevelOuter = bvNone
              BorderStyle = bsNone
              Color = clSkyBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              Text = '1,000'
              StyleName = 'Windows'
              OnKeyDown = edtQtdeKeyDown
            end
          end
        end
        object pnlPreco: TPanel
          AlignWithMargins = True
          Left = 9
          Top = 196
          Width = 262
          Height = 70
          Margins.Left = 4
          Margins.Top = 10
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 1
          ExplicitTop = 195
          object Label5: TLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 21
            Align = alTop
            Caption = 'Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 39
          end
          object Shape9: TShape
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 1
            ExplicitTop = 27
            ExplicitWidth = 270
            ExplicitHeight = 55
          end
          object Panel14: TPanel
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel11'
            Padding.Left = 4
            Padding.Top = 10
            Padding.Right = 4
            Padding.Bottom = 12
            ShowCaption = False
            TabOrder = 0
            object lblPreco: TLabel
              Left = 4
              Top = 10
              Width = 254
              Height = 27
              Margins.Top = 10
              Margins.Bottom = 10
              Align = alClient
              Alignment = taCenter
              Caption = 'R$ 4,72'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitWidth = 71
              ExplicitHeight = 30
            end
          end
        end
        object pnlProduto: TPanel
          AlignWithMargins = True
          Left = 9
          Top = 112
          Width = 262
          Height = 70
          Margins.Left = 4
          Margins.Top = 10
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          ShowCaption = False
          TabOrder = 0
          ExplicitTop = 111
          object Label7: TLabel
            Left = 0
            Top = 0
            Width = 262
            Height = 21
            Align = alTop
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 56
          end
          object Shape10: TShape
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            Brush.Color = clSkyBlue
            Pen.Style = psClear
            Shape = stRoundRect
            ExplicitLeft = 1
            ExplicitTop = 27
            ExplicitWidth = 270
            ExplicitHeight = 55
          end
          object pnledtProduto: TPanel
            Left = 0
            Top = 21
            Width = 262
            Height = 49
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel11'
            Padding.Left = 2
            Padding.Top = 8
            Padding.Right = 2
            Padding.Bottom = 4
            ShowCaption = False
            TabOrder = 0
            object edtIdProduto: TEdit
              Left = 2
              Top = 8
              Width = 258
              Height = 37
              Align = alClient
              Alignment = taCenter
              BevelOuter = bvNone
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clSkyBlue
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -23
              Font.Name = 'Segoe UI Semibold'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              TextHint = 'C'#243'digo'
              StyleName = 'Windows'
              OnKeyDown = edtIdProdutoKeyDown
            end
          end
        end
      end
      object spFuncoes: TSplitView
        Left = 805
        Top = -1
        Width = 200
        Height = 535
        Color = clSkyBlue
        DisplayMode = svmOverlay
        OpenedWidth = 200
        Placement = svpRight
        TabOrder = 0
        UseAnimation = False
        ExplicitLeft = 801
        ExplicitHeight = 534
        object Panel1: TPanel
          Left = 0
          Top = 82
          Width = 200
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Cancelar venda (F11)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          object Shape12: TShape
            Left = 0
            Top = 40
            Width = 200
            Height = 1
            Align = alBottom
            Shape = stRoundRect
            ExplicitTop = 39
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 41
          Width = 200
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Cancelar venda (F11)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          object Shape13: TShape
            Left = 0
            Top = 40
            Width = 200
            Height = 1
            Align = alBottom
            Shape = stRoundRect
            ExplicitTop = 39
          end
        end
        object pnlCancelaVenda: TPanel
          Left = 0
          Top = 0
          Width = 200
          Height = 41
          Cursor = crHandPoint
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Cancelar venda (Ctrl+1)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = pnlCancelaVendaClick
          object Shape14: TShape
            Left = 0
            Top = 40
            Width = 200
            Height = 1
            Align = alBottom
            Shape = stRoundRect
            ExplicitTop = 39
          end
        end
      end
    end
  end
  object ActList: TActionList
    Left = 432
    Top = 129
    object acSair: TAction
      Caption = 'acSair'
      ShortCut = 27
      OnExecute = acSairExecute
    end
    object acSalvar: TAction
      Caption = 'acSalvar'
      ShortCut = 113
      OnExecute = acSalvarExecute
    end
    object acFinalizar: TAction
      Caption = 'acFinalizar'
      ShortCut = 114
      OnExecute = acFinalizarExecute
    end
    object acMaisAtalhos: TAction
      Caption = 'Mais Atalhos'#13'(F12)'
      ShortCut = 123
      OnExecute = acMaisAtalhosExecute
    end
    object acPesquisaProduto: TAction
      Caption = 'acPesquisaProduto'
      ShortCut = 115
      OnExecute = acPesquisaProdutoExecute
    end
    object acExcluirProd: TAction
      Caption = 'acExcluirProd'
      ShortCut = 116
      OnExecute = acExcluirProdExecute
    end
    object acCancelar: TAction
      Caption = 'acCancelar'
      ShortCut = 16433
      OnExecute = acCancelarExecute
    end
  end
  object DS: TDataSource
    DataSet = dmVendas.CdsItens
    Left = 472
    Top = 129
  end
end
