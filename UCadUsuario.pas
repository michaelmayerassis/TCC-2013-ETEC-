unit UCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolWin,
  ComCtrls;

type
  TFRMCadUsuarios = class(TForm)
    LBLGrupoUsuario: TLabel;
    LBLNome: TLabel;
    LBLLogin: TLabel;
    LBLSenha: TLabel;
    DBLCBGrupoUsu: TDBLookupComboBox;
    DBENome: TDBEdit;
    DBELogin: TDBEdit;
    DBESenha: TDBEdit;
    QUEUsuario: TADOQuery;
    QUEUsuarioCOD_USUARIO: TAutoIncField;
    QUEUsuarioCOD_GRUPO: TIntegerField;
    QUEUsuarioNOME: TStringField;
    QUEUsuarioLOGIN: TStringField;
    QUEUsuarioSENHA: TStringField;
    DTSUsuario: TDataSource;
    QUEGrupo: TADOQuery;
    QUEGrupoCOD_GRUPO: TAutoIncField;
    QUEGrupoDESCRICAO_GRUPO: TStringField;
    DTSGrupo: TDataSource;
    BTNCadastrar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNCancelar: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SBTNPrimeiro: TSpeedButton;
    SBTNAnterior: TSpeedButton;
    SBTNProximo: TSpeedButton;
    SBTNUltimo: TSpeedButton;
    BTNConcluir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
    procedure DBLCBGrupoUsuClick(Sender: TObject);
    procedure DBENomeClick(Sender: TObject);
    procedure DBELoginClick(Sender: TObject);
    procedure DBESenhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNConcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLCBGrupoUsuKeyPress(Sender: TObject; var Key: Char);
    procedure DBENomeKeyPress(Sender: TObject; var Key: Char);
    procedure DBELoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadUsuarios: TFRMCadUsuarios;

implementation

uses UTermosDeUso, ULogin;

{$R *.dfm}

procedure TFRMCadUsuarios.BitBtn1Click(Sender: TObject);
begin
  FRMTermosDeUso.QUETermosDeUso.Edit;
  FRMTermosDeUso.QUETermosDeUsoaceitar_termos.Value:='sim';
  FRMTermosDeUso.QUETermosDeUso.Post;
  if BTNsalvar.Enabled=true then
  BTNsalvar.Click;
  FRMTermosDeUso.QUETermosDeUso.Open;
  FRMTermosDeUso.QUETermosDeUso.Edit;
  FRMTermosDeUso.QUETermosDeUsoaceitar_termos.Value:='sim';
  FRMTermosDeUso.QUETermosDeUso.Post;
  FRMTermosDeUso.QUETermosDeUso.close;
  close;
end;

procedure TFRMCadUsuarios.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEUsuario.Insert;
end;

procedure TFRMCadUsuarios.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEUsuario.Cancel;
end;

procedure TFRMCadUsuarios.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEUsuario.Edit;
end;

procedure TFRMCadUsuarios.BTNExcluirClick(Sender: TObject);
begin
   if (Application.MessageBox('Deseja realmente excluir o Usuário?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
  begin
  QUEUsuario.Delete;
  if QUEUsuario.isEmpty  then
  BTNExcluir.Enabled:= False;
  end;

end;

procedure TFRMCadUsuarios.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEUsuario.Post;
  ShowMessage('Salvo!');
end;

procedure TFRMCadUsuarios.BTNConcluirClick(Sender: TObject);
begin
  if BTNsalvar.Enabled=true then
  BTNsalvar.Click;

  FRMTermosDeUso.QUETermosDeUso.Insert;
  FRMTermosDeUso.QUETermosDeUsoaceitar_termos.Value:='sim';
  FRMTermosDeUso.QUETermosDeUso.Post;
  close;
end;

procedure TFRMCadUsuarios.DBELoginClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMCadUsuarios.DBELoginKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBESenha.SetFocus;
    key := #0;
  end;
end;

procedure TFRMCadUsuarios.DBENomeClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMCadUsuarios.DBENomeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBELogin.SetFocus;
    key := #0;
  end;
end;

procedure TFRMCadUsuarios.DBESenhaClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMCadUsuarios.DBLCBGrupoUsuClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMCadUsuarios.DBLCBGrupoUsuKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
  DBENome.SetFocus;
    key := #0;
  end;
end;

procedure TFRMCadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUEUsuario.close;
  QUEGrupo.close;
  Action:= caFree;
end;

procedure TFRMCadUsuarios.FormCreate(Sender: TObject);
begin
  QUEUsuario.open;
  QUEGrupo.open;
end;

procedure TFRMCadUsuarios.FormShow(Sender: TObject);
begin
if FRMTermosDeUso.QUETermosDeUsoaceitar_termos.value <>'sim' then
FRMTermosDeUso.Close;
if FRMTermosDeUso.QUETermosDeUsoaceitar_termos.value <>'sim' then
begin
  ShowMessage('Coloque como Administrador e em seguida digite nome, login e senha!');
  BTNConcluir.Visible:=true;
  BTNCadastrar.Click;
end;
   if QUEUsuario.isEmpty  then
   BTNExcluir.Enabled:= False;
   BTNCadastrar.Click;
   BTNCancelar.Enabled:= False;
end;

procedure TFRMCadUsuarios.SBTNAnteriorClick(Sender: TObject);
begin
  QUEUsuario.Prior;
  BTNCancelar.Click;
end;

procedure TFRMCadUsuarios.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEUsuario.First;
  BTNCancelar.Click;
end;

procedure TFRMCadUsuarios.SBTNProximoClick(Sender: TObject);
begin
  QUEUsuario.Next;
  BTNCancelar.Click;
end;

procedure TFRMCadUsuarios.SBTNUltimoClick(Sender: TObject);
begin
  QUEUsuario.Last;
  BTNCancelar.Click;
end;

end.
