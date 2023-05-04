unit uPessoas;

interface

type
  TPessoas = class
    private
      FCod         : Integer;
      FNome        : String;
      FRGIE        : String;
      FCPFCNPJ     : String;
      FEndereco    : String;
      FNumEndereco : String;
      FBairro: String;
      FAtivo : string;
      procedure setCod(const Value: Integer);
      procedure SetNome(const Value: String);
      procedure SetAtivo(const Value: String);
      procedure SetBairro(const Value: String);
      procedure SetCPFCNPJ(const Value: String);
      procedure SetEndereco(const Value: String);
      procedure SetNumEndereco(const Value: String);
      procedure SetRGIE(const Value: String);
    public
      property Cod : Integer read FCod write SetCod;
      property Nome : String read FNome write SetNome;
      property RGIE : String read FRGIE write SetRGIE;
      property CPFCNPJ : String read FCPFCNPJ write SetCPFCNPJ;
      property Endereco : String read FEndereco write SetEndereco;
      property NumEndereco : String read FNumEndereco write SetNumEndereco;
      property Bairro : String read FBairro write SetBairro;
      property Ativo : String read FAtivo write SetAtivo;
      function Tipo : String; virtual; abstract;
  end;

var
  Pessoas : TPessoas;

implementation


{ TPessoas }

procedure TPessoas.SetAtivo(const Value: String);
begin
  FAtivo := Value;
end;

procedure TPessoas.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TPessoas.SetCod(const Value: Integer);
begin
  FCod := Value;
end;

procedure TPessoas.SetCPFCNPJ(const Value: String);
begin
  FCPFCNPJ := Value;
end;

procedure TPessoas.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoas.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoas.SetNumEndereco(const Value: String);
begin
  FNumEndereco := Value;
end;

procedure TPessoas.SetRGIE(const Value: String);
begin
  FRGIE := Value;
end;

end.
