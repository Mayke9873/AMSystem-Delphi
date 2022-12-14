unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.ComCtrls, Vcl.ToolWin,System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TfPrincipal = class(TForm)
    ToolBar1: TToolBar;
    tbCliente: TToolButton;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Produtos1: TMenuItem;
    Produtos2: TMenuItem;
    Grupos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    tbSair: TToolButton;
    Movimento1: TMenuItem;
    Venda1: TMenuItem;
    ConsultadeVendas1: TMenuItem;
    procedure Cadastros2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbClienteClick(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ConsultadeVendas1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

  uses
     uCliente, uVenda, uConsultaVenda, uProduto;

{$R *.dfm}

procedure TfPrincipal.Cadastros2Click(Sender: TObject);
begin
  fCliente := TfCliente.Create(fPrincipal);
end;

procedure TfPrincipal.ConsultadeVendas1Click(Sender: TObject);
begin
  fConsultaVendas := TfConsultaVendas.Create(fPrincipal);
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {if MDIChildCount > 0 then
  begin
    ShowMessage('N�o � possivel sair do sistema');
    Abort;
  end;    }
end;

procedure TfPrincipal.Produtos1Click(Sender: TObject);
begin
  fProduto := TfProduto.Create(fPrincipal);
end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  tbSairClick(tbSair);
end;

procedure TfPrincipal.tbClienteClick(Sender: TObject);
begin
  fCliente := TfCliente.Create(fPrincipal);
end;

procedure TfPrincipal.tbSairClick(Sender: TObject);
begin
{  if MDIChildCount > 0 then
  begin
    ShowMessage('Não é possivel fechar o sistema!');
  end
  else
  begin
    Application.Terminate;
  end; }
      Application.Terminate;
end;

procedure TfPrincipal.ToolButton1Click(Sender: TObject);
begin
  Venda1Click(Venda1);
end;

procedure TfPrincipal.Venda1Click(Sender: TObject);
begin
  fVenda := TfVenda.Create(fPrincipal);
end;

end.
