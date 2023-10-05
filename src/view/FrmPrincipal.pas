unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.ComCtrls, Vcl.ToolWin,System.ImageList, Vcl.ImgList, Vcl.Menus, Threading, IPPeerClient, IPPeerServer,
  System.Tether.Manager, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  uValida, Skia, Skia.Vcl;

type
  TfPrincipal = class(TForm)
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
    N4: TMenuItem;
    Compra1: TMenuItem;
    ConsultadeCompras1: TMenuItem;
    pnlBotoes: TPanel;
    pnlCliente: TPanel;
    SkSvg1: TSkSvg;
    pnlVenda: TPanel;
    SkSvg2: TSkSvg;
    pnlSair: TPanel;
    SkSvg3: TSkSvg;
    procedure Cadastros2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbClienteClick(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure ConsultadeVendas1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure FecharSistema;
    procedure Fornecedores1Click(Sender: TObject);
    procedure AjustedeEstoque1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure pnlClienteClick(Sender: TObject);
    procedure pnlSairClick(Sender: TObject);
    procedure pnlVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConsultadeCompras1Click(Sender: TObject);
  private
    { Private declarations }
    Valida : TValidacoes;
    function VersaoExe: String;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  FrmCliente, uVenda, FrmConsultaVenda, FrmProduto, FrmGrupoProduto, FrmFuncionario,
  FrmVenda, FrmFornecedor, FrmAjusteEstoque, FrmCompra, FrmConsultaCompra;

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

procedure TfPrincipal.Compra1Click(Sender: TObject);
begin
  if not Assigned(fCompra) then
    fCompra := TfCompra.Create(fPrincipal)
  else
    fCompra.Show;
end;

procedure TfPrincipal.ConsultadeCompras1Click(Sender: TObject);
begin
  if not Assigned(fConsultaCompras) then
    fConsultaCompras := TfConsultaCompra.Create(fPrincipal)
  else
    fConsultaCompras.Show;
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
    Application.MessageBox('Não é possivel fechar o sistema.'#13'Por favor, feche todas as telas e tente novamente!', 'Atenção', 48);
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

procedure TfPrincipal.FormCreate(Sender: TObject);
begin
  Caption := 'AmSystem :::: V.' + VersaoExe;
end;

function TfPrincipal.VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F : PFFI;
  Handle : Dword;
  Len : Longint;
  Data : Pchar;
  Buffer : Pointer;
  Tamanho : Dword;
  Parquivo: Pchar;
  Arquivo : String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data:=StrAlloc(Len+1);
    if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
    begin
      VerQueryValue(Data, '\',Buffer,Tamanho);
      F := PFFI(Buffer);

      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)] );
    end;
    StrDispose(Data);
  end;

  StrDispose(Parquivo);
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

procedure TfPrincipal.pnlClienteClick(Sender: TObject);
begin
  Cadastros2.Click;
end;

procedure TfPrincipal.pnlSairClick(Sender: TObject);
begin
  FecharSistema();
end;

procedure TfPrincipal.pnlVendaClick(Sender: TObject);
begin
  Venda1.Click;
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
  FecharSistema();
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

procedure TfPrincipal.Venda1Click(Sender: TObject);
begin
  if not Assigned(fVenda) then
    fVenda := TfVenda.Create(fPrincipal)
  else
    fVenda.Show;
end;

end.
