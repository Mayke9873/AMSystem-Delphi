unit uComanda.Itens;

interface

uses
  ZDataset;

type
  {$M+}
  TItensComanda = class
  private
    Fdesconto: Currency;
    FvalotTotalPago: Currency;
    FvalorUnitario: Currency;
    FidProduto: Integer;
    FStatus: string;
    FvalorTotal: Currency;
    FComanda: Integer;
    FEx: Integer;
    FSQL: String;
    FQuery: TZQuery;
    Fid: Integer;
    Fquantidade: Double;
    Fdescricao: string;
    procedure SetComanda(const Value: Integer);
    procedure Setdesconto(const Value: Currency);
    procedure SetEx(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure SetStatus(const Value: string);
    procedure SetvalorTotal(const Value: Currency);
    procedure SetvalorUnitario(const Value: Currency);
    procedure SetvalotTotalPago(const Value: Currency);
    procedure SetSQL(const Value: String);
    procedure Setid(const Value: Integer);
    procedure Setquantidade(const Value: Double);
    procedure Setdescricao(const Value: string);

  published
    property id: Integer read Fid write Setid;
    property Comanda: Integer read FComanda write SetComanda;
    property idProduto: Integer read FidProduto write SetidProduto;
    property descricao: string read Fdescricao write Setdescricao;
    property quantidade: Double read Fquantidade write Setquantidade;
    property valorUnitario: Currency read FvalorUnitario write SetvalorUnitario;
    property desconto: Currency read Fdesconto write Setdesconto;
    property valorTotal: Currency read FvalorTotal write SetvalorTotal;
    property valotTotalPago: Currency read FvalotTotalPago write SetvalotTotalPago;
    property Status: string read FStatus write SetStatus;
    property Ex: Integer read FEx write SetEx;
    property SQL: String read FSQL write SetSQL;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  dmVenda, System.SysUtils;

{ TItensComanda }

constructor TItensComanda.Create;
begin
  FQuery := TZQuery.Create(nil);
  FQuery.Connection := dmVendas.zCon;
end;

destructor TItensComanda.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

procedure TItensComanda.SetComanda(const Value: Integer);
begin
  FComanda := Value;
end;

procedure TItensComanda.Setdesconto(const Value: Currency);
begin
  Fdesconto := Value;
end;

procedure TItensComanda.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TItensComanda.SetEx(const Value: Integer);
begin
  FEx := Value;
end;

procedure TItensComanda.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TItensComanda.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TItensComanda.Setquantidade(const Value: Double);
begin
  Fquantidade := Value;
end;

procedure TItensComanda.SetSQL(const Value: String);
begin
  FSQL := Value;

  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(FSQL);
end;

procedure TItensComanda.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TItensComanda.SetvalorTotal(const Value: Currency);
begin
  FvalorTotal := Value;
end;

procedure TItensComanda.SetvalorUnitario(const Value: Currency);
begin
  FvalorUnitario := Value;
end;

procedure TItensComanda.SetvalotTotalPago(const Value: Currency);
begin
  FvalotTotalPago := Value;
end;

end.
