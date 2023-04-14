unit uClientes;

interface

uses
  uPessoas, ZAbstractRODataset, ZDataset, SysUtils;

type
  TClientes = class(TPessoas)
  private
    DtNasc : TDate;
    TpPessoa : PChar;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Cadastrar;
    procedure Pesquisar(pAtivo : String);
  end;


implementation

  uses
    uCliente, uDM;

{ TClientes }

procedure TClientes.Cadastrar;
begin

end;

constructor TClientes.Create;
begin
  Pesquisar('T');
end;

destructor TClientes.Destroy;
begin

  inherited;
end;

procedure TClientes.Pesquisar(pAtivo : String);
begin
  DM.qCliente.Close;
  DM.qCliente.ParamByName('nome').AsString := '%' + Nome + '%';
  DM.qCliente.ParamByName('ativo').AsString   := pAtivo;
  DM.qCliente.Open;
end;

end.
