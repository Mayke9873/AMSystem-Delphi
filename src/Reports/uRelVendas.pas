unit uRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB;

type
  TfRelVendas_I = class(TForm)
    rpVenda: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    rlbDados: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand5: TRLBand;
    RLLabel5: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBResult1: TRLDBResult;
    DS: TDataSource;
    RLLabel6: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    procedure rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    count: Integer;
  public
    { Public declarations }
  end;

var
  fRelVendas_I: TfRelVendas_I;

implementation

{$R *.dfm}

uses FrmConsultaVenda;

procedure TfRelVendas_I.FormCreate(Sender: TObject);
begin
  count := 0;
end;

procedure TfRelVendas_I.rlbDadosBeforePrint(Sender: TObject; var PrintIt: Boolean);
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
