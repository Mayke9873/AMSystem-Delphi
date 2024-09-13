unit dmFinanceiro;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZAbstractRODataset, ZAbstractTable, ZDataset, ZAbstractDataset, ZAbstractConnection,
  ZConnection;

type
  TdmFinanceiros = class(TDM)
    qConta: TZQuery;
    dConta: TDataSource;
    qContaidConta: TZInt64Field;
    qContadescricao: TZUnicodeStringField;
    qContabancaria: TZShortIntField;
    qContaex: TZInt64Field;
    qContaBanc: TZUnicodeStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinanceiros: TdmFinanceiros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
