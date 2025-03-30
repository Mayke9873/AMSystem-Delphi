unit uValida;

interface

uses
  Data.DB, Vcl.Forms, System.UITypes, Winapi.Windows, System.SysUtils,   Vcl.DBGrids, Vcl.Controls;

type
  TValidacoes = class
    const
      DecimalSeparator = ',';
  public
    function ValidaData(Sender : TField; Text : String): Boolean;
    function ValidaValor(Sender : TField; Text : String) : Boolean;
    procedure SomenteNumero(var key: char);
    procedure SomenteNumeroInteiro(var key: char);

    class function ValidaDocumento(sDocumento: string): Boolean;

  end;

  procedure PosicionaGrid(grid: TDBGrid; campo: TWinControl);

implementation

uses
  System.Math;

{ TValida }

function TValidacoes.ValidaData(Sender: TField; Text: String): Boolean;
begin
  Result := false;
  if (Text = '  /  /  ') or (Text = '  /  /    ') then
  begin
    Sender.Clear;
    Result := true;
  end
  else
  begin
    try
      Sender.AsString := Text;
      Result := true;
    except
      Application.MessageBox('Data inválida. Por favor, verifique!', 'AmSystem', MB_OK + MB_ICONWARNING);
      if Screen.Cursor = crHourGlass then
      begin
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

class function TValidacoes.ValidaDocumento(sDocumento: string): Boolean;

  function InverteDocumento(sDocumento: String): String;
  var
    I: Integer;
  begin
    for I := sDocumento.Length downto 1 do
      Result := Result + sDocumento[I];
  end;

  function DigitoVerificador(sDocumento: String): String;
  var
    I, nSoma, nMultiplicador, Mult: Integer;
  begin
    if sDocumento.Length = 11 then
      Exit(sDocumento);

    if sDocumento.Length = 14 then
      Exit(InverteDocumento(sDocumento));

    nSoma := 0;
    Mult := 2;

    for I := 1 to sDocumento.Length do
    begin
      if sDocumento.Length > 11 then
      begin
        nMultiplicador := I + 1;

        if nMultiplicador > 9 then
        begin
          nMultiplicador := Mult;
          Inc(Mult);
        end;
      end
      else
        nMultiplicador := (sDocumento.Length + 2 - I);

      nSoma := nSoma + (StrToInt(sDocumento[I]) * nMultiplicador);
    end;

    nSoma := 11 - (nSoma mod 11);

    if sDocumento.Length > 11 then
      sDocumento := IntToStr(IfThen(nSoma >= 10, 0, nSoma)) + sDocumento

    else
      sDocumento := sDocumento + IntToStr(IfThen(nSoma >= 10, 0, nSoma));

    Result := DigitoVerificador(sDocumento);
  end;

var
  I: Integer;
  sDocValidado: String;
begin
  sDocValidado := '';

  sDocumento := StringReplace(sDocumento, '-', '', [rfReplaceAll]);
  sDocumento := StringReplace(sDocumento, '.', '', [rfReplaceAll]);
  sDocumento := StringReplace(sDocumento, '/', '', [rfReplaceAll]);

  for I := 1 to sDocumento.Length - 2 do
    sDocValidado := sDocValidado + sDocumento[I];

  if sDocumento.Length > 11 then
    sDocValidado := InverteDocumento(sDocValidado);

  sDocValidado := DigitoVerificador(sDocValidado);

  Result := sDocValidado.Equals(sDocumento);
end;

function TValidacoes.ValidaValor(Sender: TField; Text: String): Boolean;
begin
  Result := false;
  if (Text = '') then
  begin
    Sender.Clear;
    Result := true;
  end
  else
  begin
    try
      Sender.asString := Text;
      Result := true;
    except
      Application.MessageBox('Valor inválido. Por favor, verifique!','AmSystem', MB_OK + MB_ICONWARNING);
      if Screen.Cursor = crHourGlass then
      begin
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TValidacoes.SomenteNumero(var key: char);
begin
  if not CharInSet(key, ['0'..'9', #8, #13, DecimalSeparator]) then
    key:=#0;
end;

procedure TValidacoes.SomenteNumeroInteiro(var key: char);
begin
  if not CharInSet(key, ['0'..'9', #8, #13]) then
   key:=#0;
end;

procedure PosicionaGrid(grid: TDBGrid; campo: TWinControl);
begin
  grid.Left := campo.Left;
  grid.Top  := campo.Top + campo.Height;
  grid.BringToFront;
end;

end.
