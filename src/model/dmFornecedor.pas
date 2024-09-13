unit dmFornecedor;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZSqlUpdate, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZAbstractTable;

type
  TdmFornecedores = class(TDM)
    dFornecedor: TDataSource;
    uFornecedor: TZUpdateSQL;
    qFornecedor: TZQuery;
    qFornecedorid: TZInt64Field;
    qFornecedornome: TZUnicodeStringField;
    qFornecedorie: TZUnicodeStringField;
    qFornecedorCNPJ: TZUnicodeStringField;
    qFornecedorendereco: TZUnicodeStringField;
    qFornecedornumEndereco: TZUnicodeStringField;
    qFornecedorbairro: TZUnicodeStringField;
    qFornecedordtRegistro: TZDateField;
    qFornecedorativo: TZUnicodeStringField;
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
