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
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ie'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'endereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'numEndereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'bairro'
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
      end
      item
        DataType = ftUnknown
        Name = 'DtRegistro'
        ParamType = ptUnknown
      end>
  end
  object qFornecedor: TZQuery
    Connection = zCon
    SortedFields = 'Id'
    UpdateObject = uFornecedor
    OnNewRecord = qFornecedorNewRecord
    SQL.Strings = (
      'select'
      '  id,nome, ie, CNPJ, endereco, numEndereco,'
      '  bairro, dtRegistro, ativo'
      'from fornecedor'
      'where ((:id = 0 or id = :id) and nome like :nome)'
      #9#9'and (:ativo = '#39'T'#39' or ativo = :ativo);')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'Id Asc'
    Left = 24
    Top = 229
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
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
