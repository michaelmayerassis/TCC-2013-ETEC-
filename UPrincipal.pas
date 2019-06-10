unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWExtCtrls, ComCtrls, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdTime, StdCtrls,ShellAPI, pngimage,
  jpeg,RpRave, Buttons, RpCon, RpConDS, RpDefine, RpBase, RpSystem, TeCanvas,
  TeeEdiGrad;

type
  TFRMPrincipal = class(TForm)
    MMPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    CadastrodeClientes1: TMenuItem;
    DBPrincipal: TADOConnection;
    CadastrodeProcessos1: TMenuItem;
    Segurana1: TMenuItem;
    eladeGerenciamento1: TMenuItem;
    QUEGenerica: TADOQuery;
    Relatrios1: TMenuItem;
    RelatriodeCliente1: TMenuItem;
    RelatriodeProcesso2: TMenuItem;
    DTSClientes: TDataSource;
    CadastrodeAndamentodeProcesso1: TMenuItem;
    Cadastrodeusurios2: TMenuItem;
    Image1: TImage;
    RelatriodeClienteeseusProcessos1: TMenuItem;
    Sair1: TMenuItem;
    rocardeusurio1: TMenuItem;
    Finalizaraplicao1: TMenuItem;
    DTSProcesso: TDataSource;
    RelatriodeAndamentodoProcesso1: TMenuItem;
    DTSAndamento_processo: TDataSource;
    QUEAndamento_processo: TADOQuery;
    QUEAndamento_processoDATA_ANDAMENTO: TWideStringField;
    QUEAndamento_processoAND_PATH: TStringField;
    QUEAndamento_processoV_1: TStringField;
    QUEAndamento_processoCOD_ANDAMENTO: TAutoIncField;
    QUEAndamento_processoHISTORICO: TMemoField;
    QUEAndamento_processoNOME_CLI: TStringField;
    QUEAndamento_processoN_PROC: TStringField;
    QUEAndamento_processoN_VARA: TIntegerField;
    QUEAndamento_processoPARTE_CONT: TStringField;
    QUEAndamento_processoNUMERO_PROCESSO: TStringField;
    QUEAndamento_processoN_2: TStringField;
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
    QUEClientesCLI_PATH: TStringField;
    QUEClientesCLI_NUMERO: TStringField;
    QUEClientesCLI_RG: TStringField;
    QUEClientesCLI_CPF: TStringField;
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
    QUEProcessoNUMERO_PROCESSO: TStringField;
    QUEProcessoCLI_CPF: TStringField;
    QUEAndamento_processoDATA_COMP_PRAZO: TStringField;
    QUEAndamento_processoHORARIO: TStringField;
    QUEAndamento_processoTIPO_COMP: TStringField;
    Suporte1: TMenuItem;
    ermosdeuso1: TMenuItem;
    Crditos1: TMenuItem;
    QUETermosDeUso: TADOQuery;
    QUETermosDeUsoaceitar_termos: TStringField;
    QUETermosDeUsotermos: TMemoField;
    DTSTermosDeUso: TDataSource;
    rvsysEmpProcesso: TRvSystem;
    rvdsEmpProcesso: TRvDataSetConnection;
    rvprjEmpProcesso: TRvProject;
    rvprjEmpAndamento: TRvProject;
    rvdsEmpAndamento: TRvDataSetConnection;
    rvsysEmpAndamento: TRvSystem;
    rvprjEmpCliente: TRvProject;
    rvdsEmpCliente: TRvDataSetConnection;
    rvsysEmpCliente: TRvSystem;
    RvprjEmpCli_Proc: TRvProject;
    Manualtcnico1: TMenuItem;
    QUEProcessoNOME: TStringField;
    QUEProcessoCIDADE: TStringField;
    QUEProcessoESTADO: TStringField;
    procedure CadastrodeClientes1Click(Sender: TObject);
    procedure CadastrodeProcessos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Cadastrodeusurios1Click(Sender: TObject);
    procedure Cadastrodeintensnomenu1Click(Sender: TObject);
    procedure Cadastrodegrupodeusurios1Click(Sender: TObject);
    procedure eladeGerenciamento1Click(Sender: TObject);
    procedure RelatriodeCliente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CadastrodeAndamentodeProcesso1Click(Sender: TObject);
    procedure RelatriodeProcesso2Click(Sender: TObject);
    procedure Cadastrodeusurios2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RelatriodeClienteeseusProcessos1Click(Sender: TObject);
    procedure rocardeusurio1Click(Sender: TObject);
    procedure Finalizaraplicao1Click(Sender: TObject);
    procedure RelatriodeAndamentodoProcesso1Click(Sender: TObject);
    procedure Crditos1Click(Sender: TObject);
    procedure ermosdeuso1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Manualtcnico1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
   TIPO: String;
  end;

