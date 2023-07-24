unit uCliente;

interface

uses
  uPessoa, ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows,
  Interfaces;

type
  TCliente = class(TPessoa)
  private
    FDtNasc  : TDate;
    FTpPessoa: String;
    procedure SetDtNasc(const Value: TDate);
    procedure SetTpPessoa(const Value: String);
  public
    Conexao : IConexao;
    property DtNasc : TDate read FDtNasc write SetDtNasc;
    property TpPessoa : String read FTpPessoa write SetTpPessoa;
    procedure Cadastrar(Value : TCliente);
    procedure Editar(Value : TCliente);
    function Pesquisar(pNome : String) : Boolean; overload;
    function Pesquisar(pID : Integer) : Boolean; overload;
    function Tipo: String; override;
  end;


implementation

  uses
    FrmCliente, dmCliente;

{ TClientes }

procedure TCliente.SetDtNasc(const Value: TDate);
begin
  FDtNasc := Value;
end;

procedure TCliente.SetTpPessoa(const Value: String);
begin
  FTpPessoa := Value;
end;

function TCliente.Tipo: String;
begin
  Result := 'Cliente';
end;

procedure TCliente.Editar(Value: TCliente);
begin
  if not (dmClientes.qCliente.State in [dsEdit]) then
    dmClientes.qCliente.Edit;

  if Length(Nome) <> 0 then
  begin
    dmClientes.qClientenome.asString := Nome;
    dmClientes.qClienterg.asString := RGIE;
    dmClientes.qClienteCPFCNPJ.AsString := CPFCNPJ;
    dmClientes.qClienteendereco.asString := Endereco;
    dmClientes.qClientenumEndereco.asString := NumEndereco;
    dmClientes.qClientebairro.asString := Bairro;
    dmClientes.qClienteAtivo.AsString := Ativo;

    if DateToStr(DtNasc) <> '  /  /    ' then
      dmClientes.qClienteDtNasc.AsDateTime := DtNasc;

    dmClientes.qCliente.Post;
  end
  else
  begin
    dmClientes.qCliente.Cancel;
    Application.MessageBox('O campo nome obrigatório. Por favor, verifique!', 'Atenção', mb_OK + MB_ICONEXCLAMATION);
  end;
end;

procedure TCliente.Cadastrar(Value : TCliente);
begin
  if not (dmClientes.qCliente.State in [dsInsert]) then
    dmClientes.qCliente.Insert;

  if Length(Nome) <> 0 then
  begin
    dmClientes.qClientenome.asString := Nome;
    dmClientes.qClienterg.asString := RGIE;
    dmClientes.qClienteCPFCNPJ.AsString := CPFCNPJ;
    dmClientes.qClienteendereco.asString := Endereco;
    dmClientes.qClientenumEndereco.asString := NumEndereco;
    dmClientes.qClientebairro.asString := Bairro;
    dmClientes.qClienteAtivo.AsString := Ativo;
    dmClientes.qClientedtregistro.AsDateTime := Now;

    if DateToStr(DtNasc) <> '  /  /    ' then
      dmClientes.qClienteDtNasc.AsDateTime := DtNasc
    else
      dmClientes.qClienteDtNasc.AsString := 'null';

    dmClientes.qCliente.Post;
  end
  else
  begin
    dmClientes.qCliente.Cancel;
    Application.MessageBox('Campo nome obrigatório. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
  end;
end;


function TCliente.Pesquisar(pID : Integer) : Boolean;
begin
  Result := False;

  dmClientes.qCliente.Close;
  dmClientes.qCliente.Params[0].AsInteger := pID;
  dmClientes.qCliente.Params[1].AsString := '%%';
  dmClientes.qCliente.Params[2].AsString := Ativo;
  dmClientes.qCliente.Open;

  if (dmClientes.qCliente.RecordCount = 1) and not (pID = 0) then
  begin
    Result := True;
    Cod := dmClientes.qClienteId.AsInteger;
    Nome := dmClientes.qClienteNome.AsString;
    Exit;
  end;

  Nome := '';
end;

function TCliente.Pesquisar(pNome : String) : Boolean;
begin
  Result := False;

  dmClientes.qCliente.Close;
  dmClientes.qCliente.ParamByName('id').AsInteger := 0;
  dmClientes.qCliente.ParamByName('nome').AsString := '%' + pNome + '%';
  dmClientes.qCliente.ParamByName('ativo').AsString   := Ativo;
  dmClientes.qCliente.Open;

  if dmClientes.qCliente.RecordCount = 1 then
  begin
    Result := True;
    Nome := dmClientes.qClienteNome.AsString;
    Exit;
  end;

  Nome := '';
end;

end.
