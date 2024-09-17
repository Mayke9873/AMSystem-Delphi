unit FrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZDataset, ZSqlUpdate, ZAbstractDataset,
  System.StrUtils, Vcl.ExtCtrls, uCliente, Vcl.Buttons, uVenda, uProduto,
  uFuncionario, uVenda.Itens, Consts;

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
    dbgPesqProduto: TDBGrid;
    dbgVendedor: TDBGrid;
    dbgCliente: TDBGrid;
    dProdVenda: TDataSource;
    qProdVenda: TZQuery;
    uProdVenda: TZUpdateSQL;
    pnlDesconto: TPanel;
    Panel1: TPanel;
    Shape1: TShape;
    edDescontoVenda: TEdit;
    Label9: TLabel;
    pnlTotal: TPanel;
    Panel2: TPanel;
    Shape2: TShape;
    edTotalVenda: TEdit;
    Label10: TLabel;
    pnlBotoes: TPanel;
    btnSair: TButton;
    btnExcluirProduto: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    qProdVendaid: TZInt64Field;
    qProdVendaidVenda: TZInt64Field;
    qProdVendaidprod: TZInt64Field;
    qProdVendadescricao: TZUnicodeStringField;
    qProdVendadesconto: TZBCDField;
    qProdVendaquantidade: TZBCDField;
    qProdVendatotal: TZBCDField;
    qProdVendaex: TZIntegerField;
    qProdVendavalor: TZBCDField;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edVendedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgVendedorDblClick(Sender: TObject);
    procedure edPesqProdChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edQtdProdutoExit(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure edValorTotalEnter(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edIdVendedorExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edQtdProdutoEnter(Sender: TObject);
    procedure edClienteChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure dbgVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edVendedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Produto : TProduto;
    Cliente : TCliente;
    Funcionario : TFuncionario;
    Venda : TVenda;
    Prod_Venda : TVenda_Itens;
    procedure Consulta(Sender : TEdit);
    procedure ConsultaPorID(Sender : TEdit);
    procedure LimpaCampos(pTipo : String);
    procedure FocarGrid(edit : TEdit);
    procedure PreencheCampos(grid : TDBGrid);
    procedure LimpaProduto;

  public
    { Public declarations }
  end;

var
  fVenda: TfVenda;

implementation

uses
  uDM, dmProduto, dmFuncionario, dmCliente, dmVenda, FrmPrincipal;

{$R *.dfm}

procedure TfVenda.FormCreate(Sender: TObject);
begin
  Cliente := TCliente.Create();
  Produto := TProduto.Create();
  Funcionario := TFuncionario.Create();
  Venda := TVenda.Create();

  edTotalVenda.Text := '0,00';
  edDescontoVenda.Text := '0,00';

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

procedure TfVenda.LimpaCampos(pTipo : String);
begin

  case AnsiIndexStr(pTipo, ['Prod', 'Venda']) of
  
    0 : Begin
      edIdProd.Clear;
      edPesqProd.Clear;
      edQtdProduto.Clear;
      edValorUnitario.Clear;
      edDesconto.Clear;
      edValorTotal.Clear;
      edIdProd.SetFocus;
    End;

    1 : Begin
      edCodVenda.Clear;
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
      edTotalVenda.Text := '0,00';
      edDescontoVenda.Text := '0,00';
    End;
  end;
end;

procedure TfVenda.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    27 : begin // Esc
      btnSairClick(Sender);
      Key := 0;
    end;

    114 : begin// F3

      btnSalvarClick(Sender);
    end;

    115 : begin // F4
      btnCancelar.Click;
    end;

    116 : begin // F5
        btnExcluirProduto.Click;
    end;
  end;
end;

procedure TfVenda.dbgVendedorDblClick(Sender: TObject);
begin
  PreencheCampos(TDBGrid(Sender));
end;

procedure TfVenda.dbgVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not (Key = 13) then
    Exit;
    
  PreencheCampos(TDBGrid(Sender));
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfVenda.edPesqProdChange(Sender: TObject);
begin
  if (Trim(edPesqProd.Text) <> '') and (Trim(edIdProd.Text) = '') then
  begin
    Produto.Ativo := 'S';
    Produto.Pesquisar(edPesqProd.Text);

    if dmProdutos.qProduto.RecordCount > 0  then
    begin
      dbgPesqProduto.Visible := True;
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
end;

procedure TfVenda.edValorTotalEnter(Sender: TObject);
begin
  If not Produto.Pesquisar(StrToIntDef(edIdProd.Text, 0)) then
    Exit;

  Venda.InsereVenda(edCodVenda.Text);
  edCodVenda.Text := Venda.ID.ToString;

  Venda.PrecoProduto    := StrToCurr(edValorUnitario.Text) * strtoFLoat(edQtdProduto.Text);
  Venda.DescontoProduto := StrToCurr(edDesconto.Text);

  Venda.Soma();

  try
    qProdVenda.Open;
    qProdVenda.Insert;
    qProdVendaidVenda.AsInteger  := Venda.id;
    qProdVendaidprod.AsInteger   := StrToInt(edIdProd.Text);
    qProdVendadescricao.AsString := edPesqProd.Text;
    qProdVendavalor.AsFloat      := StrToFloat(edValorUnitario.Text);
    qProdVendadesconto.AsFloat   := StrToFloat(edDesconto.Text);
    qProdVendaquantidade.AsFloat := StrToFloat(edQtdProduto.Text);
    qProdVendatotal.AsFloat      := (Venda.PrecoProduto);
    qProdVendaex.AsInteger       := Consts.Aberto;

    Prod_Venda := TVenda_Itens.Create;
    with Prod_Venda do
    begin
      idProduto   := StrToInt(edIdProd.Text);
      idVenda     := Venda.ID;
      valor_unit  := StrToFloat(edValorUnitario.Text);
      desconto    := StrToFloat(edDesconto.Text);
      quantidade  := StrToFloat(edQtdProduto.Text);
      total       := (Venda.PrecoProduto);

      Venda.Itens.Add(Prod_Venda);
    end;

    qProdVenda.ApplyUpdates;
    qProdVenda.Close;

  finally
    qProdVenda.ParamByName('idVenda').AsInteger := StrToIntDef(edCodVenda.Text, 0);
    qProdVenda.Open;
  end;

  edTotalVenda.Text := FormatFloat('###,##0.00', Venda.Total);
  edDescontoVenda.Text := FormatFloat('###,##0.00', Venda.Desconto);

  LimpaCampos('Prod');
end;

procedure TfVenda.edVendedorChange(Sender: TObject);
begin
  if (Trim(edVendedor.Text) <> '') and (Trim(edIdVendedor.Text) = '') then
  begin
    Consulta(TEdit(Sender));
    
    if dmFuncionarios.qFuncionario.RecordCount > 0 then
      dbgVendedor.Visible := True
    else
      dbgVendedor.Visible := False;
  end
  else
    dbgVendedor.Visible := False;

end;

procedure TfVenda.edVendedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_DOWN) then
      FocarGrid(TEdit(Sender));
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
  valorTotal := StrToFloatDef(edQtdProduto.Text, 0) * StrToFloatDef(edValorUnitario.Text, 0);

  edValorTotal.Text := FloatToStr(valorTotal);
end;

procedure TfVenda.edClienteChange(Sender: TObject);
begin
  if (Trim(edCliente.Text) <> '') and (Trim(edIdCliente.Text) = '') then
  begin
    Consulta(TEdit(Sender));
    
    if dmClientes.qCliente.RecordCount > 0 then
      dbgCliente.Visible := True
    else
      dbgCliente.Visible := False;
  end
  else
    dbgCliente.Visible := False;
end;

procedure TfVenda.edDescontoExit(Sender: TObject);
begin
  Produto.Ativo := 'S';
  Produto.Descricao := edPesqProd.Text;
  if not Produto.Pesquisar(StrToIntDef(edIdProd.Text, 0)) then
  begin
    edIdProd.SetFocus;
    Exit;
  end;

  if Length(edValorUnitario.Text) = 0 then
  begin
    edPesqProd.SetFocus;
    Exit;
  end;

end;

procedure TfVenda.edIdVendedorExit(Sender: TObject);
begin
  ConsultaPorID(TEdit(Sender));
end;

procedure TfVenda.btnSalvarClick(Sender: TObject);
begin
  Funcionario.Nome := edVendedor.Text;
  if not Funcionario.Pesquisar(Funcionario.Cod) then
  begin
    Application.MessageBox('Vendedor inválido. Por favor, verifique!', 'Atenção', 48);
    Abort;
  end;

  Cliente.Nome := edCliente.Text;
  if not Cliente.Pesquisar(Cliente.Cod) then
  begin
    Application.MessageBox('Cliente inválido ou inexistente. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
    Abort;
  end;

  Venda.ID := StrToIntDef(edCodVenda.Text, 0);
  if Venda.Finaliza() then
  begin
    LimpaProduto();
    LimpaCampos('Venda');
  end;
end;

procedure TfVenda.Consulta(Sender : TEdit);
begin
  case Sender.Tag of
    0 : begin
      Funcionario.Ativo := 'S';
      Funcionario.Pesquisar(Sender.Text);
    end;

    1 : begin
      Cliente.Ativo := 'S';
      Cliente.Pesquisar(Sender.Text);
    end;
  end;
end;

procedure TfVenda.ConsultaPorID(Sender: TEdit);
begin
  case Sender.Tag of
    0 : begin  
      Funcionario.Ativo := 'S';
      Funcionario.Pesquisar(StrToIntDef(edIdVendedor.Text, 0));
      edVendedor.Text := Funcionario.Nome;
      Venda.idVendedor := Funcionario.Cod;
    end;

    2 : begin
      Produto.Descricao := '';
      Produto.Ativo := 'S';

      if Produto.Pesquisar(StrToIntDef(edIdProd.Text, 0)) then
      begin
        edIdProd.Text := IntToStr(Produto.ID);
        edPesqProd.Text := Produto.Descricao;
        edValorUnitario.Text := CurrToStr(Produto.PrecoVenda);
        edQtdProduto.Text := '1';
        edDesconto.Text := '0,00';
        edQtdProduto.SetFocus;
      end;
    end;

    1 : begin
      Cliente.Ativo := 'S';
      Cliente.Pesquisar(StrToIntDef(edIdCliente.Text, 0));
      edCliente.Text := Cliente.Nome;  
    end;
  end;
end;

procedure TfVenda.btnCancelarClick(Sender: TObject);
begin
  Venda.ID := dmVendas.qVendaid.AsInteger;
  if Venda.Cancelar then
  begin
    LimpaProduto();
    LimpaCampos('Venda');
  end;
end;

procedure TfVenda.btnExcluirProdutoClick(Sender: TObject);
begin
  If qProdVenda.RecordCount > 0 then
  begin
    Venda.PrecoProduto    := StrToCurr(DBGrid1.Fields[6].AsString);
    Venda.DescontoProduto := StrToCurr(DBGrid1.Fields[5].AsString);
    Venda.ExcluirProduto();

    qProdVenda.Close;
    qProdVenda.Params[0].AsInteger := Venda.ID;
    qProdVenda.Open;

    edTotalVenda.Text := FormatFloat('###,##0.00', Venda.Total);
    edDescontoVenda.Text := FormatFloat('###,##0.00', Venda.Desconto);
  end;
end;

procedure TfVenda.btnSairClick(Sender: TObject);
begin
  if (Trim(edCodVenda.Text) = '') and (Application.MessageBox('Deseja sair da venda?', 'Confirmação', MB_YESNO + 32) = 6) then
  begin
    Close;
  end
  else
  if (not (Trim(edCodVenda.Text) = '' ) and Venda.Cancelar()) then
    Close;
end;

procedure TfVenda.FocarGrid(edit : TEdit);
begin
  case edit.Tag of
    0 : begin
      if dbgVendedor.Visible then
        dbgVendedor.SetFocus;
    end;

    1 : begin
      if dbgCliente.Visible then
      dbgCliente.SetFocus;
    end;

    2 : begin
      if dbgPesqProduto.Visible then
        dbgPesqProduto.SetFocus;
    end;

  end;
end;

procedure TfVenda.PreencheCampos(grid: TDBGrid);
begin
  case grid.Tag of
    0 : begin 
      edIdVendedor.Text := dbgVendedor.Fields[0].Value;
      edVendedor.Text := dbgVendedor.Fields[1].Value;
      dbgVendedor.Visible := False;
    end;
    
    1 : begin
      edIdCliente.Text := dbgCliente.Fields[0].Value;
      edCliente.Text := dbgCliente.Fields[1].Value;
      dbgCliente.Visible := False;
    end;
    
    2 : begin
      edIdProd.Text := dbgPesqProduto.Fields[0].Value;
      edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
      edPesqProd.Text := dbgPesqProduto.Fields[1].Text;
      dbgPesqProduto.Visible := False;

      edQtdProduto.Text := '1';
      edDesconto.Text := '0,00';
      edQtdProduto.SetFocus; 
    end;
  end;
end;

procedure TfVenda.LimpaProduto;
begin
  qProdVenda.Close;
  qProdVenda.Params[0].AsInteger := 0;
  qProdVenda.Open;
end;

procedure TfVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente.Free;
  Venda.Free;
  Funcionario.Free;
  Produto.Free;

  Forms.FecharForm(Self, Action);
end;

end.
