unit uCompra;

interface

uses
  System.SysUtils, Vcl.Forms, Winapi.Windows, ZDataset;

type TCompra = class
  private
    FID: Integer;
    FDesconto: Currency;
    FTotal: Currency;
    FDescontoProduto: Currency;
    FPrecoProduto: Currency;
    procedure SetID(const Value: Integer);
    procedure SetDesconto(const Value: Currency);
    procedure SetTotal(const Value: Currency);
    procedure SetDescontoProduto(const Value: Currency);
    procedure SetPrecoProduto(const Value: Currency);
    procedure Estoque;
  published
    property Total : Currency read FTotal write SetTotal;
    property Desconto : Currency read FDesconto write SetDesconto;
    property PrecoProduto : Currency read FPrecoProduto write SetPrecoProduto;
    property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
    property ID : Integer read FID write SetID;
  public
    procedure Soma;
    procedure Subtrair;
    procedure ExcluirProduto;
    procedure InsereCompra(pCodigoCompra : String);
    function Cancelar: Boolean;
    function Finaliza: Boolean;
  End;

implementation

  uses
    uDM, FrmVenda, uProduto, uEstoque, Consts, FrmCompra, dmFornecedor, dmCompra;

{ TCompra }

procedure TCompra.ExcluirProduto;
begin
  ExecSQL('Update Compra_item set ex = 1 where id = '+ fCompra.DBGrid1.Fields[0].AsString +' and ' +
      ' IdCompra = '+ IntToStr(ID) +';');

  Subtrair();

  fCompra.qProdCompra.Close;
  fCompra.qProdCompra.Params[0].AsInteger := ID;
  fCompra.qProdCompra.Open;

end;

function TCompra.Finaliza : Boolean;
begin
  Result := False;
  if ID <> 0 then
  begin
    if Application.MessageBox('Confirma compra?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      ExecSQL('UPDATE COMPRA SET ID_FORNECEDOR = ' + IntToStr(dmFornecedores.qFornecedorid.AsInteger) +
        ', FORNECEDOR = ' + QuotedStr(dmFornecedores.qFornecedorNome.AsString) +
        ', VALOR = ' + StringReplace(fCompra.edTotalVenda.Text, ',', '.', []) +
        ', DESCONTO = ' + StringReplace(fCompra.edDescontoVenda.Text, ',', '.', []) +
        ', VALOR_TOTAL = ' + StringReplace(fCompra.edTotalVenda.Text, ',', '.', []) +
        ', PAGO = ' + StringReplace(fCompra.edTotalVenda.Text, ',', '.', []) +
        ', DATA_COMPRA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
        ', EX = 0 WHERE ID = ' + IntToStr(ID) + ';');

      ExecSQL('UPDATE compra_item set ex = 0 where ex = 9 and idCompra = ' + IntToStr(ID) + ';');

      Estoque();
      Result := True;
    end;

  end;

end;

procedure TCompra.Estoque;
var
  Prod: TEstoque;
begin
  Prod := TEstoque.Create;
  try
    fCompra.qProdCompra.First;
    while not fCompra.qProdCompra.Eof do
    begin
      Prod.idProduto := fCompra.qProdCompraidprod.AsInteger;
      Prod.qtd := fCompra.qProdCompraquantidade.AsFloat;

      Prod.MovEstoque(Compra, Entrada);

      fCompra.qProdCompra.Next;
    end;

  finally
    FreeAndNil(Prod);
  end;

end;

procedure TCompra.InsereCompra(pCodigoCompra : String);
begin
  if Length(pCodigoCompra) = 0 then
  begin
    Total := 0;
    Desconto := 0;
    dmCompras.qCompra.Open;
    dmCompras.qCompra.Insert;
    dmCompras.qCompra.ApplyUpdates;

    dmCompras.qCompra.Close;
    dmCompras.qCompra.Open;
    fCompra.edCodCompra.Text := dmCompras.qCompra.Fields[0].Value;
    ID := dmCompras.qCompra.Fields[0].Value;
  end;
end;

function TCompra.Cancelar : Boolean;
begin
  Result := False;
  if Application.MessageBox('Deseja cancelar compra?', 'AmSystem', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    ExecSQL('Delete from Compra where ID = ' + IntToStr(ID));
    ExecSQL('Delete from Compra_item where idCompra = '+  IntToStr(ID));
    Result := True;
  end;

end;

procedure TCompra.Soma;
begin
  PrecoProduto := PrecoProduto - DescontoProduto;
  Total := Total + PrecoProduto;
  Desconto := Desconto + (DescontoProduto);
end;

procedure TCompra.Subtrair;
begin
  Total := Total - PrecoProduto;
  Desconto := Desconto - DescontoProduto;
end;

procedure TCompra.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
end;

procedure TCompra.SetDescontoProduto(const Value: Currency);
begin
  FDescontoProduto := Value;
end;

procedure TCompra.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TCompra.SetPrecoProduto(const Value: Currency);
begin
  FPrecoProduto := Value;
end;

procedure TCompra.SetTotal(const Value: Currency);
begin
  FTotal := Value;
end;

end.
