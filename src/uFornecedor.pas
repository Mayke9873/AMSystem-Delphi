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

uses uDM;

procedure TFornecedor.Pesquisar;
begin

end;

function TFornecedor.Pesquisar(pNome: String) : Boolean;
begin

  DM.qFornecedor.Close;
  DM.qFornecedor.ParamByName('id').AsInteger := 0;
  DM.qFornecedor.ParamByName('nome').AsString := '%' + pNome + '%';
  DM.qFornecedor.ParamByName('ativo').AsString   := Ativo;
  DM.qFornecedor.Open;

  if DM.qFornecedor.RecordCount = 1 then
  begin
    Result := True;
    Nome := DM.qClienteNome.AsString;
    Exit;
  end;

  Nome := '';
  Result := False;
end;

procedure TFornecedor.Cadastrar(Value: TFornecedor);
begin
  if not (Length(Value.Nome) = 0) then
  begin
    DM.qFornecedorId.AsInteger  := Cod;
    DM.qFornecedorNome.AsString := Nome;
    DM.qFornecedorie.AsString   := RGIE;
    DM.qFornecedorCNPJ.AsString := CPFCNPJ;
    DM.qFornecedorendereco.AsString := Endereco;
    DM.qFornecedornumEndereco.AsString := NumEndereco;
    DM.qFornecedorbairro.AsString := Bairro;
    DM.qFornecedorativo.AsString := Ativo;

    DM.qFornecedor.Post;
    DM.qFornecedor.Refresh;
  end;

end;

function TFornecedor.Pesquisar(pID: integer) : Boolean;
begin

end;

end.
