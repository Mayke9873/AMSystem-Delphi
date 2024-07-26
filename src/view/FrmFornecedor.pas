unit FrmFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList, uFornecedor, Skia, Vcl.Skia;


type
  TfFornecedor = class(TForm)
    Label9: TLabel;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    dbgFornecedor: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbchkAtivo: TDBCheckBox;
    Panel1: TPanel;
    Shape1: TShape;
    DBENome: TDBEdit;
    Panel2: TPanel;
    Shape2: TShape;
    DBEIE: TDBEdit;
    Panel3: TPanel;
    Shape3: TShape;
    DBECPF: TDBEdit;
    Panel5: TPanel;
    Shape5: TShape;
    DBEEndereco: TDBEdit;
    Panel6: TPanel;
    Shape6: TShape;
    DBENumEnd: TDBEdit;
    Panel7: TPanel;
    Shape7: TShape;
    DBEBairro: TDBEdit;
    Panel8: TPanel;
    Shape8: TShape;
    DBEditID: TDBEdit;
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
    procedure dbgFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acSairExecute(Sender: TObject);
    procedure edPesquisaChange(Sender: TObject);
    procedure tbNovoClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure rdbTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Cancelar : String;
    Ativo : String;
    Fornecedor : TFornecedor;
    procedure AlterarCampos(pTipo: Integer);
    function isAtivo(Sender: TRadioButton): String;
    procedure Opacidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFornecedor: TfFornecedor;

implementation

uses
  dmFornecedor, Consts, FrmPrincipal;

{$R *.dfm}

procedure TfFornecedor.dbgFornecedorDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgFornecedor.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(dbgFornecedor).CellRect(0,TStringGrid(dbgFornecedor).Row).Top then
     begin
        dbgFornecedor.Canvas.FillRect(Rect);
        dbgFornecedor.Canvas.Brush.Color := TColor($FFFF00);
        dbgFornecedor.Canvas.Font.Color := clBlack;
        dbgFornecedor.Canvas.Font.Style := [fsBold];
        dbgFornecedor.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
     dbgFornecedor.Canvas.Brush.Color := TColor($FCCC33);
     dbgFornecedor.Canvas.Font.Color := clBlack;
     dbgFornecedor.Canvas.FillRect(Rect);
     dbgFornecedor.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfFornecedor.tbNovoClick(Sender: TObject);
begin
  AlterarCampos(telaInsert);
end;

procedure TfFornecedor.tbEditarClick(Sender: TObject);
begin
  AlterarCampos(telaEdit);
end;

procedure TfFornecedor.tbCancelarClick(Sender: TObject);
begin
  Cancelar := 'S';
  AlterarCampos(telaPadrao);
end;

procedure TfFornecedor.tbSalvarClick(Sender: TObject);
begin
  Fornecedor := TFornecedor.Create;
  try
    Fornecedor.Cod          := StrToIntDef(DBEditID.Text, 0);
    Fornecedor.Nome         := DBENome.Text;
    Fornecedor.RGIE         := DBEIE.Text;
    Fornecedor.CPFCNPJ      := DBECPF.Text;
    Fornecedor.Endereco     := DBEEndereco.Text;
    Fornecedor.NumEndereco  := DBENumEnd.Text;
    Fornecedor.Bairro       := DBEBairro.Text;

    if dbchkAtivo.Checked then
      Fornecedor.Ativo := dbchkAtivo.ValueChecked
    else
      Fornecedor.Ativo := dbchkAtivo.ValueUnchecked;

    Fornecedor.Cadastrar(Fornecedor);
  finally
    FreeAndNil(Fornecedor);
  end;

  Cancelar := 'N';
  AlterarCampos(telaPadrao);
end;

procedure TfFornecedor.AlterarCampos(pTipo : Integer);
begin
  case pTipo of

    telaPadrao : begin
      PageControl1.ActivePageIndex := 0;
      dbgFornecedor.Enabled := True;
      tbNovo.Enabled        := True;
      tbEditar.Enabled      := True;
      tbSalvar.Enabled      := false;
      tbCancelar.Enabled    := false;

      dbchkAtivo.ReadOnly   := True;
      DBEditID.ReadOnly     := True;
      dbeNome.ReadOnly      := True;
      DBEIE.ReadOnly        := True;
      dbeCPF.ReadOnly       := True;
      dbeEndereco.ReadOnly  := True;
      dbeNumEnd.ReadOnly    := True;
      dbeBairro.ReadOnly    := True;

      if Cancelar = 'S' then
        dmFornecedores.qFornecedor.Cancel;
    end;

    telaInsert : begin
      PageControl1.ActivePageIndex  := 1;
      dbgFornecedor.Enabled         := false;
      tbNovo.Enabled                := false;
      tbEditar.Enabled              := false;
      tbSalvar.Enabled              := True;
      tbCancelar.Enabled            := True;

      dbchkAtivo.ReadOnly           := False;
      DBEditID.ReadOnly   := True;
      dbeNome.ReadOnly    := false;
      DBEIE.ReadOnly      := False;
      dbeCPF.ReadOnly     := False;
      dbeEndereco.ReadOnly:= false;
      dbeNumEnd.ReadOnly  := false;
      dbeBairro.ReadOnly  := False;

      dmFornecedores.qFornecedor.Insert;
    end;

    telaEdit : begin
      if dmFornecedores.qFornecedor.IsEmpty then
        Exit;

      PageControl1.ActivePageIndex := 1;
      dbgFornecedor.Enabled := false;
      tbNovo.Enabled        := false;
      tbEditar.Enabled      := false;
      tbSalvar.Enabled      := True;
      tbCancelar.Enabled    := True;

      dbchkAtivo.ReadOnly   := False;
      DBEditID.ReadOnly     := True;
      dbeNome.ReadOnly      := false;
      dbeCPF.ReadOnly       := false;
      DBEIE.ReadOnly        := False;
      dbeEndereco.ReadOnly  := false;
      dbeNumEnd.ReadOnly    := false;
      dbeBairro.ReadOnly    := False;

      dmFornecedores.qFornecedor.Edit;
    end;
  end;

  Opacidade();
end;

procedure TfFornecedor.Opacidade;
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

procedure TfFornecedor.FormCreate(Sender: TObject);
begin
  isAtivo(Self.rdbTodos);
  edPesquisaChange(Self);
  Cancelar := 'N';
  AlterarCampos(telaPadrao);
end;

procedure TfFornecedor.edPesquisaChange(Sender: TObject);
begin
  Fornecedor := TFornecedor.Create;
  try
    Fornecedor.Ativo := Ativo;
    Fornecedor.Pesquisar(edPesquisa.Text);
  finally
    Fornecedor.Free;
  end;
end;

procedure TfFornecedor.rdbTodosClick(Sender: TObject);
begin
  isAtivo(TRadioButton(Sender));
  edPesquisaChange(edPesquisa);
end;

function TfFornecedor.isAtivo(Sender : TRadioButton) : String;
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

procedure TfFornecedor.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Forms.FecharForm(Self, Action);
end;

end.
