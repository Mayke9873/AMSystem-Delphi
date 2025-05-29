inherited dmCompras: TdmCompras
  OnDestroy = DataModuleDestroy
  inherited zCon: TZConnection
    Connected = True
    LibraryLocation = 
      'Z:\Desenvolvimento\Projetos\Delphi\AMSystem-Delphi\bin\libmariad' +
      'b.dll'
  end
  object qCompra: TZQuery
    Connection = zCon
    UpdateObject = uCompra
    SQL.Strings = (
      'select * from compra where id = :id or '#39'T'#39' = :todos;')
    Params = <
      item
        Name = 'id'
      end
      item
        Name = 'todos'
      end>
    Left = 24
    Top = 68
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'todos'
      end>
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
  object qProdCompra: TZQuery
    Connection = DM.zCon
    UpdateObject = uProdCompra
    SQL.Strings = (
      
        'Select id, idCompra, idprod, descricao, valor, desconto, quantid' +
        'ade, total, ex'
      '  From Compra_item where idCompra = :idCompra and ex = 9;')
    Params = <
      item
        DataType = ftWideString
        Name = 'idCompra'
        SQLType = stUnicodeString
      end>
    Left = 165
    Top = 166
    ParamData = <
      item
        DataType = ftWideString
        Name = 'idCompra'
        SQLType = stUnicodeString
      end>
    object qProdCompraid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qProdCompraidCompra: TZInt64Field
      FieldName = 'idCompra'
      Required = True
    end
    object qProdCompraidprod: TZInt64Field
      FieldName = 'idprod'
      Required = True
    end
    object qProdCompradescricao: TZUnicodeStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qProdCompravalor: TZBCDField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompradesconto: TZBCDField
      FieldName = 'desconto'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompraquantidade: TZBCDField
      FieldName = 'quantidade'
      Required = True
      DisplayFormat = '###,###,##0.000'
      Precision = 11
      Size = 3
    end
    object qProdCompratotal: TZBCDField
      FieldName = 'total'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdCompraex: TZIntegerField
      FieldName = 'ex'
      Required = True
    end
  end
  object uProdCompra: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Compra_item'
      'WHERE'
      '  Compra_item.id = :OLD_id AND'
      '  Compra_item.idVenda = :OLD_idCompra AND'
      '  Compra_item.idprod = :OLD_idprod AND'
      '  Compra_item.valor = :OLD_valor AND'
      '  Compra_item.desconto = :OLD_desconto AND'
      '  Compra_item.quantidade = :OLD_quantidade AND'
      '  Compra_item.total = :OLD_total AND'
      '  Compra_item.ex = :OLD_ex')
    InsertSQL.Strings = (
      'INSERT INTO Compra_item'
      
        '  (idCompra, idprod, descricao, valor, desconto, quantidade, tot' +
        'al, '
      '   ex)'
      'VALUES'
      
        '  ((select max(id) from Compra), :idprod, :descricao, :valor, :d' +
        'esconto, :quantidade, '
      '   :total, 9)')
    ModifySQL.Strings = (
      'UPDATE Compra_item SET'
      '  id = :id,'
      '  idCompra = :idCompra,'
      '  idprod = :idprod,'
      '  descricao = :descricao,'
      '  valor = :valor,'
      '  desconto = :desconto,'
      '  quantidade = :quantidade,'
      '  total = :total,'
      '  ex = :ex'
      'WHERE'
      '  Compra_item.id = :OLD_id AND'
      '  Compra_item.idVenda = :OLD_idCompra AND'
      '  Compra_item.idprod = :OLD_idprod AND'
      '  Compra_item.valor = :OLD_valor AND'
      '  Compra_item.desconto = :OLD_desconto AND'
      '  Compra_item.quantidade = :OLD_quantidade AND'
      '  Compra_item.total = :OLD_total AND'
      '  Compra_item.ex = :OLD_ex')
    UseSequenceFieldForRefreshSQL = False
    Left = 205
    Top = 166
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idCompra'
      end
      item
        Name = 'idprod'
      end
      item
        Name = 'descricao'
      end
      item
        Name = 'valor'
      end
      item
        Name = 'desconto'
      end
      item
        Name = 'quantidade'
      end
      item
        Name = 'total'
      end
      item
        Name = 'ex'
      end
      item
        Name = 'OLD_id'
      end
      item
        Name = 'OLD_idCompra'
      end
      item
        Name = 'OLD_idprod'
      end
      item
        Name = 'OLD_valor'
      end
      item
        Name = 'OLD_desconto'
      end
      item
        Name = 'OLD_quantidade'
      end
      item
        Name = 'OLD_total'
      end
      item
        Name = 'OLD_ex'
      end>
  end
end
