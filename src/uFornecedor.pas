unit uFornecedor;

interface

uses
  uPessoa, System.SysUtils;

type
  TFornecedor = class(TPessoa)
    private

    public
      function Pesquisar(const pNome: String = ''; const pId: Integer = 0) : Boolean;
      procedure Cadastrar(Value : TFornecedor);

    published

  end;

implementation

{ TFornecedor }

uses dmFornecedor;

function TFornecedor.Pesquisar(const pNome: String = ''; const pId: Integer = 0) : Boolean;
begin
  dmFornecedores.qFornecedor.Close;
  dmFornecedores.qFornecedor.ParamByName('id').AsInteger := pId;
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

end.
