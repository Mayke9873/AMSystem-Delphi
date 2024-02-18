inherited dmFornecedores: TdmFornecedores
  object dFornecedor: TDataSource
    DataSet = qFornecedor
    Left = 88
    Top = 229
  end
  object uFornecedor: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM fornecedor'
      'WHERE'
      '  fornecedor.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO fornecedor'
      
        '  (id, nome, ie, CNPJ, endereco, numEndereco, bairro, dtRegistro' +
        ', ativo)'
      'VALUES'
      
        '  (:id, :nome, :ie, :CNPJ, :endereco, :numEndereco, :bairro, :dt' +
        'Registro, '
      '   :ativo)')
    ModifySQL.Strings = (
      'UPDATE fornecedor SET'
      '  id = :id,'
      '  nome = :nome,'
      '  ie = :ie,'
      '  CNPJ = :CNPJ,'
      '  endereco = :endereco,'
      '  numEndereco = :numEndereco,'
      '  bairro = :bairro,'
      '  ativo = :ativo'
      'WHERE'
      '  fornecedor.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 229
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'ie'
      end
      item
        Name = 'CNPJ'
      end
      item
        Name = 'endereco'
      end
      item
        Name = 'numEndereco'
      end
      item
        Name = 'bairro'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'OLD_id'
      end
      item
        Name = 'DtRegistro'
      end>
  end
  object qFornecedor: TZQuery
    SortedFields = 'Id'
    Connection = zCon
    OnNewRecord = qFornecedorNewRecord
    UpdateObject = uFornecedor
    SQL.Strings = (
      'select'
      '  id,nome, ie, CNPJ, endereco, numEndereco,'
      '  bairro, dtRegistro, ativo'
      'from fornecedor'
      'where ((:id = 0 or id = :id) and nome like :nome)'
      #9#9'and (:ativo = '#39'T'#39' or ativo = :ativo);')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'ativo'
      end>
    IndexFieldNames = 'Id Asc'
    Left = 24
    Top = 229
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'ativo'
      end>
    object qFornecedorid: TIntegerField
      Alignment = taCenter
      FieldName = 'id'
      Required = True
    end
    object qFornecedornome: TWideStringField
      FieldName = 'nome'
      Required = True
      Size = 255
    end
    object qFornecedorie: TWideStringField
      FieldName = 'ie'
      Size = 14
    end
    object qFornecedorCNPJ: TWideStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
    object qFornecedorendereco: TWideStringField
      FieldName = 'endereco'
      Size = 250
    end
    object qFornecedornumEndereco: TWideStringField
      FieldName = 'numEndereco'
      Size = 6
    end
    object qFornecedorbairro: TWideStringField
      FieldName = 'bairro'
      Size = 250
    end
    object qFornecedordtRegistro: TDateField
      Alignment = taCenter
      FieldName = 'dtRegistro'
      Required = True
    end
    object qFornecedorativo: TWideStringField
      Alignment = taCenter
      FieldName = 'ativo'
      Required = True
      Size = 1
    end
  end
end
