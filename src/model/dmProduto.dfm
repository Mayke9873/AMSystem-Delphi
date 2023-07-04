inherited dmProdutos: TdmProdutos
  object qProduto: TZQuery
    Connection = zCon
    SortedFields = 'Id'
    UpdateObject = uProduto
    SQL.Strings = (
      'select id, descricao, estoque, unidade, pCompra, pLucro, pVenda,'
      '  IdGrupo, grupo, dtRegistro, ativo'
      'FROM produto'
      'where (((:id = 0) or (id = :id)) and (descricao like :desc)'
      '  and (:ativo = '#39'T'#39' or ativo = :ativo));')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'Id Asc'
    Left = 336
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end>
    object qProdutoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qProdutodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qProdutoestoque: TFloatField
      FieldName = 'estoque'
    end
    object qProdutounidade: TWideStringField
      FieldName = 'unidade'
      Size = 5
    end
    object qProdutopCompra: TFloatField
      FieldName = 'pCompra'
    end
    object qProdutopLucro: TFloatField
      FieldName = 'pLucro'
    end
    object qProdutopVenda: TFloatField
      FieldName = 'pVenda'
      Required = True
    end
    object qProdutoIdGrupo: TIntegerField
      FieldName = 'IdGrupo'
    end
    object qProdutogrupo: TWideStringField
      FieldName = 'grupo'
      Size = 70
    end
    object qProdutodtRegistro: TDateField
      FieldName = 'dtRegistro'
      Required = True
    end
    object qProdutoativo: TWideStringField
      FieldName = 'ativo'
      Required = True
      Size = 1
    end
  end
  object dProduto: TDataSource
    DataSet = qProduto
    Left = 400
    Top = 14
  end
  object uProduto: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTO'
      'WHERE'
      '  PRODUTO.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO PRODUTO'
      
        '  (id, descricao, unidade, estoque, pCompra, pLucro, pVenda, IdG' +
        'rupo,'
      '   grupo, dtRegistro, ativo)'
      'SELECT'
      
        '  (select coalesce(max(id)+1, 1) from PRODUTO), :descricao, :uni' +
        'dade, :estoque, :pCompra, :pLucro, :pVenda, :IdGrupo,'
      '   :grupo, :dtRegistro, :ativo')
    ModifySQL.Strings = (
      'UPDATE PRODUTO SET'
      '  id = :id,'
      '  descricao = :descricao,'
      '  estoque = :estoque,'
      '  unidade = :unidade,'
      '  pCompra = :pCompra,'
      '  pLucro = :pLucro,'
      '  pVenda = :pVenda,'
      '  IdGrupo = :IdGrupo,'
      '  grupo = :grupo,'
      '  dtRegistro = :dtRegistro,'
      '  ativo = :ativo'
      'WHERE'
      '  PRODUTO.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 368
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'estoque'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'unidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pCompra'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pLucro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pVenda'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IdGrupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'grupo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DtRegistro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qMovEstoque: TZQuery
    Connection = zCon
    UpdateObject = uMovEstoque
    SQL.Strings = (
      'select id, idproduto, quantidade, dataMov, idUsuario,'
      '       idFornecedor, tipoMov, obs'
      'from MovEstoque'
      '  where (:idProd = 0 or idproduto = :idProd)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idProd'
        ParamType = ptUnknown
      end>
    Left = 336
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idProd'
        ParamType = ptUnknown
      end>
    object qMovEstoqueid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qMovEstoqueidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object qMovEstoquequantidade: TFloatField
      FieldName = 'quantidade'
      Required = True
    end
    object qMovEstoquedataMov: TDateField
      FieldName = 'dataMov'
      Required = True
    end
    object qMovEstoqueidUsuario: TSmallintField
      FieldName = 'idUsuario'
    end
    object qMovEstoqueidFornecedor: TSmallintField
      FieldName = 'idFornecedor'
    end
    object qMovEstoquetipoMov: TWideStringField
      FieldName = 'tipoMov'
      Required = True
      Size = 1
    end
    object qMovEstoqueobs: TWideStringField
      FieldName = 'obs'
      Size = 250
    end
  end
  object uMovEstoque: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM MovEstoque'
      'WHERE'
      '  MovEstoque.id = :OLD_id ')
    InsertSQL.Strings = (
      'INSERT INTO MovEstoque'
      '  (idproduto, quantidade, dataMov, idUsuario, idFornecedor,'
      '  obs, tipoMov)'
      'VALUES'
      '  (:idproduto, :quantidade, :dataMov, :idUsuario, :idFornecedor,'
      '  :obs, :tipoMov)')
    ModifySQL.Strings = (
      'UPDATE MovEstoque SET'
      '  idproduto = :idproduto,'
      '  quantidade = :quantidade,'
      '  dataMov = :dataMov,'
      '  idUsuario = :idUsuario,'
      '  idFornecedor = :idFornecedor,'
      '  tipoMov = :tipoMov,'
      '  obs = :obs'
      'WHERE'
      '  MovEstoque.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 368
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idproduto'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dataMov'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idUsuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'idFornecedor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipoMov'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'obs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
end
