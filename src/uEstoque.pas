unit uEstoque;

interface

uses
  System.SysUtils, Vcl.Forms;

type
  TEstoque = class
  private
    Fqtd: Double;
    FidProduto: integer;
    FCod: integer;
    FdataMov: TDate;
    FtipoMov: String;
    FidFornecedor: integer;
    Fobs: String;
    FidMovimentacao: Integer;
    procedure SetidProduto(const Value: integer);
    procedure Setqtd(const Value: Double);
    procedure SetCod(const Value: integer);
    procedure SetdataMov(const Value: TDate);
    procedure SetidFornecedor(const Value: integer);
    procedure SettipoMov(const Value: String);
    procedure Setobs(const Value: String);
    procedure SetidMovimentacao(const Value: Integer);
  public
    procedure MovEstoque(const tipo : String; multiplo : Integer; ajuste: Boolean = False);

  published
    property Cod : integer read FCod write SetCod;
    property idProduto : integer read FidProduto write SetidProduto;
    property qtd : Double read Fqtd write Setqtd;
    property obs : String read Fobs write Setobs;
    property dataMov : TDate read FdataMov write SetdataMov;
    property tipoMov : String read FtipoMov write SettipoMov;
    property idFornecedor : integer read FidFornecedor write SetidFornecedor;
    property idMovimentacao: Integer read FidMovimentacao write SetidMovimentacao;

  end;

implementation

{ TEstoque }

uses dmProduto;

procedure TEstoque.MovEstoque(const tipo : String; multiplo : Integer; ajuste: Boolean = False);
begin
  if Fqtd = 0 then
  begin
    Application.MessageBox('Quantidade não pode ser 0 ou vazio.'#13'Por favor, verifique!', 'AmSystem', 48);
    Exit;
  end;

  dmProdutos.qMovEstoque.Open;
  dmProdutos.qMovEstoque.Insert;
  dmProdutos.qMovEstoqueIdProduto.AsInteger := FidProduto;
  dmProdutos.qMovEstoqueQuantidade.AsFloat  := Fqtd * multiplo;
  dmProdutos.qMovEstoqueObs.AsString        := Fobs;
  dmProdutos.qMovEstoquedataMov.AsDateTime  := Now;
  dmProdutos.qMovEstoqueidUsuario.AsInteger := 1;
  dmProdutos.qMovEstoquetipoMov.AsString    := tipo;
  dmProdutos.qMovEstoqueidFornecedor.AsInteger   := FidFornecedor;
  dmProdutos.qMovEstoqueidMovimentacao.AsInteger := FidMovimentacao;
  dmProdutos.qMovEstoque.Post;
  dmProdutos.qProduto.Refresh;

  if ajuste then  
    Application.MessageBox('Ajuste realizado com sucesso!','' , 32);
end;

procedure TEstoque.SetCod(const Value: integer);
begin
  FCod := Value;
end;

procedure TEstoque.SetdataMov(const Value: TDate);
begin
  FdataMov := Value;
end;

procedure TEstoque.SetidFornecedor(const Value: integer);
begin
  FidFornecedor := Value;
end;

procedure TEstoque.SetidMovimentacao(const Value: Integer);
begin
  FidMovimentacao := Value;
end;

procedure TEstoque.SetidProduto(const Value: integer);
begin
  FidProduto := Value;
end;

procedure TEstoque.Setobs(const Value: String);
begin
  Fobs := Value;
end;

procedure TEstoque.Setqtd(const Value: Double);
begin
  Fqtd := Value;
end;

procedure TEstoque.SettipoMov(const Value: String);
begin
  FtipoMov := Value;
end;

end.
