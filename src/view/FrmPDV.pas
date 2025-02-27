unit FrmPDV;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, CheckDBGrid,
  Vcl.StdCtrls, Vcl.WinXCtrls, Data.Bind.Components, Data.Bind.DBScope, Datasnap.Provider, Datasnap.DBClient,
  uFuncionario, uProduto, uVenda, uVenda.Itens, uComanda, uCliente;

type
  TfPDV = class(TForm)
    pnlPrincipal: TPanel;
    pnlBotoes: TPanel;
    pnlTop: TPanel;
    pnlGrid: TPanel;
    pnlFuncoes: TPanel;
    pnlSair: TPanel;
    pnlPesqProduto: TPanel;
    pnlFinalizar: TPanel;
    pnlSalvar: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    btnSalvar: TSpeedButton;
    btnFinalizar: TSpeedButton;
    btnBuscaProduto: TSpeedButton;
    btnSair: TSpeedButton;
    btnFuncoes: TSpeedButton;
    ActList: TActionList;
    acSair: TAction;
    CheckDBGrid1: TCheckDBGrid;
    acSalvar: TAction;
    pnlLateral: TPanel;
    pnlTotal: TPanel;
    Label1: TLabel;
    Shape6: TShape;
    pnlTotalCompra: TPanel;
    lbTotalCompra: TLabel;
    pnlSubTotal: TPanel;
    Label2: TLabel;
    Shape7: TShape;
    Panel3: TPanel;
    lblSubTotal: TLabel;
    pnlQtde: TPanel;
    Label4: TLabel;
    Shape8: TShape;
    Panel12: TPanel;
    edtQtde: TEdit;
    DS: TDataSource;
    acMaisAtalhos: TAction;
    pnlPreco: TPanel;
    Label5: TLabel;
    Shape9: TShape;
    Panel14: TPanel;
    lblPreco: TLabel;
    pnlProduto: TPanel;
    Label7: TLabel;
    Shape10: TShape;
    pnledtProduto: TPanel;
    edtIdProduto: TEdit;
    pnlComanda: TPanel;
    lblComanda: TLabel;
    pnlEdtComanda: TPanel;
    shpComanda: TShape;
    edtComanda: TEdit;
    acPesquisaProduto: TAction;
    acFinalizar: TAction;
    acExcluirProd: TAction;
    pnlExcluirProduto: TPanel;
    Shape11: TShape;
    btnExcluirProduto: TSpeedButton;
    spFuncoes: TSplitView;
    pnlCentral: TPanel;
    Panel1: TPanel;
    Shape12: TShape;
    Panel2: TPanel;
    Shape13: TShape;
    pnlCancelaVenda: TPanel;
    Shape14: TShape;
    acCancelar: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSairExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure edtIdProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure acMaisAtalhosExecute(Sender: TObject);
    procedure acPesquisaProdutoExecute(Sender: TObject);
    procedure acFinalizarExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure acExcluirProdExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure edtComandaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    Venda: TVenda;
    Produto: TProduto;
    Funcionario: TFuncionario;
    Prod_Venda : TVenda_Itens;
    Cliente: TCliente;
    procedure ConsultaPorID(Sender: TEdit);
    procedure StatusCaixa;
    procedure InserirProduto();
    procedure RefazCaption;
    procedure LimpaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPDV: TfPDV;

implementation

uses
  dmVenda, uDM, FrmPrincipal, FrmPesqProduto, uComanda.Itens,
  Winapi.Windows;

{$R *.dfm}

procedure TfPDV.FormCreate(Sender: TObject);
begin
  acMaisAtalhos.Execute;

  dmVendas.CdsItens.Open;

  pnlComanda.Visible := (DM.qParametroUsa_comanda.AsString = 'S');
  pnlSalvar.Visible  := pnlComanda.Visible;
  acSalvar.Enabled   := pnlComanda.Visible;

  if not (pnlComanda.Visible) then
    Self.OnShow := nil;

  Venda         := TVenda.Create;
  Produto       := TProduto.Create;
  Funcionario   := TFuncionario.Create;
  Cliente       := TCliente.Create;

  LimpaCampos();
end;

procedure TfPDV.FormShow(Sender: TObject);
var
  Key: Word;
begin
  Key := VK_RETURN;

  if DM.qParametroUsa_comanda.AsString = 'S' then
  begin
    if Assigned(fPrincipal.comanda) then
    begin
      edtComanda.Text := fPrincipal.Comanda.id.ToString;
      edtComandaKeyDown(Self, Key, []);
    end;
  end;
end;

procedure TfPDV.FormActivate(Sender: TObject);
begin
  if (edtIdProduto.Text = '0000') or (Trim(edtIdProduto.Text) = '') then
  begin
    edtIdProduto.Text := '0000';
    edtQtde.Text      := '1,000';

    edtIdProduto.SetFocus;
  end;

  StatusCaixa();
