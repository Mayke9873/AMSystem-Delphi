unit FrmConsultaCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, ZAbstractRODataset, ZDataset, Vcl.ExtCtrls, Skia, Vcl.Skia;

type
  TfConsultaCompras = class(TForm)
    edPesquisa: TEdit;
    Label9: TLabel;
    qCompras: TZReadOnlyQuery;
    dCompras: TDataSource;
    qComprasID: TIntegerField;
    qComprasCLIENTE: TWideStringField;
    qComprasVALOR: TZBCDField;
    qComprasDESCONTO: TZBCDField;
    qComprasVALOR_TOTAL: TZBCDField;
    qComprasDATA_VENDA: TDateField;
    qComprasNOME: TWideStringField;
    Panel1: TPanel;
    dbgVendas: TDBGrid;
    pnlBotoes: TPanel;
    tbNovo: TSkSvg;
    tbEditar: TSkSvg;
    tbSair: TSkSvg;
    tbCancelar: TSkSvg;
    tbRelatorio: TSkSvg;
    procedure tbNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSairClick(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaCompras: TfConsultaCompras;

implementation

uses dmCompra, FrmCompra, FrmRelVendas, FrmPrincipal;
{$R *.dfm}

procedure TfConsultaCompras.dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

  if gdSelected in State then  //Cor da célula selecionada
  begin
     dbgVendas.Canvas.Brush.Color := TColor($FCCC33);
     dbgVendas.Canvas.Font.Color := clBlack;
     dbgVendas.Canvas.FillRect(Rect);
     dbgVendas.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfConsultaCompras.edPesquisaChange(Sender: TObject);
begin
  qCompras.Close;
  qCompras.SQL.Clear;
  qCompras.SQL.Add('SELECT a.ID, a.Fornecedor cliente, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_COMPRA DATA_VENDA, b.NOME ' +
    'FROM COMPRA a LEFT JOIN  FUNCIONARIO b on  a.USUARIO = b.ID WHERE ex = 0 and a.Fornecedor like ' +
    QuotedStr('%' + edPesquisa.Text + '%') + ' order by id desc;');
  qCompras.Open;
end;

procedure TfConsultaCompras.FormActivate(Sender: TObject);
begin
  qCompras.Open;
end;

procedure TfConsultaCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Forms.FecharForm(Self, Action);
end;

procedure TfConsultaCompras.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfConsultaCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfConsultaCompras.tbNovoClick(Sender: TObject);
begin
  fCompra := TfCompra.Create(fConsultaCompras);
end;

procedure TfConsultaCompras.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsultaCompras.tbRelatorioClick(Sender: TObject);
begin
  if not  Assigned(fRelVendas) then
    fRelVendas := TfRelVendas.Create(fConsultaCompras);

    fRelVendas.SkLabel1.Caption := StringReplace(fRelVendas.SkLabel1.Caption, 'Vendas', 'Compras', []);
    fRelVendas.SkLabel2.Caption := StringReplace(fRelVendas.SkLabel2.Caption, 'vendas', 'compras', []);
    fRelVendas.Tag := 1;
    fRelVendas.ShowModal;
end;

end.
