unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    dtCadastro_Vendedor: TButton;
    btCadastro_Cliente: TButton;
    procedure dtCadastro_VendedorClick(Sender: TObject);
    procedure btCadastro_ClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

uses
  uCadastro_Representante, uCadastro_Cliente;

{$R *.dfm}

procedure TfPrincipal.btCadastro_ClienteClick(Sender: TObject);
begin
  if not Assigned(fCadastro_Representante) then
    fCadastro_Cliente := TfCadastro_Cliente.Create(Application);

  fCadastro_Cliente.Show;
end;

procedure TfPrincipal.dtCadastro_VendedorClick(Sender: TObject);
begin
  if not Assigned(fCadastro_Representante) then
    fCadastro_Representante := TfCadastro_Representante.Create(Application);

  fCadastro_Representante.Show;
end;

end.
