program AmSystem;

uses
  Vcl.Forms,
  uDM in 'src\view\uDM.pas' {DM: TDataModule},
  uPrincipal in 'src\view\uPrincipal.pas' {fPrincipal},
  uVenda in 'src\view\uVenda.pas' {fVenda},
  uConsultaVenda in 'src\view\uConsultaVenda.pas' {fConsultaVendas},
  uProduto in 'src\view\uProduto.pas' {fProduto},
  uGrupoProduto in 'src\view\uGrupoProduto.pas' {fGrupoProd},
  uFuncionario in 'src\view\uFuncionario.pas' {fFuncionario},
  uCliente in 'src\view\uCliente.pas' {fCliente},
  uPessoas in 'src\uPessoas.pas',
  uFornecedores in 'src\uFornecedores.pas',
  Conexao.MySQL in 'src\Conexao.MySQL.pas',
  Conexao.SQLServer in 'src\Conexao.SQLServer.pas',
  Interfaces in 'src\Interfaces.pas',
  uClientes in 'src\uClientes.pas',
  uValida in 'src\uValida.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
