unit FrmPesqProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, System.Actions,
  Vcl.ActnList, uProduto;

type
  TfPesProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edCodigo: TEdit;
    Label5: TLabel;
    Shape1: TShape;
    pnlBotoes: TPanel;
    Panel9: TPanel;
    Shape5: TShape;
    SpeedButton4: TSpeedButton;
    Panel3: TPanel;
    lblDescricao: TLabel;
    lblValor: TLabel;
    ActionList1: TActionList;
    acSair: TAction;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    Produto: TProduto;
    procedure PreencheInfo(temProd: Boolean);
  public
    { Public declarations }
  end;

var
  fPesProd: TfPesProd;

implementation

uses
  FrmPrincipal;

{$R *.dfm}

procedure TfPesProd.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfPesProd.FormCreate(Sender: TObject);
begin
  Produto := TProduto.Create;
end;

procedure TfPesProd.edCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    Produto.Ativo := 'S';
    PreencheInfo(Produto.Pesquisar(StrToIntDef(edCodigo.Text, 0)));
  end;
end;

procedure TfPesProd.PreencheInfo(temProd: Boolean);
begin
  edCodigo.SetFocus;

  if temProd then
  begin
    lblDescricao.Caption := Produto.ID.ToString +' - '+ Produto.descricao;
    lblValor.Caption     := FormatFloat('R$ ###,##0.00', Produto.PrecoVenda);
    Exit;
  end;

  lblDescricao.Caption := 'Descrição';
  lblValor.Caption     := 'R$ 0,00';
end;

procedure TfPesProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Produto);

  Action   := caFree;
  fPesProd := nil;
end;

end.
