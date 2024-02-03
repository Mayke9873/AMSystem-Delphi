unit FrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlUpdate,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, uProduto, Skia, Skia.Vcl;

Const
  telaPadrao = 0;
  telaInsert = 1;
  telaEdit = 2;

type
  TfProduto = class(TForm)
    Label9: TLabel;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    dbgProduto: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEditID: TDBEdit;
    dbeDescricao: TDBEdit;
    dbeUnidade: TDBEdit;
    dbeValorCompra: TDBEdit;
    dbeLucro: TDBEdit;
    dbeValorVenda: TDBEdit;
    dbchkAtivo: TDBCheckBox;
    dbeEstoque: TDBEdit;
    edPesquisa: TEdit;
    rdbTodos: TRadioButton;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    ImageList1: TImageList;
    DbCbGrupo: TDBLookupComboBox;
    pnlBotoes: TPanel;
    tbNovo: TSkSvg;
    tbEditar: TSkSvg;
    tbSalvar: TSkSvg;
    tbCancelar: TSkSvg;
    tbSair: TSkSvg;
    tbRelatorio: TSkSvg;
    procedure Consulta;
    procedure FormCreate(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPesquisaChange(Sender: TObject);
    procedure rdbTodosClick(Sender: TObject);
    procedure rdbAtivoClick(Sender: TObject);
    procedure rdbInativoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tbNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure dbeLucroExit(Sender: TObject);
    procedure dbeValorVendaExit(Sender: TObject);
    procedure qProdutoNewRecord(DataSet: TDataSet);
    procedure tbSalvarClick(Sender: TObject);
    procedure dbgProdutoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    Produto : TProduto;
    Cancelar : String;
    procedure AlterarCampos(pTipo : Integer);
    procedure Opacidade;
  public
    { Public declarations }
  end;

var
  fProduto: TfProduto;

implementation

uses
  dmProduto, FrmRelVendas, FrmPrincipal;
{$R *.dfm}

procedure TfProduto.Consulta;
begin
  if rdbTodos.Checked then
  begin

    Produto.Ativo := 'T';
    Produto.Pesquisar(edPesquisa.Text);
  end;

  if rdbAtivo.Checked then
  begin

    Produto.Ativo := 'S';
    Produto.Pesquisar(edPesquisa.Text);
  end;

  if rdbInativo.Checked then
  begin
    Produto.Ativo := 'N';
    Produto.Pesquisar(edPesquisa.Text);
  end;
end;

procedure TfProduto.dbeLucroExit(Sender: TObject);
var
  compra, lucro, venda: Real;
begin

  compra := 0;
  lucro := 0;
  venda := 0;

  if Trim(dbeValorCompra.Text) <> '' then
  begin
    compra := StrToFloat(dbeValorCompra.Text);
  end
  else
  begin
    compra := 0
  end;

  if Length(Trim(dbeLucro.Text)) <> 0 then
  begin
    lucro := StrToFloat(dbeLucro.Text);
  end
  else
  begin
    lucro := 0;
  end;

  venda := compra + (compra * (lucro / 100));
  // dbeValorVenda.Text := FloatToStr(venda);
  dmProdutos.qProdutoPVENDA.asFloat := venda;
end;

procedure TfProduto.dbeValorVendaExit(Sender: TObject);
var
  compra, lucro, venda: Real;
begin

  compra := 0;
  lucro := 0;
  venda := 0;

  if Trim(dbeValorCompra.Text) <> '' then
  begin
    compra := StrToFloat(dbeValorCompra.Text);
  end
  else
  begin
    compra := 0;
  end;

  if Length(Trim(dbeValorVenda.Text)) <> 0 then
  begin
    venda := StrToFloat(dbeValorVenda.Text);
  end
  else
  begin
    venda := 0;
  end;

  lucro := (venda - compra) / compra * 100;
  // dbeLucro.Text := FloatToStr(lucro);
  dmProdutos.qProdutoPLUCRO.asFloat := lucro;
end;

procedure TfProduto.dbgProdutoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgProduto.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgProduto).CellRect(0,TStringGrid(dbgProduto).Row).Top then
     begin
        dbgProduto.Canvas.FillRect(Rect);
        dbgProduto.Canvas.Brush.Color := TColor($FFFF00);
        dbgProduto.Canvas.Font.Color := clBlack;
        dbgProduto.Canvas.Font.Style := [fsBold];
        dbgProduto.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
     dbgProduto.Canvas.Brush.Color := TColor($FCCC33);
     dbgProduto.Canvas.Font.Color := clBlack;
     dbgProduto.Canvas.FillRect(Rect);
     dbgProduto.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfProduto.edPesquisaChange(Sender: TObject);
begin
  Consulta;
end;

procedure TfProduto.FormCreate(Sender: TObject);
begin
  Produto := TProduto.Create();
  AlterarCampos(telaPadrao);

  dmProdutos.qGrupo.Close;
  dmProdutos.qGrupo.Open;
  dmProdutos.qGrupo.FetchAll;

  Consulta;
end;

