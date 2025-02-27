unit uComanda;

interface

uses uDM, ZDataset, System.SysUtils, System.Generics.Collections, StrUtils, uComanda.Itens, uProduto;

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
    FItens: TObjectList<TItensComanda>;
    FSQL: String;
    FItensComanda: TItensComanda;
    FidVenda: Integer;
    procedure Setcomanda(const Value: integer);
    procedure Setem_Caixa(const Value: String);
    procedure Setem_Uso(const Value: String);
    procedure Setid(const Value: Integer);
    procedure Setnome(const Value: String);
    procedure SetListaComandas(const Value: TObjectList<TComanda>);
    function GetListaComandas: TObjectList<TComanda>;
    procedure SetvalTotal(const Value: Currency);
    procedure SetItens(const Value: TObjectList<TItensComanda>);
    procedure SetSQL(const Value: String);
    procedure InserirItens;
    procedure SetItensComanda(const Value: TItensComanda);
    procedure FinalizaItens;
    procedure SetidVenda(const Value: Integer);

    property SQL: String read FSQL write SetSQL;

  public
    constructor Create;
    destructor Destroy; override;

    property id: Integer read Fid write Setid;
    property idVenda: Integer read FidVenda write SetidVenda;
    property comanda: integer read Fcomanda write Setcomanda;
    property nome: String read Fnome write Setnome;
    property em_Uso: String read Fem_Uso write Setem_Uso;
    property em_Caixa: String read Fem_Caixa write Setem_Caixa;
    property valTotal: Currency read FvalTotal write SetvalTotal;
    property ListaComandas: TObjectList<TComanda> read GetListaComandas write SetListaComandas;
    property Itens: TObjectList<TItensComanda> read FItens write SetItens;

    function VerificaComanda(aComanda: Integer = 0): Boolean;
    function AbreComanda(aComanda: Integer = 0; nome: String = ''): TComanda;
    function CadastraComanda: Boolean;
    function Cancelar: Boolean;
    procedure buscaItens(aComanda: Integer = 0);
    procedure StatusComanda(aEmUso: String = ''; aEmCaixa: String = '');
    procedure SalvaItens();
    procedure Finaliza();
    procedure LimpaComanda();

  end;

implementation

uses
  dmVenda, Vcl.Forms, Winapi.Windows, Consts;

{ TComanda }

constructor TComanda.Create;
begin
  FQuery := TZQuery.Create(nil);
  FQuery.Connection := DM.zCon;

  FListaComandas := TObjectList<TComanda>.Create;
  Itens := TObjectList<TItensComanda>.Create;
end;

destructor TComanda.Destroy;
begin
  FreeAndNil(FQuery);
  FreeAndNil(Itens);
  FreeAndNil(FListaComandas);
end;

function TComanda.AbreComanda(aComanda: Integer = 0; nome: String = ''): TComanda;
begin
  if aComanda = 0 then
    Exit(nil);

  comanda := aComanda;

  case VerificaComanda(aComanda) of
    True : StatusComanda();

    False: CadastraComanda();
  end;

  buscaItens();

  Result := Self;
end;

function TComanda.VerificaComanda(aComanda: Integer = 0): Boolean;
begin
  SQL := 'select comanda, nome, em_Uso, em_Caixa ' +
         ' from comanda where comanda = '+ IntToStr(aComanda);
  FQuery.Open;

  em_Uso   := FQuery.Fields[2].AsString;
  em_Caixa := FQuery.Fields[3].AsString;

  Result := FQuery.RecordCount > 0;
end;

procedure TComanda.StatusComanda(aEmUso: String = ''; aEmCaixa: String = '');
begin
  SQL := 'update comanda set em_Uso = '+ QuotedStr(IfThen(aEmUso = '', 'S', aEmUso)) + ', ' +
         'em_Caixa = '+ QuotedStr(IfThen(aEmCaixa = '', 'S', aEmCaixa)) +
              IfThen(Trim(nome) <> '', ', nome = '+ QuotedStr(nome), '');

  SQL := SQL + ' where comanda = '+ IntToStr(comanda);

  ExecSQL(SQL);
end;

function TComanda.CadastraComanda: Boolean;
begin
  Result := True;

  try
    SQL := 'insert into comanda (comanda '+
            IfThen(Trim(nome) <> '', ', nome)', ')') + 'values ';

    SQL := SQL + IfThen(Trim(nome) <> '',
                      '('+ IntToStr(comanda) +', '+ QuotedStr(nome) +')',
                      '('+ IntToStr(comanda) +')');

    ExecSQL(SQL);
  except
    Result := False;
  end;
end;

procedure TComanda.buscaItens(aComanda: Integer = 0);
begin
  SQL := 'select vd.id, idProduto, quantidade, unitario, desconto,  ' +
         'total, totalpago, status, ex, descricao ' +
         'from venda_comanda vd ' +
         'left join produto on vd.idProduto = produto.id ' +
         ' where idComanda = :com and vd.ex = 0 ' +
         ' order by vd.id asc; ';

  FQuery.ParamByName('com').AsString := IfThen(comanda.ToString = '0', aComanda.ToString, comanda.ToString);

  FQuery.Open;

  if FQuery.RecordCount > 0 then
    InserirItens();
end;

procedure TComanda.InserirItens;
var
  Prod_Comanda: TItensComanda;
