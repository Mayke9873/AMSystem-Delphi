unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, ZSqlUpdate;

type
  TDM = class(TDataModule)
    zCon: TZConnection;
    qPesq: TZQuery;
    dPesq: TDataSource;
    qCliente: TZQuery;
    dCliente: TDataSource;
    uCliente: TZUpdateSQL;
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
    procedure qClienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.qClienteNewRecord(DataSet: TDataSet);
begin
  qClienteativo.AsString := 'S';
  qClientetipo.AsString := 'F';
end;

end.
