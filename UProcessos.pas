unit UProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, DB, ADODB, Buttons, ToolWin,
  ComCtrls, jpeg,StrUtils, RpBase, RpSystem, RpCon, RpConDS, RpDefine, RpRave;

type
  TFRMProcessos = class(TForm)
    LBLTipoProcesso: TLabel;
    LBLNome_parte_contraria: TLabel;
    LBLNumero_processo: TLabel;
    LBLVara: TLabel;
    LBLCliente: TLabel;
    LBLAdvogado_parte_contraria: TLabel;
    LBLTelefone_Advogado: TLabel;
    LBLEmail_Advogado: TLabel;
    LBLValorCausa: TLabel;
    LBLDataCitacao: TLabel;
    LBLDataDistribuicao: TLabel;
    LBLObs: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LBLNOrdem: TLabel;
    BTNCadastrar_Andamento: TSpeedButton;
    DBCBProcessos: TDBComboBox;
    DBENumero_Processo: TDBEdit;
    DBEExecutado: TDBEdit;
    DBEVara: TDBEdit;
    DBLCBCliente: TDBLookupComboBox;
    DBEAdvogado_parte_contraria: TDBEdit;
    DBETelefone_Advogado: TDBEdit;
    DBEEmail_advogado: TDBEdit;
    DBEDataDistribuicao: TDBEdit;
    DBEDataCitacao: TDBEdit;
    DBEValorCausa: TDBEdit;
    DBCBTipoCliente: TDBComboBox;
    DBCBTipoExecutado: TDBComboBox;
    ToolBar1: TToolBar;
    BTNCadastrar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNCancelar: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBETelefoneExecutado: TDBEdit;
    DBEEmailExecutado: TDBEdit;
    DBObservacoes: TDBMemo;
    DBENOrdem: TDBEdit;
    QUEProcesso: TADOQuery;
    QUEProcessoNUMERO_VARA_PROCESSO: TIntegerField;
    QUEProcessoTIPO_PROCESSO: TStringField;
    QUEProcessoTIPO_CLIENTE: TStringField;
    QUEProcessoNOME_EXECUTADO: TStringField;
    QUEProcessoTIPO_EXECUTADO: TStringField;
    QUEProcessoNOME_ADVOGADO: TStringField;
    QUEProcessoEMAIL_EXECUTADO: TStringField;
    QUEProcessoTELEFONE_EXECUTADO: TStringField;
    QUEProcessoDATA_DISTRIBUICAO: TWideStringField;
    QUEProcessoDATA_CITACAO: TWideStringField;
    QUEProcessoVALOR_CAUSA: TFloatField;
    QUEProcessoEMAIL_ADVOGADO: TStringField;
    QUEProcessoTELEFONE_ADVOGADO: TStringField;
    QUEProcessoNUMERO_ORDEM: TStringField;
    QUEProcessoOBS_PROCESSO: TMemoField;
    DTSProcesso: TDataSource;
    DTSClientes: TDataSource;
    BTNPesquisar: TBitBtn;
    QUEProcessoNUMERO_PROCESSO: TStringField;
    QUEProcessoCLI_CPF: TStringField;
    QUEClientes: TADOQuery;
    QUEClientesCLI_CPF: TStringField;
    QUEClientesCLI_NOME: TStringField;
    QUEClientesCLI_ENDERECO: TStringField;
    QUEClientesCLI_CEP: TStringField;
    QUEClientesCLI_RG: TStringField;
    QUEClientesCLI_COMPLEMENTO: TStringField;
    QUEClientesCLI_ESTADO: TStringField;
    QUEClientesCLI_BAIRRO: TStringField;
    QUEClientesCLI_CIDADE: TStringField;
    QUEClientesCLI_TELEFONE: TStringField;
    QUEClientesCLI_TELEFONE2: TStringField;
    QUEClientesCLI_EMAIL: TStringField;
    QUEClientesCLI_EMAIL2: TStringField;
    QUEClientesCLI_PATH: TStringField;
    QUEClientesCLI_NUMERO: TStringField;
    QUEClientesCLI_DATA_NASC: TStringField;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNAnd_procClick(Sender: TObject);
    procedure SBTNLocalizarProcClick(Sender: TObject);
    procedure BTNInserirClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SBTNLocalizarClick(Sender: TObject);
    procedure BTNPesquisarClick(Sender: TObject);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNCadastrar_AndamentoClick(Sender: TObject);
    procedure QUEProcessoBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBLCBClienteKeyPress(Sender: TObject; var Key: Char);
    procedure DBObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure DBEVaraKeyPress(Sender: TObject; var Key: Char);
    procedure DBEValorCausaKeyPress(Sender: TObject; var Key: Char);
    procedure DBENumero_ProcessoKeyPress(Sender: TObject; var Key: Char);
    procedure DBENOrdemKeyPress(Sender: TObject; var Key: Char);
    procedure DBEExecutadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEEmailExecutadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBETelefone_AdvogadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBETelefoneExecutadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDataDistribuicaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDataCitacaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEAdvogado_parte_contrariaKeyPress(Sender: TObject;
      var Key: Char);
    procedure DBCBTipoExecutadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBCBTipoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure DBCBProcessosKeyPress(Sender: TObject; var Key: Char);
    procedure DBEDataCitacaoExit(Sender: TObject);
    procedure DBEDataDistribuicaoExit(Sender: TObject);
    procedure DBLCBClienteClick(Sender: TObject);
    procedure DBCBTipoClienteClick(Sender: TObject);
    procedure DBCBProcessosClick(Sender: TObject);
    procedure DBENumero_ProcessoClick(Sender: TObject);
    procedure DBENOrdemClick(Sender: TObject);
    procedure DBEVaraClick(Sender: TObject);
    procedure DBEDataCitacaoClick(Sender: TObject);
    procedure DBEDataDistribuicaoClick(Sender: TObject);
    procedure DBEValorCausaClick(Sender: TObject);
    procedure DBObservacoesClick(Sender: TObject);
    procedure DBEExecutadoClick(Sender: TObject);
    procedure DBEEmailExecutadoClick(Sender: TObject);
    procedure DBEAdvogado_parte_contrariaClick(Sender: TObject);
    procedure DBEEmail_advogadoClick(Sender: TObject);
    procedure DBETelefone_AdvogadoClick(Sender: TObject);
    procedure DBETelefoneExecutadoClick(Sender: TObject);
    procedure DBCBTipoExecutadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    function IsValidEmail(const Email: string) : Boolean;
    function DataOk(Dt:String):Boolean; stdcall;
  end;

