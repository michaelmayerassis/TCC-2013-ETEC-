object FRMCadItensMenu: TFRMCadItensMenu
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Itens de Menu'
  ClientHeight = 201
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LBLDescItem: TLabel
    Left = 32
    Top = 72
    Width = 125
    Height = 16
    Caption = 'Descri'#231#227'o do Item '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBEDescItem: TDBEdit
    Left = 32
    Top = 104
    Width = 385
    Height = 24
    DataField = 'DESCRICAO_ITEM'
    DataSource = DTSItem
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Reference Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 568
    Height = 35
    ButtonHeight = 32
    Caption = 'ToolBar1'
    TabOrder = 1
    object BTNCadastrar: TSpeedButton
      Left = 0
      Top = 0
      Width = 75
      Height = 32
      Hint = 'Cadastrar Registro'
      Caption = 'Cadastrar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNCadastrarClick
    end
    object BTNsalvar: TSpeedButton
      Left = 75
      Top = 0
      Width = 75
      Height = 32
      Hint = 'Salvar registro'
      Caption = 'Salvar'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNsalvarClick
    end
    object BTNEditar: TSpeedButton
      Left = 150
      Top = 0
      Width = 75
      Height = 32
      Hint = 'Editar Registro'
      Caption = 'Editar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNEditarClick
    end
    object BTNCancelar: TSpeedButton
      Left = 225
      Top = 0
      Width = 75
      Height = 32
      Hint = 'Cancelar Opera'#231#227'o'
      Caption = 'Cancelar'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNCancelarClick
    end
    object BTNExcluir: TSpeedButton
      Left = 300
      Top = 0
      Width = 75
      Height = 32
      Hint = 'Excluir registro'
      Caption = 'Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNExcluirClick
    end
    object SBTNPrimeiro: TSpeedButton
      Left = 375
      Top = 0
      Width = 46
      Height = 32
      Hint = 'Primeiro Registro'
      Caption = '<<'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBTNPrimeiroClick
    end
    object SBTNAnterior: TSpeedButton
      Left = 421
      Top = 0
      Width = 46
      Height = 32
      Hint = 'Registro Anterior'
      Caption = '<'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBTNAnteriorClick
    end
    object SBTNProximo: TSpeedButton
      Left = 467
      Top = 0
      Width = 46
      Height = 32
      Hint = 'Pr'#243'ximo Registro'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBTNProximoClick
    end
    object SBTNUltimo: TSpeedButton
      Left = 513
      Top = 0
      Width = 46
      Height = 32
      Hint = #218'ltimo Registro'
      Caption = '>>'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBTNUltimoClick
    end
  end
  object DTSItem: TDataSource
    DataSet = QUEItem
    Left = 432
    Top = 72
  end
  object QUEItem: TADOQuery
    Connection = FRMPrincipal.DBPrincipal
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM ITEM ')
    Left = 424
    Top = 120
    object QUEItemCOD_ITEM: TAutoIncField
      FieldName = 'COD_ITEM'
      ReadOnly = True
    end
    object QUEItemDESCRICAO_ITEM: TStringField
      FieldName = 'DESCRICAO_ITEM'
      Size = 30
    end
  end
end