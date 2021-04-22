object fCadastro_Representante: TfCadastro_Representante
  Left = 0
  Top = 0
  Anchors = [akLeft, akBottom]
  Caption = 'Cadastro Representante'
  ClientHeight = 282
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    893
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 0
    Width = 893
    Height = 25
    Align = alTop
    Alignment = taCenter
    Caption = 'Cadastro de representante'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 279
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
    Left = 159
    Top = 127
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object Label10: TLabel
    Left = 8
    Top = 174
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label11: TLabel
    Left = 8
    Top = 125
    Width = 28
    Height = 13
    Caption = 'Sexo:'
  end
  object edtCodigo: TDBEdit
    Left = 8
    Top = 54
    Width = 65
    Height = 21
    DataField = 'rep_ID'
    DataSource = dsRepresentante
    Enabled = False
    TabOrder = 0
  end
  object edtNome: TDBEdit
    Left = 8
    Top = 96
    Width = 338
    Height = 21
    DataField = 'rep_Nome'
    DataSource = dsRepresentante
    TabOrder = 1
  end
  object edtTelefone: TDBEdit
    Left = 159
    Top = 145
    Width = 121
    Height = 21
    DataField = 'rep_Telefone'
    DataSource = dsRepresentante
    TabOrder = 3
  end
  object edtEndereco: TDBEdit
    Left = 8
    Top = 192
    Width = 338
    Height = 21
    DataField = 'rep_Endereco'
    DataSource = dsRepresentante
    TabOrder = 5
  end
  object chbAtivo: TDBCheckBox
    Left = 296
    Top = 145
    Width = 50
    Height = 17
    Caption = 'Ativo'
    DataField = 'rep_Ativo'
    DataSource = dsRepresentante
    TabOrder = 4
  end
  object cbbSexo: TDBComboBox
    Left = 8
    Top = 145
    Width = 145
    Height = 21
    DataField = 'rep_Sexo'
    DataSource = dsRepresentante
    Items.Strings = (
      'Masculino'
      'Feminino'
      'N'#227'o informado')
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 384
    Top = 25
    Width = 509
    Height = 257
    Align = alRight
    TabOrder = 7
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 507
      Height = 255
      Align = alClient
      DataSource = dsRepresentante
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
          FieldName = 'rep_ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Nome'
          Title.Caption = 'Nome'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Telefone'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Endereco'
          Title.Caption = 'Endere'#231'o'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Sexo'
          Title.Caption = 'Sexo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Ativo'
          Title.Caption = 'Ativo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rep_Data_Inclusao'
          Title.Caption = 'Inclus'#227'o'
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 241
    Width = 369
    Height = 41
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    object btIncluir: TButton
      Left = 6
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
  object dsRepresentante: TDataSource
    DataSet = qRepresentante
    Left = 552
    Top = 164
  end
  object qRepresentante: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM representante')
    Left = 560
    Top = 84
    object qRepresentanterep_ID: TFDAutoIncField
      FieldName = 'rep_ID'
      Origin = 'rep_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
    end
    object qRepresentanterep_Nome: TStringField
      FieldName = 'rep_Nome'
      Origin = 'rep_Nome'
      Required = True
      Size = 50
    end
    object qRepresentanterep_Telefone: TStringField
      FieldName = 'rep_Telefone'
      Origin = 'rep_Telefone'
      Required = True
      Size = 15
    end
    object qRepresentanterep_Endereco: TStringField
      FieldName = 'rep_Endereco'
      Origin = 'rep_Endereco'
      Required = True
      Size = 200
    end
    object qRepresentanterep_Sexo: TStringField
      FieldName = 'rep_Sexo'
      Origin = 'rep_Sexo'
      Required = True
      Size = 1
    end
    object qRepresentanterep_Ativo: TBooleanField
      FieldName = 'rep_Ativo'
      Origin = 'rep_Ativo'
      Required = True
    end
    object qRepresentanterep_Data_Inclusao: TDateTimeField
      FieldName = 'rep_Data_Inclusao'
      Origin = 'rep_Data_Inclusao'
      Required = True
    end
  end
end
