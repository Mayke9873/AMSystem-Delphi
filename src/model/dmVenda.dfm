inherited dmVendas: TdmVendas
  object qVenda: TZQuery
    Connection = zCon
    UpdateObject = uVenda
    SQL.Strings = (
      'Select id From Venda where id = (select max(id) from Venda);')
    Params = <>
    Left = 24
    Top = 68
    object qVendaid: TZInt64Field
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
  object qConsVendas: TZReadOnlyQuery
    SortedFields = 'ID'
    SortType = stDescending
    Connection = DM.zCon
    SQL.Strings = (
      'SELECT'
      
        '  a.ID, a.CLIENTE, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_VE' +
        'NDA, b.NOME'
      'FROM VENDA a'
      'LEFT JOIN  Usuario b on  a.VENDEDOR = b.ID'
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
    object qConsVendasID: TZInt64Field
      FieldName = 'ID'
      ReadOnly = True
    end
    object qConsVendasCLIENTE: TZUnicodeStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 250
    end
    object qConsVendasVALOR: TZBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsVendasDESCONTO: TZBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsVendasVALOR_TOTAL: TZBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,#00.00'
      Precision = 11
      Size = 3
    end
    object qConsVendasDATA_VENDA: TZDateField
      FieldName = 'DATA_VENDA'
      ReadOnly = True
    end
    object qConsVendasNOME: TZUnicodeStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 255
    end
  end
  object qVenda_comanda: TZQuery
    Connection = zCon
    UpdateObject = uVenda_comanda
    SQL.Strings = (
      
        'Select id From venda_comanda where id = (select max(id) from ven' +
        'da_comanda);')
    Params = <>
    Left = 24
    Top = 196
    object qVenda_comandaid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
  end
  object uVenda_comanda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM venda_comanda'
      'WHERE'
      '  Venda.id = :OLD_id')
    InsertSQL.Strings = (
      
        'insert into venda_comanda (ID, EX) select (select coalesce(max(i' +
        'd)+1, 1) from venda), 1;')
    ModifySQL.Strings = (
      'UPDATE venda_comanda SET'
      '        idComanda = :idComanda,'
      '        idProduto = :idProduto,'
      '        quantidade = :quantidade,'
      '        unitario = :unitario,'
      '        DESCONTO = :DESCONTO,'
      '        TOTAL = :TOTAL,'
      '        TOTALPAGO = Total,'
      '        EX = 0'
      'WHERE ID = :id;')
    UseSequenceFieldForRefreshSQL = False
    Left = 56
    Top = 196
    ParamData = <
      item
        Name = 'idComanda'
      end
      item
        Name = 'idProduto'
      end
      item
        Name = 'quantidade'
      end
      item
        Name = 'unitario'
      end
      item
        Name = 'DESCONTO'
      end
      item
        Name = 'TOTAL'
      end
      item
        Name = 'id'
      end
      item
        Name = 'OLD_id'
      end>
  end
  object CdsItens: TClientDataSet
    PersistDataPacket.Data = {
      B50000009619E0BD010000001800000006000000000003000000B50002494404
      000100000000000A636F6450726F6475746F04000100000000000D70726F6444
      657363726963616F01004900000001000557494454480200020064000770726F
      6451746408000400000000000870726F64556E69740800040000000100075355
      42545950450200490006004D6F6E6579000970726F64546F74616C0800040000
      00010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'codProduto'
        DataType = ftInteger
      end
      item
        Name = 'prodDescricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'prodQtd'
        DataType = ftFloat
      end
      item
        Name = 'prodUnit'
        DataType = ftCurrency
      end
      item
        Name = 'prodTotal'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 248
    Top = 24
    object CdsItensID: TIntegerField
      FieldName = 'ID'
    end
    object CdsItenscodProduto: TIntegerField
      FieldName = 'codProduto'
    end
    object CdsItensprodDescricao: TStringField
      FieldName = 'prodDescricao'
      Size = 100
    end
    object CdsItensprodQtd: TFloatField
      FieldName = 'prodQtd'
    end
    object CdsItensprodUnit: TCurrencyField
      FieldName = 'prodUnit'
    end
    object CdsItensprodTotal: TCurrencyField
      FieldName = 'prodTotal'
    end
  end
  object dProdVenda: TDataSource
    DataSet = qProdVenda
    Left = 389
    Top = 254
  end
  object uProdVenda: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Venda_item'
      'WHERE'
      '  Venda_item.id = :OLD_id AND'
      '  Venda_item.idVenda = :OLD_idVenda AND'
      '  Venda_item.idprod = :OLD_idprod AND'
      '  Venda_item.valor = :OLD_valor AND'
      '  Venda_item.desconto = :OLD_desconto AND'
      '  Venda_item.quantidade = :OLD_quantidade AND'
      '  Venda_item.total = :OLD_total AND'
      '  Venda_item.ex = :OLD_ex')
    InsertSQL.Strings = (
      'INSERT INTO Venda_item'
      
        '  (idVenda, idprod, descricao, valor, desconto, quantidade, tota' +
        'l, '
      '   ex)'
      'VALUES'
      
        '  ((select max(id) from Venda), :idprod, :descricao, :valor, :de' +
        'sconto, :quantidade, '
      '   :total, 9)')
    ModifySQL.Strings = (
      'UPDATE Venda_item SET'
      '  id = :id,'
      '  idVenda = :idVenda,'
      '  idprod = :idprod,'
      '  descricao = :descricao,'
      '  valor = :valor,'
      '  desconto = :desconto,'
      '  quantidade = :quantidade,'
      '  total = :total,'
      '  ex = :ex'
      'WHERE'
      '  Venda_item.id = :OLD_id AND'
      '  Venda_item.idVenda = :OLD_idVenda AND'
      '  Venda_item.idprod = :OLD_idprod AND'
      '  Venda_item.valor = :OLD_valor AND'
      '  Venda_item.desconto = :OLD_desconto AND'
      '  Venda_item.quantidade = :OLD_quantidade AND'
      '  Venda_item.total = :OLD_total AND'
      '  Venda_item.ex = :OLD_ex')
    UseSequenceFieldForRefreshSQL = False
    Left = 389
    Top = 206
    ParamData = <
      item
        Name = 'id'
      end
      item
        Name = 'idVenda'
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
        Name = 'OLD_idVenda'
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
  object qProdVenda: TZQuery
    Connection = DM.zCon
    UpdateObject = uProdVenda
    SQL.Strings = (
      
        'Select id, idVenda, idprod, descricao, valor, desconto, quantida' +
        'de, total, ex'
      '  From Venda_item where idvenda = :idVenda and ex = 9;')
    Params = <
      item
        Name = 'idVenda'
      end>
    Left = 389
    Top = 158
    ParamData = <
      item
        Name = 'idVenda'
      end>
    object qProdVendaid: TZInt64Field
      FieldName = 'id'
      Required = True
    end
    object qProdVendaidprod: TZInt64Field
      FieldName = 'idprod'
      Required = True
    end
    object qProdVendaquantidade: TZBCDField
      FieldName = 'quantidade'
      Required = True
      Precision = 11
      Size = 3
    end
    object qProdVendadescricao: TZUnicodeStringField
      FieldName = 'descricao'
      Required = True
      Size = 255
    end
    object qProdVendadesconto: TZBCDField
      FieldName = 'desconto'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdVendatotal: TZBCDField
      FieldName = 'total'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdVendavalor: TZBCDField
      FieldName = 'valor'
      Required = True
      DisplayFormat = '###,###,##0.00'
      Precision = 11
      Size = 3
    end
    object qProdVendaidVenda: TZInt64Field
      FieldName = 'idVenda'
      Required = True
    end
    object qProdVendaex: TZIntegerField
      FieldName = 'ex'
      Required = True
    end
  end
end
