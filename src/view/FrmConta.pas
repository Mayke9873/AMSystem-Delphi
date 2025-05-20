unit FrmConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList, Skia, Vcl.Skia,
  uFinanceiro.Conta, Math;


type
  TfConta = class(TForm)
    Label9: TLabel;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    dbgConta: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    dbchkAtivo: TDBCheckBox;
    Panel1: TPanel;
    Shape1: TShape;
    DBEDescricao: TDBEdit;
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
    dbchkBancaria: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgContaDrawColumnCell(Sender: TObject; const Rect: TRect;
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
    Contas: TConta;

    Cancelar : String;
    EX: Integer;
    procedure AlterarCampos(pTipo: Integer);
    function isAtivo(Sender: TRadioButton): String;
    procedure Opacidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConta: TfConta;

implementation

uses
  dmFinanceiro, Consts, FrmPrincipal;

{$R *.dfm}

procedure TfConta.dbgContaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if dbgConta.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
    if Rect.Top = TStringGrid(dbgConta).CellRect(0,TStringGrid(dbgConta).Row).Top then
    begin
      dbgConta.Canvas.FillRect(Rect);
      dbgConta.Canvas.Brush.Color := TColor($FFFF00);
      dbgConta.Canvas.Font.Color := clBlack;
      dbgConta.Canvas.Font.Style := [fsBold];
      dbgConta.DefaultDrawDataCell(Rect,Column.Field,State)
    end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
    dbgConta.Canvas.Brush.Color := TColor($FCCC33);
    dbgConta.Canvas.Font.Color := clBlack;
    dbgConta.Canvas.FillRect(Rect);
    dbgConta.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfConta.tbNovoClick(Sender: TObject);
begin
  AlterarCampos(telaInsert);
end;

procedure TfConta.tbEditarClick(Sender: TObject);
begin
  if Contas.DM.qConta.RecordCount = 0 then
    Exit;

  AlterarCampos(telaEdit);
end;

procedure TfConta.tbCancelarClick(Sender: TObject);
begin
  Cancelar := 'S';
  AlterarCampos(telaPadrao);
end;

procedure TfConta.tbSalvarClick(Sender: TObject);
begin
  Contas.id        := StrToIntDef(DBEditID.Text, 0);
  Contas.descricao := dbeDescricao.Text;
  Contas.ex        := IfThen(dbchkAtivo.Checked, StrToInt(dbchkAtivo.ValueChecked),
                                                 StrToInt(dbchkAtivo.ValueUnchecked));
  Contas.isBanco   := dbchkBancaria.Checked;

  if not (Contas.Salvar(Contas)) then
  begin
    Application.MessageBox('Erro ao salvar. Tente novamente!', 'Atenção', 48);
    Abort;
  end;

  AlterarCampos(telaPadrao);
end;

procedure TfConta.AlterarCampos(pTipo : Integer);
begin
  case pTipo of

    telaPadrao : begin
      PageControl1.ActivePageIndex := 0;
      dbgConta.Enabled      := True;
      tbNovo.Enabled        := True;
      tbEditar.Enabled      := True;
      tbSalvar.Enabled      := false;
      tbCancelar.Enabled    := false;

      dbchkAtivo.ReadOnly   := True;
      DBEditID.ReadOnly     := True;
      dbeDescricao.ReadOnly := True;
      dbchkBancaria.ReadOnly:= True;

      if Cancelar = 'S' then
        Contas.DM.qConta.Cancel;

      Cancelar := 'N';
    end;

    telaInsert : begin
      PageControl1.ActivePageIndex  := 1;
      dbgConta.Enabled      := False;
      tbNovo.Enabled        := False;
      tbEditar.Enabled      := False;
      tbSalvar.Enabled      := True;
      tbCancelar.Enabled    := True;

      dbchkAtivo.ReadOnly   := False;
      DBEditID.ReadOnly     := True;
      dbeDescricao.ReadOnly := False;
      dbchkBancaria.ReadOnly:= False;

      Contas.DM.qConta.Insert;
    end;

    telaEdit : begin
      if Contas.DM.qConta.IsEmpty then
        Exit;

      PageControl1.ActivePageIndex := 1;
      dbgConta.Enabled      := False;
      tbNovo.Enabled        := False;
      tbEditar.Enabled      := False;
      tbSalvar.Enabled      := True;
      tbCancelar.Enabled    := True;

      dbchkAtivo.ReadOnly   := False;
      DBEditID.ReadOnly     := True;
      dbeDescricao.ReadOnly := False;
      dbchkBancaria.ReadOnly:= False;
    end;
  end;

  Opacidade();
end;

procedure TfConta.Opacidade;
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

procedure TfConta.FormCreate(Sender: TObject);
begin
  Contas := TConta.Create;
  isAtivo(Self.rdbTodos);
  edPesquisaChange(Self);
  Cancelar := 'N';
  AlterarCampos(telaPadrao);
end;

procedure TfConta.edPesquisaChange(Sender: TObject);
begin
  Contas.ex := EX;
  Contas.Pesquisar(edPesquisa.Text);
end;

procedure TfConta.rdbTodosClick(Sender: TObject);
begin
  isAtivo(TRadioButton(Sender));
  edPesquisaChange(edPesquisa);
end;

function TfConta.isAtivo(Sender : TRadioButton) : String;
begin
  Ex := Sender.Tag;
end;

procedure TfConta.acSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Contas);
  Forms.FecharForm(Self, Action);
end;

end.
