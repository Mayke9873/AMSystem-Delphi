unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZDataset, Vcl.ComCtrls, Vcl.Tabs, Vcl.DockTabSet,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, ZAbstractDataset, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, ZSqlUpdate, Vcl.Buttons, uClientes;

type
  TfCliente = class(TForm)
    ToolBar1: TToolBar;
    tbNovo: TToolButton;
    ImageList1: TImageList;
    tbEditar: TToolButton;
    tbSalvar: TToolButton;
    tbCancelar: TToolButton;
    tbSair: TToolButton;
    PageControl1: TPageControl;
    pgTabela: TTabSheet;
    DBGrid1: TDBGrid;
    pgDados: TTabSheet;
    Label1: TLabel;
    ToolButton1: TToolButton;
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
    procedure tbSairClick(Sender: TObject);
    procedure tbNovoClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure tbSalvarClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
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
  private
    { Private declarations }
    Cliente : TClientes;
    TipoCadastro : Integer;
    procedure NovoEditar(Tipo : Integer);

  public
    { Public declarations }
  end;

var
  fCliente: TfCliente;

implementation

uses uDM;
{$R *.dfm}

procedure TfCliente.DBGrid1DblClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
end;

procedure TfCliente.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if DBGrid1.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
     if Rect.Top = TStringGrid(DBGrid1).CellRect(0,TStringGrid(DBGrid1).Row).Top then begin
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.Canvas.Brush.Color := TColor($F0CAA6);
        DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State)
     end;
  if gdSelected in State then begin //Cor da célula selecionada
     DBGrid1.Canvas.Brush.Color := TColor($808000);
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawDataCell(Rect,Column.Field,State)
  end
end;

procedure TfCliente.Consulta;
var
  vAtivo : String;
begin

  if rdbTodos.Checked then
    vAtivo := 'T' // Todos clientes

  else if rdbAtivo.Checked then
    vAtivo := 'S' // Somente ativos

  else
    vAtivo := 'N'; // Somente inativos;

  Cliente.Nome := edPesquisa.Text;

  try
    Cliente.Pesquisar(vAtivo);
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
  Cliente := TClientes.Create;
  PageControl1.TabIndex := 0;
end;

procedure TfCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfCliente.NovoEditar(Tipo: Integer);
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

procedure TfCliente.tbCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  DBGrid1.Enabled := true;
  tbNovo.Enabled := true;
  tbEditar.Enabled := true;
  tbSalvar.Enabled := false;
  tbCancelar.Enabled := false;
  DBCheckBox1.ReadOnly := true;
  DBRadioGroup1.ReadOnly := true;

  DBEditID.ReadOnly := true;
  DBENome.ReadOnly := true;
  DBERG.ReadOnly := true;
  DBECPF.ReadOnly := true;
  DBENasc.ReadOnly := true;
  DBEEndereco.ReadOnly := true;
  DBENumEnd.ReadOnly := true;
  DBEBairro.ReadOnly := true;

  DM.qCliente.Cancel;
end;

procedure TfCliente.tbEditarClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  DBGrid1.Enabled := false;
  tbNovo.Enabled := false;
  tbEditar.Enabled := false;
  tbSalvar.Enabled := true;
  tbCancelar.Enabled := true;
  DBCheckBox1.ReadOnly := false;
  DBRadioGroup1.ReadOnly := false;

  DBEditID.ReadOnly := false;
  DBENome.ReadOnly := false;
  DBERG.ReadOnly := false;
  DBECPF.ReadOnly := false;
  DBENasc.ReadOnly := false;
  DBEEndereco.ReadOnly := false;
  DBENumEnd.ReadOnly := false;
  DBEBairro.ReadOnly := false;

  DM.qCliente.Edit;
  TipoCadastro := 1;
end;

procedure TfCliente.tbNovoClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 1;
  DBGrid1.Enabled := false;
  tbNovo.Enabled := false;
  tbEditar.Enabled := false;
  tbSalvar.Enabled := true;
  tbCancelar.Enabled := true;
  DBCheckBox1.ReadOnly := false;
  DBRadioGroup1.ReadOnly := false;

  DBENome.ReadOnly := false;
  DBERG.ReadOnly := false;
  DBECPF.ReadOnly := false;
  DBENasc.ReadOnly := false;
  DBEEndereco.ReadOnly := false;
  DBENumEnd.ReadOnly := false;
  DBEBairro.ReadOnly := false;

  DBEditID.Clear;
  DBENome.Clear;
  DBERG.Clear;
  DBECPF.Clear;
  DBENasc.Clear;
  DBEEndereco.Clear;
  DBENumEnd.Clear;
  DBEBairro.Clear;

  DM.qCliente.Insert;
  TipoCadastro := 0;
end;

procedure TfCliente.tbSalvarClick(Sender: TObject);
begin

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

  if DBENasc.Text <> '  /  /    ' then
  begin
    try
        Cliente.DtNasc := StrToDate(DBENasc.Text);
    except
      Application.MessageBox('Data inválida. Por favor, verifique!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;

  if DBCheckBox1.Checked then
  begin
    Cliente.Ativo := DBCheckBox1.ValueChecked;
  end
  else
  begin
    Cliente.Ativo := DBCheckBox1.ValueUnchecked;
  end;

//  Cliente.Cadastrar(Cliente);
  NovoEditar(TipoCadastro);
  Consulta;
end;

procedure TfCliente.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cliente.Free;
  Action := caFree;
  fCliente := nil;
end;

end.
