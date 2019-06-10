object FRMRelatorio_Cliente: TFRMRelatorio_Cliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Cliente'
  ClientHeight = 513
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 72
    Top = 64
    Width = 500
    Height = 294
    TabOrder = 0
    ControlData = {
      4C000000AD330000631E00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object QUEClientes: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTE')
    Left = 544
    Top = 456
    object QUEClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 50
    end
    object QUEClientesCLI_ENDERECO: TStringField
      FieldName = 'CLI_ENDERECO'
      Size = 50
    end
    object QUEClientesCLI_CEP: TStringField
      FieldName = 'CLI_CEP'
      FixedChar = True
      Size = 8
    end
    object QUEClientesCLI_RG: TStringField
      FieldName = 'CLI_RG'
      FixedChar = True
      Size = 9
    end
    object QUEClientesCLI_COMPLEMENTO: TStringField
      FieldName = 'CLI_COMPLEMENTO'
      Size = 50
    end
    object QUEClientesCLI_CPF: TStringField
      FieldName = 'CLI_CPF'
      FixedChar = True
      Size = 11
    end
    object QUEClientesCLI_ESTADO: TStringField
      FieldName = 'CLI_ESTADO'
      FixedChar = True
      Size = 2
    end
    object QUEClientesCLI_DATA_NASC: TWideStringField
      FieldName = 'CLI_DATA_NASC'
      Size = 10
    end
    object QUEClientesCLI_BAIRRO: TStringField
      FieldName = 'CLI_BAIRRO'
      Size = 50
    end
    object QUEClientesCLI_CIDADE: TStringField
      FieldName = 'CLI_CIDADE'
      Size = 50
    end
    object QUEClientesCLI_TELEFONE: TStringField
      FieldName = 'CLI_TELEFONE'
      Size = 11
    end
    object QUEClientesCLI_TELEFONE2: TStringField
      FieldName = 'CLI_TELEFONE2'
      Size = 11
    end
    object QUEClientesCLI_EMAIL: TStringField
      FieldName = 'CLI_EMAIL'
      Size = 50
    end
    object QUEClientesCLI_EMAIL2: TStringField
      FieldName = 'CLI_EMAIL2'
      Size = 50
    end
    object QUEClientesCOD_CLI: TAutoIncField
      FieldName = 'COD_CLI'
      ReadOnly = True
    end
    object QUEClientesCLI_PATH: TStringField
      FieldName = 'CLI_PATH'
      Size = 150
    end
  end
  object DTSClientes: TDataSource
    DataSet = QUEClientes
    Left = 616
    Top = 456
  end
end
