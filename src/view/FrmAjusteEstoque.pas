unit FrmAjusteEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Vcl.AppAnalytics, Vcl.Mask, Vcl.DBCtrls;

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
    chkEntrada: TRadioButton;
    chkSaida: TRadioButton;
    Label1: TLabel;
    EntradaSaida: TAction;
    Label2: TLabel;
    pnlDados: TPanel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Shape2: TShape;
    DBEdit2: TDBEdit;
    Panel10: TPanel;
    Shape9: TShape;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel8: TPanel;
    Panel11: TPanel;
    Shape5: TShape;
    DBEdit4: TDBEdit;
    Panel9: TPanel;
    Panel12: TPanel;
    Shape4: TShape;
    DBEdit3: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSairExecute(Sender: TObject);
    procedure acAjusteEstoqueExecute(Sender: TObject);
    procedure EntradaSaidaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAjusteEstoque: TfAjusteEstoque;

implementation

{$R *.dfm}

procedure TfAjusteEstoque.acAjusteEstoqueExecute(Sender: TObject);
begin
  ShowMessage('Ajuste de estoque', [tfVerificationFlagChecked]);
end;

procedure TfAjusteEstoque.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfAjusteEstoque.EntradaSaidaExecute(Sender: TObject);
begin
  if chkEntrada.Checked then
    chkSaida.Checked   := True
  else
    chkEntrada.Checked := True;

end;

procedure TfAjusteEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fAjusteEstoque := nil;
end;

procedure TfAjusteEstoque.FormCreate(Sender: TObject);
begin
  //
end;

end.