var
  FRMProcessos: TFRMProcessos;

implementation

uses UPrincipal, UAndamento_Processo, ULocalizarProc, UClientes;

{$R *.dfm}

procedure TFRMProcessos.BTNPesquisarClick(Sender: TObject);
begin
 Application.CreateForm(TFRMLocalizarProc,FRMLocalizarProc);
  FRMLocalizarProc.ShowModal
end;

procedure TFRMProcessos.BTNAnd_procClick(Sender: TObject);
begin
application.CreateForm(TFRMAndamento_processo,FRMAndamento_processo);
FRMAndamento_processo.ShowModal;
end;

procedure TFRMProcessos.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
   BTNEditar.Enabled:=False;
   BTNsalvar.Enabled:=True;
   BTNCancelar.Enabled:=True;
   QUEProcesso.Insert;
   DBLCBCliente.SetFocus;
end;

procedure TFRMProcessos.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEProcesso.Cancel;
end;

procedure TFRMProcessos.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEProcesso.Edit;
end;

procedure TFRMProcessos.BTNExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir o Processo?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
   begin
   QUEProcesso.Delete;
   if QUEProcesso.isEmpty  then
   BTNExcluir.Enabled:= False;
   end;
end;

procedure TFRMProcessos.BTNInserirClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEProcesso.Insert;
end;

procedure TFRMProcessos.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEProcesso.Post;
  ShowMessage('Salvo!');
end;

function TFRMProcessos.DataOk(Dt: String): Boolean;
var Dia,Mes:Byte;
    Ano:Integer;
function AnoBissesto(Year :Integer): boolean ;
begin
  AnoBissesto:=(ano mod 4=0) and ( ano mod 100 <> 0) or (ano Mod 400 =0);
end;
begin
  Result:=False;
  if length(Trim(Dt)) = 10 then
    begin
      Dia:=StrToIntDef(Copy(Dt,1,2),0);
      Mes:=StrToIntDef(Copy(Dt,4,2),0);
      Ano:=StrToInt(Copy(Dt,7,4));
      if ( (Mes in [1,3,5,7,8,10,12]) and (Dia in [1..31]) ) or
        ( (Mes in [4,6,9,11]) and (Dia in [1..30]) ) or
        ( (Mes = 2) and ( AnoBissesto(Ano)) and (Dia in [1..29]) ) or
        ( (Mes = 2) and (not AnoBissesto(Ano)) and (Dia in [1..28]) ) then
        Result:=True;
    end;
end;

procedure TFRMProcessos.DBCBProcessosClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBCBProcessosKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBENumero_Processo.SetFocus;
    key := #0;
end;
end;

procedure TFRMProcessos.DBCBTipoClienteClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMProcessos.DBCBTipoClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBCBProcessos.SetFocus;
    key := #0;
end;
end;

