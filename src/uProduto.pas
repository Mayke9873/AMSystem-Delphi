unit uProduto;

interface

  uses
    SysUtils, Vcl.Forms, Winapi.Windows, Data.DB;

type
  TProduto = class
  private
    FDataRegistro: TDate;
    FPorcentLucro: Double;
    FAtivo: String;
    FDescricaoGrupo: String;
    FDescricao: String;
    FPrecoVenda: Currency;
    FIdGrupo: Integer;
    FID: Integer;
    FUnidade: String;
    FPrecoCompra: Currency;
    FEstoque: Double;
    procedure SetAtivo(const Value: String);
    procedure SetDataRegistro(const Value: TDate);
    procedure SetDescricao(const Value: String);
    procedure SetDescricaoGrupo(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetIdGrupo(const Value: Integer);
    procedure SetPorcentLucro(const Value: Double);
    procedure SetPrecoCompra(const Value: Currency);
    procedure SetPrecoVenda(const Value: Currency);
    procedure SetUnidade(const Value: String);
    procedure SetEstoque(const Value: Double);
  public
    property ID : Integer read FID write SetID;
    property Descricao : String read FDescricao write SetDescricao;
    property Unidade : String read FUnidade write SetUnidade;
    property Estoque : Double read FEstoque write SetEstoque;
    property IdGrupo : Integer read FIdGrupo write SetIdGrupo;
    property DescricaoGrupo : String read FDescricaoGrupo write SetDescricaoGrupo;
    property PrecoCompra : Currency read FPrecoCompra write SetPrecoCompra;
    property PrecoVenda : Currency read FPrecoVenda write SetPrecoVenda;
    property PorcentLucro : Double read FPorcentLucro write SetPorcentLucro;
    property DataRegistro : TDate read FDataRegistro write SetDataRegistro;
    property Ativo : String read FAtivo write SetAtivo;

    procedure Cadastrar;
    function Pesquisar() : Boolean; overload;
    function Pesquisar(pID : Integer) : Boolean; overload;
    function Pesquisar(pDescricao : String) : Boolean; overload;
  end;

implementation

uses
  uDM;

{ TProduto }

procedure TProduto.Cadastrar;
begin
  if Length(Descricao) <> 0 then
  begin
    DM.qProdutoID.AsInteger := DM.qProdutoID.AsInteger;
    DM.qProdutoDescricao.asString := Descricao;
    DM.qProdutoUnidade.AsString := Unidade;
    DM.qProdutoIdGrupo.AsInteger := IdGrupo;
    DM.qProdutoGrupo.asString := DescricaoGrupo;
    DM.qProdutoPCompra.AsCurrency := PrecoCompra;
    DM.qProdutoPVenda.AsCurrency := PrecoVenda;
    DM.qProdutoPLucro.AsFloat := PorcentLucro;
    DM.qProdutoAtivo.AsString := Ativo;

    if (DM.qProduto.State in [dsInsert]) then
    begin
      DM.qProdutoEstoque.AsFloat := 0;
      DM.qProdutoDtRegistro.AsDateTime := Now;
    end;

    DM.qProduto.Post;
  end
  else
  begin
    DM.qProduto.Cancel;
    Application.MessageBox('Campo descrição obrigatório. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
  end;
end;

function TProduto.Pesquisar() : Boolean;
begin
  Result := False;

  DM.qProduto.Close;
  DM.qProduto.Params[0].AsInteger := 0;
  DM.qProduto.Params[1].AsString := '%%';
  DM.qProduto.Params[2].AsString := Ativo;
  DM.qProduto.Open;

  if DM.qProduto.RecordCount = 1 then
  begin
    Result := True;
    ID := DM.qProdutoId.AsInteger;
    Descricao := DM.qProdutoDescricao.AsString;
    Exit;
  end;

  ID := 0;
  Descricao := '';
end;

function TProduto.Pesquisar(pDescricao: String): Boolean;
begin
  Result := False;

  DM.qProduto.Close;
  DM.qProduto.Params[0].AsInteger := 0;
  DM.qProduto.Params[1].AsString := '%' + pDescricao + '%';
  DM.qProduto.Params[2].AsString := Ativo;
  DM.qProduto.Open;

  if DM.qProduto.RecordCount = 1 then
  begin
    Result := True;
    ID := DM.qProdutoId.AsInteger;
    Descricao := DM.qProdutoDescricao.AsString;
    Exit;
  end;

  ID := 0;
  Descricao := '';
end;

function TProduto.Pesquisar(pID: Integer): Boolean;
begin
  Result := False;

  DM.qProduto.Close;
  DM.qProduto.Params[0].AsInteger := pID;
  DM.qProduto.Params[1].AsString := '%%';
  DM.qProduto.Params[2].AsString := Ativo;
  DM.qProduto.Open;

  if DM.qProduto.RecordCount = 1 then
  begin
    Result := True;
    ID := DM.qProdutoId.AsInteger;
    Descricao := DM.qProdutoDescricao.AsString;
    PrecoVenda := DM.qProdutopVenda.AsCurrency;
    Exit;
  end;

  ID := 0;
  Descricao := '';
end;

procedure TProduto.SetAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TProduto.SetDataRegistro(const Value: TDate);
begin
  FDataRegistro := Value;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetDescricaoGrupo(const Value: String);
begin
  FDescricaoGrupo := Value;
end;

procedure TProduto.SetEstoque(const Value: Double);
begin
  FEstoque := Value;
end;

procedure TProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProduto.SetIdGrupo(const Value: Integer);
begin
  FIdGrupo := Value;
end;

procedure TProduto.SetPorcentLucro(const Value: Double);
begin
  FPorcentLucro := Value;
end;

procedure TProduto.SetPrecoCompra(const Value: Currency);
begin
  FPrecoCompra := Value;
end;

procedure TProduto.SetPrecoVenda(const Value: Currency);
begin
  FPrecoVenda := Value;
end;

procedure TProduto.SetUnidade(const Value: String);
begin
  FUnidade := Value;
end;

end.
