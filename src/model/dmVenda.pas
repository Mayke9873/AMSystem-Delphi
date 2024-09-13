unit dmVenda;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Datasnap.DBClient, ZAbstractTable;

type
  TdmVendas = class(TDM)
    qVenda: TZQuery;
    uVenda: TZUpdateSQL;
    qConsVendas: TZReadOnlyQuery;
    qVenda_comanda: TZQuery;
    uVenda_comanda: TZUpdateSQL;
    CdsItens: TClientDataSet;
    CdsItenscodProduto: TIntegerField;
    CdsItensprodDescricao: TStringField;
    CdsItensprodQtd: TFloatField;
    CdsItensprodUnit: TCurrencyField;
    CdsItensprodTotal: TCurrencyField;
    CdsItensID: TIntegerField;
    dProdVenda: TDataSource;
    uProdVenda: TZUpdateSQL;
    qProdVenda: TZQuery;
    qVendaid: TZInt64Field;
    qConsVendasID: TZInt64Field;
    qConsVendasCLIENTE: TZUnicodeStringField;
    qConsVendasVALOR: TZBCDField;
    qConsVendasDESCONTO: TZBCDField;
    qConsVendasVALOR_TOTAL: TZBCDField;
    qConsVendasDATA_VENDA: TZDateField;
    qConsVendasNOME: TZUnicodeStringField;
    qVenda_comandaid: TZInt64Field;
    qProdVendaid: TZInt64Field;
    qProdVendaidVenda: TZInt64Field;
    qProdVendaidprod: TZInt64Field;
    qProdVendadescricao: TZUnicodeStringField;
    qProdVendavalor: TZBCDField;
    qProdVendadesconto: TZBCDField;
    qProdVendaquantidade: TZBCDField;
    qProdVendatotal: TZBCDField;
    qProdVendaex: TZIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmVendas: TdmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