end;

procedure TfPDV.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmVendas.CdsItens.RecordCount > 0 then
    if not (Application.MessageBox('Deseja sair sem salvar?', 'Confirmação', 32 + MB_YESNO) = IDYES) then
      Abort;

  if DM.qParametroUsa_comanda.AsString = 'S' then
    Venda.fComanda.StatusComanda('S', 'N');

  dmVendas.CdsItens.EmptyDataSet;

  FreeAndNil(Venda);
  FreeAndNil(Produto);
  FreeAndNil(Funcionario);
  FreeAndNil(Cliente);

  Forms.FecharForm(Self, Action);
end;

procedure TfPDV.LimpaCampos();
begin
  edtIdProduto.Text     := '';
  edtQtde.Text          := '1,000';
  lblPreco.Caption      := 'R$ 0,00';
  lblSubTotal.Caption   := 'R$ 0,00';
  lbTotalCompra.Caption := 'R$ 0,00';

  if edtComanda.CanFocus then  
    edtComanda.Clear;
end;

procedure TfPDV.acSalvarExecute(Sender: TObject);
begin
  if not (dmVendas.CdsItens.IsEmpty) then
    if Venda.Salvar() then
    begin
      Venda.fComanda.LimpaComanda();
      dmVendas.CdsItens.EmptyDataSet;
      StatusCaixa();
      LimpaCampos();

      Application.MessageBox('Salvo com sucesso!', 'Aviso', 64);
    end;
end;

procedure TfPDV.acCancelarExecute(Sender: TObject);
begin
  if DM.qParametroUsa_comanda.AsString = 'S' then
  begin
    if not Venda.fComanda.Cancelar then
      Abort;

    edtComanda.Text := '';
  end
  else if not Venda.Cancelar then
    Abort;

  dmVendas.CdsItens.EmptyDataSet;
  StatusCaixa();
  LimpaCampos();
end;

procedure TfPDV.acExcluirProdExecute(Sender: TObject);
begin
  if not (dmVendas.CdsItens.IsEmpty) then
  begin
    Venda.ExcluirProduto(dmVendas.CdsItensID.AsInteger -1);
    dmVendas.CdsItens.Delete;

    RefazCaption;
  end;
end;

procedure TfPDV.acFinalizarExecute(Sender: TObject);
begin
  if (dmVendas.CdsItens.IsEmpty) then
    Exit;

  Venda.Cliente := Cliente;
  if Venda.Finaliza() then
  begin
    dmVendas.CdsItens.EmptyDataSet;
    StatusCaixa();
    LimpaCampos();

    Application.MessageBox('Venda realizada com sucesso!', 'Aviso', 64);
  end;
end;

procedure TfPDV.acMaisAtalhosExecute(Sender: TObject);
begin
  spFuncoes.Opened := not spFuncoes.Opened;
end;

procedure TfPDV.acPesquisaProdutoExecute(Sender: TObject);
begin
  Forms.CriaForm(fPesProd, TfPesProd);
end;

procedure TfPDV.edtIdProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if not (Key = 13) then
    Exit;

  if (DM.qParametroUsa_comanda.AsString = 'S') and (Trim(edtComanda.Text) = '') then
  begin
    Application.MessageBox('Comanda não informada. Por favor, verifique!', 'Aviso', 48);
    Exit;
  end;

  ConsultaPorID(TEdit(Sender));
end;

procedure TfPDV.edtComandaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ItemComanda: TItensComanda;
begin
  if Key = 13 then
  begin
    if Venda.fComanda.AbreComanda(StrToIntDef(edtComanda.Text, 0)) = nil then
    begin
      Application.MessageBox('Comanda inválida. Por favor, verifique!', 'Atenção', 48);
      edtComanda.Clear;
      edtComanda.SetFocus;
      Exit;
    end;

    for ItemComanda in Venda.fComanda.Itens do
    begin
      Prod_Venda := TVenda_Itens.Create;
      with Prod_Venda do
      begin
        id          := ItemComanda.id;
        idProduto   := ItemComanda.idProduto;
        descricao   := ItemComanda.Descricao;
        valor_unit  := ItemComanda.valorUnitario;
        quantidade  := ItemComanda.quantidade;
        total       := ItemComanda.valorTotal;

        Venda.Itens.Add(Prod_Venda);
      end;
    end;

    Venda.Total := Venda.fComanda.valTotal;

    RefazCaption();
    StatusCaixa();

    if Self.Active then
      edtIdProduto.SetFocus;
  end;
end;

