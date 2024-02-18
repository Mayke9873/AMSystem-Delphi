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
    qFuncionarioId: TIntegerField;
    qFuncionarioNome: TWideStringField;
    qFuncionarioRG: TWideStringField;
    qFuncionarioCpf: TWideStringField;
    qFuncionariodtnasc: TDateField;
    qFuncionarioEndereco: TWideStringField;
    qFuncionarionumendereco: TWideStringField;
    qFuncionarioBairro: TWideStringField;
    qFuncionariodtregistro: TDateField;
    qFuncionarioAtivo: TWideStringField;
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