begin
  FQuery.First;
  while not (FQuery.Eof) do
  begin
    Prod_Comanda := TItensComanda.Create;
    with Prod_Comanda do
    begin
      id            := FQuery.Fields[0].AsInteger;
      idProduto     := FQuery.Fields[1].AsInteger;
      descricao     := FQuery.Fields[9].AsString;
      quantidade    := FQuery.Fields[2].AsFloat;
      valorUnitario := FQuery.Fields[3].AsCurrency;
      desconto      := FQuery.Fields[4].AsCurrency;
      valorTotal    := FQuery.Fields[5].AsCurrency;
      Status        := FQuery.Fields[8].AsString;
      Ex            := 4;

      dmVendas.CdsItens.Append;
      dmVendas.CdsItensID.AsInteger           := dmVendas.CdsItens.RecordCount + 1;
      dmVendas.CdsItenscodProduto.AsInteger   := idProduto;
      dmVendas.CdsItensprodDescricao.AsString := descricao;
      dmVendas.CdsItensprodQtd.AsFloat        := quantidade;
      dmVendas.CdsItensprodUnit.AsCurrency    := valorUnitario;
      dmVendas.CdsItensprodTotal.AsCurrency   := valorTotal;
      dmVendas.CdsItens.Post;

      Itens.Add(Prod_Comanda);
    end;

    valTotal := valTotal + FQuery.Fields[5].AsCurrency;
    FQuery.Next;
  end;
end;

procedure TComanda.SalvaItens;
var
  Item: TItensComanda;
  I: Integer;
begin
  for Item in FItens do
  begin
    case Item.Ex of
      Aberto: begin
        SQL := 'Insert into venda_comanda (idComanda, idProduto, quantidade, unitario, total, status , ex) VALUES ' + #13 +
             '('+ Item.Comanda.ToString +', '+
             Item.idProduto.ToString +', '+
             ReplaceStr(FloatToStr(Item.quantidade), ',', '.') +', '+
             ReplaceStr(FloatToStr(Item.valorUnitario), ',', '.') +', '+
             ReplaceStr(FloatToStr(Item.valorTotal), ',', '.') +', '+
             QuotedStr(Item.Status) +', ''0'' )';
      end;

      Excluido:
        if NOT (Item.id = 0) then
        begin
          SQL := 'Update venda_comanda set ex = 2 where id = '+ Item.id.ToString;
        end;

      Cancelado:
        Continue;

      Edicao: begin
        SQL := 'Update venda_comanda set ';
        SQL := SQL + 'quantidade = :qtd, unitario = :unit, desconto = :desc, ';
        SQL := SQL + 'total = (:qtd * :unit) where id = '+ Item.id.ToString;

        FQuery.ParamByName('qtd').AsFloat     := Item.quantidade;
        FQuery.ParamByName('unit').AsCurrency := Item.valorUnitario;
        FQuery.ParamByName('desc').AsCurrency := Item.desconto;
      end;
    end;

    FQuery.ExecSQL;
  end;

  StatusComanda('S', 'N');
end;

function TComanda.Cancelar: Boolean;
begin
  Result := False;
  if Application.MessageBox('Deseja cancelar venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    StatusComanda('S', 'N');
    LimpaComanda();
    Result := True;
  end;
end;

procedure TComanda.Finaliza;
begin
  SalvaItens();
  FinalizaItens();
  StatusComanda('N', 'N');
  LimpaComanda();
end;

procedure TComanda.FinalizaItens();
begin
  SQL := 'update venda_comanda set ex = 1, status = ''F'', idVenda = '+ idVenda.ToString +
         ' where status = ''A'' and idComanda = '+ Fcomanda.ToString;

  FQuery.ExecSQL;
end;

procedure TComanda.LimpaComanda;
begin
  FItens.Clear;
  FvalTotal := 0;
  Fcomanda  := 0;
end;

function TComanda.GetListaComandas: TObjectList<TComanda>;
var
    I: Integer;
begin
  FListaComandas.Clear;

  SQL := 'select comanda.id, comanda, nome, em_Uso, em_Caixa,  ' +
         '   sum(case when em_Uso = ''S'' then coalesce(vc.total, 0) ' + #10#13 +
         '         else 0 end) total' + #10#13 +
         ' from venda_comanda VC ' + #10#13 +
         'left join comanda on comanda.comanda = VC.idComanda and VC.ex = 0' + #10#13 +
         ' where em_uso like '+ QuotedStr(em_Uso) + #10#13 +
         ' group by comanda.id  '+ #10#13 + ' order by comanda';

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

procedure TComanda.SetidVenda(const Value: Integer);
begin
  FidVenda := Value;
end;

procedure TComanda.SetItens(const Value: TObjectList<TItensComanda>);
begin
  FItens := Value;
end;

procedure TComanda.SetItensComanda(const Value: TItensComanda);
begin
  FItensComanda := Value;
end;

procedure TComanda.SetListaComandas(const Value: TObjectList<TComanda>);
begin
  FListaComandas := Value;
end;

procedure TComanda.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TComanda.SetSQL(const Value: String);
begin
  FSQL := Value;

  FQuery.CLose;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(FSQL);
end;

procedure TComanda.SetvalTotal(const Value: Currency);
begin
  FvalTotal := Value;
end;

end.
