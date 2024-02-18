inherited dmFuncionarios: TdmFuncionarios
  object dFuncionario: TDataSource [4]
    DataSet = qFuncionario
    Left = 88
    Top = 173
  end
  object uFuncionario: TZUpdateSQL [5]
    DeleteSQL.Strings = (
      'DELETE FROM Funcionario'
      'WHERE'
      '  Funcionario.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO Funcionario'
      
        '  (id, nome, rg, CPF, DtNasc, endereco, numEndereco, bairro, DtR' +
        'egistro, '
      '   ativo)'
      'VALUES'
      
        '  (:id, :nome, :rg, :CPF, :DtNasc, :endereco, :numEndereco, :bai' +
        'rro, '
      '   :DtRegistro, :ativo)')
    ModifySQL.Strings = (
      'UPDATE Funcionario SET'
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
      '  Funcionario.id = :OLD_id')
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
  object qFuncionario: TZQuery [6]
    SortedFields = 'Id'
    Connection = zCon
    OnNewRecord = qFuncionarioNewRecord
    UpdateObject = uFuncionario
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, Cpf, dtnasc, Endereco, numendereco, Bairro,' +
        ' dtregistro, Ativo'
      #9'FROM FUNCIONARIO'
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
    object qFuncionarioId: TIntegerField
      Alignment = taCenter
      FieldName = 'Id'
      Required = True
    end
    object qFuncionarioNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
    object qFuncionarioRG: TWideStringField
      Alignment = taCenter
      FieldName = 'RG'
      Required = True
      Size = 10
    end
    object qFuncionarioCpf: TWideStringField
      Alignment = taCenter
      FieldName = 'Cpf'
      Required = True
      Size = 11
    end
    object qFuncionariodtnasc: TDateField
      Alignment = taCenter
      FieldName = 'dtnasc'
      Required = True
      OnSetText = qFuncionariodtnascSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qFuncionarioEndereco: TWideStringField
      FieldName = 'Endereco'
      Size = 250
    end
    object qFuncionarionumendereco: TWideStringField
      FieldName = 'numendereco'
      Size = 5
    end
    object qFuncionarioBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 250
    end
    object qFuncionariodtregistro: TDateField
      Alignment = taCenter
      FieldName = 'dtregistro'
      Required = True
    end
    object qFuncionarioAtivo: TWideStringField
      Alignment = taCenter
      FieldName = 'Ativo'
      Required = True
      Size = 1
    end
  end
end
