inherited dmClientes: TdmClientes
  object qCliente: TZQuery
    Connection = DM.zCon
    OnNewRecord = qClienteNewRecord
    UpdateObject = uCliente
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bai' +
        'rro, dtregistro, Tipo, Ativo'
      'FROM CLIENTE'
      '  where ((:id = 0) or (id = :id)) and (nome like :nome)'
      '    and ((:ativo = '#39'T'#39') or (ativo = :ativo));')
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
    Left = 16
    Top = 104
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
    object qClienteId: TIntegerField
      Alignment = taCenter
      FieldName = 'Id'
      Required = True
    end
    object qClienteNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 250
    end
    object qClienteRG: TWideStringField
      Alignment = taCenter
      FieldName = 'RG'
      Size = 10
    end
    object qClienteCpfCnpj: TWideStringField
      FieldName = 'CpfCnpj'
      Size = 11
    end
    object qClientedtnasc: TDateField
      FieldName = 'dtnasc'
      OnSetText = qClientedtnascSetText
      EditMask = '!99/99/9999;1;_'
    end
    object qClienteEndereco: TWideStringField
      FieldName = 'Endereco'
      Size = 255
    end
    object qClientenumendereco: TWideStringField
      FieldName = 'numendereco'
      Size = 5
    end
    object qClienteBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 250
    end
    object qClientedtregistro: TDateField
      Alignment = taCenter
      FieldName = 'dtregistro'
    end
    object qClienteTipo: TWideStringField
      Alignment = taCenter
      FieldName = 'Tipo'
      Size = 1
    end
    object qClienteAtivo: TWideStringField
      Alignment = taCenter
      FieldName = 'Ativo'
      Size = 1
    end
  end
  object dCliente: TDataSource
    DataSet = qCliente
    Left = 80
    Top = 104
  end
  object uCliente: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Cliente'
      'WHERE'
      '  Cliente.id = :OLD_id AND'
      '  Cliente.nome = :OLD_nome AND'
      
        '  ((Cliente.rg IS NULL AND :OLD_rg IS NULL) OR (Cliente.rg = :OL' +
        'D_rg)) AND'
      
        '  ((Cliente.CPFCNPJ IS NULL AND :OLD_CPFCNPJ IS NULL) OR (Client' +
        'e.CPFCNPJ = :OLD_CPFCNPJ)) AND'
      
        '  ((Cliente.DtNasc IS NULL AND :OLD_DtNasc IS NULL) OR (Cliente.' +
        'DtNasc = :OLD_DtNasc)) AND'
      
        '  ((Cliente.endereco IS NULL AND :OLD_endereco IS NULL) OR (Clie' +
        'nte.endereco = :OLD_endereco)) AND'
      
        '  ((Cliente.numEndereco IS NULL AND :OLD_numEndereco IS NULL) OR' +
        ' (Cliente.numEndereco = :OLD_numEndereco)) AND'
      
        '  ((Cliente.bairro IS NULL AND :OLD_bairro IS NULL) OR (Cliente.' +
        'bairro = :OLD_bairro)) AND'
      
        '  ((Cliente.DtRegistro IS NULL AND :OLD_DtRegistro IS NULL) OR (' +
        'Cliente.DtRegistro = :OLD_DtRegistro)) AND'
      
        '  ((Cliente.tipo IS NULL AND :OLD_tipo IS NULL) OR (Cliente.tipo' +
        ' = :OLD_tipo)) AND'
      
        '  ((Cliente.ativo IS NULL AND :OLD_ativo IS NULL) OR (Cliente.at' +
        'ivo = :OLD_ativo))')
    InsertSQL.Strings = (
      'INSERT INTO Cliente'
      
        '  (id, nome, rg, CPFCNPJ, DtNasc, endereco, numEndereco, bairro,' +
        ' DtRegistro, '
      '   tipo, ativo)'
      'VALUES'
      
        '  (:id, :nome, :rg, :CPFCNPJ, :DtNasc, :endereco, :numEndereco, ' +
        ':bairro, '
      '   :DtRegistro, :tipo, :ativo)')
    ModifySQL.Strings = (
      'UPDATE Cliente SET'
      '  id = :id,'
      '  nome = :nome,'
      '  rg = :rg,'
      '  CPFCNPJ = :CPFCNPJ,'
      '  DtNasc = :DtNasc,'
      '  endereco = :endereco,'
      '  numEndereco = :numEndereco,'
      '  bairro = :bairro,'
      '  DtRegistro = :DtRegistro,'
      '  tipo = :tipo,'
      '  ativo = :ativo'
      'WHERE'
      '  Cliente.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 48
    Top = 104
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
        Name = 'CPFCNPJ'
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
        Name = 'tipo'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'OLD_id'
      end
      item
        Name = 'OLD_nome'
      end
      item
        Name = 'OLD_rg'
      end
      item
        Name = 'OLD_CPFCNPJ'
      end
      item
        Name = 'OLD_DtNasc'
      end
      item
        Name = 'OLD_endereco'
      end
      item
        Name = 'OLD_numEndereco'
      end
      item
        Name = 'OLD_bairro'
      end
      item
        Name = 'OLD_DtRegistro'
      end
      item
        Name = 'OLD_tipo'
      end
      item
        Name = 'OLD_ativo'
      end>
  end
end
