program AmSystem;

uses
  Vcl.Forms,
  uDM in 'src\model\uDM.pas' {DM: TDataModule},
  FrmPrincipal in 'src\view\FrmPrincipal.pas' {fPrincipal},
  FrmVenda in 'src\view\FrmVenda.pas' {fVenda},
  FrmConsultaVenda in 'src\view\FrmConsultaVenda.pas' {fConsultaVendas},
  FrmProduto in 'src\view\FrmProduto.pas' {fProduto},
  FrmGrupoProduto in 'src\view\FrmGrupoProduto.pas' {fGrupoProd},
  FrmFuncionario in 'src\view\FrmFuncionario.pas' {fFuncionario},
  FrmCliente in 'src\view\FrmCliente.pas' {fCliente},
  uPessoa in 'src\uPessoa.pas',
  uFornecedor in 'src\uFornecedor.pas',
  Conexao.MySQL in 'src\Conexao.MySQL.pas',
  Conexao.SQLServer in 'src\Conexao.SQLServer.pas',
  Interfaces in 'src\Interfaces.pas',
  uCliente in 'src\uCliente.pas',
  uValida in 'src\uValida.pas',
  uVenda in 'src\uVenda.pas',
  uProduto in 'src\uProduto.pas',
  uFuncionario in 'src\uFuncionario.pas',
  FrmFornecedor in 'src\view\FrmFornecedor.pas' {fFornecedor},
  Consts in 'Consts.pas',
  uEstoque in 'src\uEstoque.pas',
  FrmAjusteEstoque in 'src\view\FrmAjusteEstoque.pas' {fAjusteEstoque},
  dmProduto in 'src\model\dmProduto.pas' {dmProdutos: TDataModule},
  dmVenda in 'src\model\dmVenda.pas' {dmVendas: TDataModule},
  dmFuncionario in 'src\model\dmFuncionario.pas' {dmFuncionarios: TDataModule},
  dmFornecedor in 'src\model\dmFornecedor.pas' {dmFornecedores: TDataModule},
  dmCliente in 'src\model\dmCliente.pas' {dmClientes: TDataModule},
  FrmCompra in 'src\view\FrmCompra.pas' {fCompra},
  uCompra in 'src\uCompra.pas',
  dmCompra in 'src\model\dmCompra.pas' {dmCompras: TDataModule},
  uGrupoProduto in 'src\uGrupoProduto.pas',
  uGrupo in 'src\uGrupo.pas',
  dmGrupo in 'src\model\dmGrupo.pas' {dmGrupos: TDataModule},
  FrmRelVendas in 'src\view\FrmRelVendas.pas' {fRelVendas},
  uRelVendas in 'src\Reports\uRelVendas.pas' {fRelVendas_I},
  FrmConsultaCompra in 'src\view\FrmConsultaCompra.pas' {fConsultaCompra},
  uFrame.Comanda in 'src\Frames\uFrame.Comanda.pas' {FrameComanda: TFrame},
  uRelEstoque in 'src\Reports\uRelEstoque.pas' {fRelEstoque_I},
  FrmPDV in 'src\view\FrmPDV.pas' {fPDV},
  uComanda in 'src\uComanda.pas',
  uComanda.Itens in 'src\uComanda.Itens.pas',
  uVenda.Itens in 'src\uVenda.Itens.pas',
  uForms in 'src\uForms.pas',
  FrmPesqProduto in 'src\view\FrmPesqProduto.pas' {fPesProd},
  uFinanceiro.Movimento in 'src\uFinanceiro.Movimento.pas',
  uFinanceiro.Conta in 'src\uFinanceiro.Conta.pas',
  dmFinanceiro in 'src\model\dmFinanceiro.pas' {dmFinanceiros: TDataModule},
  FrmConta in 'src\view\FrmConta.pas' {fConta},
  uCompra.Itens in 'src\uCompra.Itens.pas',
  uValidacoes in 'src\utils\uValidacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmVendas, dmVendas);
  Application.CreateForm(TdmFuncionarios, dmFuncionarios);
  Application.CreateForm(TdmProdutos, dmProdutos);
  Application.CreateForm(TdmFornecedores, dmFornecedores);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmCompras, dmCompras);
  Application.CreateForm(TdmGrupos, dmGrupos);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
