unit uVenda.Itens;

interface

type
  TVenda_Itens = class
  private
    Fdesconto: Real;
    Ftotal: Real;
    FidProduto: Integer;
    Fid: Integer;
    FidVenda: Integer;
    Fquantidade: Double;
    Fvalor_unit: Real;
    Fdescricao: string;

    procedure Setdesconto(const Value: Real);
    procedure Setid(const Value: Integer);
    procedure SetidProduto(const Value: Integer);
    procedure SetidVenda(const Value: Integer);
    procedure Setquantidade(const Value: Double);
    procedure Settotal(const Value: Real);
    procedure Setvalor_unit(const Value: Real);
    procedure Setdescricao(const Value: string);

  public
    property id: Integer read Fid write Setid;
    property idVenda: Integer read FidVenda write SetidVenda;
    property idProduto: Integer read FidProduto write SetidProduto;
    property quantidade: Double read Fquantidade write Setquantidade;
    property valor_unit: Real read Fvalor_unit write Setvalor_unit;
    property desconto: Real read Fdesconto write Setdesconto;
    property total: Real read Ftotal write Settotal;
    property descricao: string read Fdescricao write Setdescricao;
  end;

implementation

{ TVenda_Itens }

procedure TVenda_Itens.Setdesconto(const Value: Real);
begin
  Fdesconto := Value;
end;

procedure TVenda_Itens.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TVenda_Itens.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TVenda_Itens.SetidProduto(const Value: Integer);
begin
  FidProduto := Value;
end;

procedure TVenda_Itens.SetidVenda(const Value: Integer);
begin
  FidVenda := Value;
end;

procedure TVenda_Itens.Setquantidade(const Value: Double);
begin
  Fquantidade := Value;
end;

procedure TVenda_Itens.Settotal(const Value: Real);
begin
  Ftotal := Value;
end;

procedure TVenda_Itens.Setvalor_unit(const Value: Real);
begin
  Fvalor_unit := Value;
end;

end.
