unit uFuncionario;

interface

uses uPessoa, uDM;

  type
    TFuncionario = class(TPessoa)
  private
    FDtNasc: TDate;
    procedure SetDtNasc(const Value: TDate);
    public
      property DtNasc : TDate read FDtNasc write SetDtNasc;
      procedure Cadastrar(Value : TFuncionario);
      procedure Pesquisar; overload;
      procedure Pesquisar(pID : Integer); overload;
      procedure Pesquisar(pNome : String); overload;
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
      DM.qFuncionarioId.AsInteger := Cod;

    DM.qFuncionarionome.asString := Nome;
    DM.qFuncionarioRG.asString := RGIE;
    DM.qFuncionarioCPF.AsString := CPFCNPJ;
    DM.qFuncionarioendereco.asString := Endereco;
    DM.qFuncionarionumEndereco.asString := NumEndereco;
    DM.qFuncionariobairro.asString := Bairro;
    DM.qFuncionarioAtivo.AsString := Ativo;
    DM.qFuncionariodtregistro.AsDateTime := Now;
    DM.qFuncionarioDtNasc.AsDateTime := DtNasc;

    DM.qFuncionario.Post;
  end
  else
  begin
    DM.qFuncionario.Cancel;
    Application.MessageBox('Campo nome obrigatório. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
  end;

end;

procedure TFuncionario.Pesquisar;
begin
  DM.qFuncionario.Close;
  DM.qFuncionario.Params[0].AsInteger := 0;
  DM.qFuncionario.Params[1].AsString := '%%';
  DM.qFuncionario.Params[2].AsString := 'S';
  DM.qFuncionario.Open;
end;

procedure TFuncionario.Pesquisar(pID: Integer);
begin
  DM.qFuncionario.Close;
  DM.qFuncionario.Params[0].AsInteger := pID;
  DM.qFuncionario.Params[1].AsString := '%%';
  DM.qFuncionario.Params[2].AsString := 'S';
  DM.qFuncionario.Open;

  if DM.qFuncionario.RecordCount = 1 then
  begin
    Cod := DM.qFuncionarioID.AsInteger;
    Nome := DM.qFuncionarioNome.AsString;
    Exit;
  end;

  Cod := 0;
  Nome := '';
end;

procedure TFuncionario.Pesquisar(pNome: String);
begin
  DM.qFuncionario.Close;
  DM.qFuncionario.Params[0].AsInteger := 0;
  DM.qFuncionario.Params[1].AsString := '%' + pNome + '%';
  DM.qFuncionario.Params[2].AsString := Ativo;
  DM.qFuncionario.Open;

  if DM.qFuncionario.RecordCount = 1 then
  begin
    Cod := DM.qFuncionarioID.AsInteger;
    Nome := DM.qFuncionarioNome.AsString;
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
