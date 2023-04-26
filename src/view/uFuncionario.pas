unit uFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList;

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
    qFuncionarioId: TIntegerField;
    qFuncionarioNome: TWideStringField;
    qFuncionarioRG: TWideStringField;
    qFuncionarioCpf: TWideStringField;
    qFuncionariodtnasc: TDateField;
    qFuncionarioEndereco: TWideStringField;
    qFuncionarionumendereco: TWideStringField;
    qFuncionarioBairro: TWideStringField;
    qFuncionariodtregistro: TDateField;
    qFuncionarioAtivo: TWideStringField;
    ActionList1: TActionList;
    acSair: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFuncionario: TfFuncionario;

implementation

uses
  uDM;

{$R *.dfm}




procedure TfFuncionario.FormActivate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfFuncionario.FormCreate(Sender: TObject);
begin
  qFuncionario.Open;
end;

procedure TfFuncionario.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fFuncionario := nil;
end;

end.
