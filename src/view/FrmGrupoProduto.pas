unit FrmGrupoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

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
    ActionList1: TActionList;
    acSair: TAction;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGrupoProd: TfGrupoProd;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfGrupoProd.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfGrupoProd.FormCreate(Sender: TObject);
begin
  qGrupo.Open;
end;

procedure TfGrupoProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fGrupoProd := nil;
end;

end.
