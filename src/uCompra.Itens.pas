unit uCompra.Itens;

interface

type
  TProdutoCompra = class
  private
    Fdesconto: Currency;
    Fvalor: Currency;
    Fdescricao: String;
    Ftotal: Currency;
    FidProduto: Integer;
    Fid: Integer;
    FidCompra: Integer;
    FEX: Integer;
    Fquantidade: Double;

    procedure Setdesconto(const Value: Currency);
    procedure Setdescricao(const Value: String);
    procedure SetEX(const Value: Integer);
    procedure Setid(const Value: Integer);
    procedure SetidCompra(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure Settotal(const Value: Currency);
    procedure Setvalor(const Value: Currency);
    procedure Setquantidade(const Value: Double);

    procedure CalculaTotal;

  public
    property id: Integer read Fid write Setid;
    property idCompra: Integer read FidCompra write SetidCompra;
    property idProduto: Integer read FidProduto write SetidProduto;
    property descricao: String read Fdescricao write Setdescricao;
    property quantidade: Double read Fquantidade write Setquantidade;
    property valor: Currency read Fvalor write Setvalor;
    property desconto: Currency read Fdesconto write Setdesconto;
    property total: Currency read Ftotal write Settotal;
    property EX: Integer read FEX write SetEX;
  end;

implementation

{ TProdutoCompra }

procedure TProdutoCompra.CalculaTotal;
begin
  Self.total := (Fvalor * Fquantidade) - Fdesconto;
end;

procedure TProdutoCompra.Setdesconto(const Value: Currency);
begin
  Fdesconto := Value;

  CalculaTotal();
end;

procedure TProdutoCompra.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TProdutoCompra.SetEX(const Value: Integer);
begin
  FEX := Value;
end;

procedure TProdutoCompra.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TProdutoCompra.SetidCompra(const Value: Integer);
begin
  FidCompra := Value;
end;

procedure TProdutoCompra.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TProdutoCompra.Setquantidade(const Value: Double);
begin
  Fquantidade := Value;

  CalculaTotal();
end;

procedure TProdutoCompra.Settotal(const Value: Currency);
begin
  Ftotal := Value;
end;

procedure TProdutoCompra.Setvalor(const Value: Currency);
begin
  Fvalor := Value;

  CalculaTotal();
end;

end.
