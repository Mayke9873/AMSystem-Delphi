object DM: TDM
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
    LibraryLocation = 
      'D:\Desenvolvimento\Projetos\Delphi\AMSystem-Delphi\libmariadb.dl' +
      'l'
    Left = 24
    Top = 16
  end
  object qPesq: TZQuery
    Connection = zCon
    Params = <>
    Left = 760
    Top = 73
  end
  object dPesq: TDataSource
    DataSet = qPesq
    Left = 776
    Top = 73
  end
  object qCliente: TZQuery
    Connection = zCon
    UpdateObject = uCliente
    OnNewRecord = qClienteNewRecord
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bai' +
        'rro, dtregistro, Tipo, Ativo'
      'FROM CLIENTE'
      '  where ((:id = 0) or (id = :id)) and (nome like :nome)'
      '    and ((:ativo = '#39'T'#39') or (ativo = :ativo));')
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
    Left = 24
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
    Left = 88
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
  object qExecSQL: TZQuery
    Connection = zCon
    Params = <>
    Left = 776
    Top = 16
  end
  object uVenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Venda'
      'WHERE'
      '  Venda.id = :OLD_id')
    InsertSQL.Strings = (
      
        'insert into venda (ID, EX) select (select coalesce(max(id)+1, 1)' +
        ' from venda), 1;')
    ModifySQL.Strings = (
      'UPDATE VENDA SET '
      'ID_CLIENTE = :ID_CLIENTE, CLIENTE = :CLIENTE, '
      'VALOR = :VALOR, DESCONTO = :DESC,'
      ' VALOR_TOTAL = :TOTAL, "PAGO = :PAGO , '
      'VENDEDOR = :VENDEDOR, DATA_VENDA = :DATA, EX = 0 '
      'WHERE ID = :id;')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 68
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qVenda: TZQuery
    Connection = zCon
    UpdateObject = uVenda
    SQL.Strings = (
      'Select id From Venda where id = (select max(id) from Venda);')
    Params = <>
    Left = 24
    Top = 68
    object qVendaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
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
    Left = 24
    Top = 174
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
    Left = 88
    Top = 174
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
    Left = 56
    Top = 174
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
  object dFuncionario: TDataSource
    DataSet = qFuncionario
    Left = 88
    Top = 228
  end
  object uFuncionario: TZUpdateSQL
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
    Top = 228
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
        Name = 'CPF'
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
        Name = 'ativo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
  object qFuncionario: TZQuery
    Connection = zCon
    SortedFields = 'Id'
    UpdateObject = uFuncionario
    OnNewRecord = qFuncionarioNewRecord
    SQL.Strings = (
      
        'SELECT Id, Nome, RG, Cpf, dtnasc, Endereco, numendereco, Bairro,' +
        ' dtregistro, Ativo'
      #9'FROM FUNCIONARIO'
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
    Top = 228
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
    object qFuncionarioId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object qFuncionarioNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 255
    end
    object qFuncionarioRG: TWideStringField
      FieldName = 'RG'
      Required = True
      Size = 10
    end
    object qFuncionarioCpf: TWideStringField
      FieldName = 'Cpf'
      Required = True
      Size = 11
    end
    object qFuncionariodtnasc: TDateField
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
      FieldName = 'dtregistro'
      Required = True
    end
    object qFuncionarioAtivo: TWideStringField
      FieldName = 'Ativo'
      Required = True
      Size = 1
    end
  end
end
