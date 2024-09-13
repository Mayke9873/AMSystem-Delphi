inherited dmCompras: TdmCompras
  object qCompra: TZQuery
    Connection = zCon
    UpdateObject = uCompra
    SQL.Strings = (
      'Select id From Compra where id = (select max(id) from Compra);')
    Params = <>
    Left = 24
    Top = 68
    object qCompraid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
  end
  object uCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Compra'
      'WHERE'
      '  Compra.id = :OLD_id')
    InsertSQL.Strings = (
      
        'insert into compra (ID, EX) select (select coalesce(max(id)+1, 1' +
        ') from compra), 1;')
    ModifySQL.Strings = (
      'UPDATE COMPRA SET'
      'ID_FORNECEDOR = :ID_FORNECEDOR, FORNECEDOR = :FORNECEDOR,'
      'VALOR = :VALOR, DESCONTO = :DESC,'
      ' VALOR_TOTAL = :TOTAL, PAGO = :PAGO ,'
      'VENDEDOR = :VENDEDOR, DATA_COMPRA = :DATA, EX = 0'
      'WHERE ID = :id;')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 68
    ParamData = <
      item
        Name = 'ID_FORNECEDOR'
      end
      item
        Name = 'FORNECEDOR'
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
        Name = 'PAGO'
      end
      item
        Name = 'VENDEDOR'
      end
      item
        Name = 'DATA'
      end
      item
        Name = 'id'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object qConsCompras: TZReadOnlyQuery
    SortedFields = 'ID'
    SortType = stDescending
    Connection = DM.zCon
    SQL.Strings = (
      'SELECT'
      
        '  a.ID, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_COMPRA, a. FO' +
        'RNECEDOR NOME'
      'FROM COMPRA a'
      'LEFT JOIN USUARIO b on  a.USUARIO = b.ID'
      '  WHERE ex = 0 and'
      '    (:dt = 0 or (a.DATA_COMPRA between :dt and :dtF))'
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
    object qConsComprasID: TZInt64Field
      FieldName = 'ID'
      ReadOnly = True
    end
    object qConsComprasVALOR: TZBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsComprasDESCONTO: TZBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsComprasVALOR_TOTAL: TZBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsComprasDATA_COMPRA: TZDateField
      FieldName = 'DATA_COMPRA'
      ReadOnly = True
    end
    object qConsComprasNOME: TZUnicodeStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 255
    end
  end
end
