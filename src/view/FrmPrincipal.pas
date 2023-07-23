unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.ComCtrls, Vcl.ToolWin,System.ImageList, Vcl.ImgList, Vcl.Menus, Threading, IPPeerClient, IPPeerServer,
  System.Tether.Manager, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  uValida;

type
  TfPrincipal = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Produtos1: TMenuItem;
    Produtos2: TMenuItem;
    Grupos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Movimento1: TMenuItem;
    Venda1: TMenuItem;
    ConsultadeVendas1: TMenuItem;
    Fornecedores1: TMenuItem;
    N3: TMenuItem;
    AjustedeEstoque1: TMenuItem;
    Image1: TImage;
    ToolBar1: TToolBar;
    tbCliente: TToolButton;
    ToolButton1: TToolButton;
    tbSair: TToolButton;
    procedure Cadastros2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbClienteClick(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ConsultadeVendas1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure FecharSistema;
    procedure Fornecedores1Click(Sender: TObject);
    procedure AjustedeEstoque1Click(Sender: TObject);
  private
    { Private declarations }
    Valida : TValidacoes;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  FrmCliente, uVenda, FrmConsultaVenda, FrmProduto, FrmGrupoProduto, FrmFuncionario,
  FrmVenda, FrmFornecedor, FrmAjusteEstoque;

{$R *.dfm}

procedure TfPrincipal.AjustedeEstoque1Click(Sender: TObject);
begin
  if not Assigned(fAjusteEstoque) then
    fAjusteEstoque := TfAjusteEstoque.Create(fPrincipal)
  else
    fAjusteEstoque.ShowModal;
end;

procedure TfPrincipal.Cadastros2Click(Sender: TObject);
begin
  if not Assigned(fCliente) then
    fCliente := TfCliente.Create(fPrincipal)
  else
    fCliente.Show;
end;

procedure TfPrincipal.ConsultadeVendas1Click(Sender: TObject);
begin
  if not Assigned(fConsultaVendas) then
    fConsultaVendas := TfConsultaVendas.Create(fPrincipal)
  else
    fConsultaVendas.Show;
end;

procedure TfPrincipal.FecharSistema;
begin
  if MDIChildCount > 0 then
  begin
    Application.MessageBox('Não é possivel fechar o sistema. Por favor, feche todas as telas!', 'Atenção', 48);
    Abort;
  end;

  if (Application.MessageBox('Deseja sair do sistema?', 'Confirmação', MB_YESNO + 32) = IDYES) then
  begin
    Application.Terminate;
  end
  else
    Abort;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharSistema();
end;

procedure TfPrincipal.Fornecedores1Click(Sender: TObject);
begin
  if not Assigned(fFornecedor) then
    fFornecedor := TfFornecedor.Create(fPrincipal)
  else
    fFornecedor.Show;
end;

procedure TfPrincipal.Grupos1Click(Sender: TObject);
begin
  if not Assigned(fGrupoProd) then
    fGrupoProd := TfGrupoProd.Create(fPrincipal)
  else
    fGrupoProd.Show;
end;

procedure TfPrincipal.Produtos1Click(Sender: TObject);
begin
  if not Assigned(fProduto) then
    fProduto := TfProduto.Create(fPrincipal)
  else
    fProduto.Show;
end;

procedure TfPrincipal.Produtos2Click(Sender: TObject);
begin
  if not Assigned(fFuncionario) then
    fFuncionario := TfFuncionario.Create(fPrincipal)
  else
    fFuncionario.Show;
end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  tbSairClick(tbSair);
end;

procedure TfPrincipal.tbClienteClick(Sender: TObject);
begin
  if not Assigned(fCliente) then  
    fCliente := TfCliente.Create(fPrincipal)
  else
    fCliente.Show;
end;

procedure TfPrincipal.tbSairClick(Sender: TObject);
begin
  FecharSistema();
end;

procedure TfPrincipal.ToolButton1Click(Sender: TObject);
begin
  Venda1Click(Venda1);
end;

procedure TfPrincipal.Venda1Click(Sender: TObject);
begin
  if not Assigned(fVenda) then
    fVenda := TfVenda.Create(fPrincipal)
  else
    fVenda.Show;
end;

end.
