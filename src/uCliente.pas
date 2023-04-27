unit uCliente;

interface

uses
  uPessoas, ZAbstractRODataset, ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows,
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
    procedure Pesquisar(pAtivo : String);
    procedure Cadastrar(Value : TClientes);
    procedure Editar(Value : TClientes);
    property DtNasc : TDate read FDtNasc write SetDtNasc;
    property TpPessoa : String read FTpPessoa write SetTpPessoa;
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
      DM.qClienteDtNasc.AsDateTime := DtNasc;

    DM.qCliente.Post;
  end
  else
  begin
    DM.qCliente.Cancel;
    Application.MessageBox('O campo nome obrigat�rio. Por favor, verifique!', 'Aten��o', mb_OK + MB_ICONEXCLAMATION);
  end;
end;


procedure TClientes.Pesquisar(pAtivo : String);
begin
  DM.qCliente.Close;

  if IntToStr(Cod) <> '' then
    DM.qCliente.ParamByName('id').AsInteger := Cod
  else
    DM.qCliente.ParamByName('id').AsInteger := StrToIntDef(StringReplace(Nome, '%', '', [rfReplaceAll]), 0);

//  if DM.qCliente.ParamByName('id').Value = 0 then
    DM.qCliente.ParamByName('nome').AsString := Nome;

  DM.qCliente.ParamByName('ativo').AsString   := pAtivo;
  DM.qCliente.Open;
end;

end.