unit uComanda;

interface

uses uDM, ZDataset, System.SysUtils, System.Generics.Collections;

type
  {$M+}
  TComanda = class
  private
    Fem_Uso: String;
    Fid: Integer;
    Fcomanda: integer;
    Fem_Caixa: String;
    Fnome: String;
    FQuery: TZQuery;
    FListaComandas: TObjectList<TComanda>;
    FvalTotal: Currency;
    procedure Setcomanda(const Value: integer);
    procedure Setem_Caixa(const Value: String);
    procedure Setem_Uso(const Value: String);
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure SetListaComandas(const Value: TObjectList<TComanda>);
    function GetListaComandas: TObjectList<TComanda>;
    procedure SetvalTotal(const Value: Currency);
  public
    function VerificaComanda(comanda: Integer = 0): Boolean;
    function AbreComanda(comanda: Integer = 0; nome: String = ''): TComanda;
    function CadastraComanda: Boolean;
  published
    property id: Integer read Fid write Setid;
    property comanda: integer read Fcomanda write Setcomanda;
    property nome: String read Fnome write Setnome;
    property em_Uso: String read Fem_Uso write Setem_Uso;
    property em_Caixa: String read Fem_Caixa write Setem_Caixa;
    property valTotal: Currency read FvalTotal write SetvalTotal;
    property ListaComandas: TObjectList<TComanda> read GetListaComandas write SetListaComandas;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TComanda }

function TComanda.AbreComanda(comanda: Integer = 0; nome: String = ''): TComanda;
var
  LSQL: String;
begin
  LSQL := '';

  case VerificaComanda(comanda) of
    True : begin
      LSQL := 'update comanda set em_Uso = ''S'', em_Caixa = ''S'' ' +
              IfThen(Trim(nome) <> '', ', nome = '+ QuotedStr(nome), '');

      LSQL := LSQL + ' where comanda = '+ IntToStr(comanda);
    end;

    False: begin
      LSQL := 'insert into comanda (comanda '+
              IfThen(Trim(nome) <> '', ', nome)', ')') + 'values ';

      LSQL := LSQL + IfThen(Trim(nome) <> '',
                        '('+ IntToStr(comanda) +', '+ QuotedStr(nome) +')',
                        '('+ IntToStr(comanda) +')');
    end;
  end;

  ExecSQL(LSQL);
  Result := Self;
end;

function TComanda.VerificaComanda(comanda: Integer = 0): Boolean;
begin
  FQuery.SQL.Clear;
  FQuery.Close;
  FQuery.SQL.Add('select comanda, nome, em_Uso, em_Caixa ');
  FQuery.SQL.Add(' from comanda where comanda = '+ IntToStr(comanda));
  FQuery.Open;

  Result := FQuery.RecordCount > 0;
end;

function TComanda.CadastraComanda: Boolean;
begin
  Result := False;

  Result := True;
end;

constructor TComanda.Create;
begin
  FQuery := TZQuery.Create(nil);
  FQuery.Connection := DM.zCon;
  FListaComandas := TObjectList<TComanda>.Create;
end;

destructor TComanda.Destroy;
begin
  FQuery.Free;
  FListaComandas.Free;
end;

function TComanda.GetListaComandas: TObjectList<TComanda>;
var
    I: Integer;
begin
  FListaComandas.Clear;

  FQuery.SQL.Clear;
  FQuery.Close;
  FQuery.SQL.Add('select comanda.id, comanda, nome, em_Uso, em_Caixa, sum(coalesce(vc.total, 0)) total ');
  FQuery.SQL.Add(' from comanda left join venda_comanda VC on Vc.idComanda = comanda.comanda and VC.status = ''A''');
  FQuery.SQL.Add(' where em_uso like '+ QuotedStr(em_Uso) );
  FQuery.SQL.Add(' group by comanda.id');
  FQuery.SQL.Add(' order by comanda');
  FQuery.Open;

  if FQuery.RecordCount > 0 then
  begin
    FQuery.First;
    while not FQuery.Eof do
    begin
      FListaComandas.Add(TComanda.Create);
      I := FListaComandas.Count - 1;
      FListaComandas[I].id       := FQuery.Fields[0].AsInteger;
      FListaComandas[I].comanda  := FQuery.Fields[1].AsInteger;
      FListaComandas[I].nome     := FQuery.Fields[2].AsString;
      FListaComandas[I].em_Uso   := FQuery.Fields[3].AsString;
      FListaComandas[I].em_Caixa := FQuery.Fields[4].AsString;
      FListaComandas[I].valTotal := FQuery.Fields[5].AsCurrency;
      FQuery.Next;
    end;
  end;

  Result := FListaComandas;
end;

procedure TComanda.Setcomanda(const Value: integer);
begin
  Fcomanda := Value;
end;

procedure TComanda.Setem_Caixa(const Value: String);
begin
  Fem_Caixa := Value;
end;

procedure TComanda.Setem_Uso(const Value: String);
begin
  Fem_Uso := Value;
end;

procedure TComanda.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TComanda.SetListaComandas(const Value: TObjectList<TComanda>);
begin
  FListaComandas := Value;
end;

procedure TComanda.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TComanda.SetvalTotal(const Value: Currency);
begin
  FvalTotal := Value;
end;

end.
