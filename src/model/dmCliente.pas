unit dmCliente;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZAbstractTable;

type
  TdmClientes = class(TDM)
    qCliente: TZQuery;
    dCliente: TDataSource;
    uCliente: TZUpdateSQL;
    qClienteId: TZInt64Field;
    qClienteNome: TZUnicodeStringField;
    qClienteRG: TZUnicodeStringField;
    qClienteCpfCnpj: TZUnicodeStringField;
    qClientedtnasc: TZDateField;
    qClienteEndereco: TZUnicodeStringField;
    qClientenumendereco: TZUnicodeStringField;
    qClienteBairro: TZUnicodeStringField;
    qClientedtregistro: TZDateField;
    qClienteTipo: TZUnicodeStringField;
    qClienteAtivo: TZUnicodeStringField;
    procedure qClienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmClientes.qClienteNewRecord(DataSet: TDataSet);
begin
  inherited;
  qClienteAtivo.AsString := 'S';
  qClienteTipo.AsString  := 'F';
  qClienteDtRegistro.AsDateTime := Now;
end;

end.
