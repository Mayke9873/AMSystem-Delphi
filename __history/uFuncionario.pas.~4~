unit uFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TfFuncionario = class(TForm)
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
    DBGrid1: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEditID: TDBEdit;
    DBENome: TDBEdit;
    DBERG: TDBEdit;
    DBEEndereco: TDBEdit;
    DBENumEnd: TDBEdit;
    DBEBairro: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    DBECPF: TDBEdit;
    DBENasc: TDBEdit;
    edPesquisa: TEdit;
    rdbTodos: TRadioButton;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    dFuncionario: TDataSource;
    ImageList1: TImageList;
    uFuncionario: TZUpdateSQL;
    qFuncionario: TZQuery;
    qFuncionarioid: TIntegerField;
    qFuncionarionome: TWideStringField;
    qFuncionariorg: TWideStringField;
    qFuncionarioCPFCNPJ: TWideStringField;
    qFuncionarioDtNasc: TDateField;
    qFuncionarioendereco: TWideStringField;
    qFuncionarionumEndereco: TWideStringField;
    qFuncionariobairro: TWideStringField;
    qFuncionarioDtRegistro: TDateField;
    qFuncionariotipo: TWideStringField;
    qFuncionarioativo: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFuncionario: TfFuncionario;

implementation

{$R *.dfm}

procedure TfFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Free;
end;

procedure TfFuncionario.tbSairClick(Sender: TObject);
begin
  Destroy;
end;

end.