procedure TFRMProcessos.DBCBTipoExecutadoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBCBTipoExecutadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBEEmailExecutado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEAdvogado_parte_contrariaClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBEAdvogado_parte_contrariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBETelefone_Advogado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEDataCitacaoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBEDataCitacaoExit(Sender: TObject);
begin
if not DataOk(DBEDataCitacao.Text) then
ShowMessage('Data inválida');
end;

procedure TFRMProcessos.DBEDataCitacaoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBEDataDistribuicao.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEDataDistribuicaoClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMProcessos.DBEDataDistribuicaoExit(Sender: TObject);
begin
if not DataOk(DBEDataDistribuicao.Text) then
ShowMessage('Data inválida');
end;

procedure TFRMProcessos.DBEDataDistribuicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBEValorCausa.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEEmailExecutadoClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMProcessos.DBEEmailExecutadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBETelefoneExecutado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEEmail_advogadoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBEExecutadoClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMProcessos.DBEExecutadoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBCBTipoExecutado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBENOrdemClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBENOrdemKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBEVara.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBENumero_ProcessoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBENumero_ProcessoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBENOrdem.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBETelefoneExecutadoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBETelefoneExecutadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBEAdvogado_parte_contraria.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBETelefone_AdvogadoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBETelefone_AdvogadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    DBEEmail_advogado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEValorCausaClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBEValorCausaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBObservacoes.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBEVaraClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMProcessos.DBEVaraKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBEDataCitacao.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBLCBClienteClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBLCBClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBCBTipoCliente.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.DBObservacoesClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
end;

procedure TFRMProcessos.DBObservacoesKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBEExecutado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMProcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QUEProcesso.Close;
  QUEClientes.Close;

end;

procedure TFRMProcessos.FormCreate(Sender: TObject);
begin
QUEProcesso.Open;
QUEClientes.Open;
end;

procedure TFRMProcessos.FormShow(Sender: TObject);
begin
  BTNCadastrar.Click;
  BTNCancelar.Enabled:= False;
   if QUEProcesso.isEmpty  then
   BTNExcluir.Enabled:= False;

 if trim (FRMPrincipal.TIPO)='' then
  begin
DBENumero_Processo.ReadOnly:=TRUE;
DBEVara.ReadOnly:=TRUE;
DBEExecutado.ReadOnly:=TRUE;
DBEAdvogado_parte_contraria.ReadOnly:=TRUE;
DBETelefone_Advogado.ReadOnly:=TRUE;
DBETelefone_Advogado.ReadOnly:=TRUE;
DBEEmail_advogado.ReadOnly:=TRUE;
DBEDataDistribuicao.ReadOnly:=TRUE;
DBEDataCitacao.ReadOnly:=TRUE;
DBEValorCausa.ReadOnly:=TRUE;
DBETelefoneExecutado.ReadOnly:=TRUE;
DBEEmailExecutado.ReadOnly:=TRUE;
DBCBProcessos.ReadOnly:=TRUE;
DBCBTipoCliente.ReadOnly:=TRUE;
DBCBTipoExecutado.ReadOnly:=TRUE;
DBLCBCliente.ReadOnly:=TRUE;
DBENOrdem.ReadOnly:=True;
  end;
end;

function TFRMProcessos.IsValidEmail(const Email: string): Boolean;
const
  InvalidChar = 'àâêôûãõáéíóúçüñýÀÂÊÔÛÃÕÁÉÍÓÚÇÜÑÝ*;:⁄\|#$%&*§!()][{}<>˜ˆ´ªº+¹²³';
var
  I: Integer;
  C: Integer;
begin
  // Não existe email com menos de 8 caracteres.
  if Length(Email) < 8 then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se há somente um @
  if ((Pos( '@', Email) = 0) or
  (PosEx( '@', Email, Pos('@', Email) + 1) > 0)) then
  begin
    Result := False;
    Exit;
  end;

  // Verificando se no m�nimo há um ponto
  if (Pos('.', Email) = 0) then
  begin
    Result := False;
    Exit;
  end;

  // Não pode começar ou terminar com @ ou ponto
  if (Email[1] in ['@', '.']) or
  (Email[Length(Email)] in ['@', '.']) then
  begin
    Result := False;
    Exit;
  end;

  // O @ e o ponto não podem estar juntos
  if (Email[Pos( '@', Email) + 1] = '.') or
  (Email[Pos( '@', Email) - 1] = '.') then
  begin
    Result := False;
    Exit;
  end;

  // Testa se tem algum caracter inválido.
  for I := 1 to Length(Email) do
  begin
    for C := 0 to Length(InvalidChar) do
      if (Email[I] = InvalidChar[C]) then
      begin
        Result := False;
        Exit;
      end;
  end;

  // Se não encontrou problemas, retorna verdadeiro
  Result := True;
