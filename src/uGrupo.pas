unit uGrupo;

interface

type
  TGrupos = class
  private
    Fativo: String;
    Fdescricao: String;
    FId: Integer;
    procedure Setativo(const Value: String);
    procedure Setdescricao(const Value: String);
    procedure SetId(const Value: Integer);

  public
  { Public Declarações }

  published
    property Id: Integer read FId write SetId;
    property descricao: String read Fdescricao write Setdescricao;
    property ativo: String read Fativo write Setativo;
  end;
implementation

{ TGrupos }

procedure TGrupos.Setativo(const Value: String);
begin
  Fativo := Value;
end;

procedure TGrupos.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TGrupos.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
