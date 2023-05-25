unit uVenda;

interface

uses
  ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows, Interfaces, uCliente;

type
  TVenda = class
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
    public
      property Total : Currency read FTotal write SetTotal;
      property Desconto : Currency read FDesconto write SetDesconto;
      property PrecoProduto : Currency read FPrecoProduto write SetPrecoProduto;
      property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
      property ID : Integer read FID write SetID;
      procedure Soma;
      procedure Subtrair;
      procedure LimpaProduto;
      procedure ExcluirProduto;
      procedure InsereVenda(pCodigoVenda : String);
      function Cancelar: Boolean;
      function Finaliza: Boolean;
  End;

implementation

  uses
    uDM, FrmVenda;

{ TVenda }

procedure TVenda.ExcluirProduto;
begin
  ExecSQL('Update Venda_item set ex = 1 where id = '+ fVenda.DBGrid1.Fields[0].AsString +' and ' +
      ' IdVenda = '+ IntToStr(ID) +';');

  Subtrair();

  fVenda.qProdVenda.Close;
  fVenda.qProdVenda.Params[0].AsInteger := ID;
  fVenda.qProdVenda.Open;

end;

function TVenda.Finaliza : Boolean;
begin
  Result := False;
  if ID <> 0 then
  begin
    if Application.MessageBox('Confirma venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      ExecSQL('UPDATE VENDA SET ID_CLIENTE = ' + IntToStr(DM.qClienteId.AsInteger) + ', CLIENTE = ' + QuotedStr(DM.qClienteNome.AsString) +
        ', VALOR = ' + StringReplace(fVenda.edTotalVenda.Text, ',', '.', []) +
        ', DESCONTO = ' + StringReplace(fVenda.edDescontoVenda.Text, ',', '.', []) +
        ', VALOR_TOTAL = ' + StringReplace(fVenda.edTotalVenda.Text, ',', '.', []) +
        ', PAGO = ' + StringReplace(fVenda.edTotalVenda.Text, ',', '.', []) +
        ', VENDEDOR = ' + QuotedStr(fVenda.edIdVendedor.Text) + ', DATA_VENDA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
        ', EX = 0 WHERE ID = ' + IntToStr(ID) + ';');

      ExecSQL('UPDATE venda_item set ex = 0 where ex = 9 and idVenda = ' + IntToStr(ID) + ';');

      LimpaProduto();
      Result := True;
    end;

  end;

end;

procedure TVenda.InsereVenda(pCodigoVenda : String);
begin
  if Length(pCodigoVenda) = 0 then
  begin
    Total := 0;
    Desconto := 0;
    DM.qVenda.Open;
    DM.qVenda.Insert;
    DM.qVenda.ApplyUpdates;

    DM.qVenda.Close;
    DM.qVenda.Open;
    fVenda.edCodVenda.Text := DM.qVenda.Fields[0].Value;
    ID := DM.qVenda.Fields[0].Value;
  end;
end;

procedure TVenda.LimpaProduto;
begin
  fVenda.qProdVenda.Close;
  fVenda.qProdVenda.Params[0].AsInteger := 0;
  fVenda.qProdVenda.Open;
end;

function TVenda.Cancelar : Boolean;
begin
  Result := False;
  if Application.MessageBox('Deseja cancelar venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    LimpaProduto;
    ExecSQL('Delete from venda where ID = ' + IntToStr(ID));
    ExecSQL('Delete from venda_item where idVenda = '+  IntToStr(ID));
    Result := True;
  end;

end;

procedure TVenda.Soma;
begin
  PrecoProduto := PrecoProduto - DescontoProduto;
  Total := Total + PrecoProduto;
  Desconto := Desconto + (DescontoProduto);
end;

procedure TVenda.Subtrair;
begin
  Total := Total - PrecoProduto;
  Desconto := Desconto - DescontoProduto;
end;

procedure TVenda.SetDesconto(const Value: Currency);
begin
  FDesconto := Value;
end;

procedure TVenda.SetDescontoProduto(const Value: Currency);
begin
  FDescontoProduto := Value;
end;

procedure TVenda.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TVenda.SetPrecoProduto(const Value: Currency);
begin
  FPrecoProduto := Value;
end;

procedure TVenda.SetTotal(const Value: Currency);
begin
  FTotal := Value;
end;

end.
