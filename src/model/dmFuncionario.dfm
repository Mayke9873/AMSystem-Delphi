inherited dmFuncionarios: TdmFuncionarios
  object dFuncionario: TDataSource
    DataSet = qFuncionario
    Left = 88
    Top = 173
  end
  object uFuncionario: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM USUARIO'
      'WHERE'
      '  Usuario.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO USUARIO'
      
        '  (id, nome, rg, CPF, DtNasc, endereco, numEndereco, bairro, DtR' +
        'egistro, '
      '   ativo)'
      'VALUES'
      
        '  (:id, :nome, :rg, :CPF, :DtNasc, :endereco, :numEndereco, :bai' +
        'rro, '
      '   :DtRegistro, :ativo)')
    ModifySQL.Strings = (
      'UPDATE USUARIO SET'
      '  id = :id,'
      '  nome = :nome,'
      '  rg = :rg,'
      '  CPF = :CPF,'
      '  DtNasc = :DtNasc,'
      '  endereco = :endereco,'
      '  numEndereco = :numEndereco,'
      '  bairro = :bairro,'
      '  DtRegistro = :DtRegistro,'
      '  ativo = :ativo'
      'WHERE'
      '  USUARIO.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 173
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'nome'
      end
      item
        Name = 'rg'
      end
      item
        Name = 'CPF'
      end
      item
        Name = 'DtNasc'
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
        Name = 'DtRegistro'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object qFuncionario: TZQuery
    SortedFields = 'Id'
    Connection = zCon
    OnNewRecord = qFuncionarioNewRecord
    UpdateObject = uFuncionario
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, Cpf, dtnasc, Endereco, numendereco, Bairro,' +
        ' dtregistro, Ativo'
      #9'FROM USUARIO'
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
    Top = 173
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
    object qFuncionarioId: TZInt64Field
      Alignment = taCenter
      FieldName = 'Id'
      Required = True
    end
    object qFuncionarioNome: TZUnicodeStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
    object qFuncionarioRG: TZUnicodeStringField
      Alignment = taCenter
      FieldName = 'RG'
      Required = True
      Size = 10
    end
    object qFuncionarioCpf: TZUnicodeStringField
      Alignment = taCenter
      FieldName = 'Cpf'
      Required = True
      Size = 11
    end
    object qFuncionariodtnasc: TZDateField
      Alignment = taCenter
      FieldName = 'dtnasc'
      Required = True
      OnSetText = qFuncionariodtnascSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qFuncionarioEndereco: TZUnicodeStringField
      FieldName = 'Endereco'
      Size = 250
    end
    object qFuncionarionumendereco: TZUnicodeStringField
      FieldName = 'numendereco'
      Size = 5
    end
    object qFuncionarioBairro: TZUnicodeStringField
      FieldName = 'Bairro'
      Size = 250
    end
    object qFuncionariodtregistro: TZDateField
      Alignment = taCenter
      FieldName = 'dtregistro'
      Required = True
    end
    object qFuncionarioAtivo: TZUnicodeStringField
      Alignment = taCenter
      FieldName = 'Ativo'
      Size = 1
    end
  end
end
