unit UClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, ADODB, Mask, ExtDlgs, Buttons,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWDBStdCtrls,
  ToolWin, ComCtrls,JPEG, pngimage,StrUtils, RpBase, RpSystem, RpCon, RpConDS,
  RpDefine, RpRave;

type
  TFRMClientes = class(TForm)
    LBLCliente: TLabel;
    Label2: TLabel;
    LBLEstado: TLabel;
    LBLTelefone: TLabel;
    DBCBEstado: TDBComboBox;
    DTSClientes: TDataSource;
    DBENome: TDBEdit;
    DBEEndereco: TDBEdit;
    DBETelefone: TDBEdit;
    DBETelefone2: TDBEdit;
    LBLRG: TLabel;
    DBERG: TDBEdit;
    LBLEmail: TLabel;
    DBEEmail: TDBEdit;
    LBLTelefone2: TLabel;
    Label4: TLabel;
    DBEComplemento: TDBEdit;
    LBLEmail2: TLabel;
    DBEEmail2: TDBEdit;
    BTNCarregarImagem: TBitBtn;
    BTNLimpar: TBitBtn;
    OPDImagem: TOpenPictureDialog;
    DBEBairro: TDBEdit;
    LBLBairro: TLabel;
    LBLCidade: TLabel;
    DBECidade: TDBEdit;
    LBLCEP: TLabel;
    DBECEP: TDBEdit;
    QUEClientes: TADOQuery;
    QUEClientesCLI_NOME: TStringField;
    QUEClientesCLI_ENDERECO: TStringField;
    QUEClientesCLI_CEP: TStringField;
    QUEClientesCLI_COMPLEMENTO: TStringField;
    QUEClientesCLI_ESTADO: TStringField;
    QUEClientesCLI_DATA_NASC: TWideStringField;
    QUEClientesCLI_BAIRRO: TStringField;
    QUEClientesCLI_CIDADE: TStringField;
    QUEClientesCLI_TELEFONE: TStringField;
    QUEClientesCLI_TELEFONE2: TStringField;
    QUEClientesCLI_EMAIL: TStringField;
    QUEClientesCLI_EMAIL2: TStringField;
    DBECPF: TDBEdit;
    LBLCPF: TLabel;
    ToolBar1: TToolBar;
    BTNCadastrar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    SBTNUltimo: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SBTNPrimeiro: TSpeedButton;
    SBTNAnterior: TSpeedButton;
    SBTNProximo: TSpeedButton;
    BTNCancelar: TSpeedButton;
    Label1: TLabel;
    DBEData_Nascimento: TDBEdit;
    IMGClientes: TImage;
    BTBTNCadProc: TBitBtn;
    BitBtn1: TBitBtn;
    QUEClientesCLI_PATH: TStringField;
    DBENumero: TDBEdit;
    LBLNumero: TLabel;
    QUEClientesCLI_NUMERO: TStringField;
    QUEClientesCLI_RG: TStringField;
    QUEClientesCLI_CPF: TStringField;
    edtnome: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCarregarImagemClick(Sender: TObject);
    procedure BTNLimparClick(Sender: TObject);
    procedure BTNCadastrar_processosClick(Sender: TObject);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
    procedure BTNFecharClick(Sender: TObject);
    procedure SBTNLocalizarClick(Sender: TObject);
    procedure DTSClientesDataChange(Sender: TObject; Field: TField);
    procedure QUEClientesBeforePost(DataSet: TDataSet);
    procedure QUEClientesAfterPost(DataSet: TDataSet);
    procedure DBECPFExit(Sender: TObject);
    procedure DBENomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBEEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEBairroKeyPress(Sender: TObject; var Key: Char);
    procedure DBECidadeKeyPress(Sender: TObject; var Key: Char);
    procedure DBCBEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure DBECEPKeyPress(Sender: TObject; var Key: Char);
    procedure DBETelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure DBETelefone2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEEmailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEEmail2KeyPress(Sender: TObject; var Key: Char);
    procedure DBECPFKeyPress(Sender: TObject; var Key: Char);
    procedure DBERGKeyPress(Sender: TObject; var Key: Char);
    procedure DBEComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure BTBTNCadProcClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEData_NascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBENomeClick(Sender: TObject);
    procedure DBEEnderecoClick(Sender: TObject);
    procedure DBENumeroClick(Sender: TObject);
    procedure DBEBairroClick(Sender: TObject);
    procedure DBECidadeClick(Sender: TObject);
    procedure DBCBEstadoClick(Sender: TObject);
    procedure DBECEPClick(Sender: TObject);
    procedure DBETelefoneClick(Sender: TObject);
    procedure DBETelefone2Click(Sender: TObject);
    procedure DBEEmailClick(Sender: TObject);
    procedure DBEEmail2Click(Sender: TObject);
    procedure DBEData_NascimentoClick(Sender: TObject);
    procedure DBECPFClick(Sender: TObject);
    procedure DBERGClick(Sender: TObject);
    procedure DBEComplementoClick(Sender: TObject);
    procedure DBENumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBEData_NascimentoExit(Sender: TObject);
    procedure actRelGeralExecute(Sender: TObject);
    procedure actRelDepExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtnomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
      function ValidaCPF(CPF:String): boolean;
      function IsValidEmail(const Email: string) : Boolean;
      function DataOk(Dt:String):Boolean; stdcall;
  end;

