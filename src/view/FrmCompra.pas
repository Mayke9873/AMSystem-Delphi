unit FrmCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  uValida, uFornecedor, uFuncionario, uProduto;

type
  TfCompra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodVenda: TEdit;
    edIdFornecedor: TEdit;
    edIdProd: TEdit;
    edFornecedor: TEdit;
    edPesqProd: TEdit;
    edQtdProduto: TEdit;
    edValorUnitario: TEdit;
    edDesconto: TEdit;
    edValorTotal: TEdit;
    DBGrid1: TDBGrid;
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
    dProdVenda: TDataSource;
    qProdVenda: TZQuery;
    qProdVendaid: TIntegerField;
    qProdVendaidprod: TIntegerField;
    qProdVendadescricao: TWideStringField;
    qProdVendaquantidade: TFloatField;
    qProdVendadesconto: TFloatField;
    qProdVendatotal: TFloatField;
    qProdVendavalor: TFloatField;
    uProdVenda: TZUpdateSQL;
    ActionList1: TActionList;
    acSair: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acExcluirProduto: TAction;
    tmPesquisa: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure edIdFornecedorExit(Sender: TObject);
    procedure edFornecedorChange(Sender: TObject);
    procedure tmPesquisaTimer(Sender: TObject);
    procedure edPesqProdChange(Sender: TObject);
    procedure edPesqProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    Fornecedor: TFornecedor;
    Produto: TProduto;

    procedure PesquisaPorID(Sender: TEdit);
    procedure Consulta(Sender: TEdit);
  public
    { Public declarations }
  end;

var
  fCompra: TfCompra;

implementation

{$R *.dfm}

uses dmFornecedor, dmProduto;

procedure TfCompra.FormCreate(Sender: TObject);
begin
  PosicionaGrid(dbgFornecedor, edIdFornecedor);
  PosicionaGrid(dbgPesqProduto, edIdProd);

  Fornecedor := TFornecedor.Create;
  Produto := TProduto.Create;

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
        edValorUnitario.Text := CurrToStr(Produto.PrecoVenda);
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

  if (Trim(edIdFornecedor.Text) <> '') and (Trim(edIdFornecedor.Text) = '') then
  begin
    Consulta(TEdit(Sender));

    if (dmFornecedores.qFornecedor.RecordCount > 0) and ((edIdFornecedor.Text = '') or (edIdFornecedor.Text = '0')) then
      dbgFornecedor.Visible := True
    else
      dbgFornecedor.Visible := False;
  end
  else
    dbgFornecedor.Visible := False;
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


procedure TfCompra.dbgFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
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
        edQtdProduto.SetFocus;
      end;
    end;
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
  if (Trim(edPesqProd.Text) <> '') and (Trim(edIdProd.Text) = '') then
  begin
    Consulta(TEdit(Sender));

    dbgPesqProduto.Visible := dmProdutos.qProduto.RecordCount > 0;
  end
  else
    dbgPesqProduto.Visible := false;
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

procedure TfCompra.acSairExecute(Sender: TObject);
begin
  if (Application.MessageBox('Deseja sair?', 'AmSystem', MB_YESNO + 32) = IDYES) then
  begin
    Close;
  end;
end;

procedure TfCompra.acSalvarExecute(Sender: TObject);
begin
  Application.MessageBox('Salvar', 'AmSystem');
end;

procedure TfCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fCompra := nil;
end;

end.
