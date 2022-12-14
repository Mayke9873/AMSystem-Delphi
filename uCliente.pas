unit uCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZDataset, Vcl.ComCtrls, Vcl.Tabs, Vcl.DockTabSet,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, ZAbstractDataset, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, ZSqlUpdate;

type
  TfCliente = class(TForm)
    dCliente: TDataSource;
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
    DBEditID: TDBEdit;
    DBENome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBERG: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEEndereco: TDBEdit;
    DBENumEnd: TDBEdit;
    DBEBairro: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    DBECPF: TDBEdit;
    DBENasc: TDBEdit;
    uCliente: TZUpdateSQL;
    qCliente: TZQuery;
    qClienteid: TIntegerField;
    qClientenome: TWideStringField;
    qClienterg: TWideStringField;
    qClienteCPFCNPJ: TWideStringField;
    qClienteDtNasc: TDateField;
    qClienteendereco: TWideStringField;
    qClientenumEndereco: TWideStringField;
    qClientebairro: TWideStringField;
    qClienteDtRegistro: TDateField;
    qClientetipo: TWideStringField;
    qClienteativo: TWideStringField;
    Label9: TLabel;
    edPesquisa: TEdit;
    rdbTodos: TRadioButton;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
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
  private
    { Private declarations }
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

procedure TfCliente.Consulta;
begin
  if rdbTodos.Checked then
  begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bairro, dtregistro, Tipo, Ativo ' +
      'FROM CLIENTE where ((id = ' + QuotedStr(edPesquisa.Text) + ') or  (nome like ' +
      QuotedStr('%' + edPesquisa.Text + '%') + '));');
    qCliente.Open;
  end;

  if rdbAtivo.Checked then
  begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bairro, dtregistro, Tipo, Ativo ' +
      'FROM CLIENTE where ativo = ' + QuotedStr('S') + ' and ((id = ' + QuotedStr(edPesquisa.Text) + ') or  ' + '(nome like ' +
      QuotedStr('%' + edPesquisa.Text + '%') + '));');
    qCliente.Open;
  end;

  if rdbInativo.Checked then
  begin
    qCliente.Close;
    qCliente.SQL.Clear;
    qCliente.SQL.Add('SELECT Id, Nome, RG, CpfCnpj, dtnasc, Endereco, numendereco, Bairro, dtregistro, Tipo, Ativo ' +
      'FROM CLIENTE where ativo = ' + QuotedStr('N') + ' and ((id = ' + QuotedStr(edPesquisa.Text) + ') or  ' + '(nome like ' +
      QuotedStr('%' + edPesquisa.Text + '%') + '));');
    qCliente.Open;
  end;
end;

procedure TfCliente.edPesquisaChange(Sender: TObject);
begin
  Consulta;
end;

procedure TfCliente.FormActivate(Sender: TObject);
begin
  qCliente.Open;
end;

procedure TfCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
end;

procedure TfCliente.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  tbNovo.Enabled := true;
  tbEditar.Enabled := true;
  tbSalvar.Enabled := false;
  tbCancelar.Enabled := false;
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

procedure TfCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
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

  qCliente.Cancel;
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

  qCliente.Edit;
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

  qCliente.Insert;
end;

procedure TfCliente.tbSairClick(Sender: TObject);
begin
  Destroy;
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

  if DBENome.GetTextLen <> 0 then
  begin
    qClientenome.asString := DBENome.Text;
    qClienterg.asString := DBERG.Text;
    qClienteCPFCNPJ.asString := DBECPF.Text;
    qClienteendereco.asString := DBEEndereco.Text;
    qClientenumEndereco.asString := DBENumEnd.Text;
    qClientebairro.asString := DBEBairro.Text;

    if DBCheckBox1.Checked then
    begin
      qClienteativo.Value := DBCheckBox1.ValueChecked;
    end
    else
    begin
      qClienteativo.Value := DBCheckBox1.ValueUnchecked;
    end;

    if DBENasc.Text <> '' then
      qClienteDtNasc.AsDateTime := StrToDate(DBENasc.Text);

    qCliente.Post;
  end
  else
  begin
    qCliente.Cancel;
    ShowMessage('Campo Nome obrigat?rio!');
  end;

  qCliente.Close;
  qCliente.Open;
end;

end.
