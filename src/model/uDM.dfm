object DM: TDM
  OnCreate = DataModuleCreate
  Height = 366
  Width = 493
  object zCon: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'RawStringEncoding=DB_CP')
    HostName = 'localhost'
    Port = 3306
    Database = 'projeto_db'
    User = 'root'
    Password = '123456'
    Protocol = 'mysql'
    LibraryLocation = 
    Left = 24
    Top = 16
  end
  object qPesq: TZQuery
    Connection = zCon
    Params = <>
    Left = 160
    Top = 81
  end
  object dPesq: TDataSource
    DataSet = qPesq
    Left = 176
    Top = 81
  end
  object qExecSQL: TZQuery
    Connection = zCon
    Params = <>
    Left = 176
    Top = 24
  end
  object qParametro: TZTable
    Connection = zCon
    SequenceField = 'idCliente'
    TableName = 'parametro'
    Left = 64
    Top = 16
    object qParametroidCliente: TZInt64Field
      FieldName = 'idCliente'
      Required = True
    end
    object qParametroUsa_comanda: TZUnicodeStringField
      FieldName = 'Usa_comanda'
      Size = 1
    end
    object qParametroUsa_PDV: TZUnicodeStringField
      FieldName = 'Usa_PDV'
      Size = 1
    end
  end
end
