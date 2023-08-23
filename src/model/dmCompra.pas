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