var
  FRMPrincipal: TFRMPrincipal;

implementation

uses UClientes, UProcessos, ULogin, UCadItensMenu, UCadGrupo, UCadUsuario,
  UTelaGerenciamento, UAndamento_Processo, URelatorio_Cliente_proc, USplash,
  UCreditos, UTermosDeUso, URelatorio_And_Proc;

{$R *.dfm}

procedure TFRMPrincipal.BitBtn1Click(Sender: TObject);
begin
// rvprjEmpProcesso.Execute;
end;

procedure TFRMPrincipal.Button1Click(Sender: TObject);
begin
   RvprjEmpCli_Proc.Execute;
end;

procedure TFRMPrincipal.CadastrodeAndamentodeProcesso1Click(Sender: TObject);
begin
Application.CreateForm(TFRMAndamento_Processo,FRMAndamento_Processo);
FRMAndamento_Processo.ShowModal;
end;

procedure TFRMPrincipal.CadastrodeClientes1Click(Sender: TObject);
begin
    Application.CreateForm(TFRMClientes, FRMClientes);
    FRMClientes.ShowModal;
end;

procedure TFRMPrincipal.Cadastrodegrupodeusurios1Click(Sender: TObject);
begin
  Application.CreateForm(TFRMCadGrupo,FRMCadGrupo);
  FRMCadGrupo.ShowModal ;
end;

procedure TFRMPrincipal.Cadastrodeintensnomenu1Click(Sender: TObject);
begin
  Application.CreateForm(TFRMCadItensMenu,FRMCadItensMenu);
  FRMCadItensMenu.ShowModal ;
end;

procedure TFRMPrincipal.CadastrodeProcessos1Click(Sender: TObject);
begin
 Application.CreateForm(TFRMProcessos, FRMProcessos);
    FRMProcessos.ShowModal;
end;
procedure TFRMPrincipal.Cadastrodeusurios1Click(Sender: TObject);
begin
  Application.CreateForm(TFRMCadUsuarios,FRMCadUsuarios);
  FRMCadUsuarios.ShowModal ;
end;

procedure TFRMPrincipal.Cadastrodeusurios2Click(Sender: TObject);
begin
  Application.CreateForm(TFRMCadUsuarios, FRMCadUsuarios);
  FRMCadUsuarios.ShowModal;
end;

procedure TFRMPrincipal.Crditos1Click(Sender: TObject);
begin
  Application.Createform(TFrmCreditos, FrmCreditos);
  FRMCreditos.BTNAceitar.Visible:=False;
  FRMCreditos.BTNFechar1.Visible:=False;
  FRMCreditos.BTNFechar2.Visible:=True;
  FrmCreditos.ShowModal;

end;

procedure TFRMPrincipal.eladeGerenciamento1Click(Sender: TObject);
begin
   Application.CreateForm(TFRMGerenciamento, FRMGerenciamento);
  FRMGerenciamento.Showmodal;
end;

procedure TFRMPrincipal.ermosdeuso1Click(Sender: TObject);
begin
  Application.Createform(TFrmTermosdeuso, FRMTermosdeuso);
  FRMTermosDeUso.BTNFechar1.Visible:=False;
  FRMTermosDeUso.BTNFechar2.Visible:=True;
  FRMTermosDeUso.LBLConcordar.Visible:=False;
  FRMTermosDeUso.BTNProximo.Visible:=False;
  FRMTermosdeuso.Showmodal;

end;

procedure TFRMPrincipal.Finalizaraplicao1Click(Sender: TObject);
begin
  if (Application.MessageBox('Deseja finalizar a aplicação','Finalizar ',mb_YESNO+mb_iconInformation) = mrYes) then
  begin
    Application.Terminate;
  end
  else
  Abort;
