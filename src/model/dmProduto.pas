unit dmProduto;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, ZAbstractTable;

type
  TdmProdutos = class(TDM)
    qProduto: TZQuery;
    dProduto: TDataSource;
    uProduto: TZUpdateSQL;
    qMovEstoque: TZQuery;
    uMovEstoque: TZUpdateSQL;
    dGrupo: TDataSource;
    qGrupo: TZQuery;
    qConsProdutos: TZReadOnlyQuery;
    qConsProdutosid: TZInt64Field;
    qConsProdutosdescricao: TZUnicodeStringField;
    qConsProdutosestoque: TZDoubleField;
    qConsProdutosunidade: TZUnicodeStringField;
    qConsProdutospCompra: TZBCDField;
    qConsProdutospLucro: TZBCDField;
    qConsProdutospVenda: TZBCDField;
    qConsProdutosIdGrupo: TZInt64Field;
    qConsProdutosgrupo: TZUnicodeStringField;
    qConsProdutosdtRegistro: TZDateField;
    qConsProdutosativo: TZUnicodeStringField;
    qConsProdutostotCompra: TZDoubleField;
    qConsProdutostotVenda: TZDoubleField;
    qProdutoid: TZInt64Field;
    qProdutodescricao: TZUnicodeStringField;
    qProdutoestoque: TZDoubleField;
    qProdutounidade: TZUnicodeStringField;
    qProdutopCompra: TZBCDField;
    qProdutopLucro: TZBCDField;
    qProdutopVenda: TZBCDField;
    qProdutoIdGrupo: TZInt64Field;
    qProdutogrupo: TZUnicodeStringField;
    qProdutodtRegistro: TZDateField;
    qProdutoativo: TZUnicodeStringField;
    qMovEstoqueid: TZInt64Field;
    qMovEstoqueidproduto: TZInt64Field;
    qMovEstoquequantidade: TZDoubleField;
    qMovEstoquedataMov: TZDateField;
    qMovEstoqueidUsuario: TZInt64Field;
    qMovEstoqueidFornecedor: TZInt64Field;
    qMovEstoquetipoMov: TZUnicodeStringField;
    qMovEstoqueidMovimentacao: TZIntegerField;
    qMovEstoqueobs: TZUnicodeStringField;
    qGrupoid: TZInt64Field;
    qGrupodescricao: TZUnicodeStringField;
    procedure qProdutoNewRecord(DataSet: TDataSet);
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

procedure TdmProdutos.qProdutoNewRecord(DataSet: TDataSet);
begin
  qProdutoativo.AsString := 'S';
end;

end.
