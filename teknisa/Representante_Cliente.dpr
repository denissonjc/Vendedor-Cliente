program Representante_Cliente;

uses
  Vcl.Forms,
  uCadastro_Representante in 'uCadastro_Representante.pas' {fCadastro_Representante},
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  uCadastro_Cliente in 'uCadastro_Cliente.pas' {fCadastro_Cliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfCadastro_Representante, fCadastro_Representante);
  Application.CreateForm(TfCadastro_Cliente, fCadastro_Cliente);
  Application.Run;
end.
