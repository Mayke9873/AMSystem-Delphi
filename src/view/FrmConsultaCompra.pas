unit FrmConsultaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, ZAbstractRODataset, ZDataset, Vcl.ExtCtrls, Skia, Skia.Vcl;

type
  TfConsultaCompra = class(TForm)
    edPesquisa: TEdit;
    Label9: TLabel;
    qCompras: TZReadOnlyQuery;
    dCompras: TDataSource;
    qComprasID: TIntegerField;
    qComprasCLIENTE: TWideStringField;
    qComprasVALOR: TFloatField;
    qComprasDESCONTO: TFloatField;
    qComprasVALOR_TOTAL: TFloatField;
    qComprasDATA_VENDA: TDateField;
    qComprasNOME: TWideStringField;
    Panel1: TPanel;
    dbgVendas: TDBGrid;
    pnlBotoes: TPanel;
    tbNovo: TSkSvg;
    tbEditar: TSkSvg;
    tbSair: TSkSvg;
    tbCancelar: TSkSvg;
    ToolButton1: TSkSvg;
    procedure tbNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSairClick(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaCompras: TfConsultaCompra;

implementation

uses dmVenda, FrmVenda, FrmRelVendas;
{$R *.dfm}

procedure TfConsultaCompra.dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbgVendas.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgVendas).CellRect(0,TStringGrid(dbgVendas).Row).Top then
     begin
        dbgVendas.Canvas.FillRect(Rect);
        dbgVendas.Canvas.Brush.Color := TColor($FFFF00);
        dbgVendas.Canvas.Font.Color := clBlack;
        dbgVendas.Canvas.Font.Style := [fsBold];
        dbgVendas.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da c�lula selecionada
  begin
     dbgVendas.Canvas.Brush.Color := TColor($FCCC33);
     dbgVendas.Canvas.Font.Color := clBlack;
     dbgVendas.Canvas.FillRect(Rect);
     dbgVendas.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfConsultaCompra.edPesquisaChange(Sender: TObject);
begin
  qCompras.Close;
  qCompras.SQL.Clear;
  qCompras.SQL.Add('SELECT a.ID, a.Fornecedor cliente, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_COMPRA DATA_VENDA, b.NOME ' +
    'FROM COMPRA a LEFT JOIN  FUNCIONARIO b on  a.USUARIO = b.ID WHERE ex = 0 and a.Fornecedor like ' +
    QuotedStr('%' + edPesquisa.Text + '%') + ' order by id desc;');
  qCompras.Open;
end;

procedure TfConsultaCompra.FormActivate(Sender: TObject);
begin
  qCompras.Open;
end;

procedure TfConsultaCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fConsultaCompras := nil;
end;

procedure TfConsultaCompra.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of

    27: begin
      tbSairClick(tbSair);
      Key := 0;
    end;

    112: begin
      tbNovoClick(tbNovo);
    end;

  end;
end;

procedure TfConsultaCompra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfConsultaCompra.tbNovoClick(Sender: TObject);
begin
  fVenda := TfVenda.Create(fConsultaCompras);
end;

procedure TfConsultaCompra.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsultaCompra.ToolButton1Click(Sender: TObject);
begin
  if not  Assigned(fRelVendas) then
    fRelVendas := TfRelVendas.Create(fConsultaCompras)
  else
    fRelVendas.ShowModal;
end;

end.