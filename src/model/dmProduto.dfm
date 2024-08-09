inherited dmProdutos: TdmProdutos
  object qProduto: TZQuery
    SortedFields = 'Id'
    Connection = zCon
    OnNewRecord = qProdutoNewRecord
    UpdateObject = uProduto
    SQL.Strings = (
      
        'SELECT p.id, p.descricao, coalesce(sum(movestoque.quantidade),0)' +
        ' estoque, unidade, pCompra, pLucro, pVenda,'
      '  IdGrupo, grupo, dtRegistro, ativo'
      'FROM produto p'
      'left join movestoque on p.id = movestoque.idproduto '
      'where ((:id = 0) or (p.id = :id)) and (descricao like :desc)'
      '  and (:ativo = '#39'T'#39' or ativo = :ativo)'
      
        '  group by p.id, p.descricao, p.unidade, p.pCompra, pLucro, pVen' +
        'da,'
      '  IdGrupo, grupo, dtRegistro, ativo')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'desc'
      end
      item
        Name = 'ativo'
      end>
    IndexFieldNames = 'Id Asc'
    Left = 336
    Top = 14
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'desc'
      end
      item
        Name = 'ativo'
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
    object qProdutopCompra: TZBCDField
      FieldName = 'pCompra'
      DisplayFormat = '###,###,##0.00'
      Precision = 5
      Size = 2
    end
    object qProdutopLucro: TZBCDField
      FieldName = 'pLucro'
      DisplayFormat = '###,###,##0.00'
      Precision = 5
      Size = 2
    end
    object qProdutopVenda: TZBCDField
      FieldName = 'pVenda'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 5
      Size = 2
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
      'Values'
      
        '  (null, :descricao, :unidade, :estoque, :pCompra, :pLucro, :pVe' +
        'nda, :IdGrupo,'
      '   :grupo, :dtRegistro, :ativo)')
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
        Name = 'id'
      end
      item
        Name = 'descricao'
      end
      item
        Name = 'estoque'
      end
      item
        Name = 'unidade'
      end
      item
        Name = 'pCompra'
      end
      item
        Name = 'pLucro'
      end
      item
        Name = 'pVenda'
      end
      item
        Name = 'IdGrupo'
      end
      item
        Name = 'grupo'
      end
      item
        Name = 'DtRegistro'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object qMovEstoque: TZQuery
    Connection = zCon
    UpdateObject = uMovEstoque
    SQL.Strings = (
      'select id, idproduto, quantidade, dataMov, idUsuario,'
      '       idFornecedor, tipoMov, idMovimentacao, obs'
      'from MovEstoque'
      '  where (:idProd = 0 or idproduto = :idProd)')
    Params = <
      item
        Name = 'idProd'
      end>
    Left = 336
    Top = 62
    ParamData = <
      item
        Name = 'idProd'
      end>
    object qMovEstoqueid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qMovEstoqueidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object qMovEstoquequantidade: TZDoubleField
      FieldName = 'quantidade'
      Required = True
    end
    object qMovEstoquedataMov: TDateField
      FieldName = 'dataMov'
      Required = True
    end
    object qMovEstoqueidUsuario: TZShortIntField
      FieldName = 'idUsuario'
    end
    object qMovEstoqueidFornecedor: TZShortIntField
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
    object qMovEstoqueidMovimentacao: TZIntegerField
      FieldName = 'idMovimentacao'
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
      '  obs, tipoMov, idMovimentacao)'
      'VALUES'
      '  (:idproduto, :quantidade, :dataMov, :idUsuario, :idFornecedor,'
      '  :obs, :tipoMov, :idMovimentacao)')
    ModifySQL.Strings = (
      'UPDATE MovEstoque SET'
      '  idproduto = :idproduto,'
      '  quantidade = :quantidade,'
      '  dataMov = :dataMov,'
      '  idUsuario = :idUsuario,'
      '  idFornecedor = :idFornecedor,'
      '  tipoMov = :tipoMov,'
      '  idMovimentacao = :idMovimentacao,'
      '  obs = :obs'
      'WHERE'
      '  MovEstoque.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 368
    Top = 62
    ParamData = <
      item
        Name = 'idproduto'
      end
      item
        Name = 'quantidade'
      end
      item
        Name = 'dataMov'
      end
      item
        Name = 'idUsuario'
      end
      item
        Name = 'idFornecedor'
      end
      item
        Name = 'tipoMov'
      end
      item
        Name = 'idMovimentacao'
      end
      item
        Name = 'obs'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object dGrupo: TDataSource
    DataSet = qGrupo
    Left = 376
    Top = 126
  end
  object qGrupo: TZQuery
    SortedFields = 'Id'
    Connection = zCon
    SQL.Strings = (
      'select 0 id, '#39#39' descricao from grupo_produto'
      'UNION'
      'select id, descricao from grupo_produto'
      'where ativo = '#39'S'#39';')
    Params = <>
    IndexFieldNames = 'Id Asc'
    Left = 336
    Top = 126
    object qGrupoid: TZInt64Field
      FieldName = 'id'
      ReadOnly = True
    end
    object qGrupodescricao: TWideStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 255
    end
  end
  object qConsProdutos: TZReadOnlyQuery
    Connection = zCon
    SQL.Strings = (
      
        'SELECT p.id, p.descricao, coalesce(sum(movestoque.quantidade),0)' +
        ' estoque, unidade, pCompra, pLucro, pVenda,'
      '  IdGrupo, grupo, dtRegistro, ativo,'
      
        '  (pCompra * ( coalesce(sum(movestoque.quantidade),0))) totCompr' +
        'a,'
      '  (pVenda  * ( coalesce(sum(movestoque.quantidade),0))) totVenda'
      'FROM produto p'
      'left join movestoque on p.id = movestoque.idproduto '
      'where (:dt = 0 or movestoque.dataMov BETWEEN :dt and :dtF)'
      '  and (ativo = '#39'S'#39')'
      
        '  group by p.id, p.descricao, p.unidade, p.pCompra, pLucro, pVen' +
        'da,'
      '  IdGrupo, grupo, dtRegistro, ativo')
    Params = <
      item
        Name = 'dt'
      end
      item
        Name = 'dtF'
      end>
    Left = 32
    Top = 128
    ParamData = <
      item
        Name = 'dt'
      end
      item
        Name = 'dtF'
      end>
    object qConsProdutosid: TZIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object qConsProdutosdescricao: TZUnicodeStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 255
    end
    object qConsProdutosestoque: TZDoubleField
      FieldName = 'estoque'
      ReadOnly = True
      DisplayFormat = '###,###,##0.000'
    end
    object qConsProdutosunidade: TZUnicodeStringField
      FieldName = 'unidade'
      ReadOnly = True
      Size = 5
    end
    object qConsProdutospCompra: TZBCDField
      FieldName = 'pCompra'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object qConsProdutospLucro: TZBCDField
      FieldName = 'pLucro'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object qConsProdutospVenda: TZBCDField
      FieldName = 'pVenda'
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object qConsProdutosIdGrupo: TZIntegerField
      FieldName = 'IdGrupo'
      ReadOnly = True
    end
    object qConsProdutosgrupo: TZUnicodeStringField
      FieldName = 'grupo'
      ReadOnly = True
      Size = 70
    end
    object qConsProdutosdtRegistro: TZDateField
      FieldName = 'dtRegistro'
      ReadOnly = True
    end
    object qConsProdutosativo: TZUnicodeStringField
      FieldName = 'ativo'
      ReadOnly = True
      Size = 1
    end
    object qConsProdutostotCompra: TZDoubleField
      FieldName = 'totCompra'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
    object qConsProdutostotVenda: TZDoubleField
      FieldName = 'totVenda'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
    end
  end
end
