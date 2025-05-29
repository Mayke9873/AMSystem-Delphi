unit uCompra;

interface

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows, ZDataset,
  System.Generics.Collections, uCompra.Itens, Data.DB, Datasnap.DBClient;

type TCompra = class
  private
    FID: Integer;
    FDesconto: Currency;
    FTotal: Currency;
    Fforncedor: String;
    FidForncedor: Integer;
    FEX: Integer;
    FItensCompra: TObjectList<TProdutoCompra>;

    procedure SetID(const Value: Integer);
    procedure SetDesconto(const Value: Currency);
    procedure SetTotal(const Value: Currency);
    procedure Estoque;
    procedure Financeiro;
    procedure Setforncedor(const Value: String);
    procedure SetidForncedor(const Value: Integer);
    procedure SetEX(const Value: Integer);
    procedure SetItensCompra(const Value: TObjectList<TProdutoCompra>);

    procedure LimpaCompra;

  public
    property Total : Currency read FTotal write SetTotal;
    property Desconto : Currency read FDesconto write SetDesconto;
    property ID : Integer read FID write SetID;
    property idForncedor: Integer read FidForncedor write SetidForncedor;
    property forncedor: String read Fforncedor write Setforncedor;
    property EX: Integer read FEX write SetEX;
    property ItensCompra: TObjectList<TProdutoCompra> read FItensCompra write SetItensCompra;

    constructor Create;
    destructor  Destroy; override;

    procedure Soma; overload;
    procedure Soma(aItem: TProdutoCompra); overload;
    procedure Subtrair(aItem: TProdutoCompra);
    procedure ExcluirProduto(cdsItem: TClientDataSet = nil; pID: Integer = 0);
    procedure InserirItem(aItem: TProdutoCompra);
    function Cancelar: Boolean;
    function Salvar: Boolean;

  End;

implementation

uses
  Math,
  uDM, uProduto, uEstoque, Consts, FrmCompra,
  dmFornecedor, uFinanceiro.Movimento, dmCompra;

{ TCompra }

constructor TCompra.Create;
begin
  FID           := 0;
  FidForncedor  := 0;
  FDesconto     := 0;
  FTotal        := 0;

  ItensCompra := TObjectList<TProdutoCompra>.Create;
end;

destructor TCompra.Destroy;
begin
  FreeAndNil(ItensCompra);

  inherited;
end;

procedure TCompra.ExcluirProduto(cdsItem: TClientDataSet = nil; pID: Integer = 0);
begin
  if (FItensCompra.Count = 0) or (pID = 0) then
    Abort;

  try
    cdsItem.Edit;
    cdsItem.FieldByName('ex').AsInteger := Cancelado;
    cdsItem.Post;

    FItensCompra[pID-1].EX := Cancelado;
  except
    raise Exception.Create('Erro ao excluir produto');
  end;

  Subtrair(FItensCompra[pID-1]);
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
      if ProdutoCompra.ex = Cancelado then
        Continue;

      Prod.idProduto := ProdutoCompra.idProduto;
      Prod.qtd       := ProdutoCompra.quantidade;
      Prod.idMovimentacao := FID;

      Prod.MovEstoque(Compra, IfThen(ProdutoCompra.EX = 2, Saida, Entrada));
    end;
  finally
    FreeAndNil(Prod);
  end;
end;

procedure TCompra.Financeiro();
begin
  var Caixa := TCaixa.Create;

  try
    Caixa.idConta := 1;
    Caixa.idMov   := Self.FID;
    Caixa.tipoMov := Compra;
    Caixa.valor   := Self.FTotal;
    Caixa.ex      := 0;
    Caixa.InsereCaixa(Caixa);
  finally
    FreeAndNil(Caixa);
  end;
end;

function TCompra.Salvar: Boolean;
var
  DmCompra: TdmCompras;
begin
  DmCompra := TdmCompras.Create(nil);
  try
    DmCompra.SalvarCompra(Self);

    Estoque();
    Financeiro();
    Self.ID := 0;
    ItensCompra.Clear;
  finally
    FreeAndNil(DmCompra);
  end;
end;

procedure TCompra.InserirItem(aItem: TProdutoCompra);
begin
  Self.ItensCompra.Add(aItem);
  Self.Soma(aItem);
end;

function TCompra.Cancelar : Boolean;
begin
  Result := False;

  if not (Application.MessageBox('Deseja concelar compra?', 'Confirmação', 32 + MB_YESNO) = IDYES) then
    Abort;

  Result := True;
end;

procedure TCompra.LimpaCompra;
begin
  FItensCompra.Clear;
  FTotal    := 0;
  FDesconto := 0;
end;

procedure TCompra.Soma;
var
  LItem: TProdutoCompra;
begin
  FTotal := 0;
  FDesconto := 0;

  for LItem in FItensCompra do
  begin
    if Assigned(LItem) then
      Continue;

    if LItem.EX = Cancelado then
      Continue;

    Soma(LItem);
  end;
end;

procedure TCompra.Soma(aItem: TProdutoCompra);
begin
  Total := Total + aItem.total;
  Desconto := Desconto + (aItem.desconto);
end;

procedure TCompra.Subtrair(aItem: TProdutoCompra);
begin
  Total := Total - aItem.total;
  Desconto := Desconto - aItem.desconto;
end;

procedure TCompra.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
end;

procedure TCompra.SetEX(const Value: Integer);
begin
  FEX := Value;
end;

procedure TCompra.SetID(const Value: Integer);
begin
  FID := Value;
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