procedure TfProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of

    27: begin
      tbSairClick(tbSair);
      Key := 0;
    end;

    112: begin
      tbNovoClick(tbNovo);
    end;

  end;
end;

procedure TfProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfProduto.AlterarCampos(pTipo : Integer);
begin
  case pTipo of

    telaPadrao : begin
      PageControl1.ActivePageIndex := 0;
      dbgProduto.Enabled := True;
      tbNovo.Enabled := True;
      tbEditar.Enabled := True;
      tbSalvar.Enabled := false;
      tbCancelar.Enabled := false;
      DbCbGrupo.Enabled := False;

      dbchkAtivo.ReadOnly := True;
      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := True;
      dbeUnidade.ReadOnly := True;
      dbeEstoque.ReadOnly := True;
      dbeValorCompra.ReadOnly := True;
      dbeLucro.ReadOnly := True;
      dbeValorVenda.ReadOnly := True;

      if Cancelar = 'S' then
        dmProdutos.qProduto.Cancel;
    end;

    telaInsert : begin
      PageControl1.ActivePageIndex := 1;
      dbgProduto.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      DbCbGrupo.Enabled := True;

      dbchkAtivo.ReadOnly := false;
      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := false;
      dbeUnidade.ReadOnly := false;
      dbeEstoque.ReadOnly := false;
      dbeValorCompra.ReadOnly := false;
      dbeLucro.ReadOnly := false;
      dbeValorVenda.ReadOnly := false;

      DBEditID.Clear;
      dbeDescricao.Clear;
      dbeUnidade.Clear;
      dbeEstoque.Clear;
      dbeValorCompra.Clear;
      dbeLucro.Clear;
      dbeValorVenda.Clear;

      dmProdutos.qProduto.Insert;
    end;

    telaEdit : begin
      PageControl1.ActivePageIndex := 1;
      dbgProduto.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      DbCbGrupo.Enabled := True;

      dbchkAtivo.ReadOnly := false;
      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := false;
      dbeUnidade.ReadOnly := false;
      dbeEstoque.ReadOnly := false;
      dbeValorCompra.ReadOnly := false;
      dbeLucro.ReadOnly := false;
      dbeValorVenda.ReadOnly := false;

      dmProdutos.qProduto.Edit;
    end;
  end;

  Opacidade();
end;

procedure TfProduto.Opacidade;
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if (Components[i]) is TSkSvg then
    begin
      case TSkSvg(Components[i]).Enabled of

        True  : TSkSvg(Components[i]).Opacity := 255;

        False : TSkSvg(Components[i]).Opacity := 100;

      end;
    end;
  end;
end;

procedure TfProduto.qProdutoNewRecord(DataSet: TDataSet);
begin
  dmProdutos.qProdutoATIVO.AsString := 'S';
end;

procedure TfProduto.rdbAtivoClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfProduto.rdbInativoClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfProduto.rdbTodosClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfProduto.tbCancelarClick(Sender: TObject);
begin
  Cancelar := 'S';
  AlterarCampos(telaPadrao);
end;

procedure TfProduto.tbEditarClick(Sender: TObject);
begin
  AlterarCampos(telaEdit);
end;

procedure TfProduto.tbNovoClick(Sender: TObject);
begin
  AlterarCampos(telaInsert);
end;

procedure TfProduto.tbRelatorioClick(Sender: TObject);
begin
  if not  Assigned(fRelVendas) then
  fRelVendas := TfRelVendas.Create(fProduto);

  fRelVendas.SkLabel1.Caption := StringReplace(fRelVendas.SkLabel1.Caption, 'Vendas', 'Estoque', []);
  fRelVendas.SkLabel2.Caption := StringReplace(fRelVendas.SkLabel2.Caption, 'vendas', 'estoque', []);
  fRelVendas.Tag := 2;
  fRelVendas.ckTodos.Checked := True;
  fRelVendas.pnlPrincipal.Visible := False;
  fRelVendas.ClientHeight := 100;

  fRelVendas.ShowModal;
end;

procedure TfProduto.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfProduto.tbSalvarClick(Sender: TObject);
begin
  Cancelar := 'N';
  AlterarCampos(telaPadrao);

  Produto.Descricao      := dbeDescricao.Text;
  Produto.Unidade        := dbeUnidade.Text;
  Produto.PrecoCompra    := StrToCurrDef(dbeValorCompra.Text, 0);
  Produto.PrecoVenda     := StrToCurrDef(dbeValorVenda.Text, 0);
  Produto.PorcentLucro   := StrToFloatDef(dbeLucro.Text, 0);
  Produto.DescricaoGrupo := DbCbGrupo.Text;
  Produto.Estoque        := StrToFloatDef(dbeEstoque.Text, 0);

  if DbCbGrupo.KeyValue <> Null then
  Produto.IdGrupo        := DbCbGrupo.KeyValue;

  if dbchkAtivo.Checked then
    Produto.Ativo := dbchkAtivo.ValueChecked
  else
    Produto.Ativo := dbchkAtivo.ValueUnchecked;

  Produto.Cadastrar;
end;

procedure TfProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Produto.Free;
  Forms.FecharForm(Self, Action);
end;

end.
