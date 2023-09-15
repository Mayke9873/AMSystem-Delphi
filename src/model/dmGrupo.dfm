inherited dmGrupos: TdmGrupos
  inherited zCon: TZConnection
    Connected = True
  end
  object dGrupo: TDataSource
    DataSet = qGrupo
    Left = 16
    Top = 200
  end
  object qGrupo: TZQuery
    Connection = zCon
    SortedFields = 'Id'
    UpdateObject = uGrupo
    OnNewRecord = qGrupoNewRecord
    SQL.Strings = (
      'select id, descricao, ativo from grupo_produto'
      '  where (0 = :id or id = :id) and '
      '  descricao like :pesq and'
      '  ('#39'T'#39' = :ativo or ativo = :ativo)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pesq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'Id Asc'
    Left = 16
    Top = 102
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pesq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ativo'
        ParamType = ptUnknown
      end>
    object qGrupoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qGrupodescricao: TWideStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qGrupoativo: TWideStringField
      FieldName = 'ativo'
      Required = True
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
        DataType = ftUnknown
        Name = 'descricao'
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
end
