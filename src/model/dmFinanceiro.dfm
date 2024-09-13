inherited dmFinanceiros: TdmFinanceiros
  inherited zCon: TZConnection
    LibraryLocation = ''
  end
  object qConta: TZQuery
    Connection = zCon
    SQL.Strings = (
      'SELECT idConta, descricao, bancaria, ex,'
      '  case when'
      '      bancaria = 0 then '#39'N'#39' else '#39'S'#39' end Banc'
      'FROM conta'
      '  where (:id = 0 or idConta = :id) and'
      '        descricao like :descricao and'
      '        (:ativo = 0 or ex = :ativo) and ex  not in (0, 1, 3, 6);')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'descricao'
      end
      item
        Name = 'ativo'
      end>
    Left = 408
    Top = 24
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'descricao'
      end
      item
        Name = 'ativo'
      end>
    object qContaidConta: TZInt64Field
      DisplayLabel = 'Cod.'
      FieldName = 'idConta'
      ReadOnly = True
      Required = True
    end
    object qContadescricao: TZUnicodeStringField
      FieldName = 'descricao'
      Required = True
      Size = 70
    end
    object qContabancaria: TZShortIntField
      FieldName = 'bancaria'
    end
    object qContaex: TZInt64Field
      FieldName = 'ex'
    end
    object qContaBanc: TZUnicodeStringField
      Alignment = taCenter
      DisplayLabel = 'Bancaria'
      FieldName = 'Banc'
      ReadOnly = True
      Size = 1
    end
  end
  object dConta: TDataSource
    DataSet = qConta
    Left = 432
    Top = 24
  end
end
