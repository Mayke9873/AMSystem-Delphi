unit uVenda;

interface

uses
  System.Generics.Collections, ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows, Interfaces,
  uCliente, uVenda.Itens, uComanda, uComanda.Itens;

type
  TVenda = class
  private
    FID: Integer;
    FidVendedor: Integer;
    FDesconto: Currency;
    FTotal: Currency;
    FDescontoProduto: Currency;
    FPrecoProduto: Currency;
    FItens: TObjectList<TVenda_Itens>;
    FCliente: TCliente;

    procedure SetID(const Value: Integer);
    procedure SetidVendedor(const Value: Integer);
    procedure SetDesconto(const Value: Currency);
    procedure SetTotal(const Value: Currency);
    procedure SetDescontoProduto(const Value: Currency);
    procedure SetPrecoProduto(const Value: Currency);
    procedure SetItens(const Value: TObjectList<TVenda_Itens>);
    procedure Estoque;
    procedure AbreVenda;
    procedure ItensPDV;
    procedure Financeiro;

  public
    fComanda: TComanda;

    property ID : Integer read FID write SetID;
    property idVendedor: Integer read FidVendedor write SetidVendedor;
    property Desconto : Currency read FDesconto write SetDesconto;
    property Total : Currency read FTotal write SetTotal;
    property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
    property PrecoProduto : Currency read FPrecoProduto write SetPrecoProduto;
    property Itens: TObjectList<TVenda_Itens> read FItens write SetItens;
    property Cliente: TCliente read FCliente write FCliente;

    procedure Soma;
    procedure Subtrair;
    procedure LimpaVenda;
    procedure ExcluirProduto(index: Integer = 0);
    procedure InsereVenda(pCodigoVenda : String);
    procedure InserirItemComanda(aItem: TVenda_Itens);

    function Salvar: Boolean;
    function Cancelar: Boolean;
    function Finaliza: Boolean;

    constructor Create;
    destructor Destroy; override;
  End;

implementation

  uses
    uDM, FrmVenda, uProduto, uEstoque, Consts, dmCliente, dmVenda, uFinanceiro.Movimento,
  System.StrUtils;

{ TVenda }

procedure TVenda.ExcluirProduto(index: Integer = 0);
begin
  if not (DM.qParametroUsa_PDV.AsString = 'S') then
    ExecSQL('Update Venda_item set ex = 2 where id = '+ fVenda.DBGrid1.Fields[0].AsString +' and ' +
            ' IdVenda = '+ IntToStr(ID) +';');

  if DM.qParametroUsa_comanda.AsString = 'S' then
    fComanda.Itens[index].Ex := 2;

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
    if Application.MessageBox('Confirma venda?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin

      ItensPDV();

      ExecSQL('UPDATE VENDA SET ID_CLIENTE = ' + IfThen(FCliente.Cod = 0, 'null', FCliente.Cod.ToString) +
        ', CLIENTE = ' + FCliente.Nome.QuotedString +
        ', VALOR = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', DESCONTO = ' + StringReplace(FloatToStr(Desconto), ',', '.', []) +
        ', VALOR_TOTAL = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', PAGO = ' + StringReplace(FloatToStr(Total), ',', '.', []) +
        ', VENDEDOR = ' + IfThen(idVendedor = 0, 'null', idVendedor.ToString) + ', DATA_VENDA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
        ', EX = 5 WHERE ID = ' + IntToStr(ID) + ';');

      ExecSQL('UPDATE venda_item set ex = 0 where ex = 9 and idVenda = ' + IntToStr(ID) + ';');

      Estoque();
      Financeiro();

      if DM.qParametroUsa_comanda.AsString = 'S' then
      begin
        fComanda.idVenda := FID;
        fComanda.Finaliza();
      end;

      LimpaVenda();
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
      dmVendas.qProdVendaidVenda.AsString   := IfThen(FID = 0, '', FID.ToString);
      dmVendas.qProdVendaidprod.AsInteger   := Item.idProduto;
      dmVendas.qProdVendadescricao.AsString := Item.descricao;
      dmVendas.qProdVendavalor.AsFloat      := Item.valor_unit;
      dmVendas.qProdVendadesconto.AsFloat   := Item.desconto;
      dmVendas.qProdVendaquantidade.AsFloat := Item.quantidade;
      dmVendas.qProdVendatotal.AsFloat      := Item.total;
      dmVendas.qProdVendaex.AsInteger       := 5;

      dmVendas.qProdVenda.Post;
      dmVendas.qProdVenda.ApplyUpdates;
      dmVendas.qProdVenda.Close;
    end;
  end;
end;

constructor TVenda.Create;
begin
  Itens     := TObjectList<TVenda_Itens>.Create;
  fComanda  := TComanda.Create;
end;

destructor TVenda.Destroy;
begin
  FreeAndNil(fComanda);
  FreeAndNil(Itens);
  inherited;
end;

procedure TVenda.Financeiro();
begin
  var Caixa := TCaixa.Create;
  Caixa.idConta := 1;
  Caixa.idMov   := Self.FID;
  Caixa.tipoMov := CVenda;
  Caixa.valor   := Self.FTotal;
  Caixa.ex      := 0;
  Caixa.InsereCaixa(Caixa);

  FreeAndNil(Caixa);
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
      Prod.idProduto      := Item.idProduto;
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
    ExecSQL('delete from movestoque where tipoMov = ''V'' and IdMovimentacao = '+ Id.ToString);
    ExecSQL('Delete from venda_item where idVenda = '+  IntToStr(ID));
    ExecSQL('Delete from venda where ID = ' + IntToStr(ID));
    ExecSQL('ALTER table venda AUTO_INCREMENT = 0');
    ExecSQL('ALTER table venda_item AUTO_INCREMENT = 0');
    ExecSQL('ALTER table MovEstoque AUTO_INCREMENT = 0');
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

function TVenda.Salvar: Boolean;
var
  Item: TVenda_Itens;
begin
  if NOT (Application.MessageBox('Salvar comanda?', 'Confirmação', MB_YESNO + 32) = IDYES) then
    Exit(False);

  if DM.qParametroUsa_comanda.AsString = 'S' then
  begin
    fComanda.SalvaItens;
    Self.Itens.Clear;
    Exit(True);
  end;
end;

procedure TVenda.InserirItemComanda(aItem: TVenda_Itens);
var
  LItensComanda: TItensComanda;
begin
  LItensComanda := TItensComanda.Create;

  LItensComanda.comanda     := Self.fComanda.comanda;
  LItensComanda.idProduto   := aItem.idProduto;
  LItensComanda.quantidade  := aItem.quantidade;
  LItensComanda.valorUnitario := aItem.valor_unit;
  LItensComanda.valorTotal    := aItem.total;
  LItensComanda.Status        := 'A';
  LItensComanda.ex            := 0;

  Self.fComanda.Itens.Add(LItenscomanda);
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
var
  Comanda: TComanda;
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
