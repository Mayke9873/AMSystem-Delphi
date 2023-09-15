unit uGrupoProduto;

interface

uses uGrupo, dmProduto, Vcl.Forms, Winapi.Windows, dmGrupo, System.SysUtils;

type
  TGrupoProduto = class(TGrupos)
  public
    procedure Cadastrar;
    function Pesquisar(pId: String = ''; pDescricao: String = ''): Boolean;
  end;

implementation

{ TGrupoProduto }

procedure TGrupoProduto.Cadastrar;
begin
  if Length(Descricao) <> 0 then
  begin
    dmGrupos.qGrupoID.AsInteger := dmProdutos.qGrupoID.AsInteger;
    dmGrupos.qGrupoDescricao.asString := Descricao;
    dmGrupos.qGrupoAtivo.AsString := Ativo;

    dmGrupos.qGrupo.Post;
    dmGrupos.qGrupo.Refresh;
    dmGrupos.qGrupo.Last;
  end
  else
  begin
    dmGrupos.qGrupo.Cancel;
    Application.MessageBox('Campo descrição obrigatório. Por favor, verifique!', 'Atenção', MB_ICONEXCLAMATION);
  end;
end;

function TGrupoProduto.Pesquisar(pId: String = ''; pDescricao: String = ''): Boolean;
begin
  Result := False;

  dmGrupos.qGrupo.Close;
  dmGrupos.qGrupo.Params[0].AsInteger := StrToIntDef(pId, 0);
  dmGrupos.qGrupo.Params[1].AsString := '%' + pDescricao + '%';
  dmGrupos.qGrupo.Params[2].AsString := Ativo;
  dmGrupos.qGrupo.Open;

  if dmGrupos.qGrupo.RecordCount = 1 then
  begin
    Result := True;
    ID := dmGrupos.qGrupoId.AsInteger;
    Descricao := dmGrupos.qGrupoDescricao.AsString;
    Exit;
  end;

  ID := 0;
  Descricao := '';
end;

end.
