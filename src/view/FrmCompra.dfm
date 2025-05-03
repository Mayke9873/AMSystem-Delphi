object fCompra: TfCompra
  Left = 0
  Top = 0
  Caption = 'fCompra'
  ClientHeight = 624
  ClientWidth = 963
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 15
  object lblTitle: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 957
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Nova compra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 116
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 963
    Height = 593
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      963
      593)
    object Label3: TLabel
      Left = 8
      Top = 21
      Width = 81
      Height = 18
      Caption = 'Fornecedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 55
      Height = 18
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 584
      Top = 72
      Width = 38
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'Qtde.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 596
    end
    object Label6: TLabel
      Left = 677
      Top = 72
      Width = 55
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'R$ Unit.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 689
    end
    object Label7: TLabel
      Left = 771
      Top = 72
      Width = 41
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'Desc.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 783
    end
    object Label8: TLabel
      Left = 862
      Top = 72
      Width = 56
      Height = 18
      Anchors = [akTop, akRight]
      Caption = 'R$ Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 874
    end
    object edIdFornecedor: TEdit
      Left = 8
      Top = 42
      Width = 86
      Height = 23
      TabOrder = 2
      OnExit = edIdFornecedorExit
    end
    object edIdProd: TEdit
      Tag = 2
      Left = 8
      Top = 92
      Width = 86
      Height = 23
      TabOrder = 4
      OnExit = edIdFornecedorExit
    end
    object edFornecedor: TEdit
      Left = 95
      Top = 42
      Width = 476
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
      OnChange = edFornecedorChange
      OnKeyDown = edPesqProdKeyDown
    end
    object edPesqProd: TEdit
      Tag = 1
      Left = 95
      Top = 92
      Width = 476
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 5
      OnChange = edPesqProdChange
      OnKeyDown = edPesqProdKeyDown
    end
    object edQtdProduto: TEdit
      Tag = 99
      Left = 584
      Top = 92
      Width = 86
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 6
      OnExit = edQtdProdutoExit
    end
    object edValorUnitario: TEdit
      Tag = 99
      Left = 677
      Top = 92
      Width = 86
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 7
    end
    object edDesconto: TEdit
      Tag = 99
      Left = 771
      Top = 92
      Width = 86
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 8
      OnExit = edDescontoExit
    end
    object edValorTotal: TEdit
      Tag = 99
      Left = 862
      Top = 92
      Width = 86
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 9
      OnEnter = edValorTotalEnter
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 121
      Width = 940
      Height = 411
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dProdCompra
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'idprod'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 430
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          ReadOnly = True
          Title.Caption = 'Qtd.'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'R$ Unit.'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desconto'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Desconto'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'R$ Total'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end>
    end
    object dbgPesqProduto: TDBGrid
      Tag = 1
      Left = 934
      Top = 298
      Width = 813
      Height = 153
      DataSource = dmProdutos.dProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      OnKeyPress = dbgFornecedorKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 425
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'estoque'
          Title.Alignment = taRightJustify
          Title.Caption = 'Estoque'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'pVenda'
          Title.Alignment = taRightJustify
          Title.Caption = 'R$ Venda'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end>
    end
    object dbgFornecedor: TDBGrid
      Left = 934
      Top = 115
      Width = 533
      Height = 120
      TabStop = False
      DataSource = dmFornecedores.dFornecedor
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      OnKeyPress = dbgFornecedorKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 420
          Visible = True
        end>
    end
    object pnlDesconto: TPanel
      Left = 732
      Top = 10
      Width = 107
      Height = 55
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'pnlDesconto'
      ShowCaption = False
      TabOrder = 0
      object Label9: TLabel
        Left = 0
        Top = 0
        Width = 107
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Descontos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 89
      end
      object Panel2: TPanel
        Left = 0
        Top = 20
        Width = 107
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Shape1: TShape
          Left = 0
          Top = 0
          Width = 107
          Height = 35
          Align = alClient
          Brush.Color = clMedGray
          Pen.Color = clSilver
          Pen.Mode = pmMask
          Shape = stRoundRect
          ExplicitLeft = 48
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edDescontoVenda: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 101
          Height = 29
          Align = alClient
          Alignment = taRightJustify
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clMedGray
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object pnlTotal: TPanel
      Left = 841
      Top = 10
      Width = 107
      Height = 55
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'pnlTotal'
      ShowCaption = False
      TabOrder = 1
      object Label10: TLabel
        Left = 0
        Top = 0
        Width = 107
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'R$ Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 68
      end
      object Panel3: TPanel
        Left = 0
        Top = 20
        Width = 107
        Height = 35
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 107
          Height = 35
          Align = alClient
          Brush.Color = clMedGray
          Pen.Color = clSilver
          Pen.Mode = pmMask
          Shape = stRoundRect
          ExplicitLeft = 48
          ExplicitTop = 16
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object edTotalVenda: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 101
          Height = 29
          Align = alClient
          Alignment = taRightJustify
          BevelInner = bvNone
          BevelOuter = bvNone
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Color = clMedGray
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 538
      Width = 963
      Height = 55
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlBotoes'
      ShowCaption = False
      TabOrder = 13
      DesignSize = (
        963
        55)
      object btnSair: TButton
        Left = 401
        Top = 7
        Width = 125
        Height = 32
        Action = acSair
        Anchors = [akLeft, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object btnExcluirProduto: TButton
        Left = 270
        Top = 7
        Width = 125
        Height = 32
        Action = acExcluirProduto
        Anchors = [akLeft, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnCancelar: TButton
        Left = 139
        Top = 7
        Width = 125
        Height = 32
        Action = acCancelar
        Anchors = [akLeft, akBottom]
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnSalvar: TButton
        Left = 8
        Top = 7
        Width = 125
        Height = 32
        Action = acSalvar
        Anchors = [akLeft, akBottom]
        BiDiMode = bdLeftToRight
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object dProdCompra: TDataSource
    DataSet = qProdCompra
    Left = 856
    Top = 544
  end
  object qProdCompra: TZQuery
    Connection = DM.zCon
    UpdateObject = uProdCompra
    SQL.Strings = (
      
        'Select id, idCompra, idprod, descricao, valor, desconto, quantid' +
        'ade, total, ex'
      '  From Compra_item where idCompra = :idCompra and ex = 9;')
    Params = <
      item
        DataType = ftWideString
        Name = 'idCompra'
        SQLType = stUnicodeString
      end>
    Left = 798
    Top = 512
    ParamData = <
      item
        DataType = ftWideString
        Name = 'idCompra'
        SQLType = stUnicodeString
      end>
    object qProdCompraid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qProdCompraidCompra: TZInt64Field
      FieldName = 'idCompra'
      Required = True
    end
    object qProdCompraidprod: TZInt64Field
      FieldName = 'idprod'
      Required = True
    end
    object qProdCompradescricao: TZUnicodeStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qProdCompravalor: TZBCDField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompradesconto: TZBCDField
      FieldName = 'desconto'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompraquantidade: TZBCDField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '###,###,##0.000'
      Precision = 11
      Size = 3
    end
    object qProdCompratotal: TZBCDField
      FieldName = 'total'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompraex: TZIntegerField
      FieldName = 'ex'
      Required = True
    end
  end
  object uProdCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Compra_item'
      'WHERE'
      '  Compra_item.id = :OLD_id AND'
      '  Compra_item.idVenda = :OLD_idCompra AND'
      '  Compra_item.idprod = :OLD_idprod AND'
      '  Compra_item.valor = :OLD_valor AND'
      '  Compra_item.desconto = :OLD_desconto AND'
      '  Compra_item.quantidade = :OLD_quantidade AND'
      '  Compra_item.total = :OLD_total AND'
      '  Compra_item.ex = :OLD_ex')
    InsertSQL.Strings = (
      'INSERT INTO Compra_item'
      
        '  (idCompra, idprod, descricao, valor, desconto, quantidade, tot' +
        'al, '
      '   ex)'
      'VALUES'
      
        '  ((select max(id) from Compra), :idprod, :descricao, :valor, :d' +
        'esconto, :quantidade, '
      '   :total, 9)')
    ModifySQL.Strings = (
      'UPDATE Compra_item SET'
      '  id = :id,'
      '  idCompra = :idCompra,'
      '  idprod = :idprod,'
      '  descricao = :descricao,'
      '  valor = :valor,'
      '  desconto = :desconto,'
      '  quantidade = :quantidade,'
      '  total = :total,'
      '  ex = :ex'
      'WHERE'
      '  Compra_item.id = :OLD_id AND'
      '  Compra_item.idVenda = :OLD_idCompra AND'
      '  Compra_item.idprod = :OLD_idprod AND'
      '  Compra_item.valor = :OLD_valor AND'
      '  Compra_item.desconto = :OLD_desconto AND'
      '  Compra_item.quantidade = :OLD_quantidade AND'
      '  Compra_item.total = :OLD_total AND'
      '  Compra_item.ex = :OLD_ex')
    UseSequenceFieldForRefreshSQL = False
    Left = 827
    Top = 528
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idCompra'
      end
      item
        Name = 'idprod'
      end
      item
        Name = 'descricao'
      end
      item
        Name = 'valor'
      end
      item
        Name = 'desconto'
      end
      item
        Name = 'quantidade'
      end
      item
        Name = 'total'
      end
      item
        Name = 'ex'
      end
      item
        Name = 'OLD_id'
      end
      item
        Name = 'OLD_idCompra'
      end
      item
        Name = 'OLD_idprod'
      end
      item
        Name = 'OLD_valor'
      end
      item
        Name = 'OLD_desconto'
      end
      item
        Name = 'OLD_quantidade'
      end
      item
        Name = 'OLD_total'
      end
      item
        Name = 'OLD_ex'
      end>
  end
  object ActionList1: TActionList
    Left = 544
    Top = 568
    object acSair: TAction
      Caption = 'Esc - Sair'
      ShortCut = 27
      OnExecute = acSairExecute
    end
    object acSalvar: TAction
      Caption = 'F3 - Salvar'
      ShortCut = 114
      OnExecute = acSalvarExecute
    end
    object acCancelar: TAction
      Caption = 'F4 - Cancelar'
      ShortCut = 115
      OnExecute = acCancelarExecute
    end
    object acExcluirProduto: TAction
      Caption = 'F5 - Excluir Produto'
      ShortCut = 116
      OnExecute = acExcluirProdutoExecute
    end
  end
  object tmPesquisa: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmPesquisaTimer
    Left = 496
    Top = 24
  end
end
