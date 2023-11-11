unit uRelEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport;

type
  TfRelEstoque_I = class(TForm)
    DS: TDataSource;
    rpEstoque: TRLReport;
    RLBand1: TRLBand;
    RLLabel6: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    rlbDados: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand5: TRLBand;
    RLLabel5: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    count: Integer;
  public
    { Public declarations }
  end;

var
  fRelEstoque_I: TfRelEstoque_I;

implementation

{$R *.dfm}

procedure TfRelEstoque_I.FormCreate(Sender: TObject);
begin
  count := 0;
end;

procedure TfRelEstoque_I.rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if count = 0 then
  begin
    rlbDados.Color := clSilver;
    Inc(count);
  end
  else
  begin
    rlbDados.Color := clWhite;
    count := 0;
  end;

end;

end.
