unit FrmAjusteEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Vcl.AppAnalytics, Vcl.Mask, Vcl.DBCtrls, uEstoque, Consts, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfAjusteEstoque = class(TForm)
    pnlPrincipal: TPanel;
    pnlBotoes: TPanel;
    pnlSair: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    Shape3: TShape;
    btnAjustarEstoque: TSpeedButton;
    btnSair: TSpeedButton;
    Panel5: TPanel;
    lblTitulo: TLabel;
    ActionList1: TActionList;
    acAjusteEstoque: TAction;
    acSair: TAction;
    Panel2: TPanel;
    rdEntrada: TRadioButton;
    rdSaida: TRadioButton;
    Label1: TLabel;
    EntradaSaida: TAction;
    Label2: TLabel;
    pnlDados: TPanel;
    Label3: TLabel;
    pnlPesqProduto: TPanel;
    pnlProduto: TPanel;
    Shape2: TShape;
    pnlIdProduto: TPanel;
    Shape9: TShape;
    pnlQuantidade: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel8: TPanel;
    Panel11: TPanel;
    Shape5: TShape;
    Panel9: TPanel;
    Panel12: TPanel;
    Shape4: TShape;
    gdPesqProduto: TDBGrid;
    edProduto: TEdit;
    tmPesquisar: TTimer;
    edIdProduto: TEdit;
    edQuantidade: TEdit;
    edObs: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSairExecute(Sender: TObject);
    procedure EntradaSaidaExecute(Sender: TObject);
    procedure acAjusteEstoqueExecute(Sender: TObject);
    procedure edProdutoChange(Sender: TObject);
    procedure gdPesqProdutoDblClick(Sender: TObject);
    procedure tmPesquisarTimer(Sender: TObject);
    procedure edProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edIdProdutoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Estoque : TEstoque;
    Descricao : String;
    Pesquisar : Boolean;
    procedure PesquisaProd(Sender : TEdit);
    procedure grid;
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  fAjusteEstoque: TfAjusteEstoque;

implementation

{$R *.dfm}

uses dmProduto, uProduto;

procedure TfAjusteEstoque.edProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  tmPesquisar.Enabled := False;
  Pesquisar := False;
end;

procedure TfAjusteEstoque.edProdutoChange(Sender: TObject);
begin
  Pesquisar := True;
  tmPesquisar.Enabled := True;
end;

procedure TfAjusteEstoque.tmPesquisarTimer(Sender: TObject);
begin
  if (Pesquisar) and ((Trim(edIdProduto.Text) <> '') and (edIdProduto.Text = '0')) then
  begin
    TThread.CreateAnonymousThread(procedure
    begin
      TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        Descricao := edProduto.Text;
        PesquisaProd(edProduto);
        grid();
      end);

    end).Start;
  end;

  tmPesquisar.Enabled := False;
end;

procedure TfAjusteEstoque.PesquisaProd(Sender : TEdit);
var
  Produto : TProduto;
begin
  Produto := TProduto.Create;
  try
    Produto.Ativo := 'S';

    case Sender.Tag of
      0 : Produto.Pesquisar(Sender.Text);

      1 : begin
        if Produto.Pesquisar(StrToInt(Sender.Text)) then
          gdPesqProdutoDblClick(Self);
      end;

    end;

  finally
    FreeAndNil(Produto);
  end;
end;

procedure TfAjusteEstoque.grid;
begin
  if ((Length(edProduto.Text) = 0) or (StrToIntDef(edIdProduto.Text, 0) <> 0 )) or (dmProdutos.qProduto.RecordCount = 0) then
    gdPesqProduto.Visible := False
  else
    gdPesqProduto.Visible := True;

end;

procedure TfAjusteEstoque.gdPesqProdutoDblClick(Sender: TObject);
begin
  edIdProduto.Text := gdPesqProduto.Fields[0].Value;
  edProduto.Text   := gdPesqProduto.Fields[1].Value;
end;

procedure TfAjusteEstoque.edIdProdutoExit(Sender: TObject);
begin
  TEdit(Sender).Text := IntToStr(StrToIntDef(edIdProduto.Text, 0));
  PesquisaProd(TEdit(Sender));
end;

procedure TfAjusteEstoque.acAjusteEstoqueExecute(Sender: TObject);
begin
  Estoque := TEstoque.Create;
  try
    Estoque.idProduto := StrToIntDef(edIdProduto.Text, 0);
    Estoque.qtd := StrToIntDef(edQuantidade.Text, 0);
    Estoque.obs := edObs.Text;

    if rdEntrada.Checked then
      Estoque.MovEstoque(Ajuste, Entrada)
    else
      Estoque.MovEstoque(Ajuste, Saida);

    Application.MessageBox('Ajuste realizado com sucesso!','' , 32);
    LimpaTela;
  finally
    FreeAndNil(Estoque);
  end;
end;

procedure TfAjusteEstoque.LimpaTela;
begin
  edIdProduto.Clear;
  edProduto.Clear;
  edObs.Clear;
  edQuantidade.Clear;
  edIdProduto.SetFocus;
end;

procedure TfAjusteEstoque.EntradaSaidaExecute(Sender: TObject);
begin
  if rdEntrada.Checked then
    rdSaida.Checked   := True
  else
    rdEntrada.Checked := True;

end;

procedure TfAjusteEstoque.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfAjusteEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(dmProdutos);
  Action := caFree;
  fAjusteEstoque := nil;
end;

procedure TfAjusteEstoque.FormCreate(Sender: TObject);
begin
  dmProdutos := TdmProdutos.Create(nil);
end;

procedure TfAjusteEstoque.FormShow(Sender: TObject);
begin
  edIdProduto.SetFocus;
end;

procedure TfAjusteEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl, True, True);
end;

end.
