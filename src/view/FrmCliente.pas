unit FrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZDataset, Vcl.ComCtrls, Vcl.Tabs, Vcl.DockTabSet,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, ZAbstractDataset, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, ZSqlUpdate, Vcl.Buttons, uCliente, uValida,
  System.Threading, Skia, VCL.Skia;

type
  TfCliente = class(TForm)
    ImageList1: TImageList;
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
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    Label9: TLabel;
    edPesquisa: TEdit;
    rdbTodos: TRadioButton;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    Panel1: TPanel;
    Shape1: TShape;
    DBENome: TDBEdit;
    Panel2: TPanel;
    Shape2: TShape;
    Panel3: TPanel;
    Shape3: TShape;
    Panel4: TPanel;
    Shape4: TShape;
    Panel5: TPanel;
    Shape5: TShape;
    Panel6: TPanel;
    Shape6: TShape;
    DBERG: TDBEdit;
    DBECPF: TDBEdit;
    DBENasc: TDBEdit;
    DBEEndereco: TDBEdit;
    Panel7: TPanel;
    Shape7: TShape;
    Panel8: TPanel;
    Shape8: TShape;
    DBENumEnd: TDBEdit;
    DBEBairro: TDBEdit;
    DBEditID: TDBEdit;
    pnlBotoes: TPanel;
    tbNovo: TSkSvg;
    tbEditar: TSkSvg;
    tbSalvar: TSkSvg;
    tbCancelar: TSkSvg;
    tbSair: TSkSvg;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPesquisaChange(Sender: TObject);
    procedure Consulta;
    procedure rdbTodosClick(Sender: TObject);
    procedure rdbAtivoClick(Sender: TObject);
    procedure rdbInativoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBECPFKeyPress(Sender: TObject; var Key: Char);
    procedure tbNovoClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure DBECPFExit(Sender: TObject);
  private
    { Private declarations }
    Cliente : TCliente;
    TipoCadastro : Integer;
    Valida : TValidacoes;
    procedure NovoOuEditar(Tipo : Integer);
    procedure Opacidade;
    procedure AjustaTela(aValue: Boolean);

  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

uses dmCliente, Conexao.MySQL, FrmPrincipal, System.StrUtils;
{$R *.dfm}

procedure TfCliente.DBECPFExit(Sender: TObject);
begin
  if Trim((Sender as TDBEdit).Text) = EmptyStr then
    Exit;

  if not Valida.ValidaDocumento((Sender as TDBEdit).Text) then
  begin
    Application.MessageBox('CPF inválido. Por favor, verifique!', 'Atenção', 48);
    DBECPF.SetFocus;
    Abort;
  end;
end;

procedure TfCliente.DBECPFKeyPress(Sender: TObject; var Key: Char);
begin
  Valida := TValidacoes.Create;
  try
    Valida.SomenteNumeroInteiro(Key);
  finally
    Valida.Free;
  end;
end;

procedure TfCliente.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfCliente.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DBGrid1.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
  begin
     if Rect.Top = TStringGrid(DBGrid1).CellRect(0,TStringGrid(DBGrid1).Row).Top then
     begin
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.Canvas.Brush.Color := TColor($FFFF00);
        DBGrid1.Canvas.Font.Color := clBlack;
        DBGrid1.Canvas.Font.Style := [fsBold];
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  end;

  if gdSelected in State then  //Cor da célula selecionada
  begin
     DBGrid1.Canvas.Brush.Color := TColor($FCCC33);
     DBGrid1.Canvas.Font.Color := clBlack;
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State)
  end;
end;

procedure TfCliente.Consulta;
begin

  if rdbTodos.Checked then
    Cliente.Ativo := 'T' // Todos clientes

  else if rdbAtivo.Checked then
    Cliente.Ativo := 'S' // Somente ativos

  else
    Cliente.Ativo := 'N'; // Somente inativos;

  Cliente.Nome := '%' + edPesquisa.Text + '%';

  try
    Cliente.Pesquisar(Cliente.Nome);
  except
    Application.MessageBox('Erro ao pesquisar cliente!', 'Atenção', MB_OK+MB_ICONEXCLAMATION);
  end;
