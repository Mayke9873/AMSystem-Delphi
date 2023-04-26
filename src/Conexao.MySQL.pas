unit Conexao.MySQL;

interface

uses
  Interfaces;

type
  TConexaoMySQL = class(TInterfacedObject, IConexao)
    procedure Gravar;
  end;

implementation

{ TConexaoMySQL }

procedure TConexaoMySQL.Gravar;
var
  teste: string;
begin
  teste := 'Teste';
end;

end.
