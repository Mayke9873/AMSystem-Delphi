unit dmCompra;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TdmCompras = class(TDM)
    qCompra: TZQuery;
    uCompra: TZUpdateSQL;
    qCompraid: TIntegerField;
    qConsCompras: TZReadOnlyQuery;
    qConsComprasID: TZIntegerField;
    qConsComprasVALOR: TZBCDField;
    qConsComprasDESCONTO: TZBCDField;
    qConsComprasVALOR_TOTAL: TZBCDField;
    qConsComprasDATA_COMPRA: TZDateField;
    qConsComprasNOME: TZUnicodeStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCompras: TdmCompras;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
