unit dmCompra;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZAbstractTable, Vcl.DdeMan, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  uCompra, uCompra.Itens;

type
  TdmCompras = class(TDM)
    qCompra: TZQuery;
    uCompra: TZUpdateSQL;
    qConsCompras: TZReadOnlyQuery;
    qCompraid: TZInt64Field;
    qConsComprasID: TZInt64Field;
    qConsComprasVALOR: TZBCDField;
    qConsComprasDESCONTO: TZBCDField;
    qConsComprasVALOR_TOTAL: TZBCDField;
    qConsComprasDATA_COMPRA: TZDateField;
    qConsComprasNOME: TZUnicodeStringField;
    qProdCompra: TZQuery;
    qProdCompraid: TZInt64Field;
    qProdCompraidCompra: TZInt64Field;
    qProdCompraidprod: TZInt64Field;
    qProdCompradescricao: TZUnicodeStringField;
    qProdCompravalor: TZBCDField;
    qProdCompradesconto: TZBCDField;
    qProdCompraquantidade: TZBCDField;
    qProdCompratotal: TZBCDField;
    qProdCompraex: TZIntegerField;
    uProdCompra: TZUpdateSQL;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    FQuery: TZQuery;
    FSQL: String;
    procedure SetQuery(const Value: TZQuery);
    procedure SetSQL(const Value: String);
    property SQL: String read FSQL write SetSQL;
    property Query: TZQuery read FQuery write SetQuery;

    function AtivaQryItens(aId: Integer): Boolean;

  public
    function SalvarCompra(aCompra: TCompra): Boolean;
    function SalvaItem(aItem: TProdutoCompra; aIdCompra: Integer): Boolean;
  end;

var
  dmCompras: TdmCompras;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmCompras.DataModuleCreate(Sender: TObject);
begin
  inherited;

  Query := TZQuery.Create(nil);
  Query.Connection := zCon;
end;

procedure TdmCompras.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(Query);

  inherited;
end;

function TdmCompras.SalvarCompra(aCompra: TCompra): Boolean;
var
  LItem: TProdutoCompra;
  LQry: TZQuery;
begin
  Result := False;

  //Edicao
  if aCompra.ID <> 0 then
  begin
    SQL := 'UPDATE COMPRA SET ID_FORNECEDOR = ' + aCompra.idForncedor.ToString +
      ', FORNECEDOR = ' + aCompra.forncedor.QuotedString +
      ', VALOR = ' + StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
      ', DESCONTO = ' + StringReplace(FloatToStr(aCompra.Desconto), ',', '.', []) +
      ', VALOR_TOTAL = ' + StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
      ', PAGO = ' + StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
      ', EX = 0 WHERE ID = ' + IntToStr(aCompra.ID) + ';';
    FQuery.ExecSQL;

    if AtivaQryItens(aCompra.ID) then
      for LItem in aCompra.ItensCompra do
        SalvaItem(LItem, aCompra.ID);

    Exit(True);
  end;

  SQL := 'INSERT INTO COMPRA (id_fornecedor, fornecedor '+
    ', valor, desconto, valor_total '+
    ', pago, troco, usuario, data_compra) '+
    'VALUES ('+ aCompra.idForncedor.ToString +', '+ aCompra.forncedor.QuotedString +
    ', '+ StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
    ', '+ StringReplace(FloatToStr(aCompra.Desconto), ',', '.', []) +
    ', '+ StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
    ', '+ StringReplace(FloatToStr(aCompra.Total), ',', '.', []) +
    ', null, null, CURRENT_DATE());';
  FQuery.ExecSQL;

  SQL := 'select LAST_INSERT_ID() id;';
  FQuery.Open;

  aCompra.ID := FQuery.Fields[0].AsInteger;

  if AtivaQryItens(aCompra.ID) then
    for LItem in aCompra.ItensCompra do
      SalvaItem(LItem, aCompra.ID);

  Result := True;
end;

procedure TdmCompras.SetQuery(const Value: TZQuery);
begin
  FQuery := Value;
end;

procedure TdmCompras.SetSQL(const Value: String);
begin
  FSQL := Value;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(FSQL);
end;

function TdmCompras.AtivaQryItens(aId: Integer): Boolean;
begin
  if not (qProdCompra.Active) and (aId <> 0) then
  begin
    qProdCompra.Params[0].AsInteger := aId;
    qProdCompra.Open;
  end;

  Result := qProdCompra.Active;
end;

function TdmCompras.SalvaItem(aItem: TProdutoCompra; aIdCompra: Integer): Boolean;
begin
  if not Assigned(aItem) then
    Exit;

  if aItem.EX = 3 then
    Exit;

  qProdCompra.Append;

  qProdCompraidprod.AsInteger   := aItem.idProduto;
  qProdCompraidCompra.AsInteger := aIdCompra;
  qProdCompradescricao.AsString := aItem.descricao;
  qProdCompravalor.AsFloat      := aItem.valor;
  qProdCompradesconto.AsFloat   := aItem.desconto;
  qProdCompraquantidade.AsFloat := aItem.quantidade;
  qProdCompratotal.AsFloat      := aItem.total;
  qProdCompraex.AsInteger       := 0;

  qProdCompra.ApplyUpdates;
end;

end.
