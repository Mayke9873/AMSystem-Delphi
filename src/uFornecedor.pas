unit uFornecedor;

interface

uses
  uPessoa, System.SysUtils;

type
  TFornecedor = class(TPessoa)
    private

    public
      procedure Pesquisar; overload;
      function Pesquisar(pNome : String) : Boolean; overload;
      function Pesquisar(pID : integer) : Boolean; overload;
      procedure Cadastrar(Value : TFornecedor);

    published

  end;

implementation

{ TFornecedor }

uses dmFornecedor;

procedure TFornecedor.Pesquisar;
begin

end;

function TFornecedor.Pesquisar(pNome: String) : Boolean;
begin

  dmFornecedores.qFornecedor.Close;
  dmFornecedores.qFornecedor.ParamByName('id').AsInteger := 0;
  dmFornecedores.qFornecedor.ParamByName('nome').AsString := '%' + pNome + '%';
  dmFornecedores.qFornecedor.ParamByName('ativo').AsString   := Ativo;
  dmFornecedores.qFornecedor.Open;

  if dmFornecedores.qFornecedor.RecordCount = 1 then
  begin
    Result := True;
    Nome := dmFornecedores.qFornecedorNome.AsString;
    Exit;
  end;

  Nome := '';
  Result := False;
end;

procedure TFornecedor.Cadastrar(Value: TFornecedor);
begin
  if not (Length(Value.Nome) = 0) then
  begin
    dmFornecedores.qFornecedorId.AsInteger  := Cod;
    dmFornecedores.qFornecedorNome.AsString := Nome;
    dmFornecedores.qFornecedorie.AsString   := RGIE;
    dmFornecedores.qFornecedorCNPJ.AsString := CPFCNPJ;
    dmFornecedores.qFornecedorendereco.AsString := Endereco;
    dmFornecedores.qFornecedornumEndereco.AsString := NumEndereco;
    dmFornecedores.qFornecedorbairro.AsString := Bairro;
    dmFornecedores.qFornecedorativo.AsString := Ativo;

    dmFornecedores.qFornecedor.Post;
    dmFornecedores.qFornecedor.Refresh;
  end;

end;

function TFornecedor.Pesquisar(pID: integer) : Boolean;
begin

end;

end.
