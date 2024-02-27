unit dmVenda;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Datasnap.DBClient, ZAbstractTable;

type
  TdmVendas = class(TDM)
    qVenda: TZQuery;
    qVendaid: TIntegerField;
    uVenda: TZUpdateSQL;
    qConsVendas: TZReadOnlyQuery;
    qConsVendasID: TIntegerField;
    qConsVendasCLIENTE: TWideStringField;
    qConsVendasVALOR: TZBCDField;
    qConsVendasDESCONTO: TZBCDField;
    qConsVendasVALOR_TOTAL: TZBCDField;
    qConsVendasDATA_VENDA: TZDateField;
    qConsVendasNOME: TWideStringField;
    qVenda_comanda: TZQuery;
    IntegerField1: TIntegerField;
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
    qProdVendaid: TIntegerField;
    qProdVendaidprod: TIntegerField;
    qProdVendaquantidade: TZBCDField;
    qProdVendadescricao: TWideStringField;
    qProdVendadesconto: TZBCDField;
    qProdVendatotal: TZBCDField;
    qProdVendavalor: TZBCDField;
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