end;

procedure TfCliente.edPesquisaChange(Sender: TObject);
begin
  Consulta;
end;

procedure TfCliente.FormCreate(Sender: TObject);
begin
  Cliente := TCliente.Create;
  Consulta;
  PageControl1.TabIndex := 0;
  tbCancelarClick(tbCancelar);
end;

procedure TfCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfCliente.NovoOuEditar(Tipo: Integer);
begin
  case Tipo of  // 0 = Novo;  1 = Editar;
    0 :
    begin
      Cliente.Cadastrar(Cliente);
    end;

    1 :
    begin
      Cliente.Editar(Cliente);
    end;
  end;

end;

procedure TfCliente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfCliente.rdbAtivoClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfCliente.rdbInativoClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfCliente.rdbTodosClick(Sender: TObject);
begin
  Consulta;
end;

procedure TfCliente.tbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;

  AjustaTela(False);

  DBENome.SetFocus;

  dmClientes.qCliente.Insert;
  TipoCadastro := 0;
end;

procedure TfCliente.tbEditarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;

  AjustaTela(False);

  DBENome.SetFocus;

  dmClientes.qCliente.Edit;
  TipoCadastro := 1;
end;

procedure TfCliente.tbSalvarClick(Sender: TObject);
begin
  if not (Trim(DBECPF.Text) = EmptyStr)  then
    if not Valida.ValidaDocumento(DBECPF.Text) then
    begin
      Application.MessageBox('CPF inválido. Por favor, verifique!', 'Atenção', 48);
      DBECPF.SetFocus;
      Abort;
    end;

  SelectNext(ActiveControl, True, True);

  DBEditID.ReadOnly := true;
  DBENome.ReadOnly := true;
  DBERG.ReadOnly := true;
  DBECPF.ReadOnly := true;
  DBENasc.ReadOnly := true;
  DBEEndereco.ReadOnly := true;
  DBENumEnd.ReadOnly := true;
  DBEBairro.ReadOnly := true;
  DBCheckBox1.ReadOnly := true;
  DBRadioGroup1.ReadOnly := true;

  PageControl1.ActivePageIndex := 0;
  DBGrid1.Enabled := true;
  tbNovo.Enabled := true;
  tbEditar.Enabled := true;
  tbSalvar.Enabled := false;
  tbCancelar.Enabled := false;


  Cliente.Nome := DBENome.Text;
  Cliente.RGIE := DBERG.Text;
  Cliente.CPFCNPJ := DBECPF.Text;
  Cliente.Endereco := DBEEndereco.Text;
  Cliente.NumEndereco := DBENumEnd.Text;
  Cliente.Bairro := DBEBairro.Text;
  Cliente.DtNasc := DBENasc.Text;

  Cliente.Ativo := IfThen(DBCheckBox1.Checked, DBCheckBox1.ValueChecked, DBCheckBox1.ValueUnchecked);

  NovoOuEditar(TipoCadastro);
  Consulta;

  Opacidade();
end;

procedure TfCliente.tbCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  AjustaTela(True);

  dmClientes.qCliente.Cancel;

end;

procedure TfCliente.AjustaTela(aValue: Boolean);
begin
  DBGrid1.Enabled       := aValue;
  tbNovo.Enabled        := aValue;
  tbEditar.Enabled      := aValue;
  tbSalvar.Enabled      := not aValue;
  tbCancelar.Enabled    := not aValue;

  DBCheckBox1.ReadOnly  := aValue;
  DBRadioGroup1.ReadOnly:= aValue;

  DBENome.ReadOnly      := aValue;
  DBERG.ReadOnly        := aValue;
  DBECPF.ReadOnly       := aValue;
  DBENasc.ReadOnly      := aValue;
  DBEEndereco.ReadOnly  := aValue;
  DBENumEnd.ReadOnly    := aValue;
  DBEBairro.ReadOnly    := aValue;

  Opacidade();
end;

procedure TfCliente.Opacidade;
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

procedure TfCliente.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente.Free;
  Forms.FecharForm(Self, Action);
end;

end.
