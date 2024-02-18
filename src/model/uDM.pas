unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, ZSqlUpdate, Vcl.Forms,
  Winapi.Windows, System.UITypes, ZAbstractTable;

type
  TDM = class(TDataModule)
    zCon: TZConnection;
    qPesq: TZQuery;
    dPesq: TDataSource;
    qExecSQL: TZQuery;
    procedure qClientedtnascSetText(Sender: TField; const Text: string);
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

end.
