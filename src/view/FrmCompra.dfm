object fCompra: TfCompra
  Left = 0
  Top = 0
  Caption = 'fCompra'
  ClientHeight = 625
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 967
    Height = 625
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 963
    ExplicitHeight = 624
    DesignSize = (
      967
      625)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 65
      Height = 18
      Caption = 'N'#186' Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 66
      Width = 68
      Height = 18
      Caption = 'Vendedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 49
      Height = 18
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 192
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
      Left = 547
      Top = 192
      Width = 29
      Height = 18
      Caption = 'Qtd.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 640
      Top = 192
      Width = 55
      Height = 18
      Caption = 'R$ Unit.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 734
      Top = 192
      Width = 41
      Height = 18
      Caption = 'Desc.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 826
      Top = 192
      Width = 56
      Height = 18
      Caption = 'R$ Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edCodVenda: TEdit
      Tag = 99
      Left = 8
      Top = 28
      Width = 86
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edIdVendedor: TEdit
      Left = 8
      Top = 86
      Width = 86
      Height = 23
      TabOrder = 1
    end
    object edIdCliente: TEdit
      Tag = 1
      Left = 8
      Top = 148
      Width = 86
      Height = 23
      TabOrder = 2
    end
    object edIdProd: TEdit
      Tag = 2
      Left = 8
      Top = 212
      Width = 86
      Height = 23
      TabOrder = 3
    end
    object edVendedor: TEdit
      Left = 95
      Top = 86
      Width = 446
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 4
    end
    object edCliente: TEdit
      Tag = 1
      Left = 95
      Top = 148
      Width = 446
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object edPesqProd: TEdit
      Tag = 2
      Left = 95
      Top = 212
      Width = 446
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 6
    end
    object edQtdProduto: TEdit
      Tag = 99
      Left = 547
      Top = 212
      Width = 86
      Height = 23
      TabOrder = 7
    end
    object edValorUnitario: TEdit
      Tag = 99
      Left = 640
      Top = 212
      Width = 86
      Height = 23
      TabOrder = 8
    end
    object edDesconto: TEdit
      Tag = 99
      Left = 734
      Top = 212
      Width = 86
      Height = 23
      TabOrder = 9
    end
    object edValorTotal: TEdit
      Tag = 99
      Left = 826
      Top = 212
      Width = 86
      Height = 23
      TabOrder = 10
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 244
      Width = 900
      Height = 320
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dProdVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 11
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'idprod'
          Title.Caption = 'C'#243'digo'
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
          FieldName = 'descricao'
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
      Tag = 2
      Left = 910
      Top = 386
      Width = 814
      Height = 153
      DataSource = dmProdutos.dProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 12
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
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
    object dbgVendedor: TDBGrid
      Left = 918
      Top = 118
      Width = 533
      Height = 120
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 13
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
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
          FieldName = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 420
          Visible = True
        end>
    end
    object dbgCliente: TDBGrid
      Tag = 1
      Left = 918
      Top = 244
      Width = 533
      Height = 120
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 14
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
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
          FieldName = 'Nome'
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
      Left = 695
      Top = 10
      Width = 107
      Height = 55
      BevelOuter = bvNone
      Caption = 'pnlDesconto'
      ShowCaption = False
      TabOrder = 15
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
      Left = 805
      Top = 10
      Width = 107
      Height = 55
      BevelOuter = bvNone
      Caption = 'pnlTotal'
      ShowCaption = False
      TabOrder = 16
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
      Top = 570
      Width = 967
      Height = 55
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'pnlBotoes'
      ShowCaption = False
      TabOrder = 17
      ExplicitTop = 569
      ExplicitWidth = 963
      DesignSize = (
        967
        55)
      object btnSair: TButton
        Left = 401
        Top = 7
        Width = 125
        Height = 32
        Anchors = [akLeft, akBottom]
        Caption = 'Esc - Sair'
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object btnExcluirProduto: TButton
        Left = 270
        Top = 7
        Width = 125
        Height = 32
        Anchors = [akLeft, akBottom]
        Caption = 'F5 - Excluir Produto'
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object btnCancelar: TButton
        Left = 139
        Top = 7
        Width = 125
        Height = 32
        Anchors = [akLeft, akBottom]
        Caption = 'F4 - Cancelar'
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object btnSalvar: TButton
        Left = 8
        Top = 7
        Width = 125
        Height = 32
        Anchors = [akLeft, akBottom]
        BiDiMode = bdLeftToRight
        Caption = 'F3 - Salvar'
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object dProdVenda: TDataSource
    DataSet = qProdVenda
    Left = 856
    Top = 544
  end
  object qProdVenda: TZQuery
    Connection = DM.zCon
    UpdateObject = uProdVenda
    SQL.Strings = (
      
        'Select id, idVenda, idprod, descricao, valor, desconto, quantida' +
        'de, total, ex'
      '  From Venda_item where idvenda = :idVenda and ex = 9;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idVenda'
        ParamType = ptUnknown
      end>
    Left = 798
    Top = 512
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idVenda'
        ParamType = ptUnknown
      end>
    object qProdVendaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qProdVendaidprod: TIntegerField
      FieldName = 'idprod'
      Required = True
    end
    object qProdVendadescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qProdVendaquantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qProdVendadesconto: TFloatField
      FieldName = 'desconto'
      Required = True
    end
    object qProdVendatotal: TFloatField
      FieldName = 'total'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
    object qProdVendavalor: TFloatField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
    end
  end
  object uProdVenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Venda_item'
      'WHERE'
      '  Venda_item.id = :OLD_id AND'
      '  Venda_item.idVenda = :OLD_idVenda AND'
      '  Venda_item.idprod = :OLD_idprod AND'
      '  Venda_item.valor = :OLD_valor AND'
      '  Venda_item.desconto = :OLD_desconto AND'
      '  Venda_item.quantidade = :OLD_quantidade AND'
      '  Venda_item.total = :OLD_total AND'
      '  Venda_item.ex = :OLD_ex')
    InsertSQL.Strings = (
      'INSERT INTO Venda_item'
      
        '  (idVenda, idprod, descricao, valor, desconto, quantidade, tota' +
        'l, '
      '   ex)'
      'VALUES'
      
        '  ((select max(id) from Venda), :idprod, :descricao, :valor, :de' +
        'sconto, :quantidade, '
      '   :total, 9)')
    ModifySQL.Strings = (
      'UPDATE Venda_item SET'
      '  id = :id,'
      '  idVenda = :idVenda,'
      '  idprod = :idprod,'
      '  descricao = :descricao,'
      '  valor = :valor,'
      '  desconto = :desconto,'
      '  quantidade = :quantidade,'
      '  total = :total,'
      '  ex = :ex'
      'WHERE'
      '  Venda_item.id = :OLD_id AND'
      '  Venda_item.idVenda = :OLD_idVenda AND'
      '  Venda_item.idprod = :OLD_idprod AND'
      '  Venda_item.valor = :OLD_valor AND'
      '  Venda_item.desconto = :OLD_desconto AND'
      '  Venda_item.quantidade = :OLD_quantidade AND'
      '  Venda_item.total = :OLD_total AND'
      '  Venda_item.ex = :OLD_ex')
    UseSequenceFieldForRefreshSQL = False
    Left = 827
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idprod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_idprod'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_valor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_desconto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_total'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ex'
        ParamType = ptUnknown
      end>
  end
end
