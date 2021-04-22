unit uCadastro_Representante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfCadastro_Representante = class(TForm)
    Label2: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    edtTelefone: TDBEdit;
    edtEndereco: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    chbAtivo: TDBCheckBox;
    cbbSexo: TDBComboBox;
    Label11: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btIncluir: TButton;
    btAlterar: TButton;
    btExcluir: TButton;
    btGravar: TButton;
    btCancelar: TButton;
    DBGrid1: TDBGrid;
    Connection: TFDConnection;
    dsRepresentante: TDataSource;
    qRepresentante: TFDQuery;
    qRepresentanterep_ID: TFDAutoIncField;
    qRepresentanterep_Nome: TStringField;
    qRepresentanterep_Endereco: TStringField;
    qRepresentanterep_Sexo: TStringField;
    qRepresentanterep_Ativo: TBooleanField;
    qRepresentanterep_Data_Inclusao: TDateTimeField;
    qRepresentanterep_Telefone: TStringField;
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ativa(valor: boolean);
    procedure AtivaBotoes(valor: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastro_Representante: TfCadastro_Representante;

implementation

{$R *.dfm}

procedure TfCadastro_Representante.ativa(valor: boolean);
begin
  edtNome.Enabled := valor;
  edtTelefone.Enabled := valor;
  edtEndereco.Enabled := valor;
  cbbSexo.Enabled := valor;
  chbAtivo.Enabled := valor;

  if valor then
    edtNome.SetFocus;
end;

procedure TfCadastro_Representante.btCancelarClick(Sender: TObject);
begin
  qRepresentante.Cancel;
  ativa(false);
  AtivaBotoes(true);
end;

procedure TfCadastro_Representante.btExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Excluir Representante?', 'Confirma',
    MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
    qRepresentante.Delete;
end;

procedure TfCadastro_Representante.btIncluirClick(Sender: TObject);
begin
  qRepresentante.Insert;
  ativa(true);
  AtivaBotoes(false);
end;

procedure TfCadastro_Representante.AtivaBotoes(valor: boolean);
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

procedure TfCadastro_Representante.btAlterarClick(Sender: TObject);
begin
  qRepresentante.Edit;
  ativa(true);
  AtivaBotoes(false);
end;

procedure TfCadastro_Representante.btGravarClick(Sender: TObject);
begin
  if ((edtNome.Text = '') or (edtTelefone.Text = '') or (edtEndereco.Text = '')
    or (cbbSexo.ItemIndex = null)) then
    ShowMessage('Favor preencehr todos os campos!')
  else
  begin

    qRepresentante.FieldByName('rep_Data_Inclusao').AsDateTime := date;

    qRepresentante.Post;
    Connection.Commit;
    ativa(false);
    AtivaBotoes(true);
  end;

end;

procedure TfCadastro_Representante.FormShow(Sender: TObject);
begin
  Connection.Connected := true;
  qRepresentante.Close;
  qRepresentante.Open();
  ativa(false);
  AtivaBotoes(true);
end;

end.
