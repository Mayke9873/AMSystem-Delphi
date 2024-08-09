unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.Win.TaskbarCore, Vcl.Taskbar, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, Vcl.Menus, Threading, IPPeerClient,
  IPPeerServer, System.Tether.Manager, Vcl.OleCtrls, SHDocVw, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, uValida, Skia, Vcl.Skia, ZDataset, uComanda,
  System.Generics.Collections, Vcl.StdCtrls, uForms, System.Classes;

type
  TfPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Funcionarios1: TMenuItem;
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
    tmComanda: TTimer;
    pnlComandas: TPanel;
    Contas1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Venda1Click(Sender: TObject);
    procedure ConsultadeVendas1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure FecharSistema;
    procedure Fornecedores1Click(Sender: TObject);
    procedure AjustedeEstoque1Click(Sender: TObject);
    procedure Compra1Click(Sender: TObject);
    procedure pnlClienteClick(Sender: TObject);
    procedure pnlSairClick(Sender: TObject);
    procedure pnlVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ConsultadeCompras1Click(Sender: TObject);
    procedure tmComandaTimer(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
  private
    { Private declarations }
    function VersaoExe: string;
    procedure Comandas(Sender: TObject);
    procedure ClickComandas(Sender: TObject);

  public
    comanda: TComanda;
  end;

var
  fPrincipal: TfPrincipal;
  Forms: TForms;

implementation

uses
  FrmCliente, uVenda, FrmConsultaVenda, FrmProduto, FrmGrupoProduto,
  FrmFuncionario, FrmVenda, FrmFornecedor, FrmAjusteEstoque, FrmCompra,
  FrmConsultaCompra, uFrame.Comanda, FrmPDV, uDM, FrmConta;

{$R *.dfm}

procedure TfPrincipal.AjustedeEstoque1Click(Sender: TObject);
begin
  Forms.CriaForm(fAjusteEstoque, TfAjusteEstoque);
end;

procedure TfPrincipal.Clientes1Click(Sender: TObject);
begin
  Forms.CriaForm(fCliente, TfCliente);
end;

procedure TfPrincipal.Compra1Click(Sender: TObject);
begin
  Forms.CriaForm(fCompra, TfCompra);
end;

procedure TfPrincipal.ConsultadeCompras1Click(Sender: TObject);
begin
  Forms.CriaForm(fConsultaCompras, TfConsultaCompras);
end;

procedure TfPrincipal.ConsultadeVendas1Click(Sender: TObject);
begin
  Forms.CriaForm(fConsultaVendas, TfConsultaVendas);
end;

procedure TfPrincipal.Contas1Click(Sender: TObject);
begin
  Forms.CriaForm(fConta, TfConta);
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
    FreeAndNil(Forms);
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
  Forms := TForms.Create;

  if (DM.qParametroUsa_comanda.AsString = 'S') then
  begin
    pnlComandas.Visible := True;
    Comandas(Application);
  end;
end;

function TfPrincipal.VersaoExe: string;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: string;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);

      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;

  StrDispose(Parquivo);
end;

procedure TfPrincipal.Fornecedores1Click(Sender: TObject);
begin
  Forms.CriaForm(fFornecedor, TfFornecedor);
end;

procedure TfPrincipal.Grupos1Click(Sender: TObject);
begin
  Forms.CriaForm(fGrupoProd, TfGrupoProd);
end;

procedure TfPrincipal.pnlClienteClick(Sender: TObject);
begin
  Clientes1.Click;
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
  Forms.CriaForm(fProduto, TfProduto);
end;

procedure TfPrincipal.Funcionarios1Click(Sender: TObject);
begin
  Forms.CriaForm(fFuncionario, TfFuncionario);
end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  FecharSistema();
end;

procedure TfPrincipal.tmComandaTimer(Sender: TObject);
begin
  tmComanda.Enabled := False;
  Comandas(Sender);
end;

procedure TfPrincipal.Comandas(Sender: TObject);
var
  LFrame: TFrameComanda;
  left, top, I: Integer;
  LComandas: TComanda;
  AComandas: TObjectList<TComanda>;
  PositionScroll: Integer;
begin
  left := 1;
  top := 2;

  LComandas := TComanda.Create;
  try
    LComandas.em_Uso := 'N';
    AComandas := LComandas.ListaComandas;
    for I := 0 to AComandas.Count - 1 do
      FindComponent('CMD' + AComandas[I].id.ToString).Free;

    LComandas.em_Uso := 'S';
    AComandas := LComandas.ListaComandas;      //Cria frames de todas as comandas em aberto.
    for I := 0 to AComandas.Count - 1 do
    begin
      if AComandas[I].valTotal = 0 then
        FindComponent('CMD' + AComandas[I].id.ToString).Free
      else
      begin
        if (FindComponent('CMD' + AComandas[I].id.ToString) = nil) then
        begin
          LFrame                  := TFrameComanda.Create(Self);
          LFrame.Name             := 'CMD' + AComandas[I].id.ToString;
          LFrame.Parent           := pnlComandas;
          LFrame.pnlFrame.OnClick := ClickComandas;
          LFrame.lNome.OnClick    := ClickComandas;
          LFrame.lValor.OnClick   := ClickComandas;
          LFrame.lNumeroComanda.OnClick := ClickComandas;
          LFrame.lNumeroComanda.Caption := AComandas[I].comanda.ToString;
          LFrame.pnlFrame.Tag           := AComandas[I].comanda;
          LFrame.lValor.Tag             := AComandas[I].comanda;
          LFrame.lNumeroComanda.Tag     := AComandas[I].comanda;
          LFrame.lNome.Tag              := AComandas[I].comanda;
        end
        else
          LFrame := TFrameComanda(FindComponent('CMD' + AComandas[I].id.ToString));

        LFrame.lNome.Caption := AComandas[I].nome;
        LFrame.lNome.Visible := not (Trim(AComandas[I].nome) = '');

        LFrame.lValor.Caption := FormatCurr('#0.00', AComandas[I].valTotal);
        LFrame.pnlFrame.Hint := 'CMD ' + (AComandas[I].nome);

        LFrame.Left := left;
        LFrame.Top := top;

        if AComandas[I].em_Caixa = 'S' then
          LFrame.spColor.Brush.Color := $565fe2
        else
          LFrame.spColor.Brush.Color := clSkyBlue;

        left := left + LFrame.Width + 2;
        if left + LFrame.Width >= pnlComandas.Width then
        begin
          left := 1;
          top := top + LFrame.Height + 2;
        end;
      end;
    end;

  finally
    pnlComandas.Refresh;
    LComandas.Free;
    tmComanda.Enabled := True;
  end;
end;

procedure TfPrincipal.ClickComandas(Sender: TObject);
begin
  comanda := TComanda.Create;
  try
    comanda.id := TFrameComanda(Sender).Tag;
    Venda1.Click;
  finally
    FreeAndNil(comanda);
  end;
end;

procedure TfPrincipal.Venda1Click(Sender: TObject);
begin
  if (DM.qParametroUsa_PDV.AsString = 'S') then
    Forms.CriaForm(fPDV, TfPDV)
  else
    Forms.CriaForm(fVenda, TfVenda);
end;

end.

