object fCadastro_Cliente: TfCadastro_Cliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 279
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    918
    279)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 918
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Cadastro de Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 204
  end
  object Label7: TLabel
    Left = 8
    Top = 37
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object Label8: TLabel
    Left = 8
    Top = 79
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label9: TLabel
    Left = 8
    Top = 174
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object Label10: TLabel
    Left = 8
    Top = 126
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label1: TLabel
    Left = 135
    Top = 173
    Width = 76
    Height = 13
    Caption = 'Representante:'
  end
  object edtCodigo: TDBEdit
    Left = 8
    Top = 54
    Width = 65
    Height = 21
    DataField = 'cli_ID'
    DataSource = dsCliente
    Enabled = False
    TabOrder = 0
  end
  object edtNome: TDBEdit
    Left = 8
    Top = 96
    Width = 353
    Height = 21
    DataField = 'cli_Nome'
    DataSource = dsCliente
    TabOrder = 1
  end
  object edtTelefone: TDBEdit
    Left = 8
    Top = 193
    Width = 121
    Height = 21
    DataField = 'cli_Telefone'
    DataSource = dsCliente
    TabOrder = 3
  end
  object edtEndereco: TDBEdit
    Left = 8
    Top = 144
    Width = 353
    Height = 21
    DataField = 'cli_Endereco'
    DataSource = dsCliente
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 367
    Top = 25
    Width = 551
    Height = 254
    Align = alRight
    TabOrder = 6
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 549
      Height = 252
      Align = alClient
      DataSource = dsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cli_Nome'
          Title.Caption = 'Cliente'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cli_Telefone'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cli_Endereco'
          Title.Caption = 'Endere'#231'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Nome'
          Title.Caption = 'Representante'
          Width = 150
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = -4
    Top = 237
    Width = 366
    Height = 41
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    object btIncluir: TButton
      Left = 7
      Top = 7
      Width = 70
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btIncluirClick
    end
    object btAlterar: TButton
      Left = 78
      Top = 7
      Width = 70
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btExcluir: TButton
      Left = 149
      Top = 7
      Width = 70
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btExcluirClick
    end
    object btGravar: TButton
      Left = 220
      Top = 7
      Width = 70
      Height = 25
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = btGravarClick
    end
    object btCancelar: TButton
      Left = 291
      Top = 7
      Width = 70
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btCancelarClick
    end
  end
  object lcbRepresentante: TDBLookupComboBox
    Left = 135
    Top = 193
    Width = 226
    Height = 21
    DataField = 'rep_ID'
    DataSource = dsCliente
    KeyField = 'rep_ID'
    ListField = 'rep_Nome'
    ListSource = dsRepresentanteAtivo
    TabOrder = 4
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=representante_cliente'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 552
    Top = 24
  end
  object dsCliente: TDataSource
    DataSet = qCliente
    Left = 552
    Top = 164
  end
  object qCliente: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT c.cli_ID, c.cli_Nome, c.cli_Telefone, c.rep_ID, c.cli_End' +
        'ereco, r.rep_Nome'
      'FROM cliente c'
      'join representante r on r.rep_ID = c.rep_ID '
      'order by c.rep_ID, c.cli_ID')
    Left = 560
    Top = 84
    object qClientecli_ID: TFDAutoIncField
      FieldName = 'cli_ID'
      Origin = 'cli_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qClientecli_Nome: TStringField
      FieldName = 'cli_Nome'
      Origin = 'cli_Nome'
      Required = True
      Size = 50
    end
    object qClientecli_Telefone: TStringField
      FieldName = 'cli_Telefone'
      Origin = 'cli_Telefone'
      Required = True
      Size = 15
    end
    object qClienterep_ID: TIntegerField
      FieldName = 'rep_ID'
      Origin = 'rep_ID'
      Required = True
    end
    object qClientecli_Endereco: TStringField
      FieldName = 'cli_Endereco'
      Origin = 'cli_Endereco'
      Required = True
      Size = 200
    end
    object qClienterep_Nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'rep_Nome'
      Origin = 'rep_Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qRepresentanteAtivo: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM representante'
      'WHERE representante.rep_Ativo= true')
    Left = 664
    Top = 100
    object qRepresentanteAtivorep_ID: TFDAutoIncField
      FieldName = 'rep_ID'
      Origin = 'rep_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
    end
    object qRepresentanteAtivorep_Nome: TStringField
      FieldName = 'rep_Nome'
      Origin = 'rep_Nome'
      Required = True
      Size = 50
    end
    object qRepresentanteAtivorep_Telefone: TStringField
      FieldName = 'rep_Telefone'
      Origin = 'rep_Telefone'
      Required = True
      Size = 15
    end
    object qRepresentanteAtivorep_Endereco: TStringField
      FieldName = 'rep_Endereco'
      Origin = 'rep_Endereco'
      Required = True
      Size = 200
    end
    object qRepresentanteAtivorep_Sexo: TStringField
      FieldName = 'rep_Sexo'
      Origin = 'rep_Sexo'
      Required = True
      Size = 1
    end
    object qRepresentanteAtivorep_Ativo: TBooleanField
      FieldName = 'rep_Ativo'
      Origin = 'rep_Ativo'
      Required = True
    end
    object qRepresentanteAtivorep_Data_Inclusao: TDateTimeField
      FieldName = 'rep_Data_Inclusao'
      Origin = 'rep_Data_Inclusao'
      Required = True
    end
  end
  object dsRepresentanteAtivo: TDataSource
    DataSet = qRepresentanteAtivo
    Left = 656
    Top = 164
  end
end
