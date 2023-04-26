unit uValida;

interface

uses
  Data.DB, Vcl.Forms, System.UITypes, Winapi.Windows, System.SysUtils;

type
  TValidacoes = class
    const
      DecimalSeparator = ',';
  public
    function ValidaData(Sender : TField; Text : String): Boolean;
    function ValidaValor(Sender : TField; Text : String) : Boolean;
    procedure SomenteNumero(var key: char);
    procedure SomenteNumeroInteiro(var key: char);

  end;

implementation

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
      Application.MessageBox('Data inválida. Por favor, verifique!', 'Atenção', MB_OK + MB_ICONWARNING);
      if Screen.Cursor = crHourGlass then
      begin
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

function TValidacoes.ValidaValor(Sender: TField; Text: String): Boolean;
begin  Result := false;  if (Text = '') then  begin    Sender.Clear;    Result := true;  end  else  begin    try      Sender.asString := Text;      Result := true;    except      Application.MessageBox('Valor inválido. Por favor, verifique!','Atenção', MB_OK + MB_ICONWARNING);      if Screen.Cursor = crHourGlass then      begin        Screen.Cursor := crDefault;      end;    end;  end;end;

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

end.
