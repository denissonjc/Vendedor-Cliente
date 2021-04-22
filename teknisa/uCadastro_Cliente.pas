unit uCadastro_Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uCadastro_Representante;

type
  TfCadastro_Cliente = class(TForm)
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    edtTelefone: TDBEdit;
    edtEndereco: TDBEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btGravar: TButton;
    btCancelar: TButton;
    Connection: TFDConnection;
    dsCliente: TDataSource;
    qCliente: TFDQuery;
    qClientecli_ID: TFDAutoIncField;
    qClientecli_Nome: TStringField;
    qClienterep_ID: TIntegerField;
    qClientecli_Endereco: TStringField;
    lcbRepresentante: TDBLookupComboBox;
    Label1: TLabel;
    qClienterep_Nome: TStringField;
    qRepresentanteAtivo: TFDQuery;
    qRepresentanteAtivorep_ID: TFDAutoIncField;
    qRepresentanteAtivorep_Nome: TStringField;
    qRepresentanteAtivorep_Endereco: TStringField;
    qRepresentanteAtivorep_Sexo: TStringField;
    qRepresentanteAtivorep_Ativo: TBooleanField;
    qRepresentanteAtivorep_Data_Inclusao: TDateTimeField;
    dsRepresentanteAtivo: TDataSource;
    qClientecli_Telefone: TStringField;
    qRepresentanteAtivorep_Telefone: TStringField;
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ativa(valor: boolean);
    procedure AtivaBotoes(valor: boolean);
  public
    { Public declarations }
  end;

var
  fCadastro_Cliente: TfCadastro_Cliente;

implementation

{$R *.dfm}
{ TfCadastro_Cliente }

procedure TfCadastro_Cliente.ativa(valor: boolean);
begin
  lcbRepresentante.Enabled := valor;
  edtNome.Enabled := valor;
  edtTelefone.Enabled := valor;
  edtEndereco.Enabled := valor;
end;

procedure TfCadastro_Cliente.AtivaBotoes(valor: boolean);
var
  valorOutro: boolean;
begin
  if valor then
    valorOutro := false
  else
    valorOutro := true;

  btIncluir.Enabled := valor;
  btAlterar.Enabled := valor;
  btExcluir.Enabled := valor;
  DBGrid1.Enabled := valor;
  btGravar.Enabled := valorOutro;
  btCancelar.Enabled := valorOutro;

end;

procedure TfCadastro_Cliente.btAlterarClick(Sender: TObject);
begin
  qCliente.Edit;
  ativa(true);
  AtivaBotoes(false);
end;

procedure TfCadastro_Cliente.btCancelarClick(Sender: TObject);
begin
  qCliente.Cancel;
  ativa(false);
  AtivaBotoes(true);
end;

procedure TfCadastro_Cliente.btExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Excluir Representante?', 'Confirma',
    MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
    qCliente.Delete;
end;

procedure TfCadastro_Cliente.btGravarClick(Sender: TObject);
begin
  if ((edtNome.Text = '') or (edtTelefone.Text = '') or (edtEndereco.Text = '')
    or (lcbRepresentante.Text = '')) then
    ShowMessage('Favor preencehr todos os campos!')
  else
  begin
    qCliente.Post;
    Connection.Commit;
    qCliente.Close;
    qCliente.Open();
    ativa(false);
    AtivaBotoes(true);
  end;
end;

procedure TfCadastro_Cliente.btIncluirClick(Sender: TObject);
begin
  qCliente.Insert;
  ativa(true);
  AtivaBotoes(false);
end;

procedure TfCadastro_Cliente.FormShow(Sender: TObject);
begin
  Connection.Connected := true;
  qCliente.Close;
  qCliente.Open();
  qRepresentanteAtivo.Close;
  qRepresentanteAtivo.Open();
  ativa(false);
  AtivaBotoes(true);
end;

end.