end;

procedure TFRMPrincipal.FormActivate(Sender: TObject);
begin
if QUEAndamento_processoDATA_COMP_PRAZO.Value=DateToStr(date) then
ShowMessage(QUEAndamento_processoHISTORICO.value);
abort;
end;

procedure TFRMPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUETermosDeUso.Close;
  QUEClientes.Close;
  QUEProcesso.Close;
  QUEAndamento_processo.Close;
end;

procedure TFRMPrincipal.FormCreate(Sender: TObject);
begin
  QUETermosDeUso.Open;
  QUEClientes.Open;
  QUEProcesso.Open;
  QUEAndamento_processo.Open;
end;

procedure TFRMPrincipal.FormShow(Sender: TObject);
begin
  Application.CreateForm(TFRMLogin, FRMLogin);
  FRMLogin.Showmodal;
  if  Application.Terminated  then
  begin
Application.Terminate
  end
  else
  begin
  Application.CreateForm(TFRMSplash, FRMSplash);
  FRMSplash.Show; //chama o formulário
  FRMSplash.Refresh; //atualiza
  Sleep (1000); //tempo de exibição da tela
  FRMSplash.Free; // libera da memória
  FRMSplash := Nil; //inutiliza a ação do ponteiro do mouse
  end
end;

procedure TFRMPrincipal.Manualtcnico1Click(Sender: TObject);
var
Pdir: Pchar;
begin
  GetMem(pDir,256);
  StrPCopy(pDir, 'C:\TCC-Gerenciamento\PastaManual\Manual.pdf');
  ShellExecute(0, nil, 'C:\TCC-Gerenciamento\PastaManual\Manual.pdf', nil, Pdir, SW_NORMAL);
  FreeMem(pdir,256);
end;

procedure TFRMPrincipal.RelatriodeAndamentodoProcesso1Click(Sender: TObject);
begin
Application.CreateForm(TFRMRAnd_Proc,FRMRAnd_Proc);
FRMRAnd_Proc.ShowModal;
end;

procedure TFRMPrincipal.RelatriodeCliente1Click(Sender: TObject);
  var