end;

procedure TFRMProcessos.QUEProcessoBeforePost(DataSet: TDataSet);
begin
  if not IsValidEmail( DBEEmail_advogado.Text) then
  begin
    if not (Application.MessageBox('Formato do E-mail do advogado incorreto salvar mesmo assim?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
    begin
    BTNsalvar.Enabled:=true;
    BTNEditar.Enabled:=False;
    BTNCancelar.Enabled:=true;
    BTNCadastrar.Enabled:=False ;
    abort;
    end
  end;

    if not IsValidEmail( DBEEmailExecutado.Text) then
  begin
    if not (Application.MessageBox('Formato do E-mail da parte contrária incorreto salvar mesmo assim?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
    begin
    BTNsalvar.Enabled:=true;
    BTNEditar.Enabled:=False;
    BTNCancelar.Enabled:=true;
    BTNCadastrar.Enabled:=False ;
    abort;
    end
  end;

  if Trim (DBENumero_Processo.Text)= '       -  .    . .  .    ' then
  begin
    showmessage('Preencha o número do processo');
    DBENumero_Processo.setfocus;
    abort;
  end;

    if Trim (DBEExecutado.Text)= '' then
  begin
    showmessage('Preencha o nome da parte contrária');
    DBEExecutado.setfocus;
    abort;
  end;

      if Trim (DBEVara.Text)= '' then
  begin
    showmessage('Preencha a vara do processo');
    DBEVara.setfocus;
    abort;
  end;

      if Trim (DBEAdvogado_parte_contraria.Text)= '' then
  begin
    showmessage('Preencha o nome do advogado da parte contrária');
    DBEAdvogado_parte_contraria.setfocus;
    abort;

        if Trim (DBETelefone_Advogado.Text)= '(  )    -    ' then
  begin
    showmessage('Preencha o nome da parte contrária');
    DBEAdvogado_parte_contraria.setfocus;
    abort;
  end;

      if Trim (DBEDataDistribuicao.Text)= '  /  /    ' then
  begin
    showmessage('Preencha a data de distribuição');
    DBEDataDistribuicao.setfocus;
    abort;
  end;

        if Trim (DBEDataCitacao.Text)= '  /  /    ' then
  begin
    showmessage('Preencha a data de citação');
    DBEDataCitacao.setfocus;
    abort;
  end;
  end;
end;

procedure TFRMProcessos.SBTNLocalizarClick(Sender: TObject);
begin
  Application.CreateForm(TFRMLocalizarProc,FRMLocalizarProc);
  FRMLocalizarProc.ShowModal
end;

procedure TFRMProcessos.SBTNLocalizarProcClick(Sender: TObject);
begin
  Application.CreateForm(TFRMLocalizarProc,FRMLocalizarProc);
  FRMLocalizarProc.ShowModal;
end;

procedure TFRMProcessos.BTNCadastrar_AndamentoClick(Sender: TObject);
begin
Application.CreateForm(TFRMAndamento_Processo,FRMAndamento_Processo);
FRMAndamento_Processo.Show;
FRMAndamento_Processo.BTNCadastrar.Enabled:=false;
FRMAndamento_Processo.BTNExcluir.Enabled:=True;
FRMAndamento_Processo.BTNsalvar.Enabled:=True;
FRMAndamento_Processo.DBENome_cli.Enabled:=false;
FRMAndamento_Processo.DBEVara.Enabled:=false;
FRMAndamento_Processo.DBEExecutado.Enabled:=false;
FRMAndamento_Processo.DBENumero_Processo.Enabled:=false;
FRMAndamento_Processo.QUEAndamento_processo.Insert;
FRMAndamento_Processo.DBENumero_Processo.text:=DBENumero_Processo.Text;
FRMAndamento_Processo.DBENome_cli.text:=DBLCBCliente.Text;
FRMAndamento_Processo.DBEExecutado.text:=DBEExecutado.Text;
FRMAndamento_Processo.DBEVara.text:=DBEVara.Text;
FRMAndamento_Processo.DBMHistorico.SetFocus;
Close;
end;

procedure TFRMProcessos.SpeedButton4Click(Sender: TObject);
begin
  QUEProcesso.Last;
  BTNCancelar.Click;
end;

procedure TFRMProcessos.SpeedButton6Click(Sender: TObject);
begin
  QUEProcesso.First;
  BTNCancelar.Click;
end;

procedure TFRMProcessos.SpeedButton7Click(Sender: TObject);
begin
  QUEProcesso.Prior;
  BTNCancelar.Click;
end;

procedure TFRMProcessos.SpeedButton8Click(Sender: TObject);
begin
  QUEProcesso.Next;
  BTNCancelar.Click;
end;

end.
