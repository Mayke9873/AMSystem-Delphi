unit FrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, ZAbstractRODataset, ZDataset, ZSqlUpdate, ZAbstractDataset,
  System.StrUtils, Vcl.ExtCtrls, uCliente, Vcl.Buttons, uVenda;

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
    qProdVendaid: TIntegerField;
    qProdVendaidprod: TIntegerField;
    qProdVendadescricao: TWideStringField;
    qProdVendaquantidade: TFloatField;
    qProdVendadesconto: TFloatField;
    qProdVendatotal: TFloatField;
    qProdVendavalor: TFloatField;
    qClienteid: TIntegerField;
    qClientenome: TWideStringField;
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
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edVendedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgVendedorDblClick(Sender: TObject);
    procedure dbgClienteDblClick(Sender: TObject);
    procedure edPesqProdChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPesqProdutoDblClick(Sender: TObject);
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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
  private
    { Private declarations }
    totalVenda, descontoVenda: Real;
    Cliente : TCliente;
    Venda : TVenda;
    procedure Consulta(Tipo, TipoCampo : String);
    procedure LimpaCampos(pTipo : String);

  public
    { Public declarations }
  end;

var
  fVenda: TfVenda;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfVenda.FormCreate(Sender: TObject);
begin
  Cliente := TCliente.Create();
  Venda := TVenda.Create();

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
      totalVenda := 0;
      descontoVenda := 0;
    End;
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
  dbgCliente.Visible := False;
end;

procedure TfVenda.dbgPesqProdutoDblClick(Sender: TObject);
begin
  edIdProd.Text := dbgPesqProduto.Fields[0].Value;
  edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
  edPesqProd.Text := dbgPesqProduto.Fields[1].Text;
  dbgPesqProduto.Visible := False;

  edQtdProduto.Text := '1';
  edDesconto.Text := '0,00';
  edQtdProduto.SetFocus;
end;

procedure TfVenda.dbgVendedorDblClick(Sender: TObject);
begin
  edIdVendedor.Text := dbgVendedor.Fields[0].Value;
  edVendedor.Text := dbgVendedor.Fields[1].Value;
  dbgVendedor.Visible := False;
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
    DM.qVenda.Open;
    DM.qVenda.Insert;
    DM.qVenda.ApplyUpdates;

    DM.qVenda.Close;
    DM.qVenda.Open;
    edCodVenda.Text := DM.qVenda.Fields[0].Value;
    Venda.ID := DM.qVenda.Fields[0].Value;
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

  LimpaCampos('Prod');
end;

procedure TfVenda.edVendedorChange(Sender: TObject);
begin
  if Trim(edIdVendedor.Text) = '' then
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
  valorTotal := StrToFloatDef(edQtdProduto.Text, 0) * StrToFloatDef(edValorUnitario.Text, 0);

  edValorTotal.Text := FloatToStr(valorTotal);
end;

procedure TfVenda.edClienteChange(Sender: TObject);
begin
  if Trim(edIdCliente.Text) = '' then
    Consulta('Cli', 'Pesq');
end;

procedure TfVenda.edDescontoExit(Sender: TObject);
var
  valorTotal: Real;
  valorProduto: Real;
  desconto: Real;
begin
  valorProduto := 0;

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
begin

  Cliente.Nome := '%%';
  Cliente.Ativo := 'S';
  Cliente.Pesquisar(StrToIntDef(edIdCliente.Text, 0));
  edCliente.Text := Cliente.Nome;
end;


procedure TfVenda.edIdProdExit(Sender: TObject);
begin
  if Length(edIdProd.Text) <> 0 then
  begin
    qPesqProd.Close;
    qPesqProd.Params[0].AsString := edIdProd.Text;
    qPesqProd.Open;

    edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
    edPesqProd.Text := dbgPesqProduto.Fields[1].Text;
    edQtdProduto.Text := '1';
    edDesconto.Text := '0,00';
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
    Application.MessageBox('Vendedor inválido. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
    Abort;
  end;

  Cliente.Nome := edCliente.Text;
  if not Cliente.Pesquisar(Cliente.Cod) then
  begin
    Application.MessageBox('Cliente inválido ou inexistente. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
    Abort;
  end;

  Venda.ID := StrToIntDef(edCodVenda.Text, 0);
  Venda.Finaliza;

  LimpaCampos('Venda');
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

      else if not (Trim(edIdVendedor.Text) = '') then
      begin
        dbgVendedor.Visible := false;

        qFuncionario.ParamByName('id').AsInteger := StrToIntDef(edIdVendedor.Text, 0);
        qFuncionario.ParamByName('nome').AsString := '%%';
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

      if not (Trim(edCliente.Text) = '') then
      begin
        dbgCliente.Visible := True;

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

procedure TfVenda.btnCancelarClick(Sender: TObject);
begin
  Venda.ID := DM.qVendaid.AsInteger;
  Venda.Cancelar;
  LimpaCampos('Venda');
end;

procedure TfVenda.btnExcluirProdutoClick(Sender: TObject);
begin
  If qProdVenda.RecordCount > 0 then
    Venda.ExcluirProduto();
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

procedure TfVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente.Free;
  Venda.Free;
  Action := caFree;
  fVenda := nil;
end;

end.
