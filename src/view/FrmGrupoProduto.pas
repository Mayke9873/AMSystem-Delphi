unit FrmGrupoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.ToolWin, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, Skia, Skia.Vcl, uGrupoProduto;

type
  TfGrupoProd = class(TForm)
    Label9: TLabel;
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
    ImageList1: TImageList;
    ActionList1: TActionList;
    acSair: TAction;
    pnlBotoes: TPanel;
    tbNovo: TSkSvg;
    tbEditar: TSkSvg;
    tbSalvar: TSkSvg;
    tbCancelar: TSkSvg;
    tbSair: TSkSvg;
    tmPesquisar: TTimer;
    procedure acSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbNovoClick(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure rdbTodosClick(Sender: TObject);
    procedure tmPesquisarTimer(Sender: TObject);
    procedure edPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgGrupoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    Grupo: TGrupoProduto;
    Cancelar: Boolean;
    procedure Opacidade;
    procedure AlterarCampos(pTipo : Integer);
    procedure Consulta;
  public
    { Public declarations }
  end;

var
  fGrupoProd: TfGrupoProd;

implementation

uses
  uDM, Consts, dmProduto, dmGrupo, FrmPrincipal;

{$R *.dfm}

procedure TfGrupoProd.Opacidade;
var
  i: Integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if (Components[i]) is TSkSvg then
    begin
      case TSkSvg(Components[i]).Enabled of

        True  : TSkSvg(Components[i]).Opacity := 255;

        False : TSkSvg(Components[i]).Opacity := 100;

      end;
    end;
  end;
end;

procedure TfGrupoProd.rdbTodosClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfGrupoProd.tbCancelarClick(Sender: TObject);
begin
  Cancelar := False;
  AlterarCampos(telaPadrao);
end;

procedure TfGrupoProd.tbEditarClick(Sender: TObject);
begin
  AlterarCampos(telaEdit);
end;

procedure TfGrupoProd.tbNovoClick(Sender: TObject);
begin
  AlterarCampos(telaInsert);
end;

procedure TfGrupoProd.tbSairClick(Sender: TObject);
begin
  acSairExecute(Self);
end;

procedure TfGrupoProd.tbSalvarClick(Sender: TObject);
begin
  Cancelar := False;
  AlterarCampos(telaPadrao);

  Grupo.Descricao      := dbeDescricao.Text;

  if dbchkAtivo.Checked then
    Grupo.Ativo := dbchkAtivo.ValueChecked
  else
    Grupo.Ativo := dbchkAtivo.ValueUnchecked;

  Grupo.Cadastrar;
end;

procedure TfGrupoProd.tmPesquisarTimer(Sender: TObject);
begin
  Consulta();

  tmPesquisar.Enabled := False;
end;

procedure TfGrupoProd.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfGrupoProd.FormCreate(Sender: TObject);
begin
  cancelar := False;
  Grupo := TGrupoProduto.Create();
  AlterarCampos(telaPadrao);

  Consulta;
end;

procedure TfGrupoProd.AlterarCampos(pTipo : Integer);
begin
  case pTipo of
    telaPadrao : begin
      PageControl1.ActivePageIndex := 0;
      dbgGrupo.Enabled := True;
      tbNovo.Enabled := True;
      tbEditar.Enabled := True;
      tbSalvar.Enabled := false;
      tbCancelar.Enabled := false;
      dbchkAtivo.ReadOnly := True;

      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := True;

      if Cancelar then
        dmGrupos.qGrupo.Cancel;
    end;

    telaInsert : begin
      PageControl1.ActivePageIndex := 1;
      dbgGrupo.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      dbchkAtivo.ReadOnly := false;

      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := false;

      dmGrupos.qGrupo.Insert;
    end;

    telaEdit : begin
      PageControl1.ActivePageIndex := 1;
      dbgGrupo.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      dbchkAtivo.ReadOnly := false;

      DBEditID.ReadOnly := True;
      dbeDescricao.ReadOnly := false;

      dmGrupos.qGrupo.Edit;
    end;
  end;

  Opacidade();
end;

procedure TfGrupoProd.Consulta;
begin
  if rdbTodos.Checked then
  begin
    Grupo.Ativo := 'T';
    Grupo.Pesquisar('', edPesquisa.Text);
  end;

  if rdbAtivo.Checked then
  begin
    Grupo.Ativo := 'S';
    Grupo.Pesquisar('', edPesquisa.Text);
  end;

  if rdbInativo.Checked then
  begin
    Grupo.Ativo := 'N';
    Grupo.Pesquisar('', edPesquisa.Text);
  end;
end;

procedure TfGrupoProd.dbgGrupoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgGrupo.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgGrupo).CellRect(0,TStringGrid(dbgGrupo).Row).Top then
     begin
        dbgGrupo.Canvas.FillRect(Rect);
        dbgGrupo.Canvas.Brush.Color := TColor($FFFF00);
        dbgGrupo.Canvas.Font.Color := clBlack;
        dbgGrupo.Canvas.Font.Style := [fsBold];
        dbgGrupo.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
     dbgGrupo.Canvas.Brush.Color := TColor($FCCC33);
     dbgGrupo.Canvas.Font.Color := clBlack;
     dbgGrupo.Canvas.FillRect(Rect);
     dbgGrupo.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfGrupoProd.edPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  tmPesquisar.Enabled := False;
end;

procedure TfGrupoProd.edPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  tmPesquisar.Enabled := True;
end;

procedure TfGrupoProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Forms.FecharForm(Self, Action);
end;

end.