procedure TfPDV.ConsultaPorID(Sender: TEdit);
begin
  try
    case Sender.Tag of
      0 : begin
        Produto.Descricao := '';
        Produto.Ativo := 'S';

        if Produto.Pesquisar(StrToIntDef(edtIdProduto.Text, 0)) then
        begin
          InserirProduto();

          RefazCaption();
        end;

        StatusCaixa();
      end;
    end;
  finally
    edtQtde.Text := FormatFloat('0.000', 1);
    edtIdProduto.Clear;
  end;
end;

procedure TfPDV.InserirProduto();
begin
  try
    edtIdProduto.Text := FormatFloat('0000', Produto.ID);
    dmVendas.CdsItens.Append;
    dmVendas.CdsItensID.AsInteger           := Venda.Itens.Count + 1;
    dmVendas.CdsItenscodProduto.AsInteger   := Produto.ID;
    dmVendas.CdsItensprodDescricao.AsString := Produto.Descricao;
    dmVendas.CdsItensprodQtd.AsFloat        := StrToFloatDef(edtQtde.Text, 1);
    dmVendas.CdsItensprodUnit.AsCurrency    := Produto.PrecoVenda;
    dmVendas.CdsItensprodTotal.AsCurrency   := Produto.PrecoVenda * dmVendas.CdsItensprodQtd.AsFloat;

    Prod_Venda := TVenda_Itens.Create;
    with Prod_Venda do
    begin
      idProduto   := Produto.ID;
      idVenda     := Venda.ID;
      descricao   := Produto.Descricao;
      valor_unit  := Produto.PrecoVenda;
      quantidade  := StrToFloatDef(edtQtde.Text, 1);
      total       := dmVendas.CdsItensprodTotal.AsCurrency;

      Venda.Itens.Add(Prod_Venda);
      if DM.qParametroUsa_comanda.AsString = 'S' then
        Venda.InserirItemComanda(Prod_Venda);
    end;

    dmVendas.CdsItens.Post;
  except
    Application.MessageBox('Falha ao inserir produto. Tente novamente', 'Atenção', 48);
    dmVendas.CdsItens.Cancel;
  end;

  Venda.PrecoProduto    := dmVendas.CdsItensprodTotal.AsCurrency;
  Venda.DescontoProduto := 0;
  Venda.Soma();
end;

procedure TfPDV.RefazCaption();
begin
  lblPreco.Caption      := FormatFloat('###,##0.00', dmVendas.CdsItensprodUnit.AsCurrency);
  lblSubTotal.Caption   := FormatFloat('###,##0.00', dmVendas.CdsItensprodTotal.AsCurrency);
  lbTotalCompra.Caption := FormatFloat('###,##0.00', Venda.Total);
end;

procedure TfPDV.edtQtdeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    Venda.PrecoProduto := dmVendas.CdsItensprodTotal.AsCurrency;
    Venda.Subtrair;

    dmVendas.CdsItens.Edit;
    dmVendas.CdsItensprodQtd.AsFloat      := StrToFloatDef(edtQtde.Text, 1);
    dmVendas.CdsItensprodTotal.AsCurrency := dmVendas.CdsItensprodUnit.AsCurrency * dmVendas.CdsItensprodQtd.AsFloat;
    dmVendas.CdsItens.Post;

    Venda.Itens[dmVendas.CdsItens.RecNo -1].quantidade := dmVendas.CdsItensprodQtd.AsFloat;
    Venda.Itens[dmVendas.CdsItens.RecNo -1].total      := dmVendas.CdsItensprodTotal.AsCurrency;

    Venda.PrecoProduto    := dmVendas.CdsItensprodTotal.AsCurrency;
    Venda.DescontoProduto := 0;
    Venda.Soma();

    edtQtde.Text := FormatFloat('0.000', 1);
    edtIdProduto.SetFocus;

    RefazCaption();
  end;
end;

procedure TfPDV.StatusCaixa();
begin
  if dmVendas.CdsItens.RecordCount > 0 then
  begin
    pnlTop.Caption    := 'Caixa Ocupado';
    pnlTop.Color      := $000c53ff;
    edtComanda.Color  := $000c53ff;

    if DM.qParametroUsa_comanda.AsString = 'S' then
      edtComanda.Enabled := False;

    Exit;
  end;

  if dmVendas.CdsItens.RecordCount = 0 then
  begin
    pnlTop.Caption    := 'Caixa Aberto';
    pnlTop.Color      := $00FFDF5A;
    edtComanda.Color  := $00FFDF5A;

    if DM.qParametroUsa_comanda.AsString = 'S' then
    begin
      edtComanda.Enabled := True;
      if edtComanda.CanFocus then
        edtComanda.SetFocus;
    end;

    Exit;
  end;

  pnlTop.Caption    := 'Caixa Fechado';
  pnlTop.Color      := $000042ff;
  edtComanda.Color  := $000c53ff;
end;

end.
