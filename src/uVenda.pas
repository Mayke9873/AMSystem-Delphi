unit uVenda;

interface

uses
  ZDataset, SysUtils, Data.DB, Vcl.Forms, Winapi.Windows, Interfaces, uCliente;

type
  TVenda = class
    private
    FID: Integer;
    procedure SetID(const Value: Integer);
    public
      property ID : Integer read FID write SetID;
      procedure Finaliza;
      procedure LimpaProduto;
      procedure ExcluirProduto;
      function Cancelar: Boolean;
  End;

implementation

  uses
    uDM, FrmVenda;

{ TVenda }

procedure TVenda.ExcluirProduto;
begin
  ExecSQL('Update Venda_item set ex = 1 where id = '+ fVenda.DBGrid1.Fields[0].AsString +' and ' +
      ' IdVenda = '+ IntToStr(ID) +';');

  fVenda.edTotalVenda.Text := CurrToStr(StrToCurr(fVenda.edTotalVenda.Text) - fVenda.DBGrid1.Fields[6].AsCurrency);
  fVenda.edDescontoVenda.Text := CurrToStr(StrToCurr(fVenda.edDescontoVenda.Text) - fVenda.DBGrid1.Fields[5].AsCurrency);

  fVenda.qProdVenda.Close;
  fVenda.qProdVenda.Params[0].AsInteger := ID;
  fVenda.qProdVenda.Open;

end;

procedure TVenda.Finaliza;
begin
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
    end;

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

procedure TVenda.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
