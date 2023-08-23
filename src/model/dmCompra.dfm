inherited dmCompras: TdmCompras
  inherited zCon: TZConnection
    Connected = True
  end
  object qCompra: TZQuery
    Connection = zCon
    UpdateObject = uCompra
    SQL.Strings = (
      'Select id From Compra where id = (select max(id) from Compra);')
    Params = <>
    Left = 24
    Top = 68
    object qCompraid: TIntegerField
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
        DataType = ftUnknown
        Name = 'ID_FORNECEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FORNECEDOR'
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
        Name = 'PAGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VENDEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_id'
        ParamType = ptUnknown
      end>
  end
end
