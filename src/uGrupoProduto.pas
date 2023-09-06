unit uGrupoProduto;

interface

uses uGrupo, dmProduto;

type
  TGrupoProduto = class(TGrupos)     
    procedure Cadastrar;
    function Pesquisar(pDescricao: String): Boolean;
  end;

implementation

{ TGrupoProduto }

procedure TGrupoProduto.Cadastrar;
begin

end;

function TGrupoProduto.Pesquisar(pDescricao: String): Boolean;
begin
  Result := False;

  dmProdutos.qGrupo.Close;
//  dmProdutos.qGrupo.Params[0].AsInteger := 0;
//  dmProdutos.qGrupo.Params[1].AsString := '%' + pDescricao + '%';
//  dmProdutos.qGrupo.Params[2].AsString := Ativo;
  dmProdutos.qGrupo.Open;

  if dmProdutos.qGrupo.RecordCount = 1 then
  begin
    Result := True;
    ID := dmProdutos.qGrupoId.AsInteger;
    Descricao := dmProdutos.qGrupoDescricao.AsString;
    Exit;
  end;

  ID := 0;
  Descricao := '';
end;

end.
