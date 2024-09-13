inherited dmGrupos: TdmGrupos
  object dGrupo: TDataSource
    DataSet = qGrupo
    Left = 16
    Top = 200
  end
  object qGrupo: TZQuery
    SortedFields = 'Id'
    Connection = zCon
    OnNewRecord = qGrupoNewRecord
    UpdateObject = uGrupo
    SQL.Strings = (
      'select id, descricao, ativo from grupo_produto'
      '  where (0 = :id or id = :id) and '
      '  descricao like :pesq and'
      '  ('#39'T'#39' = :ativo or ativo = :ativo)')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'pesq'
      end
      item
        Name = 'ativo'
      end>
    IndexFieldNames = 'Id Asc'
    Left = 16
    Top = 102
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'pesq'
      end
      item
        Name = 'ativo'
      end>
    object qGrupoid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qGrupodescricao: TZUnicodeStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qGrupoativo: TZUnicodeStringField
      FieldName = 'ativo'
      Size = 1
    end
  end
  object uGrupo: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM grupo_produto'
      'WHERE'
      '  grupo_produto.id = :OLD_id')
    InsertSQL.Strings = (
      'INSERT INTO grupo_produto'
      '  (descricao, ativo)'
      'VALUES'
      '  (:descricao, :ativo)')
    ModifySQL.Strings = (
      'UPDATE grupo_produto SET'
      '  descricao = :descricao,'
      '  ativo = :ativo'
      'WHERE'
      '  grupo_produto.id = :OLD_id')
    UseSequenceFieldForRefreshSQL = False
    Left = 16
    Top = 150
    ParamData = <
      item
        Name = 'descricao'
      end
      item
        Name = 'ativo'
      end
      item
        Name = 'OLD_id'
      end>
  end
end
