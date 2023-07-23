unit dmFornecedor;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TdmFornecedores = class(TDM)
    dFornecedor: TDataSource;
    uFornecedor: TZUpdateSQL;
    qFornecedor: TZQuery;
    qFornecedorid: TIntegerField;
    qFornecedornome: TWideStringField;
    qFornecedorie: TWideStringField;
    qFornecedorCNPJ: TWideStringField;
    qFornecedorendereco: TWideStringField;
    qFornecedornumEndereco: TWideStringField;
    qFornecedorbairro: TWideStringField;
    qFornecedordtRegistro: TDateField;
    qFornecedorativo: TWideStringField;
    procedure qFornecedorNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFornecedores: TdmFornecedores;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmFornecedores.qFornecedorNewRecord(DataSet: TDataSet);
begin
//  inherited;
  qFornecedorativo.AsString := 'S';
  qFornecedordtRegistro.AsDateTime := Date;
end;

end.
