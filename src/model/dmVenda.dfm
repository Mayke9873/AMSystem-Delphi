inherited dmVendas: TdmVendas
  object qVenda: TZQuery [4]
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
  object uVenda: TZUpdateSQL [5]
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
        Name = 'ID_CLIENTE'
      end
      item
        Name = 'CLIENTE'
      end
      item
        Name = 'VALOR'
      end
      item
        Name = 'DESC'
      end
      item
        Name = 'TOTAL'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object qConsVendas: TZReadOnlyQuery [6]
    SortedFields = 'ID'
    SortType = stDescending
    Connection = DM.zCon
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
        Name = 'dt'
      end
      item
        Name = 'dtF'
      end>
    IndexFieldNames = 'ID Desc'
    Left = 24
    Top = 128
    ParamData = <
      item
        Name = 'dt'
      end
      item
        Name = 'dtF'
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
    object qConsVendasVALOR: TZBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 6
      Size = 2
    end
    object qConsVendasDESCONTO: TZBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 6
      Size = 2
    end
    object qConsVendasVALOR_TOTAL: TZBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 6
      Size = 2
    end
    object qConsVendasDATA_VENDA: TZDateField
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
