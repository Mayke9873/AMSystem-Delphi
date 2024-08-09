unit uFinanceiro.Conta;

interface

uses
  ZDataset, uDM, System.SysUtils, dmFinanceiro;

type
  TConta = class
  private
    FDM: TdmFinanceiros;
    SQL: string;
    Query: TZQuery;

    Fdescricao: string;
    Fid: Integer;
    Fativo: String;
    FisBanco: Boolean;
    Fex: Integer;
    procedure SetDM(const Value: TdmFinanceiros);
    procedure Setid(const Value: Integer);
    procedure Setdescricao(const Value: string);
    procedure Setativo(const Value: String);
    procedure Setex(const Value: Integer);
    procedure SetisBanco(const Value: Boolean);

  public
    constructor Create;
    destructor Destroy; override;

    property DM: TdmFinanceiros read FDM write SetDM;

    property id: Integer read Fid write Setid;
    property descricao: string read Fdescricao write Setdescricao;
    property isBanco: Boolean read FisBanco write SetisBanco;
    property ativo: String read Fativo write Setativo;
    property ex: Integer read Fex write Setex;

    function Pesquisar(const pNome: String = ''; const pId: Integer = 0) : Boolean;
    function Salvar(aValue: TConta): Boolean;

  end;

implementation

{ TConta }

constructor TConta.Create;
begin
  DM := TdmFinanceiros.Create(nil);
  Query := TZQuery.Create(nil);
  Query.Connection := DM.zCon;
end;

destructor TConta.Destroy;
begin
  FreeAndNil(Query);
  FreeAndNil(DM);
  inherited;
end;

function TConta.Pesquisar(const pNome: String = ''; const pId: Integer = 0) : Boolean;
begin
  Result := False;
  descricao := '';

  DM.qConta.Close;
  DM.qConta.ParamByName('id').AsInteger := pId;
  DM.qConta.ParamByName('descricao').AsString := '%' + pNome + '%';
  DM.qConta.ParamByName('ativo').AsInteger    := ex;
  DM.qConta.Open;

  if (DM.qConta.RecordCount = 1) and not (pId = 0) then
  begin
    Result := True;
    id  := DM.qContaidConta.AsInteger;
    descricao := DM.qContaDescricao.AsString;
  end;
end;

function TConta.Salvar(aValue: TConta): Boolean;
var
  LLinha: integer;
begin
  try
    if NOT (aValue.id = 0) then
      DM.qConta.Edit;

    DM.qContadescricao.AsString := aValue.descricao;
    DM.qContabancaria.Value     := isBanco.ToInteger;
    DM.qContaex.AsInteger       := aValue.ex;

    DM.qConta.Post;
    Result := True;

    aValue.id := DM.qContaidConta.AsInteger;
    DM.qConta.Close;
    DM.qConta.Open;
    DM.qConta.Locate('idConta', aValue.id, []);

  except
    Result := False;
    DM.qConta.Cancel;
  end;
end;

procedure TConta.Setativo(const Value: String);
begin
  Fativo := Value;
end;

procedure TConta.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TConta.SetDM(const Value: TdmFinanceiros);
begin
  FDM := Value;
end;

procedure TConta.Setex(const Value: Integer);
begin
  Fex := Value;
end;

procedure TConta.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TConta.SetisBanco(const Value: Boolean);
begin
  FisBanco := Value;
end;

end.