F:TextFile;
begin
  QUEClientes.Close;
  QUEClientes.Open;
  AssignFile(F,'C:\TCC-Gerenciamento\Clientes.html');
  RewRite(F);
  Writeln(F, '<HTML>');
  Writeln(F, '<HEAD>');
  Writeln(F, '<TITLE>');
  Writeln(F, '<Relatório de Clientes>');
  Writeln(F, '</TITLE>');
  Writeln(F, '</HEAD>');
  Writeln(F, '<BODY style="font-family:Segoe UI,Arial,Microsoft Sans Serif;">');

  Writeln(F, '<H1> <CENTER> Relatório de Clientes </CENTER> </H1>');
  Writeln(F, '<TABLE  BORDER="2" WIDTH="100%">');
  Writeln(F, '<TR>');
  Writeln(F, '<TH> Nome </TH>');
  Writeln(F, '<TH> Endereço </TH>');
  Writeln(F, '<TH> Bairro </TH>');
  Writeln(F, '<TH> CEP </TH>');
  Writeln(F, '<TH> Cidade </TH>');
  Writeln(F, '<TH> Estado </TH>');
  Writeln(F, '<TH> Telefone </TH>');
  Writeln(F, '<TH> Email </TH>');
  Writeln(F, '</TR>');

  QUEClientes.First;
  while not QUEClientes.Eof do
  begin
    Writeln(F, '<TR>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_NOME.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_ENDERECO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_BAIRRO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' + FormatFloat('00000-000',QUEClientesCLI_CEP.AsFloat)+'</TD>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_CIDADE.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_ESTADO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FormatFloat('(00)0000-0000',QUEClientesCLI_TELEFONE.AsFloat )+'</TD>');
    Writeln(F, '<TD align= center>' +QUEClientesCLI_EMAIL.AsString +'</TD>');
    Writeln(F, '</TR>');
    QUEClientes.Next;
  end;

  Writeln(F, '<TABLE>');
  Writeln(F, '</BODY');
  Writeln(F, '</HTML>');
  CloseFile(F);
  ShellExecute(Handle, 'Open', Pchar ('C:\TCC-Gerenciamento\Clientes.html'),'','', SW_ShowMaximized);
end;


procedure TFRMPrincipal.RelatriodeClienteeseusProcessos1Click(Sender: TObject);
begin
  Application.CreateForm(TFRMRe_cli_proc,FRMRe_cli_proc);
  FRMRe_cli_proc.ShowModal;
end;

procedure TFRMPrincipal.RelatriodeProcesso2Click(Sender: TObject);
 var
F:TextFile;
begin
  QUEProcesso.Close;
  QUEProcesso.Open;
  AssignFile(F,'C:\TCC-Gerenciamento\Processos.html');
  RewRite(F);
  Writeln(F, '<HTML>');
  Writeln(F, '<HEAD>');
  Writeln(F, '<TITLE>');
  Writeln(F, '<Relatório de Processos>');
  Writeln(F, '</TITLE>');
  Writeln(F, '</HEAD>');
  Writeln(F, '<BODY style="font-family:Segoe UI,Arial,Microsoft Sans Serif;">');
  Writeln(F, '<H1> <CENTER> Relatório de Processos </CENTER> </H1>');
  Writeln(F, '<BR> <BR>');
  Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');
  Writeln(F, '<TR>');
  Writeln(F, '<TH> Cliente </TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP">Tipo de Cliente</TH>');
  Writeln(F, '<TH  NOWRAP="NOWRAP"> Tipo de Processo </TH>');
  Writeln(F, '<TH  NOWRAP="NOWRAP"> Número Processo </TH>');
  Writeln(F, '<TH  NOWRAP="NOWRAP"> Número da Vara </TH>');
  Writeln(F, '<TH  NOWRAP="NOWRAP"> Data Distribuição </TH>');
  Writeln(F,'<TH  NOWRAP="NOWRAP"> Data de Citação </TH>');
  Writeln(F,'<TH  NOWRAP="NOWRAP"> Número de Ordem</TH>');
  Writeln(F, '<TH NOWRAP="NOWRAP"> Valor da Causa </TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Observações</TH>');
  Writeln(F, '<TH NOWRAP="NOWRAP"> Cidade </TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Parte Contrária</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Tipo de Executado</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Email da Parte Contrária</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Telefone da Parte Contrária</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Advogado da Parte Contrária</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Email do Advogado da Parte Contrária</TH>');
  Writeln(F,'<TH NOWRAP="NOWRAP"> Telefone do Advogado Da Parte Contrária</TH>');
  Writeln(F, '</TR>');

  QUEProcesso.First;
  while not QUEProcesso.Eof do
  begin
    Writeln(F, '<TR>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoNOME.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoTIPO_CLIENTE.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoTIPO_PROCESSO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoNUMERO_PROCESSO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoNUMERO_VARA_PROCESSO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoDATA_DISTRIBUICAO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoDATA_CITACAO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FormatFloat('000000/0000',QUEProcessoNUMERO_ORDEM.AsFloat)+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FormatFloat('R$ 0.00',QUEProcessoVALOR_CAUSA.AsFloat)+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoOBS_PROCESSO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoCIDADE.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoNOME_EXECUTADO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoTIPO_EXECUTADO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoEMAIL_EXECUTADO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FormatFloat('(00)0000-0000',QUEProcessoTELEFONE_EXECUTADO.AsFloat)+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoNOME_ADVOGADO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +QUEProcessoEMAIL_ADVOGADO.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FormatFloat('(00)0000-0000',QUEProcessoTELEFONE_ADVOGADO.AsFloat)+'</TD');
    Writeln(F, '</TR>');
    QUEProcesso.Next;
  end;

  Writeln(F, '</TABLE>');
  Writeln(F, '</BODY');
  Writeln(F, '</HTML>');
  CloseFile(F);
  ShellExecute(Handle, 'Open', Pchar ('C:\TCC-Gerenciamento\Processos.html'),'','', SW_ShowMaximized);
end;

procedure TFRMPrincipal.rocardeusurio1Click(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente trocar de usuário?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
  BEGIN
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
    FRMPrincipal.ShowModal;
  Application.Terminate;
  FRMPrincipal.Close;
  END
  ELSE
  ABORT;
end;

end.
