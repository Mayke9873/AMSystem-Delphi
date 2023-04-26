unit uConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, ZAbstractRODataset, ZDataset;

type
  TfConsultaVendas = class(TForm)
    ToolBar1: TToolBar;
    dbgVendas: TDBGrid;
    tbNovo: TToolButton;
    tbSair: TToolButton;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    edPesquisa: TEdit;
    Label9: TLabel;
    qVendas: TZReadOnlyQuery;
    dVendas: TDataSource;
    qVendasID: TIntegerField;
    qVendasCLIENTE: TWideStringField;
    qVendasVALOR: TFloatField;
    qVendasDESCONTO: TFloatField;
    qVendasVALOR_TOTAL: TFloatField;
    qVendasDATA_VENDA: TDateField;
    qVendasNOME: TWideStringField;
    procedure tbNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSairClick(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaVendas: TfConsultaVendas;

implementation

uses uDM, uVenda;
{$R *.dfm}

procedure TfConsultaVendas.dbgVendasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if dbgVendas.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgVendas).CellRect(0,TStringGrid(dbgVendas).Row).Top then
     begin
        dbgVendas.Canvas.FillRect(Rect);
        dbgVendas.Canvas.Brush.Color := TColor($FFFF00);
        dbgVendas.Canvas.Font.Color := clBlack;
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

procedure TfConsultaVendas.edPesquisaChange(Sender: TObject);
begin
  qVendas.Close;
  qVendas.SQL.Clear;
  qVendas.SQL.Add('SELECT a.ID, a.CLIENTE, a.VALOR, a.DESCONTO, a.VALOR_TOTAL, a.DATA_VENDA, b.NOME ' +
    'FROM VENDA a LEFT JOIN  FUNCIONARIO b on  a.VENDEDOR = b.ID WHERE ex = 0 and cliente like ' +
    QuotedStr('%' + edPesquisa.Text + '%') + ' order by id desc;');
  qVendas.Open;

end;

procedure TfConsultaVendas.FormActivate(Sender: TObject);
begin
  qVendas.Open;
end;

procedure TfConsultaVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
end;

procedure TfConsultaVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  case Key of
    27:
      begin
        tbSairClick(tbSair);
        Key := 0;
      end;

    112:
      begin
        tbNovoClick(tbNovo);
      end;

  end;
end;

procedure TfConsultaVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfConsultaVendas.tbNovoClick(Sender: TObject);
begin
  fVenda := TfVenda.Create(fConsultaVendas);
end;

procedure TfConsultaVendas.tbSairClick(Sender: TObject);
begin
  Close;
end;

end.
