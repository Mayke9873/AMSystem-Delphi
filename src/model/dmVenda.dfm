inherited dmVendas: TdmVendas
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
  object qConsVendas: TZReadOnlyQuery
    Connection = DM.zCon
    SortedFields = 'ID'
    SortType = stDescending
    SQL.Strings = (
      'SELECT'
      
        '  a.ID, a.CLIENTE, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_VE' +
        'NDA, b.NOME'
      'FROM VENDA a'
      'LEFT JOIN  FUNCIONARIO b on  a.VENDEDOR = b.ID'
      '  WHERE ex = 0 and'
      '    (:dt = 0 or (a.DATA_VENDA between :dt and :dtF))'
      '    order by id desc;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtF'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'ID Desc'
    Left = 24
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dtF'
        ParamType = ptUnknown
      end>
    object qConsVendasID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qConsVendasCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 250
    end
    object qConsVendasVALOR: TFloatField
      FieldName = 'VALOR'
      ReadOnly = True
      currency = True
    end
    object qConsVendasDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      ReadOnly = True
      EditFormat = '#.##'
      currency = True
    end
    object qConsVendasVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      currency = True
    end
    object qConsVendasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      ReadOnly = True
    end
    object qConsVendasNOME: TWideStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 255
    end
  end
end
