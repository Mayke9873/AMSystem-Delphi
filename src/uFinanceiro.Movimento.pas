unit uFinanceiro.Movimento;

interface

uses
  ZDataset, dmFinanceiro;

type
  TCaixa = class
  private
    FSQL: String;
    FQuery: TZQuery;
    FDM: TdmFinanceiros;

    Fid: Integer;
    FidMov: Integer;
    FtipoMov: string;
    Fvalor: Real;
    FidConta: Integer;
    Fex: Integer;

    procedure SetSQL(const Value: String);
    procedure SetQuery(const Value: TZQuery);
    procedure SetDM(const Value: TdmFinanceiros);

    procedure Setid(const Value: Integer);
    procedure SetidMov(const Value: Integer);
    procedure SettipoMov(const Value: string);
    procedure Setvalor(const Value: Real);
    procedure SetidConta(const Value: Integer);
    procedure Setex(const Value: Integer);

    property SQL: String read FSQL write SetSQL;
    property Query: TZQuery read FQuery write SetQuery;

  public
    constructor Create;
    destructor Destroy; override;

    property DM: TdmFinanceiros read FDM write SetDM;

    property id: Integer read Fid write Setid;
    property idMov: Integer read FidMov write SetidMov;
    property tipoMov: string read FtipoMov write SettipoMov;
    property valor: Real read Fvalor write Setvalor;
    property idConta: Integer read FidConta write SetidConta;
    property ex: Integer read Fex write Setex;

    procedure InsereCaixa(aCaixa: TCaixa);
  end;

implementation

uses
  System.SysUtils;

{ TCaixa }

constructor TCaixa.Create;
begin
  DM := TdmFinanceiros.Create(nil);
  Query := TZQuery.Create(nil);
  Query.Connection := DM.zCon;
end;

destructor TCaixa.Destroy;
begin
  FreeAndNil(Query);
  FreeAndNil(DM);
  inherited;
end;

procedure TCaixa.InsereCaixa(aCaixa: TCaixa);
begin
  SQL := 'INSERT INTO caixa VALUES ' + #13#10 +
         ' ( null, '+ aCaixa.idConta.ToString +', '+ aCaixa.idMov.ToString + #13#10 +
         ', '+ QuotedStr(aCaixa.tipoMov) +', '+ StringReplace(FloatToStr(aCaixa.valor), ',', '.', []) +
         ', '+ aCaixa.ex.ToString +'); ';

  FQuery.ExecSQL;
end;

procedure TCaixa.SetDM(const Value: TdmFinanceiros);
begin
  FDM := Value;
end;

procedure TCaixa.Setex(const Value: Integer);
begin
  Fex := Value;
end;

procedure TCaixa.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCaixa.SetidConta(const Value: Integer);
begin
  FidConta := Value;
end;

procedure TCaixa.SetidMov(const Value: Integer);
begin
  FidMov := Value;
end;

procedure TCaixa.SetQuery(const Value: TZQuery);
begin
  FQuery := Value;
end;

procedure TCaixa.SetSQL(const Value: String);
begin
  FSQL := Value;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(FSQL);
end;

procedure TCaixa.SettipoMov(const Value: string);
begin
  FtipoMov := Value;
end;

procedure TCaixa.Setvalor(const Value: Real);
begin
  Fvalor := Value;
end;

end.
