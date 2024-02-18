unit uFrame.Comanda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameComanda = class(TFrame)
    spColor: TShape;
    pnlFrame: TPanel;
    lNumeroComanda: TLabel;
    lValor: TLabel;
    lNome: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
