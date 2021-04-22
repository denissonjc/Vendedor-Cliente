object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Representante e Cliente'
  ClientHeight = 99
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 447
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 304
      Height = 49
      Align = alClient
      Alignment = taCenter
      Caption = 'Rela'#231#227'o Vendedor e Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 284
      ExplicitHeight = 25
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 304
    Height = 120
    Align = alTop
    BevelOuter = bvNone
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 55
    object dtCadastro_Vendedor: TButton
      Left = 7
      Top = 6
      Width = 130
      Height = 25
      Caption = 'Cadastro Representante'
      TabOrder = 0
      OnClick = dtCadastro_VendedorClick
    end
    object btCadastro_Cliente: TButton
      Left = 143
      Top = 6
      Width = 114
      Height = 25
      Caption = 'Cadastro Cliente'
      TabOrder = 1
      OnClick = btCadastro_ClienteClick
    end
  end
end
