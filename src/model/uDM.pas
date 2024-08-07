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
    qParametro: TZTable;
    qParametroidCliente: TZIntegerField;
    qParametroUsa_comanda: TZUnicodeStringField;
    qParametroUsa_PDV: TZUnicodeStringField;
    procedure qClientedtnascSetText(Sender: TField; const Text: string);
    procedure qFuncionariodtnascSetText(Sender: TField; const Text: string);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TDM.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  DM.zCon.LibraryLocation := ExtractFilePath(Application.ExeName) + 'libmariadb.dll';
  try
    DM.zCon.Connect;

    for I := 0 to ComponentCount - 1 do
      if Components[i].ClassName = 'TZTable' then
        (Components[i] as TZTable).Open;

  except
    Application.MessageBox('Nao foi possivel conectar ao banco de dados', 'Atenção', 16);
    Halt;
  end;
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
