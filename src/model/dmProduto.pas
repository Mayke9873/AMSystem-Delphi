unit dmProduto;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, ZAbstractTable;

type
  TdmProdutos = class(TDM)
    qProduto: TZQuery;
    qProdutoid: TIntegerField;
    qProdutodescricao: TWideStringField;
    qProdutoestoque: TFloatField;
    qProdutounidade: TWideStringField;
    qProdutopCompra: TZBCDField;
    qProdutopLucro: TZBCDField;
    qProdutopVenda: TZBCDField;
    qProdutoIdGrupo: TIntegerField;
    qProdutogrupo: TWideStringField;
    qProdutodtRegistro: TDateField;
    qProdutoativo: TWideStringField;
    dProduto: TDataSource;
    uProduto: TZUpdateSQL;
    qMovEstoque: TZQuery;
    qMovEstoqueid: TIntegerField;
    qMovEstoqueidproduto: TIntegerField;
    qMovEstoqueidUsuario: TZShortIntField;
    qMovEstoquedataMov: TDateField;
    qMovEstoquequantidade: TZDoubleField;
    qMovEstoqueidFornecedor: TZShortIntField;
    qMovEstoquetipoMov: TWideStringField;
    qMovEstoqueobs: TWideStringField;
    uMovEstoque: TZUpdateSQL;
    dGrupo: TDataSource;
    qGrupo: TZQuery;
    qGrupoid: TZInt64Field;
    qGrupodescricao: TWideStringField;
    qConsProdutos: TZReadOnlyQuery;
    qConsProdutosid: TZIntegerField;
    qConsProdutosdescricao: TZUnicodeStringField;
    qConsProdutosestoque: TZDoubleField;
    qConsProdutosunidade: TZUnicodeStringField;
    qConsProdutospCompra: TZBCDField;
    qConsProdutospLucro: TZBCDField;
    qConsProdutospVenda: TZBCDField;
    qConsProdutosIdGrupo: TZIntegerField;
    qConsProdutosgrupo: TZUnicodeStringField;
    qConsProdutosdtRegistro: TZDateField;
    qConsProdutosativo: TZUnicodeStringField;
    qConsProdutostotCompra: TZDoubleField;
    qConsProdutostotVenda: TZDoubleField;
    qMovEstoqueidMovimentacao: TZIntegerField;
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
