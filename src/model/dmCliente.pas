unit dmCliente;

interface

uses
  System.SysUtils, System.Classes, uDM, ZSqlUpdate, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TdmClientes = class(TDM)
    qCliente: TZQuery;
    qClienteId: TIntegerField;
    qClienteNome: TWideStringField;
    qClienteRG: TWideStringField;
    qClienteCpfCnpj: TWideStringField;
    qClientedtnasc: TDateField;
    qClienteEndereco: TWideStringField;
    qClientenumendereco: TWideStringField;
    qClienteBairro: TWideStringField;
    qClientedtregistro: TDateField;
    qClienteTipo: TWideStringField;
    qClienteAtivo: TWideStringField;
    dCliente: TDataSource;
    uCliente: TZUpdateSQL;
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

end.
