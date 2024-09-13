unit dmFuncionario;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZAbstractTable;

type
  TdmFuncionarios = class(TDM)
    dFuncionario: TDataSource;
    uFuncionario: TZUpdateSQL;
    qFuncionario: TZQuery;
    qFuncionarioId: TZInt64Field;
    qFuncionarioNome: TZUnicodeStringField;
    qFuncionarioRG: TZUnicodeStringField;
    qFuncionarioCpf: TZUnicodeStringField;
    qFuncionariodtnasc: TZDateField;
    qFuncionarioEndereco: TZUnicodeStringField;
    qFuncionarionumendereco: TZUnicodeStringField;
    qFuncionarioBairro: TZUnicodeStringField;
    qFuncionariodtregistro: TZDateField;
    qFuncionarioAtivo: TZUnicodeStringField;
    procedure qFuncionarioNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFuncionarios: TdmFuncionarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmFuncionarios.qFuncionarioNewRecord(DataSet: TDataSet);
begin
//  inherited;
  qFuncionarioAtivo.AsString := 'S';
end;

end.
