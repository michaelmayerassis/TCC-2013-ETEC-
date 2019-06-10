unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, ComCtrls, jpeg;

type
  TFRMLogin = class(TForm)
    LBLSenha: TLabel;
    LBLLogin: TLabel;
    EDTLogin: TEdit;
    EDTSenha: TEdit;
    BTNConectar: TBitBtn;
    BTNFechar: TBitBtn;
    QUEValidaUsuario: TADOQuery;
    QUEValidaUsuarioCOD_USUARIO: TAutoIncField;
    QUEValidaUsuarioCOD_GRUPO: TIntegerField;
    QUEValidaUsuarioNOME: TStringField;
    QUEValidaUsuarioLOGIN: TStringField;
    QUEValidaUsuarioSENHA: TStringField;
    QUEItensGrupoAcessa: TADOQuery;
    QUEItensGrupoAcessaCOD_ITEM: TIntegerField;
    QueTipoGrupo: TADOQuery;
    QueTipoGrupoTipo: TStringField;
    LBLTempo: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    procedure BTNConectarClick(Sender: TObject);
    procedure BTNFecharClick(Sender: TObject);
    procedure EDTLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EDTSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMLogin: TFRMLogin;
  Fechar: Boolean;
implementation

uses UPrincipal, UCreditos, UTermosDeUso, USplash;

{$R *.dfm}

procedure TFRMLogin.BTNConectarClick(Sender: TObject);
var I,J: Integer;
begin
  if trim(EDTLogin.text)='' then
  begin
    ShowMessage('Preencha o login');
    EDTLogin.SetFocus;
    Abort;
  end;
  if trim(EDTSenha.text)='' then
  begin
    ShowMessage('Preencha o campo senha');
    EDTSenha.SetFocus;
    Abort;
  end;
  QUEValidaUsuario.Close;
  QUEValidaUsuario.Parameters[0].Value:= EDTLogin.Text;
  QUEValidaUsuario.Parameters[1].Value:=EDTSenha.Text;
  QUEValidaUsuario.Open;
  QueTipoGrupo.Close;
  QueTipoGrupo.Parameters[0].Value:= QUEValidaUsuarioCOD_GRUPO.Value;
  QueTipoGrupo.Open;
  FRMPrincipal.TIPO:= QueTipoGrupoTipo.Value;

  if QUEValidaUsuario.RecordCount > 0 then
  begin
  QUEItensGrupoAcessa.Close;
  QUEItensGrupoAcessa.Parameters[0].Value:= QUEValidaUsuarioCOD_GRUPO.Value;
  QUEItensGrupoAcessa.Open;
  //Desabilitando o Menu
  for I := 0 to FRMPrincipal.MMPrincipal.Items.Count -1 do
  begin
    for J := 0 to FRMPrincipal.MMPrincipal.Items[I].Count - 1 do
    Begin
      FRMPrincipal.MMPrincipal.Items[I].Items[J].Enabled:= False;
    End;
  end;
  //Habilitando o Menu de Acordo com os direitos do usuario
  For I := 0 to FRMPrincipal.MMPrincipal.Items.Count -1 do
  Begin
    for J := 0 to FRMPrincipal.MMPrincipal.Items[I].Count - 1 do
    Begin
      QUEItensGrupoAcessa.First;
      while not QUEItensGrupoAcessa.Eof do
      Begin
        if FRMPrincipal.MMPrincipal.Items[I].Items[J].Tag=
           QUEItensGrupoAcessaCOD_ITEM.Value then
           FRMPrincipal.MMPrincipal.Items[I].Items[J].Enabled:=True;
           QUEItensGrupoAcessa.Next;
      End;
    End;
  End;
    Fechar:= True;
    Close;
  end
  else
  begin
    ShowMessage('Usuário não cadastrado!');
  end;
end;

procedure TFRMLogin.BTNFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFRMLogin.Button1Click(Sender: TObject);
begin
//FRMTermosDeUso.QUETermosDeUso.Delete
end;

procedure TFRMLogin.EDTLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if Key= #13 then
  Begin
    EDTSenha.SetFocus;
    Key:= #0;
  End;
end;

procedure TFRMLogin.EDTSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BTNConectar.Click;
    Key:= #0;
  end;
end;

procedure TFRMLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Fechar then
    Action:= CaFree
  else
    Action:= CaNone;
end;

procedure TFRMLogin.FormShow(Sender: TObject);
begin
  Fechar:= False;
  if FRMTermosDeUso.QUETermosDeUsoaceitar_termos.value <>'sim' then
  begin
   Application.CreateForm(TFRMCreditos,FRMCreditos);
    FRMCreditos.ShowModal;
  end;
end;

procedure TFRMLogin.Timer1Timer(Sender: TObject);
begin
  LBLTempo.caption := timetostr(time);
end;

end.
