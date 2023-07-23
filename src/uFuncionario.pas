unit uFuncionario;

interface

uses uPessoa, dmFuncionario;

  type
    TFuncionario = class(TPessoa)
  private
    FDtNasc: TDate;
    procedure SetDtNasc(const Value: TDate);
    public
      property DtNasc : TDate read FDtNasc write SetDtNasc;
      procedure Cadastrar(Value : TFuncionario);
      procedure Pesquisar; overload;
      procedure Pesquisar(pNome : String); overload;
      function Pesquisar(pID : Integer) : Boolean; overload;
      function Tipo: String; override;
    end;

implementation

uses
  Data.DB, System.SysUtils, Vcl.Forms, Winapi.Windows;

{ TFuncionario }

procedure TFuncionario.Cadastrar(Value : TFuncionario);
begin
  if Length(Nome) <> 0 then
  begin
    if Cod <> 0 then
      dmFuncionarios.qFuncionarioId.AsInteger := Cod;

    dmFuncionarios.qFuncionarionome.asString := Nome;
    dmFuncionarios.qFuncionarioRG.asString := RGIE;
    dmFuncionarios.qFuncionarioCPF.AsString := CPFCNPJ;
    dmFuncionarios.qFuncionarioendereco.asString := Endereco;
    dmFuncionarios.qFuncionarionumEndereco.asString := NumEndereco;
    dmFuncionarios.qFuncionariobairro.asString := Bairro;
    dmFuncionarios.qFuncionarioAtivo.AsString := Ativo;
    dmFuncionarios.qFuncionariodtregistro.AsDateTime := Now;
    dmFuncionarios.qFuncionarioDtNasc.AsDateTime := DtNasc;

    dmFuncionarios.qFuncionario.Post;
  end
  else
  begin
    dmFuncionarios.qFuncionario.Cancel;
    Application.MessageBox('Campo nome obrigatório. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
  end;

end;

procedure TFuncionario.Pesquisar;
begin
  dmFuncionarios.qFuncionario.Close;
  dmFuncionarios.qFuncionario.Params[0].AsInteger := 0;
  dmFuncionarios.qFuncionario.Params[1].AsString := '%%';
  dmFuncionarios.qFuncionario.Params[2].AsString := 'S';
  dmFuncionarios.qFuncionario.Open;
end;

function TFuncionario.Pesquisar(pID: Integer) : Boolean;
begin
  Result := False;
  dmFuncionarios.qFuncionario.Close;
  dmFuncionarios.qFuncionario.Params[0].AsInteger := pID;
  dmFuncionarios.qFuncionario.Params[1].AsString := '%%';
  dmFuncionarios.qFuncionario.Params[2].AsString := 'S';
  dmFuncionarios.qFuncionario.Open;

  if dmFuncionarios.qFuncionario.RecordCount = 1 then
  begin
    Result := True;
    Cod := dmFuncionarios.qFuncionarioID.AsInteger;
    Nome := dmFuncionarios.qFuncionarioNome.AsString;
    Exit;
  end;

  Cod := 0;
  Nome := '';
end;

procedure TFuncionario.Pesquisar(pNome: String);
begin
  dmFuncionarios.qFuncionario.Close;
  dmFuncionarios.qFuncionario.Params[0].AsInteger := 0;
  dmFuncionarios.qFuncionario.Params[1].AsString := '%' + pNome + '%';
  dmFuncionarios.qFuncionario.Params[2].AsString := Ativo;
  dmFuncionarios.qFuncionario.Open;

  if dmFuncionarios.qFuncionario.RecordCount = 1 then
  begin
    Cod := dmFuncionarios.qFuncionarioID.AsInteger;
    Nome := dmFuncionarios.qFuncionarioNome.AsString;
    Exit;
  end;

  Cod := 0;
  Nome := '';
end;

procedure TFuncionario.SetDtNasc(const Value: TDate);
begin
  FDtNasc := Value;
end;

function TFuncionario.Tipo: String;
begin
  Result := 'Funcionario';
end;

end.
