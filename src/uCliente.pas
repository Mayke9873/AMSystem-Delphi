unit uCliente;

interface

uses
  uPessoas, ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows,
  Interfaces;

type
  TClientes = class(TPessoas)
  private
    FDtNasc  : TDate;
    FTpPessoa: String;
    procedure SetDtNasc(const Value: TDate);
    procedure SetTpPessoa(const Value: String);
  public
    Conexao : IConexao;
    property DtNasc : TDate read FDtNasc write SetDtNasc;
    property TpPessoa : String read FTpPessoa write SetTpPessoa;
    function Pesquisar(pNome : String) : Boolean; overload;
    function Pesquisar(pID : Integer) : Boolean; overload;
    procedure Cadastrar(Value : TClientes);
    procedure Editar(Value : TClientes);
    function Tipo: String; override;
  end;


implementation

  uses
    uFrmCliente, uDM;

{ TClientes }

procedure TClientes.SetDtNasc(const Value: TDate);
begin
  FDtNasc := Value;
end;

procedure TClientes.SetTpPessoa(const Value: String);
begin
  FTpPessoa := Value;
end;

function TClientes.Tipo: String;
begin
  Result := 'C';
end;

procedure TClientes.Editar(Value: TClientes);
begin
  if not (dm.qCliente.State in [dsEdit]) then
    DM.qCliente.Edit;

  if Length(Nome) <> 0 then
  begin
    DM.qClientenome.asString := Nome;
    DM.qClienterg.asString := RGIE;
    DM.qClienteCPFCNPJ.AsString := CPFCNPJ;
    DM.qClienteendereco.asString := Endereco;
    DM.qClientenumEndereco.asString := NumEndereco;
    DM.qClientebairro.asString := Bairro;
    DM.qClienteAtivo.AsString := Ativo;

    if DateToStr(DtNasc) <> '  /  /    ' then
      DM.qClienteDtNasc.AsDateTime := DtNasc;

    DM.qCliente.Post;
  end
  else
  begin
    DM.qCliente.Cancel;
    Application.MessageBox('O campo nome obrigat�rio. Por favor, verifique!', 'Aten��o', mb_OK + MB_ICONEXCLAMATION);
  end;
end;

procedure TClientes.Cadastrar(Value : TClientes);
begin
  if not (dm.qCliente.State in [dsInsert]) then
    DM.qCliente.Insert;

  if Length(Nome) <> 0 then
  begin
    DM.qClientenome.asString := Nome;
    DM.qClienterg.asString := RGIE;
    DM.qClienteCPFCNPJ.AsString := CPFCNPJ;
    DM.qClienteendereco.asString := Endereco;
    DM.qClientenumEndereco.asString := NumEndereco;
    DM.qClientebairro.asString := Bairro;
    DM.qClienteAtivo.AsString := Ativo;
    DM.qClientedtregistro.AsDateTime := Now;

    if DateToStr(DtNasc) <> '  /  /    ' then
      DM.qClienteDtNasc.AsDateTime := DtNasc
    else
      DM.qClienteDtNasc.Value := varNull;

    DM.qCliente.Post;
  end
  else
  begin
    DM.qCliente.Cancel;
    Application.MessageBox('Campo nome obrigat�rio. Por favor, verifique!', 'Aten��o', MB_ICONEXCLAMATION);
  end;
end;


function TClientes.Pesquisar(pID : Integer) : Boolean;
begin
  Result := False;

  DM.qCliente.Close;
  DM.qCliente.Params[0].AsInteger := pID;
  DM.qCliente.Params[1].AsString := Nome;
  DM.qCliente.Params[2].AsString := Ativo;
  DM.qCliente.Open;

  if DM.qCliente.RecordCount = 1 then
  begin
    Result := True;
    Cod := DM.qClienteId.AsInteger;
    Nome := DM.qClienteNome.AsString;
    Exit;
  end;

  Nome := '';
end;

function TClientes.Pesquisar(pNome : String) : Boolean;
begin
  Result := False;

  DM.qCliente.Close;
  DM.qCliente.ParamByName('id').AsInteger := 0;
  DM.qCliente.ParamByName('nome').AsString := pNome;
  DM.qCliente.ParamByName('ativo').AsString   := Ativo;
  DM.qCliente.Open;

  if DM.qCliente.RecordCount = 1 then
  begin
    Result := True;
    Nome := DM.qClienteNome.AsString;
    Exit;
  end;

  Nome := '';
end;

end.
