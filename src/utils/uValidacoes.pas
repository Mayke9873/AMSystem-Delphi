unit uValidacoes;

interface

type
  TValidacoes = class
    class procedure ValidaValor(Sender: TObject; var Key: Char; QtdeVirgula: Integer = 0);
  end;

implementation

uses
  System.StrUtils, Vcl.StdCtrls;

{ TVAlidacoes }

class procedure TVAlidacoes.ValidaValor(Sender: TObject; var Key: Char; QtdeVirgula: Integer = 0);
begin
  if (QtdeVirgula = 0) and (Key in [',']) then
  begin
    Key := #0;
    Exit;
  end;

  if not (Key in ['0'..'9', #8, #13, ',']) or
         ((key = ',') and ContainsText(TEdit(Sender).Text, ',')) then
  begin
    Key := #0;
    Exit;
  end;
end;

end.
