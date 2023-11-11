unit FrmRelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Skia, Skia.Vcl, Vcl.WinXPickers, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList,
  ZDataset, RLReport;

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
    pnlPrincipal: TPanel;
    DatePicker1: TDatePicker;
    DatePicker2: TDatePicker;
    SkLabel2: TSkLabel;
    ckTodos: TCheckBox;
    ActionList1: TActionList;
    acImprimir: TAction;
    acSair: TAction;
    ckKardex: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
  private
    procedure AbreConsulta(pQuery: TZQuery);
  public
    { Public declarations }
  end;

var
  fRelVendas: TfRelVendas;

implementation

{$R *.dfm}

uses uRelVendas, dmVenda, dmCompra, dmProduto, uRelEstoque;

procedure TfRelVendas.FormCreate(Sender: TObject);
begin
  DatePicker1.Date := Now - 90;
  DatePicker2.Date := Now;
end;

procedure TfRelVendas.acImprimirExecute(Sender: TObject);
var
  Report: TRLReport;
begin
  fRelVendas_I  := TfRelVendas_I.Create(nil);
  fRelEstoque_I := TfRelEstoque_I.Create(nil);
  try
    case Self.Tag of
      0..1: begin
        if Self.Tag = 0 then
          AbreConsulta(TZQuery(dmVendas.qConsVendas))
        else
        begin
          AbreConsulta(TZQuery(dmCompras.qConsCompras));

          fRelVendas_I.RLLabel6.Caption    := StringReplace(fRelVendas_I.RLLabel6.Caption, 'vendas', 'compras', []);
          fRelVendas_I.RLLabel4.Caption    := StringReplace(fRelVendas_I.RLLabel4.Caption, 'Venda', 'Compra', []);
          fRelVendas_I.RLDBText4.DataField := 'Data_compra';
          fRelVendas_I.RLLabel2.Caption    := 'Fornecedor';
          fRelVendas_I.RLDBText2.DataField := 'Nome';
        end;


      end;

      2 : begin
        AbreConsulta(TZQuery(dmProdutos.qConsProdutos));
      end;
        
    end;

    case Self.Tag of
      0..1: fRelVendas_I.rpVenda.PreviewModal;

      2   : fRelEstoque_I.rpEstoque.PreviewModal
    end;
    
  finally
    FreeAndNil(fRelVendas_I);
    FreeAndNil(fRelEstoque_I);
  end;
end;

procedure TfRelVendas.AbreConsulta(pQuery: TZQuery);
begin
  pQuery.Close;

  if ckTodos.Checked then
   PQuery.Params[0].AsInteger := 0
  else
   PQuery.Params[0].AsDate := DatePicker1.Date;

   PQuery.Params[1].AsDate := DatePicker2.Date;

  PQuery.Open;

  fRelVendas_I.DS.DataSet  := PQuery;
  fRelEstoque_I.DS.DataSet := PQuery;
end;

procedure TfRelVendas.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfRelVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fRelVendas := nil;
end;

end.
