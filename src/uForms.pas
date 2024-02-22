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
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I] is aClass then
    begin
      aValue := Screen.Forms[I];
      Break;
    end;
  end;

  if not Assigned(aValue) then
    aValue := aClass.Create(fPrincipal)
  else
    aValue.BringToFront;

  AtivaPanel(False);
end;

procedure TForms.FecharForm(Sender: TObject; var Action: TCloseAction; PanelVisible: Boolean = True);
begin
  Action := caFree;
  TForm(Sender) := nil;

  if fPrincipal.MDIChildCount = 1 then
    AtivaPanel(True)
  else
  begin
    TForm(Sender) := fPrincipal.ActiveMDIChild;
    TForm(Sender).BringToFront;
  end;
end;

procedure TForms.AtivaPanel(PanelVisible: Boolean);
begin
  fPrincipal.pnlComandas.Visible := PanelVisible;
end;

end.
