program AmSystem;

uses
  Vcl.Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uVenda in 'uVenda.pas' {fVenda},
  uConsultaVenda in 'uConsultaVenda.pas' {fConsultaVendas},
  uProduto in 'uProduto.pas' {fProduto},
  uGrupoProduto in 'uGrupoProduto.pas' {fGrupoProd},
  uFuncionario in 'uFuncionario.pas' {fFuncionario},
  uCliente in 'uCliente.pas' {fCliente},
  uPessoas in 'uPessoas.pas',
  uClientes in 'uClientes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
