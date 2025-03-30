unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZDataset, ZAbstractDataset, ZSqlUpdate, Vcl.Forms,
  Winapi.Windows, System.UITypes, ZAbstractTable, System.IniFiles;

type
  TDM = class(TDataModule)
    zCon: TZConnection;
    qPesq: TZQuery;
    dPesq: TDataSource;
    qExecSQL: TZQuery;
    qParametro: TZTable;
    qParametroUsa_comanda: TZUnicodeStringField;
    qParametroUsa_PDV: TZUnicodeStringField;
    qParametroidCliente: TZInt64Field;
    procedure qClientedtnascSetText(Sender: TField; const Text: string);
    procedure qFuncionariodtnascSetText(Sender: TField; const Text: string);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CriaArquivoIni;
    procedure ConfiguraConexao(AConexao: TZConnection);
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
  for I := 0 to ComponentCount -1 do
    if Components[I].ClassName = 'TZConnection' then
    begin
      ConfiguraConexao(TZConnection(Components[I]));
      Break;
    end;

  try
    DM.zCon.Connect;

    for I := 0 to ComponentCount - 1 do
      if Components[i].ClassName = 'TZTable' then
        (Components[i] as TZTable).Open;
  except
    on E: Exception do
    begin
      CriaArquivoIni();
      Application.MessageBox(PChar('Nao foi possivel conectar ao banco de dados'#13+E.Message + Self.Name), 'Atenção', 16);
      Halt;
    end;
  end;
end;

procedure TDM.ConfiguraConexao(AConexao: TZConnection);
var
  Config: TIniFile;
begin
  DM.zCon.LibraryLocation := ExtractFilePath(Application.ExeName) + 'libmariadb.dll';

  Config := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    AConexao.HostName := Config.ReadString('Conexao', 'hostName', 'localhost');
    AConexao.Port     := Config.ReadInteger('Conexao', 'port', 3306);
    AConexao.User     := Config.ReadString('Conexao', 'user', 'root');
    AConexao.Password := Config.ReadString('Conexao', 'password', '123456');
    AConexao.Database := Config.ReadString('Conexao', 'database', '');
  finally
    Config.Free;
  end;
end;

procedure TDM.CriaArquivoIni;
var
  Config: TIniFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'Config.ini') then
    Exit;

  Config := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  try
    Config.WriteString('Conexao', 'hostName', 'localhost');
    Config.WriteString('Conexao', 'port', '3306');
    Config.WriteString('Conexao', 'user', 'root');
    Config.WriteString('Conexao', 'password', '123456');
    Config.WriteString('Conexao', 'database', '');
  finally
    Config.Free;
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
