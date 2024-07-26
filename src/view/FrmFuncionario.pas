unit FrmFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZSqlUpdate, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList, uFuncionario, Skia, Vcl.Skia;

Const
  telaPadrao = 0;
  telaInsert = 1;
  telaEdit = 2;

type
  TfFuncionario = class(TForm)
    Label9: TLabel;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    dbgFuncionario: TDBGrid;
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
    dbchkAtivo: TDBCheckBox;
    DBECPF: TDBEdit;
    DBENasc: TDBEdit;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbNovoClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure dbgFuncionarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rdbTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    Cancelar : String;
    Ativo : String;
    procedure AlterarCampos(pTipo: Integer);
    function isAtivo(Sender : TRadioButton) : String;
    procedure Opacidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFuncionario: TfFuncionario;

implementation

uses
  dmFuncionario, FrmPrincipal;

{$R *.dfm}

procedure TfFuncionario.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  rdbTodosClick(Self);
  tbCancelarClick(Self);
end;

procedure TfFuncionario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

function TfFuncionario.isAtivo(Sender : TRadioButton) : String;
begin
  case Sender.tag of
    0 : begin
      Ativo := 'T';
    end;

    1 : begin
      Ativo := 'S';
    end;

    2 : begin
      Ativo := 'N';
    end;
  end;
end;

procedure TfFuncionario.rdbTodosClick(Sender: TObject);
begin
  isAtivo(TRadioButton(Sender));
  edPesquisaChange(edPesquisa);
end;

procedure TfFuncionario.tbCancelarClick(Sender: TObject);
begin
  Cancelar := 'S';
  AlterarCampos(telaPadrao);
end;

procedure TfFuncionario.tbEditarClick(Sender: TObject);
begin
  AlterarCampos(telaEdit);
end;

procedure TfFuncionario.tbNovoClick(Sender: TObject);
begin
  AlterarCampos(telaInsert);
end;

procedure TfFuncionario.tbSalvarClick(Sender: TObject);
var
  Funcionario : TFuncionario;
begin
  Cancelar := 'N';
  AlterarCampos(telaPadrao);

  Funcionario := TFuncionario.Create;
  try
    Funcionario.Cod := StrToIntDef(DBEditID.Text, 0);
    Funcionario.Nome := DBENome.Text;
    Funcionario.RGIE := DBERG.Text;
    Funcionario.CPFCNPJ := DBECPF.Text;
    Funcionario.Endereco := DBEEndereco.Text;
    Funcionario.NumEndereco := DBENumEnd.Text;
    Funcionario.Bairro := DBEBairro.Text;

    if DBENasc.Text <> '  /  /    ' then
    begin
      try
        Funcionario.DtNasc := StrToDate(DBENasc.Text);
      except
        Application.MessageBox('Data inválida. Por favor, verifique!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      end;
    end;

    if dbchkAtivo.Checked then
      Funcionario.Ativo := dbchkAtivo.ValueChecked
    else
      Funcionario.Ativo := dbchkAtivo.ValueUnchecked;

    Funcionario.Cadastrar(Funcionario);
    rdbTodosClick(Self);
  finally
    Funcionario.Free;
  end;
end;

procedure TfFuncionario.edPesquisaChange(Sender: TObject);
var
  Funcionario : TFuncionario;
begin
  Funcionario := TFuncionario.Create;
  try
    Funcionario.Ativo := Ativo;
    Funcionario.Pesquisar(edPesquisa.Text);
  finally
    Funcionario.Free;
  end;
end;

procedure TfFuncionario.AlterarCampos(pTipo : Integer);
begin
  case pTipo of

    telaPadrao : begin
      PageControl1.ActivePageIndex := 0;
      dbgFuncionario.Enabled := True;
      tbNovo.Enabled := True;
      tbEditar.Enabled := True;
      tbSalvar.Enabled := false;
      tbCancelar.Enabled := false;
      dbchkAtivo.ReadOnly := True;

      DBEditID.ReadOnly := True;
      dbeNome.ReadOnly := True;
      dbeRG.ReadOnly := True;
      dbeCPF.ReadOnly := True;
      dbeNasc.ReadOnly := True;
      dbeEndereco.ReadOnly := True;
      dbeNumEnd.ReadOnly := True;
      dbeBairro.ReadOnly := True;

      if Cancelar = 'S' then
        dmFuncionarios.qFuncionario.Cancel;
    end;

    telaInsert : begin
      PageControl1.ActivePageIndex := 1;
      dbgFuncionario.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      dbchkAtivo.ReadOnly := false;

      DBEditID.ReadOnly := True;
      dbeNome.ReadOnly := false;
      dbeRG.ReadOnly := false;
      dbeCPF.ReadOnly := false;
      dbeNasc.ReadOnly := false;
      dbeEndereco.ReadOnly := false;
      dbeNumEnd.ReadOnly := false;
      dbeBairro.ReadOnly := False;

      dmFuncionarios.qFuncionario.Insert;
    end;

    telaEdit : begin
      PageControl1.ActivePageIndex := 1;
      dbgFuncionario.Enabled := false;
      tbNovo.Enabled := false;
      tbEditar.Enabled := false;
      tbSalvar.Enabled := True;
      tbCancelar.Enabled := True;
      dbchkAtivo.ReadOnly := false;

      DBEditID.ReadOnly := True;
      dbeNome.ReadOnly := false;
      dbeRG.ReadOnly := false;
      dbeCPF.ReadOnly := false;
      dbeNasc.ReadOnly := false;
      dbeEndereco.ReadOnly := false;
      dbeNumEnd.ReadOnly := false;
      dbeBairro.ReadOnly := False;

      dmFuncionarios.qFuncionario.Edit;
    end;
  end;

  Opacidade();
end;

procedure TfFuncionario.dbgFuncionarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgFuncionario.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgFuncionario).CellRect(0,TStringGrid(dbgFuncionario).Row).Top then
     begin
        dbgFuncionario.Canvas.FillRect(Rect);
        dbgFuncionario.Canvas.Brush.Color := TColor($FFFF00);
        dbgFuncionario.Canvas.Font.Color := clBlack;
        dbgFuncionario.Canvas.Font.Style := [fsBold];
        dbgFuncionario.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
     dbgFuncionario.Canvas.Brush.Color := TColor($FCCC33);
     dbgFuncionario.Canvas.Font.Color := clBlack;
     dbgFuncionario.Canvas.FillRect(Rect);
     dbgFuncionario.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfFuncionario.Opacidade;
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

procedure TfFuncionario.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Forms.FecharForm(Self, Action);
end;

end.
