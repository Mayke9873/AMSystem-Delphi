unit FrmCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  uValida, uFornecedor, uFuncionario, uProduto, System.StrUtils, uCompra,
  uCompra.Itens, Datasnap.DBClient;

type
  TfCompra = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edIdFornecedor: TEdit;
    edIdProd: TEdit;
    edFornecedor: TEdit;
    edPesqProd: TEdit;
    edQtdProduto: TEdit;
    edValorUnitario: TEdit;
    edDesconto: TEdit;
    edValorTotal: TEdit;
    grdItensCompra: TDBGrid;
    dbgPesqProduto: TDBGrid;
    dbgFornecedor: TDBGrid;
    pnlDesconto: TPanel;
    Label9: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    edDescontoVenda: TEdit;
    pnlTotal: TPanel;
    Label10: TLabel;
    Panel3: TPanel;
    Shape2: TShape;
    edTotalVenda: TEdit;
    pnlBotoes: TPanel;
    btnSair: TButton;
    btnExcluirProduto: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dProdCompra: TDataSource;
    ActionList1: TActionList;
    acSair: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acExcluirProduto: TAction;
    tmPesquisa: TTimer;
    lblTitle: TLabel;
    cdsItem: TClientDataSet;
    cdsItemid: TIntegerField;
    cdsItemidProd: TIntegerField;
    cdsItemdescricao: TStringField;
    cdsItemvalor: TFloatField;
    cdsItemdesconto: TFloatField;
    cdsItemquantidade: TFloatField;
    cdsItemtotal: TFloatField;
    cdsItemex: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure edIdFornecedorExit(Sender: TObject);
    procedure edFornecedorChange(Sender: TObject);
    procedure tmPesquisaTimer(Sender: TObject);
    procedure edPesqProdChange(Sender: TObject);
    procedure edPesqProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edQtdProdutoExit(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure edValorTotalEnter(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirProdutoExecute(Sender: TObject);
    procedure grdItensCompraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    Fornecedor: TFornecedor;
    Produto: TProduto;
    Compra: TCompra;
    ProdutoCompra: TProdutoCompra;

    procedure PesquisaPorID(Sender: TEdit);
    procedure Consulta(Sender: TEdit);
    procedure LimpaCampos(pTipo : String);
    procedure InserirItemCDS(aItem: TProdutoCompra);
  public
    { Public declarations }
    CodCompra: Integer;
  end;

var
  fCompra: TfCompra;

implementation

{$R *.dfm}

uses dmFornecedor, dmProduto, dmCompra, uDM, FrmPrincipal, System.Math;

procedure TfCompra.FormCreate(Sender: TObject);
begin
  CodCompra := 0;
  PosicionaGrid(dbgFornecedor, edIdFornecedor);
  PosicionaGrid(dbgPesqProduto, edIdProd);

  cdsItem.CreateDataSet;

  Fornecedor    := TFornecedor.Create;
  Produto       := TProduto.Create;
  Compra        := TCompra.Create;
end;

procedure TfCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    SelectNext(ActiveControl, True, True);
end;

procedure TfCompra.PesquisaPorID(Sender: TEdit);
begin
  case Sender.Tag of
    0: begin
      Fornecedor.Ativo := 'S';
      if Fornecedor.Pesquisar('', StrToIntDef(edIdFornecedor.Text, 0)) then
        edFornecedor.Text := Fornecedor.Nome;
    end;

    2: begin
      Produto.Ativo := 'S';

      if Produto.Pesquisar(StrToIntDef(edIdProd.Text, 0)) then
      begin
        edIdProd.Text := IntToStr(Produto.ID);
        edPesqProd.Text := Produto.Descricao;
        edValorUnitario.Text := CurrToStr(Produto.PrecoCompra);
        edQtdProduto.Text := '1';
        edDesconto.Text := '0,00';
        edQtdProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfCompra.tmPesquisaTimer(Sender: TObject);
begin
  tmPesquisa.Enabled := False;
  dbgFornecedor.Visible := False;

  if (Trim(edIdFornecedor.Text) <> '') and (Trim(edIdFornecedor.Text) = '') then
  begin
    Consulta(TEdit(Sender));

    dbgFornecedor.Visible := (dmFornecedores.qFornecedor.RecordCount > 0)
                             and ((edIdFornecedor.Text = '') or (edIdFornecedor.Text = '0'))
  end
end;

procedure TfCompra.Consulta(Sender : TEdit);
begin
  case Sender.Tag of
    0 : begin
      Fornecedor.Ativo := 'S';
      Fornecedor.Pesquisar(Sender.Text);
    end;

    1 : begin
      Produto.Ativo := 'S';
      Produto.Pesquisar(edPesqProd.Text);
    end;
  end;
end;

procedure TfCompra.dbgFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
  begin
    case TDBGrid(Sender).Tag of
      0: begin
        edIdFornecedor.Text := dbgFornecedor.Fields[0].Value;
        edFornecedor.Text   := dbgFornecedor.Fields[1].Value;
        dbgFornecedor.Visible := False;
      end;

      1 : begin
        edIdProd.Text := dbgPesqProduto.Fields[0].Value;
        edValorUnitario.Text := dbgPesqProduto.Fields[3].Text;
        edPesqProd.Text := dbgPesqProduto.Fields[1].Text;
        dbgPesqProduto.Visible := False;

        edQtdProduto.Text := '1';
        edDesconto.Text := '0,00';
      end;
    end;
  end;
end;

procedure TfCompra.grdItensCompraDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Rect.Top = TStringGrid(grdItensCompra).CellRect(0, TStringGrid(grdItensCompra).Row).Top then
  begin
    grdItensCompra.Canvas.FillRect(Rect);
    grdItensCompra.Canvas.Brush.Color := TColor($FFFF00);
    grdItensCompra.Canvas.Font.Color := clBlack;
    grdItensCompra.Canvas.Font.Style := [fsBold];
    grdItensCompra.DefaultDrawDataCell(Rect, Column.Field, State)
  end;
end;

procedure TfCompra.edDescontoExit(Sender: TObject);
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

procedure TfCompra.edFornecedorChange(Sender: TObject);
begin
  if (Trim(edFornecedor.Text) <> '') and ((Trim(edIdFornecedor.Text) = '') or (Trim(edIdFornecedor.Text) = '0')) then
  begin
    Consulta(TEdit(Sender));

    dbgFornecedor.Visible := dmFornecedores.qFornecedor.RecordCount > 0
  end
  else
    dbgFornecedor.Visible := False;
end;

procedure TfCompra.edIdFornecedorExit(Sender: TObject);
begin
  PesquisaPorID(TEdit(Sender));
end;

procedure TfCompra.edPesqProdChange(Sender: TObject);
begin
  dbgPesqProduto.Visible := false;
  if (Trim(edPesqProd.Text) <> '') and (Trim(edIdProd.Text) = '') then
  begin
    Consulta(TEdit(Sender));

    dbgPesqProduto.Visible := dmProdutos.qProduto.RecordCount > 0;
  end
end;

procedure TfCompra.edPesqProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DOWN then
  begin
    case TEdit(Sender).Tag of
      0: begin
        if dbgFornecedor.Visible then
          dbgFornecedor.SetFocus;
      end;

      1: begin
        if dbgPesqProduto.Visible then
          dbgPesqProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfCompra.edQtdProdutoExit(Sender: TObject);
var
  valorTotal: Real;
begin
  valorTotal := StrToFloatDef(edQtdProduto.Text, 0) * StrToFloatDef(edValorUnitario.Text, 0);

  edValorTotal.Text := FormatFloat('##0.00', valorTotal);
end;

procedure TfCompra.edValorTotalEnter(Sender: TObject);
begin
  If not Produto.Pesquisar(StrToIntDef(edIdProd.Text, 0)) then
    Exit;

  ProdutoCompra := TProdutoCompra.Create;
  with ProdutoCompra do
  begin
    idProduto     := Produto.ID;
    descricao     := Produto.Descricao;
    valor         := StrToFloat(edValorUnitario.Text);
    desconto      := StrToFloat(edDesconto.Text);
    quantidade    := StrToFloat(edQtdProduto.Text);
  end;

  InserirItemCDS(ProdutoCompra);

  edTotalVenda.Text := FormatFloat('###,##0.00', Compra.Total);
  edDescontoVenda.Text := FormatFloat('###,##0.00', Compra.Desconto);

  LimpaCampos('Prod');
end;

procedure TfCompra.InserirItemCDS(aItem: TProdutoCompra);
begin
  cdsItem.Append;
  cdsItemid.AsInteger       := IfThen(aItem.EX = 0, Succ(Compra.ItensCompra.Count), aItem.id);
  cdsItemidprod.AsInteger   := aItem.idProduto;
  cdsItemdescricao.AsString := aItem.descricao;
  cdsItemvalor.AsFloat      := aItem.valor;
  cdsItemdesconto.AsFloat   := aItem.desconto;
  cdsItemquantidade.AsFloat := aItem.quantidade;
  cdsItemtotal.AsFloat      := aItem.total;
  cdsItemex.AsInteger       := aItem.EX;
  cdsItem.Post;

  if not Compra.ItensCompra.Equals(aItem) then
    Compra.InserirItem(ProdutoCompra);
end;

procedure TfCompra.LimpaCampos(pTipo : String);
begin
  case AnsiIndexStr(pTipo, ['Prod', 'Compra']) of

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
      CodCompra := 0;
      edIdProd.Clear;
      edPesqProd.Clear;
      edQtdProduto.Clear;
      edValorUnitario.Clear;
      edDesconto.Clear;
      edTotalVenda.Clear;
      edDescontoVenda.Clear;
      edIdFornecedor.SetFocus;
      edTotalVenda.Text := '0,00';
      edDescontoVenda.Text := '0,00';

      cdsItem.EmptyDataSet;
      FreeAndNil(Compra);

      Compra := TCompra.Create;
    End;
  end;
end;

procedure TfCompra.acCancelarExecute(Sender: TObject);
begin
  if cdsItem.RecordCount > 0 then
    if Compra.Cancelar() then
      LimpaCampos('Compra');
end;

procedure TfCompra.acExcluirProdutoExecute(Sender: TObject);
begin
  Compra.ExcluirProduto(cdsItem, cdsItemid.AsInteger);

  edTotalVenda.Text := FormatFloat('###,##0.00', Compra.Total);
  edDescontoVenda.Text := FormatFloat('###,##0.00', Compra.Desconto);
end;

procedure TfCompra.acSairExecute(Sender: TObject);
begin
  if (Compra.ID = 0) and (Application.MessageBox('Deseja sair da compra?', 'Confirma��o', MB_YESNO + 32) = 6) then
    Close

  else if (not (Compra.ID = 0) and Compra.Cancelar()) then
    Close;
end;

procedure TfCompra.acSalvarExecute(Sender: TObject);
begin
  if not Fornecedor.Pesquisar(edFornecedor.Text, StrToIntDef(edIdFornecedor.Text, 0)) then
  begin
    Application.MessageBox('Fornecedor inv�lido. Por favor, verifique!', 'Aten��o', 48);
    Abort;
  end;

  if Application.MessageBox('Deseja salvar a compra?', 'Confirmacao', MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  Compra.idForncedor := Fornecedor.Cod;
  Compra.forncedor   := Fornecedor.Nome;

  if Compra.Salvar() then
    LimpaCampos('Compra');
end;

procedure TfCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Fornecedor);
  FreeAndNil(Produto);
  FreeAndNil(Compra);

  Forms.FecharForm(Self, Action);
end;

end.
