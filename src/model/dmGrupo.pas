unit dmGrupo;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate, ZAbstractTable;

type
  TdmGrupos = class(TDM)
    dGrupo: TDataSource;
    qGrupo: TZQuery;
    uGrupo: TZUpdateSQL;
    qGrupoid: TIntegerField;
    qGrupodescricao: TWideStringField;
    qGrupoativo: TWideStringField;
    procedure qGrupoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGrupos: TdmGrupos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmGrupos.qGrupoNewRecord(DataSet: TDataSet);
begin
  qGrupoativo.AsString := 'S';
end;

end.
