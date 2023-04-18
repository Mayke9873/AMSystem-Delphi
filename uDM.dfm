object DM: TDM
  OldCreateOrder = False
  Height = 468
  Width = 835
  object zCon: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = '192.168.2.104'
    Port = 3306
    Database = 'projeto_db'
    User = 'mayke'
    Password = 'mayke98'
    Protocol = 'mysql'
    LibraryLocation = 'E:\AmSystem\libmariadb.dll'
    Left = 24
    Top = 16
  end
  object qPesq: TZQuery
    Connection = zCon
    Params = <>
    Left = 24
    Top = 72
  end
  object dPesq: TDataSource
    DataSet = qPesq
    Left = 64
    Top = 72
  end
  object qCliente: TZQuery
    Connection = zCon
    UpdateObject = uCliente
    OnNewRecord = qClienteNewRecord
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bai' +
        'rro, dtregistro, Tipo, Ativo '
      '                   FROM CLIENTE    where ((nome like :nome))  '
      
        '                                     and ((:ativo = '#39'T'#39') or (ati' +
        'vo = :ativo))')
    Params = <
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
    Left = 24
    Top = 120
    ParamData = <
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
    object qClienteId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object qClienteNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 250
    end
    object qClienteRG: TWideStringField
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
      FieldName = 'dtregistro'
    end
    object qClienteTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qClienteAtivo: TWideStringField
      FieldName = 'Ativo'
      Size = 1
    end
  end
  object dCliente: TDataSource
    DataSet = qCliente
    Left = 90
    Top = 120
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
    Left = 56
    Top = 120
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
        Name = 'rg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CPFCNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DtNasc'
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
        Name = 'DtRegistro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo'
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
        Name = 'OLD_nome'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_rg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CPFCNPJ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_DtNasc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_endereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_numEndereco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_bairro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_DtRegistro'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_tipo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ativo'
        ParamType = ptUnknown
      end>
  end
end
