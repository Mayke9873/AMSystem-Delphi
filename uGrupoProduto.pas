unit uGrupoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin;

type
  TfGrupoProd = class(TForm)
    Label9: TLabel;
    ToolBar1: TToolBar;
    tbNovo: TToolButton;
    tbEditar: TToolButton;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    tbSair: TToolButton;
    ToolButton1: TToolButton;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    dbgGrupo: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBEditID: TDBEdit;
    dbeDescricao: TDBEdit;
    dbchkAtivo: TDBCheckBox;
    edPesquisa: TEdit;
    rdbTodos: TRadioButton;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    dGrupo: TDataSource;
    ImageList1: TImageList;
    uGrupo: TZUpdateSQL;
    qGrupo: TZQuery;
    qGrupoid: TIntegerField;
    qGrupodescricao: TWideStringField;
    qGrupoativo: TWideStringField;
    procedure tbSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupoProd: TfGrupoProd;

implementation

{$R *.dfm}

procedure TfGrupoProd.FormActivate(Sender: TObject);
begin
  qGrupo.Open;
end;

procedure TfGrupoProd.tbSairClick(Sender: TObject);
begin
  Destroying;
end;

end.
