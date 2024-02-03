unit uForms;

interface

uses
  Vcl.Forms;

type
  TForms = class
  public
    procedure CriaForm(aValue: TForm; aClass: TFormClass);
    procedure FecharForm(Sender: TObject; var Action: TCloseAction; PanelVisible: Boolean = True);
  private
    procedure AtivaPanel(PanelVisible: Boolean);
  end;

implementation

uses
  FrmPrincipal;

procedure TForms.CriaForm(aValue: TForm; aClass: TFormClass);
begin
  if not Assigned(aValue) then
    aValue := aClass.Create(fPrincipal)
  else
    aValue.Show;

  AtivaPanel(False);
end;

procedure TForms.FecharForm(Sender: TObject; var Action: TCloseAction; PanelVisible: Boolean = True);
begin
  Action := caFree;
  TForm(Sender) := nil;

  if fPrincipal.MDIChildCount = 1 then
    AtivaPanel(True);
end;

procedure TForms.AtivaPanel(PanelVisible: Boolean);
begin
  fPrincipal.pnlComandas.Visible := PanelVisible;
end;

end.
