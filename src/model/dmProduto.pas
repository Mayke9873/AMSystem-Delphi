unit dmProduto;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection;

type
  TdmProdutos = class(TDM)
    qProduto: TZQuery;
    qProdutoid: TIntegerField;
    qProdutodescricao: TWideStringField;
    qProdutoestoque: TFloatField;
    qProdutounidade: TWideStringField;
    qProdutopCompra: TFloatField;
    qProdutopLucro: TFloatField;
    qProdutopVenda: TFloatField;
    qProdutoIdGrupo: TIntegerField;
    qProdutogrupo: TWideStringField;
    qProdutodtRegistro: TDateField;
    qProdutoativo: TWideStringField;
    dProduto: TDataSource;
    uProduto: TZUpdateSQL;
    qMovEstoque: TZQuery;
    qMovEstoqueid: TIntegerField;
    qMovEstoqueidproduto: TIntegerField;
    qMovEstoquequantidade: TFloatField;
    qMovEstoquedataMov: TDateField;
    qMovEstoqueidUsuario: TSmallintField;
    qMovEstoqueidFornecedor: TSmallintField;
    qMovEstoquetipoMov: TWideStringField;
    qMovEstoqueobs: TWideStringField;
    uMovEstoque: TZUpdateSQL;
    dGrupo: TDataSource;
    qGrupo: TZQuery;
    qGrupoid: TIntegerField;
    qGrupodescricao: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProdutos: TdmProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
