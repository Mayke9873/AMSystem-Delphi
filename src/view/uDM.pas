unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, ZSqlUpdate, Vcl.Forms,
  Winapi.Windows, System.UITypes;

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
    qExecSQL: TZQuery;
    uVenda: TZUpdateSQL;
    qVenda: TZQuery;
    qVendaid: TIntegerField;
    qProduto: TZQuery;
    dProduto: TDataSource;
    uProduto: TZUpdateSQL;
    qProdutoid: TIntegerField;
    qProdutodescricao: TWideStringField;
    qProdutoestoque: TFloatField;
    qProdutounidade: TWideStringField;
    qProdutopCompra: TFloatField;
    qProdutopLucro: TFloatField;
    qProdutopVenda: TFloatField;
    qProdutoIdGrupo: TIntegerField;
    qProdutogrupo: TWideStringField;
    qProdutodtRegistro: TDateField;
    qProdutoativo: TWideStringField;
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
    procedure qClienteNewRecord(DataSet: TDataSet);
    procedure qClientedtnascSetText(Sender: TField; const Text: string);
    procedure qFuncionarioNewRecord(DataSet: TDataSet);
    procedure qFuncionariodtnascSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  procedure ExecSQL(SQL : String);
implementation

uses
  uValida;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure ExecSQL(SQL: String);
begin
  DM.qExecSQL.Close;
  DM.qExecSQL.SQL.Clear;
  DM.qExecSQL.SQL.Add(SQL);
  DM.qExecSQL.ExecSQL;
  DM.qExecSQL.ApplyUpdates;
end;

procedure TDM.qClientedtnascSetText(Sender: TField; const Text: string);
var
  Valida : TValidacoes;
begin
  Valida := TValidacoes.Create;
  try
    if not Valida.ValidaData(Sender, Text) then
      Abort;
  finally
    Valida.Free;
  end;
end;

procedure TDM.qClienteNewRecord(DataSet: TDataSet);
begin
  qClienteativo.AsString := 'S';
  qClientetipo.AsString := 'F';
end;

procedure TDM.qFuncionariodtnascSetText(Sender: TField; const Text: string);
var
  Valida : TValidacoes;
begin
    Valida := TValidacoes.Create;
  try
    if not Valida.ValidaData(Sender, Text) then
      Abort;
  finally
    Valida.Free;
  end;
end;

procedure TDM.qFuncionarioNewRecord(DataSet: TDataSet);
begin
  qFuncionarioAtivo.AsString := 'S';
end;

end.
