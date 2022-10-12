unit uDM;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZDataset;

type
  TDataModule1 = class(TDataModule)
    zCon: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
