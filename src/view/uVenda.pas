unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZDataset, ZSqlUpdate, ZAbstractDataset,
  System.StrUtils, Vcl.ExtCtrls;

type
  TfVenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodVenda: TEdit;
    edIdVendedor: TEdit;
    edIdCliente: TEdit;
    edIdProd: TEdit;
    edVendedor: TEdit;
    edCliente: TEdit;
    edPesqProd: TEdit;
    edQtdProduto: TEdit;
    edValorUnitario: TEdit;
    edDesconto: TEdit;
    edValorTotal: TEdit;
    DBGrid1: TDBGrid;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnExcluirProduto: TButton;
    btnSair: TButton;
    dFuncionario: TDataSource;
    dCliente: TDataSource;
    dbgPesqProduto: TDBGrid;
    dbgVendedor: TDBGrid;
    dbgCliente: TDBGrid;
    dProdVenda: TDataSource;
    dPesqProd: TDataSource;
    qFuncionario: TZReadOnlyQuery;
    qFuncionarioid: TIntegerField;
    qFuncionarionome: TWideStringField;
    qCliente: TZReadOnlyQuery;
    qPesqProd: TZReadOnlyQuery;
    qPesqProdid: TIntegerField;
    qPesqProddescricao: TWideStringField;
    qPesqProdestoque: TFloatField;
    qPesqProdpVenda: TFloatField;
    qProdVenda: TZQuery;
    uProdVenda: TZUpdateSQL;
    qVenda: TZQuery;
    uVenda: TZUpdateSQL;
    qProdVendaid: TIntegerField;
    qProdVendaidprod: TIntegerField;
    qProdVendadescricao: TWideStringField;
    qProdVendaquantidade: TFloatField;
    qProdVendadesconto: TFloatField;
    qProdVendatotal: TFloatField;
    qVendaid: TIntegerField;
    qProdVendavalor: TFloatField;
    Label9: TLabel;
    Label10: TLabel;
    qClienteid: TIntegerField;
    qClientenome: TWideStringField;
    Panel1: TPanel;
    edDescontoVenda: TEdit;
    Shape1: TShape;
    Panel2: TPanel;
    Shape2: TShape;
    edTotalVenda: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edVendedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgVendedorDblClick(Sender: TObject);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure edPesqProdChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPesqProdutoDblClick(Sender: TObject);
    procedure dbgPesqProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edQtdProdutoExit(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure edValorTotalEnter(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edIdProdExit(Sender: TObject);
    procedure edIdVendedorExit(Sender: TObject);
    procedure edIdClienteExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edQtdProdutoEnter(Sender: TObject);
    procedure edClienteChange(Sender: TObject);
  private
    { Private declarations }
    totalVenda, descontoVenda: Real;
    procedure Consulta(Tipo, TipoCampo : String);

  public
    { Public declarations }
  end;

var
  fVenda: TfVenda;

implementation

uses
  uDM, uCliente;

{$R *.dfm}

procedure TfVenda.FormCreate(Sender: TObject);
begin

  totalVenda := 0;
  descontoVenda := 0;

  dbgVendedor.Left := 8;
  dbgVendedor.Top := 112;

  dbgPesqProduto.Left := 8;
  dbgPesqProduto.Top := 238;

  dbgCliente.Left := 8;
  dbgCliente.Top := 174;
end;

procedure TfVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    27: // Esc
      begin
        btnSairClick(Sender);
        Key := 0;
      end;

    114: // F3
      begin
        btnSalvarClick(Sender);
      end;

    115: // F4
      begin
        btnCancelar.Click;
      end;

    116: // F5
      begin
        btnExcluirProduto.Click;
      end;
  end;
end;

procedure TfVenda.dbgClienteDblClick(Sender: TObject);
begin
  edIdCliente.Text := dbgCliente.Fields[0].Value;
  edCliente.Text := dbgCliente.Fields[1].Value;
end;

procedure TfVenda.dbgPesqProdutoDblClick(Sender: TObject);
begin
  edIdProd.Text := dbgPesqProduto.Fields[0].Value;
  edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
  edPesqProd.Text := dbgPesqProduto.Fields[1].Text;

  edQtdProduto.Text := '1';
  edQtdProduto.SetFocus;
end;

procedure TfVenda.dbgPesqProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  dbgPesqProdutoDblClick(Sender);
end;

procedure TfVenda.dbgVendedorDblClick(Sender: TObject);
begin
  edIdVendedor.Text := dbgVendedor.Fields[0].Value;
  edVendedor.Text := dbgVendedor.Fields[1].Value;
end;

procedure TfVenda.edPesqProdChange(Sender: TObject);
begin

  qPesqProd.Close;

  if Trim(edPesqProd.Text) <> '' then
  begin
    if Trim(edIdProd.Text) = '' then
    begin
      dbgPesqProduto.Visible := True;

      qPesqProd.ParamByName('descricao').AsString := '%' + edPesqProd.Text + '%';
    end
    else
    begin
      dbgPesqProduto.Visible := false;
    end;
  end
  else
  begin
    dbgPesqProduto.Visible := false;
  end;

  qPesqProd.Open;
end;

procedure TfVenda.edValorTotalEnter(Sender: TObject);
begin
  if Length(edCodVenda.Text) = 0 then
  begin
    qVenda.Open;
    qVenda.Insert;
    qVenda.ApplyUpdates;

    qVenda.Close;
    qVenda.Open;
    edCodVenda.Text := qVenda.Fields[0].Value;
  end;

  try
    qProdVenda.Open;
    qProdVenda.Insert;
    qProdVendaidprod.AsInteger := StrToInt(edIdProd.Text);
    qProdVendadescricao.AsString := edPesqProd.Text;
    qProdVendavalor.AsFloat := StrToFloat(edValorUnitario.Text);
    qProdVendadesconto.AsFloat := StrToFloat(edDesconto.Text);
    qProdVendaquantidade.AsFloat := StrToFloat(edQtdProduto.Text);
    qProdVendatotal.AsFloat := StrToFloat(edValorTotal.Text);

    qProdVenda.ApplyUpdates;
    qProdVenda.Close;
  finally
    qProdVenda.ParamByName('idVenda').AsString := '' + edCodVenda.Text + '';
    qProdVenda.Open;
  end;
  totalVenda := totalVenda + StrToFloat(edValorTotal.Text);
  edTotalVenda.Text := FormatFloat('###,###,##0.00', totalVenda);

  descontoVenda := descontoVenda + StrToFloat(edDesconto.Text);
  edDescontoVenda.Text :=  FormatFloat('###,###,##0.00', descontoVenda);

  edIdProd.Clear;
  edPesqProd.Clear;
  edQtdProduto.Clear;
  edValorUnitario.Clear;
  edDesconto.Clear;
  edValorTotal.Clear;
  edIdProd.SetFocus;
end;

procedure TfVenda.edVendedorChange(Sender: TObject);
begin
  Consulta('Func', 'Pesq');
end;

procedure TfVenda.edQtdProdutoEnter(Sender: TObject);
begin
  if Length(Trim(edQtdProduto.Text)) <> 0 then
  begin
    edQtdProduto.Text := '1'
  end;
end;

procedure TfVenda.edQtdProdutoExit(Sender: TObject);
var
  valorTotal: Real;
begin
  valorTotal := StrToFloat(edQtdProduto.Text) * StrToFloat(edValorUnitario.Text);

  edValorTotal.Text := FloatToStr(valorTotal);
end;

procedure TfVenda.edClienteChange(Sender: TObject);
begin
  Consulta('Cli', 'Pesq');
end;

procedure TfVenda.edDescontoExit(Sender: TObject);
var
  valorTotal: Real;
  valorProduto: Real;
  desconto: Real;

begin
  valorProduto := 0;
  desconto := 0;

  if Length(edValorUnitario.Text) = 0 then
  begin
    edPesqProd.SetFocus;
  end
  else
  begin
    valorProduto := StrToFloat(edValorUnitario.Text);
  end;

  if Length(edDesconto.Text) <> 0 then
  begin
    desconto := StrToFloat(edDesconto.Text);
    valorTotal := (valorProduto * StrToFloat(edQtdProduto.Text)) - desconto;

    edValorTotal.Text := FloatToStr(valorTotal);
  end
  else
  begin
    valorTotal := valorProduto * StrToFloat(edQtdProduto.Text);

    edValorTotal.Text := FloatToStr(valorTotal);
    edDesconto.Text := '0,00';
  end;
end;

procedure TfVenda.edIdClienteExit(Sender: TObject);
var
  Cliente : TClientes;
begin
  Cliente :=  TClientes.Create;
  try
    Cliente.Cod := StrToIntDef(edIdCliente.Text, 0);
    Cliente.Nome := '%%';
    Cliente.Pesquisar('S');
    edCliente.Text := DM.qClienteNome.AsString;
  finally
    Cliente.Free;
  end;
end;


procedure TfVenda.edIdProdExit(Sender: TObject);
begin
  if Length(edIdProd.Text) <> 0 then
  begin
    qPesqProd.Close;
    qPesqProd.SQL.Clear;
    qPesqProd.SQL.Add('SELECT id, descricao, estoque, pVenda FROM produto WHERE id = ' + QuotedStr(edIdProd.Text) + ';');
    qPesqProd.Open;

    edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
    edPesqProd.Text := dbgPesqProduto.Fields[1].Text;
    edQtdProduto.Text := '1';
    edQtdProduto.SetFocus;
  end;

end;

procedure TfVenda.edIdVendedorExit(Sender: TObject);
begin
  Consulta('Func', 'ID');
end;

procedure TfVenda.btnSalvarClick(Sender: TObject);
begin
  DM.qPesq.Close;
  DM.qPesq.SQL.Clear;
  DM.qPesq.SQL.Add('SELECT id, nome FROM funcionario WHERE id = ' + QuotedStr(edIdVendedor.Text) + ' and nome = ' +
    QuotedStr(edVendedor.Text) + ';');
  DM.qPesq.Open;

  if DM.qPesq.RecordCount = 0 then
  begin
    ShowMessage('Vendedor inv�lido. Por favor, verifique!');
    Abort;
  end;

  DM.qPesq.Close;
  DM.qPesq.SQL.Clear;
  DM.qPesq.SQL.Add('SELECT id, nome FROM cliente WHERE id = ' + QuotedStr(edIdCliente.Text) + ' and nome = ' +
    QuotedStr(edCliente.Text) + ';');
  DM.qPesq.Open;

  if DM.qPesq.RecordCount = 0 then
  begin
    Application.MessageBox('AMSystem', 'Cleinte inv�lido. Por favor, verifique!');
    Abort;
  end;

  if (Length(Trim(edCodVenda.Text)) <> 0) then
  begin
    DM.qPesq.Close;
    DM.qPesq.SQL.Clear;
    DM.qPesq.SQL.Add('UPDATE VENDA SET ID_CLIENTE = ' + QuotedStr(edCliente.Text) + ', CLIENTE = ' + QuotedStr(edCliente.Text) +
      ', ' + 'VALOR = ' + StringReplace(edTotalVenda.Text, ',', '.', []) + ', DESCONTO = ' +
      StringReplace(edDescontoVenda.Text, ',', '.', []) +
      ', VALOR_TOTAL = ' + StringReplace(edTotalVenda.Text, ',', '.', []) + ', PAGO = ' + StringReplace(edTotalVenda.Text, ',', '.', []) +
      ', VENDEDOR = ' + QuotedStr(edIdVendedor.Text) + ', DATA_VENDA = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Now)) +
      ', EX = 0 WHERE ID = ' + QuotedStr(edCodVenda.Text) + ';');
    DM.qPesq.ExecSQL;

    DM.qPesq.SQL.Clear;
    DM.qPesq.SQL.Add('UPDATE venda_item set ex = 0 where ex = 9 and idVenda = ' + QuotedStr(edCodVenda.Text) + ';');
    DM.qPesq.ExecSQL;
  end;

  qProdVenda.Close;
  qProdVenda.SQL.Clear;
  qProdVenda.SQL.Add('Select id, idVenda, idprod, descricao, valor, desconto, quantidade, total, ex ' +
                      'From Venda_item where idvenda = :idVenda and ex = 9;');

  qProdVenda.ParamByName('idVenda').Value := '0';
  qProdVenda.ExecSQL;

  edCodVenda.Clear;
  // edIdVendedor.Clear;
  // edVendedor.Clear;
  edIdCliente.Clear;
  edCliente.Clear;
  edIdProd.Clear;
  edPesqProd.Clear;
  edQtdProduto.Clear;
  edValorUnitario.Clear;
  edDesconto.Clear;
  edTotalVenda.Clear;
  edDescontoVenda.Clear;
  edIdVendedor.SetFocus;

end;

procedure TfVenda.Consulta(Tipo, TipoCampo : String);
begin

  case AnsiIndexStr(Tipo, ['Func', 'Cli']) of

    0: begin
      qFuncionario.Close; 
           
      if (TipoCampo = 'Pesq') and (Trim(edIdVendedor.Text) = '') then
      begin
        dbgVendedor.Visible := True;

        qFuncionario.ParamByName('id').AsInteger := 0;
        qFuncionario.ParamByName('nome').AsString := '%' + edVendedor.Text + '%';
        qFuncionario.Open;
      end

      else
      begin
        dbgVendedor.Visible := false;

        qFuncionario.ParamByName('id').AsInteger := StrToIntDef(edIdVendedor.Text, 0);
        qFuncionario.ParamByName('nome').AsString := '%' + edVendedor.Text + '%';
        qFuncionario.Open;

        if not (qFuncionario.ParamByName('id').Value = 0) then
          edVendedor.Text := qFuncionarionome.AsString;
      end;
      
      if edVendedor.Text = '' then
      begin
        dbgVendedor.Visible := false;
      end;
    end;

    1: begin
      qCliente.Close;      

      if (TipoCampo = 'Pesq') and (Trim(edIdCliente.Text) = '') then
      begin
        dbgCliente.Visible := True;

        qCliente.ParamByName('id').AsInteger := 0;
        qCliente.ParamByName('nome').AsString := '%' + edCliente.Text + '%';
        qCliente.Open;
      end

      else 
      begin
        dbgCliente.Visible := false;

        qCliente.ParamByName('id').AsInteger := StrToIntDef(edIdCliente.Text, 0);
        qCliente.ParamByName('nome').AsString := '%' + edCliente.Text + '%';
        qCliente.Open;

        if not (qCliente.ParamByName('id').Value = 0) then
          edCliente.Text := qClientenome.AsString;
      end;
      
      if edCliente.Text = '' then
      begin
        dbgCliente.Visible := false;
      end;
    end;

  end;

end;

procedure TfVenda.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fVenda := nil;
end;

end.