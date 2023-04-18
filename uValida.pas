unit uValida;

interface

uses
  Data.DB, Vcl.Forms, System.UITypes, Winapi.Windows;

type
  TValida = class
    function ValidaData(Sender: TField; Text: String): Boolean;
  end;

implementation

{ TValida }

function TValida.ValidaData(Sender: TField; Text: String): Boolean;
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

end.