var
  FRMClientes: TFRMClientes;

implementation

uses UPrincipal, UProcessos, UPesquisa;

{$R *.dfm}

function TFRMClientes.DataOk(Dt: String): Boolean;
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

procedure TFRMClientes.DBCBEstadoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBCBEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBECEP.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBEBairroClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBECidade.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBECEPClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBECEPKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBETelefone.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBECidadeClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBECidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBCBEstado.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBEComplementoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    BTNCarregarImagem.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBECPFClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBECPFExit(Sender: TObject);
begin
  if not ValidaCPF(DBECPF.Text) then
    ShowMessage('CPF inválido');
    ABORT;
end;

procedure TFRMClientes.DBECPFKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
   if ValidaCPF(DBECPF.Text) then
    ShowMessage('CPF válido')
   else
    ShowMessage('CPF inválido');
  end;
   if (key = #13) and ValidaCPF(DBECPF.Text) then
   begin
     DBERG.SetFocus;
     key := #0;
   end;
end;

procedure TFRMClientes.DBEData_NascimentoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEData_NascimentoExit(Sender: TObject);
begin
  if not DataOk(DBEData_Nascimento.Text) then
    ShowMessage('data invalida');
end;

procedure TFRMClientes.DBEData_NascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
  DBECPF.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBEEmail2Click(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEEmail2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEData_Nascimento.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBEEmailClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEEmail2.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBEEnderecoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBEEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBENumero.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBENomeClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBENomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEEndereco.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBENumeroClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBENumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEBairro.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBERGClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNCadastrar.Enabled:=False;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBERGKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    DBEComplemento.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBETelefone2Click(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBETelefone2KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEEmail.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DBETelefoneClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMClientes.DBETelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBETelefone2.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.DTSClientesDataChange(Sender: TObject; Field: TField);
begin
  if(trim(QUEClientesCLI_PATH.Value)<> '') and (FileExists(QUEClientesCLI_PATH.Value)) then
  begin
    IMGClientes.Picture.LoadFromFile(QUEClientesCLI_PATH.Value);
    IMGClientes.Visible:= True;
  end
  else
  begin
    IMGClientes.Visible:= False;
  end;
end;

procedure TFRMClientes.edtnomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBEEndereco.SetFocus;
    key := #0;
  end;
end;

procedure TFRMClientes.BTNCadastrar_processosClick(Sender: TObject);
begin
  application.CreateForm(TFRMProcessos,FRMProcessos);
  FRMProcessos.showmodal;
end;

procedure TFRMClientes.BTNCarregarImagemClick(Sender: TObject);
begin
  if OpdImagem.Execute = True then
  begin
      if OpdImagem.FileName <> '' then
      Begin
          IMGClientes.Picture.LoadFromFile(OpdImagem.FileName);
          if QUEClientes.State = dsBrowse then QUEClientes.Edit;
          QUEClientesCLI_PATH.Value:= OpdImagem.FileName;
          //showmessage(OPDImagem.FileName);
          IMGClientes.Visible:= True;
      End;
  end;
end;

procedure TFRMClientes.BTNLimparClick(Sender: TObject);
begin
  QUEClientes.Edit;
  QUEClientesCLI_PATH.Value:= '';
  QUEClientes.Post;
  IMGClientes.Visible:= False;
end;

procedure TFRMClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QUEClientes.Close;
end;

procedure TFRMClientes.FormCreate(Sender: TObject);
begin
  QUEClientes.Open;
end;

procedure TFRMClientes.FormShow(Sender: TObject);
begin
   if QUEClientes.isEmpty  then
   BTNExcluir.Enabled:= False;
end;

function TFRMClientes.IsValidEmail(const Email: string): Boolean;
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

procedure TFRMClientes.QUEClientesAfterPost(DataSet: TDataSet);
begin
   QUEClientes.Close;
   QUEClientes.Open;
end;

procedure TFRMClientes.QUEClientesBeforePost(DataSet: TDataSet);
begin
  if not IsValidEmail( DBEEmail.Text) then
  begin
    if not (Application.MessageBox('Formato do E-mail incorreto salvar mesmo assim?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
    begin
    BTNsalvar.Enabled:=true;
    BTNEditar.Enabled:=False;
    BTNCancelar.Enabled:=true;
    BTNCadastrar.Enabled:=False ;
    abort;
    end
  end;
    if Trim (DBEEmail2.Text) <> '' then
    if not IsValidEmail( DBEEmail2.Text) then
  begin
    if not (Application.MessageBox('Formato do E-mail alternativo incorreto salvar mesmo assim?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
    begin
    BTNsalvar.Enabled:=true;
    BTNEditar.Enabled:=False;
    BTNCancelar.Enabled:=true;
    BTNCadastrar.Enabled:=False ;
    abort;
    end
  end;

  if Trim (DBENome.Text)= '' then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o nome do cliente');
    DBENome.setfocus;
    abort;
  end;

  if Trim (DBENumero.Text)= '' then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o número do endereço!');
    DBENumero.setfocus;
    abort;
  end;

  if Trim (DBEEndereco.Text)= '' then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o endereço');
    DBEEndereco.setfocus;
    abort;
  end;

  if Trim (DBECidade.Text)= '' then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o nome da cidade');
    DBECidade.setfocus;
    abort;
  end;

  if Trim (DBEBairro.Text)= '' then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o bairro');
    DBEBairro.setfocus;
    abort;
  end;

  if trim (DBETelefone.text)='(  )    -    'then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o telefone ');
    DBETelefone.setfocus;
    abort;
  end;

  if trim(DBECEP.text)='     -   'then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o CEP');
    DBECEP.setfocus;
    abort;
  end;

    if trim(DBCBEstado.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o estado');
    DBCBEstado.setfocus;
    abort;
  end;

    if trim(DBEEmail.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o email');
    DBEEmail.setfocus;
    abort;
  end;

    if trim(DBERG.text)='  .   .   - 'then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o RG');
    DBERG.setfocus;
    abort;
  end;

    if trim(DBECPF.text)='   .   .   -  'then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o CPF');
    DBECPF.setfocus;
    abort;
  end;

    if trim(DBEData_Nascimento.text)='  /  /    'then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha a data de nascimento');
    DBEData_Nascimento.setfocus;
    abort;
  end;

end;

procedure TFRMClientes.actRelDepExecute(Sender: TObject);
var sIndice: string;
begin
//sIndice := dmEmp.tbEmp.IndexFieldNames;
//dmEmp.tbEmp.IndexFieldNames:='COD_DEPTO';
////------------------------------------
//dmEmp.rvprjEmp.ExecuteReport('rptEmpDepto');
////------------------------------------
//dmEmp.tbEmp.IndexFieldNames := sIndice
end;

procedure TFRMClientes.actRelGeralExecute(Sender: TObject);
begin
//dmEmp.rvprjEmp.ExecuteReport('rptEmpGeral');
end;

procedure TFRMClientes.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(TFRMLocalizar,FRMLocalizar);
  FRMLocalizar.ShowModal
end;

procedure TFRMClientes.BTBTNCadProcClick(Sender: TObject);
begin
  application.CreateForm(TFRMProcessos,FRMProcessos);
  FRMProcessos.showmodal;
  Close;
end;

procedure TFRMClientes.BTNCadastrarClick(Sender: TObject);
begin
Application.CreateForm(TFRMLocalizar,FRMLocalizar);
   FRMLocalizar.ShowModal;
end;

procedure TFRMClientes.BTNEditarClick(Sender: TObject);
begin
   BTNCadastrar.Enabled:=False;
   BTNEditar.Enabled:=False;
   BTNsalvar.Enabled:=True;
   BTNCancelar.Enabled:=True;
   QUEClientes.Edit;
end;

procedure TFRMClientes.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNCancelar.Enabled:=False;
  BTNEditar.Enabled:=True;
  edtnome.Visible:=False;
  DBENome.Visible:=True;
  if  not ValidaCPF(DBECPF.Text) then
  begin
    showmessage('CPF inválido!');
    DBECPF.SetFocus;
    abort;
  end
  else
  begin
  BTNsalvar.Enabled:=false;
  end ;
  QUEClientes.Post;
  ShowMessage('Salvo!');
end;


procedure TFRMClientes.SBTNLocalizarClick(Sender: TObject);
begin
  Application.CreateForm(TFRMLocalizar,FRMLocalizar);
  FRMLocalizar.ShowModal
end;

procedure TFRMClientes.SBTNUltimoClick(Sender: TObject);
begin
   QUEClientes.Last;
   BTNCancelar.Click;
end;

procedure TFRMClientes.SpeedButton1Click(Sender: TObject);
begin
QUEClientes.Refresh;
end;

procedure TFRMClientes.BTNExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir o Cliente?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
   begin
   QUEClientes.Delete;
   if QUEClientes.isEmpty  then
   BTNExcluir.Enabled:= False;
   end;
end;

procedure TFRMClientes.BTNFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFRMClientes.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEClientes.First;
  BTNCancelar.Click;
end;

procedure TFRMClientes.SBTNAnteriorClick(Sender: TObject);
begin
   QUEClientes.Prior;
   BTNCancelar.Click;
end;

procedure TFRMClientes.SBTNProximoClick(Sender: TObject);
begin
   QUEClientes.Next;
   BTNCancelar.Click;
end;

procedure TFRMClientes.BTNCancelarClick(Sender: TObject);
begin
   BTNCadastrar.Enabled:=True;
   BTNEditar.Enabled:=True;
   BTNsalvar.Enabled:=False;
   BTNCancelar.Enabled:=False;
   QUEClientes.Cancel;
end;

function TFRMClientes.ValidaCPF(CPF: String): boolean;
var I, Soma, Digito:Integer;
    CalcCPF, S1, S2:String;
    B:Boolean;
    C:Char;
begin
  Result:=False;
  //Eliminando caracteres não numéricos
  S1:='';
  for I := 1 to Length(CPF) do
    begin
      S2:= Copy(CPF, I, 1);
      if Pos(S2,'0123456789') > 0 then
        S1:= S1 + S2;
    end;
  if Length(S1)<> 11 then
    begin;
      ShowMessage('Isso não é CPF');
      abort;
    end;
    //Testando se os dígitos são iguais
    B:= True;
    C:= S1[1];
    for I := 2 to 11 do
    begin
      B:= B and (S1[i]=C);
      C:= S1[I];
    end;
  if B = True then
    begin
      ShowMessage('Todos os dígitos são iguais');
      Abort;
    end;

  CalcCPF:= Copy(S1, 1, 9);

  //Calculando o 10º dígito
  Soma:=0;
  for I := 1 to 9 do
  begin
      Soma:=Soma+StrToInt(Copy(CalcCPF, I, 1)) * (11-I);
  end;
  Digito:= Soma mod 11;
  if Digito < 2 then
    CalcCPF:= CalcCPF+'0'
  else
    CalcCPF:=CalcCPF+(IntToStr(11-Digito));

  //Calculando 11º dígito
  Soma:=0;
  for I := 1 to 10 do
  begin
    Soma:=Soma+StrToInt(Copy(CalcCPF,I,1))*(12-I);
  end;

  Digito:= Soma mod 11;

  if Digito < 2 then
    CalcCPF:=CalcCPF+'0'
  else
    CalcCPF:=CalcCPF+(IntToStr(11-Digito));

  if S1 = CalcCPF then
    Result:= True;
  end;
end.
