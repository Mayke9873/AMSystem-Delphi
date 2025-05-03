unit uCompra;

interface

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows, ZDataset,
  System.Generics.Collections, uCompra.Itens;

type TCompra = class
  private
    FID: Integer;
    FDesconto: Currency;
    FTotal: Currency;
    FDescontoProduto: Currency;
    FPrecoProduto: Currency;
    Fforncedor: String;
    FidForncedor: Integer;
    FItensCompra: TObjectList<TProdutoCompra>;
    procedure SetID(const Value: Integer);
    procedure SetDesconto(const Value: Currency);
    procedure SetTotal(const Value: Currency);
    procedure SetDescontoProduto(const Value: Currency);
    procedure SetPrecoProduto(const Value: Currency);
    procedure Estoque;
    procedure Financeiro;
    procedure Setforncedor(const Value: String);
    procedure SetidForncedor(const Value: Integer);
    procedure SetItensCompra(const Value: TObjectList<TProdutoCompra>);
    procedure LimpaCompra;

  public
    property Total : Currency read FTotal write SetTotal;
    property Desconto : Currency read FDesconto write SetDesconto;
    property PrecoProduto : Currency read FPrecoProduto write SetPrecoProduto;
    property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
    property ID : Integer read FID write SetID;
    property idForncedor: Integer read FidForncedor write SetidForncedor;
    property forncedor: String read Fforncedor write Setforncedor;
    property ItensCompra: TObjectList<TProdutoCompra> read FItensCompra write SetItensCompra;

    constructor Create;
    destructor  Destroy; override;

    procedure Soma;
    procedure Subtrair;
    procedure ExcluirProduto(pID: Integer = 0);
    procedure InsereCompra(pCodigoCompra : String);
    function Cancelar: Boolean;
    function Finaliza: Boolean;
  End;

implementation

  uses
    uDM, FrmVenda, uProduto, uEstoque, Consts, FrmCompra, dmFornecedor, dmCompra, uFinanceiro.Movimento;

{ TCompra }

constructor TCompra.Create;
begin
  ItensCompra := TObjectList<TProdutoCompra>.Create;
end;

destructor TCompra.Destroy;
begin
  FreeAndNil(ItensCompra);
  inherited;
end;

procedure TCompra.ExcluirProduto(pID: Integer = 0);
begin
  ExecSQL('Update Compra_item set ex = 1 where id = '+ pID.ToString +' and ' +
      ' IdCompra = '+ IntToStr(ID) +';');

  //TODO: Fazer exclusao de produto da Object List.
  Subtrair();
end;

function TCompra.Finaliza : Boolean;
begin
  Result := False;
  if ID <> 0 then
  begin
    if Application.MessageBox('Confirma compra?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      ExecSQL('UPDATE COMPRA SET ID_FORNECEDOR = ' + FidForncedor.ToString +
        ', FORNECEDOR = ' + Fforncedor.QuotedString +
        ', VALOR = ' + StringReplace(FloatToStr(FTotal), ',', '.', []) +
        ', DESCONTO = ' + StringReplace(FloatToStr(FDesconto), ',', '.', []) +
        ', VALOR_TOTAL = ' + StringReplace(FloatToStr(FTotal), ',', '.', []) +
        ', PAGO = ' + StringReplace(FloatToStr(FTotal), ',', '.', []) +
        ', DATA_COMPRA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
        ', EX = 0 WHERE ID = ' + IntToStr(ID) + ';');

      ExecSQL('UPDATE compra_item set ex = 0 where ex = 9 and idCompra = ' + IntToStr(ID) + ';');

      Estoque();
      Financeiro();
      Self.ID := 0;
      ItensCompra.Clear;
      Result := True;
    end;
  end;
end;

procedure TCompra.Estoque;
var
  Prod: TEstoque;
  ProdutoCompra: TProdutoCompra;
begin
  Prod := TEstoque.Create;
  try
    for ProdutoCompra in ItensCompra do
    begin
      Prod.idProduto := ProdutoCompra.idProduto;
      Prod.qtd       := ProdutoCompra.quantidade;
      Prod.idMovimentacao := FID;

      Prod.MovEstoque(Compra, Entrada);
    end;
  finally
    FreeAndNil(Prod);
  end;

end;

procedure TCompra.Financeiro();
begin
  var Caixa := TCaixa.Create;
  Caixa.idConta := 1;
  Caixa.idMov   := Self.FID;
  Caixa.tipoMov := Compra;
  Caixa.valor   := Self.FTotal;
  Caixa.ex      := 0;
  Caixa.InsereCaixa(Caixa);

  FreeAndNil(Caixa);
end;

procedure TCompra.InsereCompra(pCodigoCompra : String);
begin
  if (Length(pCodigoCompra.Trim) = 0) or (pCodigoCompra.Trim = '0') then
  begin
    Total := 0;
    Desconto := 0;

    var LQuery := TZQuery.Create(nil);
    try
      LQuery.Connection := DM.zCon;

      ExecSQL('ALTER table compra AUTO_INCREMENT = 0');
      ExecSQL('insert into compra (ID, EX) values (null, 1);');

      LQuery.SQL.Add('select LAST_INSERT_ID() id;');
      LQuery.Open;

      ID := LQuery.Fields[0].AsInteger;
    finally
      FreeAndNil(LQuery);
    end;
  end;
end;

function TCompra.Cancelar : Boolean;
begin
  Result := False;
  if Application.MessageBox('Deseja cancelar compra?', 'AmSystem', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    ExecSQL('Delete from Compra_item where idCompra = '+  IntToStr(ID));
    ExecSQL('Delete from Compra where ID = ' + IntToStr(ID));
    LimpaCompra();
    Result := True;
  end;

end;

procedure TCompra.LimpaCompra;
begin
  FItensCompra.Clear;
  FTotal    := 0;
  FDesconto := 0;
end;

procedure TCompra.Soma;
begin
  PrecoProduto := PrecoProduto - DescontoProduto;
  Total := Total + PrecoProduto;
  Desconto := Desconto + (DescontoProduto);
end;

procedure TCompra.Subtrair;
begin
  Total := Total - PrecoProduto;
  Desconto := Desconto - DescontoProduto;
end;

procedure TCompra.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
end;

procedure TCompra.SetDescontoProduto(const Value: Currency);
begin
  FDescontoProduto := Value;
end;

procedure TCompra.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCompra.SetPrecoProduto(const Value: Currency);
begin
  FPrecoProduto := Value;
end;

procedure TCompra.SetTotal(const Value: Currency);
begin
  FTotal := Value;
end;

procedure TCompra.SetidForncedor(const Value: Integer);
begin
  FidForncedor := Value;
end;

procedure TCompra.SetItensCompra(const Value: TObjectList<TProdutoCompra>);
begin
  FItensCompra := Value;
end;

procedure TCompra.Setforncedor(const Value: String);
begin
  Fforncedor := Value;
end;

end.
