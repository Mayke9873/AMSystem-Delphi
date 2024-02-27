unit uVenda;

interface

uses
  ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows, Interfaces, uCliente, uVenda_Itens,
  System.Generics.Collections;

type
  TVenda = class
  private
    FID: Integer;
    FDesconto: Currency;
    FTotal: Currency;
    FDescontoProduto: Currency;
    FPrecoProduto: Currency;
    FItens: TObjectList<TVenda_Itens>;
    FidVendedor: Integer;
    procedure SetID(const Value: Integer);
    procedure SetDesconto(const Value: Currency);
    procedure SetTotal(const Value: Currency);
    procedure SetDescontoProduto(const Value: Currency);
    procedure SetPrecoProduto(const Value: Currency);
    procedure SetItens(const Value: TObjectList<TVenda_Itens>);
    procedure Estoque;
    procedure AbreVenda;
    procedure SetidVendedor(const Value: Integer);
    procedure ItensPDV;

  public
    property Total : Currency read FTotal write SetTotal;
    property Desconto : Currency read FDesconto write SetDesconto;
    property PrecoProduto : Currency read FPrecoProduto write SetPrecoProduto;
    property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
    property ID : Integer read FID write SetID;
    property Itens: TObjectList<TVenda_Itens> read FItens write SetItens;
    property idVendedor: Integer read FidVendedor write SetidVendedor;
    procedure Soma;
    procedure Subtrair;
    procedure LimpaVenda;
    procedure ExcluirProduto(index: Integer = 0);
    procedure InsereVenda(pCodigoVenda : String);
    function Cancelar: Boolean;
    function Finaliza: Boolean;

    constructor Create;
    destructor Destroy; override;
  End;

implementation

  uses
    uDM, FrmVenda, uProduto, uEstoque, Consts, dmCliente, dmVenda;

{ TVenda }

procedure TVenda.ExcluirProduto(index: Integer = 0);
begin
  if not (DM.qParametroUsa_PDV.AsString = 'S') then
    ExecSQL('Update Venda_item set ex = 1 where id = '+ fVenda.DBGrid1.Fields[0].AsString +' and ' +
            ' IdVenda = '+ IntToStr(ID) +';');

  PrecoProduto := FItens[index].total;
  Desconto     := FItens[index].desconto;

  FItens.Delete(index);

  Subtrair();
end;

function TVenda.Finaliza : Boolean;
begin
  Result := False;
  if (ID <> 0) or (DM.qParametroUsa_PDV.AsString = 'S') then
  begin
    if Application.MessageBox('Confirma venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin

      ItensPDV();

      ExecSQL('UPDATE VENDA SET ID_CLIENTE = ' + IntToStr(dmClientes.qClienteId.AsInteger) +
        ', CLIENTE = ' + QuotedStr(dmClientes.qClienteNome.AsString) +
        ', VALOR = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', DESCONTO = ' + StringReplace(FloatToStr(Desconto), ',', '.', []) +
        ', VALOR_TOTAL = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', PAGO = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', VENDEDOR = ' + QuotedStr(idVendedor.ToString) + ', DATA_VENDA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
        ', EX = 0 WHERE ID = ' + IntToStr(ID) + ';');

      ExecSQL('UPDATE venda_item set ex = 0 where ex = 9 and idVenda = ' + IntToStr(ID) + ';');

      Estoque();
      FItens.Clear;
      Result := True;
    end;
  end;
end;

procedure TVenda.ItensPDV;
var
  Item: TVenda_Itens;
begin
  if DM.qParametroUsa_PDV.AsString = 'S' then
  begin
    InsereVenda('');

    for Item in FItens do
    begin
      dmVendas.qProdVenda.Open;
      dmVendas.qProdVenda.Insert;
      dmVendas.qProdVendaidprod.AsInteger := Item.id;
      dmVendas.qProdVendadescricao.AsString := Item.descricao;
      dmVendas.qProdVendavalor.AsFloat := Item.valor_unit;
      dmVendas.qProdVendadesconto.AsFloat := Item.desconto;
      dmVendas.qProdVendaquantidade.AsFloat := Item.quantidade;
      dmVendas.qProdVendatotal.AsFloat := Item.total;

      dmVendas.qProdVenda.ApplyUpdates;
      dmVendas.qProdVenda.Close;
    end;
  end;
end;

constructor TVenda.Create;
begin
  Itens := TObjectList<TVenda_Itens>.Create;
end;

destructor TVenda.Destroy;
begin
  FreeAndNil(Itens);
  inherited;
end;

procedure TVenda.Estoque;
var
  Prod: TEstoque;
  Item: TVenda_Itens;
begin
  Prod := TEstoque.Create;
  try
    for Item in FItens do
    begin
      Prod.idProduto      := Item.id;
      Prod.qtd            := Item.quantidade;
      Prod.idMovimentacao := FID;

      Prod.MovEstoque(Venda, Saida);
    end;

  finally
    FreeAndNil(Prod);
  end;
end;

procedure TVenda.InsereVenda(pCodigoVenda : String);
begin
  if Length(pCodigoVenda) = 0 then
  begin
    if not (DM.qParametroUsa_PDV.AsString = 'S') then
    begin
      Total := 0;
      Desconto := 0;
    end;

    ExecSQL('insert into venda (ID, EX) select (select coalesce(max(id)+1, 1) from venda), 1;');

    AbreVenda();
  end;
end;

procedure TVenda.AbreVenda;
begin
  dmVendas.qVenda.Close;
  dmVendas.qVenda.Open;
  ID := dmVendas.qVenda.Fields[0].Value;
end;

procedure TVenda.LimpaVenda;
begin
  FItens.Clear;
  FTotal    := 0;
  FDesconto := 0;
end;

function TVenda.Cancelar : Boolean;
begin
  Result := False;
  if Application.MessageBox('Deseja cancelar venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    LimpaVenda;
    ExecSQL('Delete from venda where ID = ' + IntToStr(ID));
    ExecSQL('Delete from venda_item where idVenda = '+  IntToStr(ID));
    Result := True;
  end;
end;

procedure TVenda.Soma;
begin
  PrecoProduto := PrecoProduto - DescontoProduto;
  Total := Total + PrecoProduto;
  Desconto := Desconto + (DescontoProduto);
end;

procedure TVenda.Subtrair;
begin
  Total := Total - PrecoProduto;
  Desconto := Desconto - DescontoProduto;
end;

procedure TVenda.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
end;

procedure TVenda.SetDescontoProduto(const Value: Currency);
begin
  FDescontoProduto := Value;
end;

procedure TVenda.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TVenda.SetidVendedor(const Value: Integer);
begin
  FidVendedor := Value;
end;

procedure TVenda.SetItens(const Value: TObjectList<TVenda_Itens>);
begin
  FItens := Value;
end;

procedure TVenda.SetPrecoProduto(const Value: Currency);
begin
  FPrecoProduto := Value;
end;

procedure TVenda.SetTotal(const Value: Currency);
begin
  FTotal := Value;
end;

end.
