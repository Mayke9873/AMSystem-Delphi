unit FrmRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Skia, Skia.Vcl, Vcl.WinXPickers, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TfRelVendas = class(TForm)
    Panel1: TPanel;
    SkLabel1: TSkLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Shape1: TShape;
    btnAjustarEstoque: TSpeedButton;
    pnlSair: TPanel;
    Shape3: TShape;
    btnSair: TSpeedButton;
    Panel3: TPanel;
    DatePicker1: TDatePicker;
    DatePicker2: TDatePicker;
    SkLabel2: TSkLabel;
    CheckBox1: TCheckBox;
    ActionList1: TActionList;
    acImprimir: TAction;
    acSair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
  private
    procedure AbreConsulta;
  public
    { Public declarations }
  end;

var
  fRelVendas: TfRelVendas;

implementation

{$R *.dfm}

uses uRelVendas, dmVenda;

procedure TfRelVendas.FormCreate(Sender: TObject);
begin
  DatePicker1.Date := Now - 90;
  DatePicker2.Date := Now;
end;

procedure TfRelVendas.acImprimirExecute(Sender: TObject);
begin
  fRelVendas_I := TfRelVendas_I.Create(nil);
  try
    AbreConsulta();
    fRelVendas_I.DS.DataSet := dmVendas.qConsVendas;
    fRelVendas_I.rpVenda.PreviewModal;
  finally
    FreeAndNil(fRelVendas_I);
  end;
end;

procedure TfRelVendas.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfRelVendas.AbreConsulta;
begin
  dmVendas.qConsVendas.Close;

  if CheckBox1.Checked then
    dmVendas.qConsVendas.Params[0].AsInteger := 0
  else
    dmVendas.qConsVendas.Params[0].AsDate := DatePicker1.Date;

    dmVendas.qConsVendas.Params[1].AsDate := DatePicker2.Date;

  dmVendas.qConsVendas.Open;
end;

procedure TfRelVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRelVendas := nil;
end;

end.
