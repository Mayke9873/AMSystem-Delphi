unit dmVenda;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TdmVendas = class(TDM)
    qVenda: TZQuery;
    qVendaid: TIntegerField;
    uVenda: TZUpdateSQL;
    qConsVendas: TZReadOnlyQuery;
    qConsVendasID: TIntegerField;
    qConsVendasCLIENTE: TWideStringField;
    qConsVendasVALOR: TFloatField;
    qConsVendasDESCONTO: TFloatField;
    qConsVendasVALOR_TOTAL: TFloatField;
    qConsVendasDATA_VENDA: TDateField;
    qConsVendasNOME: TWideStringField;
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
