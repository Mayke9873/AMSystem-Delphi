unit FrmCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfCompra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodVenda: TEdit;
    edIdVendedor: TEdit;
    edIdCliente: TEdit;
    edIdProd: TEdit;
    edVendedor: TEdit;
    edCliente: TEdit;
    edPesqProd: TEdit;
    edQtdProduto: TEdit;
    edValorUnitario: TEdit;
    edDesconto: TEdit;
    edValorTotal: TEdit;
    DBGrid1: TDBGrid;
    dbgPesqProduto: TDBGrid;
    dbgVendedor: TDBGrid;
    dbgCliente: TDBGrid;
    pnlDesconto: TPanel;
    Label9: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    edDescontoVenda: TEdit;
    pnlTotal: TPanel;
    Label10: TLabel;
    Panel3: TPanel;
    Shape2: TShape;
    edTotalVenda: TEdit;
    pnlBotoes: TPanel;
    btnSair: TButton;
    btnExcluirProduto: TButton;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dProdVenda: TDataSource;
    qProdVenda: TZQuery;
    qProdVendaid: TIntegerField;
    qProdVendaidprod: TIntegerField;
    qProdVendadescricao: TWideStringField;
    qProdVendaquantidade: TFloatField;
    qProdVendadesconto: TFloatField;
    qProdVendatotal: TFloatField;
    qProdVendavalor: TFloatField;
    uProdVenda: TZUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCompra: TfCompra;

implementation

{$R *.dfm}

end.
