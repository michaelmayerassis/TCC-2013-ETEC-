unit URelatorio_Cliente_proc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,ShellAPI;

type
  TFRMRe_cli_proc = class(TForm)
    DBGrResultado: TDBGrid;
    Panel1: TPanel;
    LblNome: TLabel;
    SBLimpar: TSpeedButton;
    SBLocalizar: TSpeedButton;
    EdtLocalizar: TEdit;
    QueLocalizar: TADOQuery;
    QueLocalizarCLI_NOME: TStringField;
    DtsLocalizar: TDataSource;
    QueLocalizarCLI_CPF: TStringField;
    SBVerTodos: TSpeedButton;
    procedure SBLocalizarClick(Sender: TObject);
    procedure SBLimparClick(Sender: TObject);
    procedure EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrResultadoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBVerTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMRe_cli_proc: TFRMRe_cli_proc;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMRe_cli_proc.DBGrResultadoDblClick(Sender: TObject);
var
  F:TextFile;
  Aux, Aux1 : String;
begin
  if (QueLocalizar.Active) and (QueLocalizar.RecordCount > 0 ) then //recordcount retorna a quantidade de dados da Que
  begin
      FRMPrincipal.QUEClientes.Close;
      FRMPrincipal.QUEClientes.SQL.Clear;
      FRMPrincipal.QUEClientes.SQL.Add('SELECT *');
      FRMPrincipal.QUEClientes.SQL.Add('FROM CLIENTE');
      FRMPrincipal.QUEClientes.SQL.Add('WHERE CLI_CPF = ''' + QueLocalizarCLI_CPF.AsString+'''');
      FRMPrincipal.QUEClientes.Open;
  end;

  AssignFile(F,'C:\TCC-Gerenciamento\Cliente_Processo.html');
  RewRite(F);
  Writeln(F, '<HTML>');
  Writeln(F, '<HEAD>');
  Writeln(F, '<TITLE>');
  Writeln(F, '<Relatório de Cliente e Seus Processos>');
  Writeln(F, '</TITLE>');
  Writeln(F, '</HEAD>');
  Writeln(F, '<BODY style="font-family:Segoe UI,Arial,Microsoft Sans Serif;">');
  Writeln(F, '<H1> <CENTER> Relatório de Cliente e Seus Processos </CENTER> </H1>');

  begin
    Writeln(F, '<h2> <center>' +FRMPrincipal.QUEClientesCLI_NOME.AsString +'</h2>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');
    Writeln(F, '<TR>');
    Writeln(F, '<TH> Endereço </TH>');
    Writeln(F, '<TH> Bairro </TH>');
    if FRMPrincipal.QUEClientesCLI_COMPLEMENTO.Value <>'' then
    Writeln(F, '<TH> Complemento </TDH');
    Writeln(F, '<TH> CEP </TH>');
//    Writeln(F, '<TH> Cidade </TH>');
    Writeln(F, '<TH> Estado </TH>');
    Writeln(F, '<TH> Telefone </TH>');
    if FRMPrincipal.QUEClientesCLI_TELEFONE2.Value <>'' then
    Writeln(F, '<TH> Telefone Alternativo </TH>');
    Writeln(F, '<TH> Email </TH>');
    if FRMPrincipal.QUEClientesCLI_EMAIL2.Value <>'' then
    Writeln(F, '<TH> E-mail Alternativo </TH>');
    Writeln(F, '<TH> Data de Nacimneto </TH>');
    Writeln(F, '<TH> CPF </TH>');
    Writeln(F, '<TH> RG </TH>');
    Writeln(F, '</TR>');

    Writeln(F, '<TR>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_ENDERECO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_BAIRRO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_CEP.AsString +'</TD>');
//    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_CIDADE.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_ESTADO.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_TELEFONE.AsString +'</TD>');
    if FRMPrincipal.QUEClientesCLI_TELEFONE2.Value <>'' then
    Writeln(F, '<TD align= center>'+FRMPrincipal.QUEClientesCLI_TELEFONE2.AsString +'</TD>');
    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_EMAIL.AsString + '</TD>');
    if FRMPrincipal.QUEClientesCLI_EMAIL2.Value <>'' then
    Writeln(F, '<TD align= center>'+FRMPrincipal.QUEClientesCLI_EMAIL2.AsString +'</TD>');
    Writeln(F, '<TD align= center>'+FRMPrincipal.QUEClientesCLI_DATA_NASC.AsString +'</TD>');
    Writeln(F, '<TD align= center>'+FRMPrincipal.QUEClientesCLI_CPF.AsString +'</TD>');
    Writeln(F, '<TD align= center>'+FRMPrincipal.QUEClientesCLI_RG.AsString +'</TD>');
    Writeln(F, '</TR></TABLE>');

    //Imprimindo os dados dos processos do cliente
    Writeln(F, '<BR>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');

    Writeln(F, '<TR>');
    Writeln(F, '<TH> Número Processo </TH>');
    Writeln(F, '<TH> Vara </TH>');
    Writeln(F, '<TH> Cidade </TH>');
    Writeln(F, '<TH> Tipo de Processo </TH>');
    Writeln(F, '<TH> Valor da Causa </TH>');
    Writeln(F, '<TH> Data Distribuição </TH>');
    Writeln(F, '</TR>');

    FRMPrincipal.QUEProcesso.Close;
    FRMPrincipal.QUEProcesso.SQL.Clear;
    FRMPrincipal.QUEProcesso.SQL.Add('SELECT *');
    FRMPrincipal.QUEProcesso.SQL.Add('FROM PROCESSO');
    FRMPrincipal.QUEProcesso.SQL.Add('WHERE CLI_CPF = ''' + QueLocalizarCLI_CPF.AsString+'''');
    FRMPrincipal.QUEProcesso.Open;
    while not FRMPrincipal.QUEProcesso.Eof do
    begin
      Writeln(F, '<TR>');
      Writeln(F, '<TD align= center>' +FRMPrincipal.QUEProcessoNUMERO_PROCESSO.AsString+'</TD>');
      Writeln(F, '<TD align= center>' +FRMPrincipal.QUEProcessoNUMERO_VARA_PROCESSO.AsString +'</TD>');
      Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_CIDADE.AsString +'</TD>');
      Writeln(F, '<TD align= center>' +FRMPrincipal.QUEProcessoTIPO_PROCESSO.AsString +'</TD>');
      Writeln(F, '<TD align= center>' + FormatFloat('R$ 0.00',FRMPrincipal.QUEProcessoVALOR_CAUSA.AsFloat)+'</TD>');
      Writeln(F, '<TD align= center>' +FRMPrincipal.QUEProcessoDATA_DISTRIBUICAO.AsString +'</TD>');
      Writeln(F, '</TR>');
      FRMPrincipal.QUEProcesso.Next;
    end;
    Writeln(F, '</TABLE>');

        //Imprimindo os dados do ANDAMENTO do cliente
    Writeln(F, '<BR>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');

    Writeln(F, '<TR>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Parte Contrária </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Andamento </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Comp/prazo </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Histórico </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Imagem </TH>');
    Writeln(F, '</TR>');

    FRMPrincipal.QUEAndamento_processo.Close;
    FRMPrincipal.QUEAndamento_processo.SQL.Clear;
    FRMPrincipal.QUEAndamento_processo.SQL.Add('SELECT *');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('FROM ANDAMENTO_PROCESSO');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('WHERE NOME_CLI = ''' + QueLocalizarCLI_NOME.AsString+'''');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('ORDER BY CONVERT(DATE,DATA_ANDAMENTO)');
    FRMPrincipal.QUEAndamento_processo.Open;
    while not FRMPrincipal.QUEAndamento_processo.Eof do
    begin
      Writeln(F, '<TR>');
      Aux := FRMPrincipal.QUEAndamento_processoHISTORICO.AsString;
      Aux1 := '';
      while Length(Aux) > 0 do
      begin
        Aux1 := Aux1 + '<BR>' +Copy(Aux,1,76);
        Aux := Copy(Aux,77);
      end;

      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoPARTE_CONT.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_ANDAMENTO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_COMP_PRAZO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">'+ Aux1+'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP"><a href="'+FRMPrincipal.QUEAndamento_processoN_2.AsString +'" target="_blank" title="Imagem">'+FRMPrincipal.QUEAndamento_processoV_1.AsString +' </a></TD>');
      Writeln(F, '</TR>');
      FRMPrincipal.QUEAndamento_processo.Next;
  end;
    Writeln(F, '</TABLE>');
  end;
  CloseFile(F);
  ShellExecute(Handle, 'Open', Pchar ('C:\TCC-Gerenciamento\Cliente_Processo.html'),'','', SW_ShowMaximized);
end;

procedure TFRMRe_cli_proc.EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SBLocalizar.Click;
    key := #0;
  end;
end;

procedure TFRMRe_cli_proc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QueLocalizar.Close;
end;

procedure TFRMRe_cli_proc.FormShow(Sender: TObject);
begin
  EdtLocalizar.SetFocus;
end;

procedure TFRMRe_cli_proc.SBLimparClick(Sender: TObject);
begin
  EdtLocalizar.Text := '';
  QueLocalizar.Close;
  EdtLocalizar.SetFocus;
end;

procedure TFRMRe_cli_proc.SBLocalizarClick(Sender: TObject);
begin
  if Trim (EdtLocalizar.Text) = '' then
  begin
    ShowMessage('Digite parte do nome do Cliente');
    EdtLocalizar.SetFocus;
    Abort;
  end;

  QueLocalizar.Close;
  QueLocalizar.SQL.Clear;
  QueLocalizar.SQL.Add('SELECT  CLI_CPF, CLI_NOME');
  QueLocalizar.SQL.Add('FROM CLIENTE');
  QueLocalizar.SQL.Add('WHERE CLI_NOME LIKE ''%' + EdtLocalizar.Text + '%''');
  QueLocalizar.SQL.Add('ORDER BY CLI_NOME');
  QueLocalizar.Open;

  if QueLocalizar.RecordCount > 0 then
    DBGrResultado.SetFocus;
end;

procedure TFRMRe_cli_proc.SBVerTodosClick(Sender: TObject);
  var
F:TextFile;
  Aux, Aux1 : String;
begin
FRMPrincipal.QUEClientes.Close;
      FRMPrincipal.QUEClientes.SQL.Clear;
      FRMPrincipal.QUEClientes.SQL.Add('SELECT *');
      FRMPrincipal.QUEClientes.SQL.Add('FROM CLIENTE');
      FRMPrincipal.QUEClientes.Open;

  AssignFile(F,'C:\TCC-Gerenciamento\TodosCli_proc.html');
  RewRite(F);
  Writeln(F, '<HTML>');
  Writeln(F, '<HEAD>');
  Writeln(F,'<title>Relatório de Cliente e Seus Processos</title>');
  Writeln(F,'<style type="text/css">');
  Writeln(F,' hr{');
  Writeln(F,'	background-color:#F00;');
  Writeln(F,'	text-align:left;');
  Writeln(F,'	height:20px;');
  Writeln(F,'	width:100%;');
  Writeln(F,'	margin-left:0px;');
  Writeln(F,'	border:2px solid #000;');
  Writeln(F,'}');

  Writeln(F,'</style>');
  Writeln(F,'</head>');
  Writeln(F, '</HEAD>');
  Writeln(F, '<BODY style="font-family:Segoe UI,Arial,Microsoft Sans Serif;">');
  Writeln(F, '<H1> <CENTER> Relatório de Cliente e Seus Processos </CENTER> </H1>');
  FRMPrincipal.QUEClientes.First;
  while not FRMPrincipal.QUEClientes.Eof do
  begin
    Writeln(F, '<h2> <center>' +FRMPrincipal.QUEClientesCLI_NOME.AsString +'</h2>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');
    Writeln(F, '<TR>');
    Writeln(F, '<TH> Endereço </TH>');
    Writeln(F, '<TH> Bairro </TH>');
    if FRMPrincipal.QUEClientesCLI_COMPLEMENTO.Value <>'' then
    Writeln(F, '<TH> Complemento </TDH');
    Writeln(F, '<TH> CEP </TH>');
//    Writeln(F, '<TH> Cidade </TH>');
    Writeln(F, '<TH> Estado </TH>');
    Writeln(F, '<TH> Telefone </TH>');
    if FRMPrincipal.QUEClientesCLI_TELEFONE2.Value <>'' then
    Writeln(F, '<TH> Telefone Alternativo </TH>');
    Writeln(F, '<TH> Email </TH>');
    if FRMPrincipal.QUEClientesCLI_EMAIL2.Value <>'' then
    Writeln(F, '<TH> E-mail Alternativo </TH>');
    Writeln(F, '<TH> Data de Nacimneto </TH>');
    Writeln(F, '<TH> CPF </TH>');
    Writeln(F, '<TH> RG </TH>');
    Writeln(F, '</TR>');

    Writeln(F, '<TR>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_ENDERECO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_BAIRRO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FormatFloat('00000-000',FRMPrincipal.QUEClientesCLI_CEP.AsFloat)+'</TD>');
//    Writeln(F, '<TD align= center>' +FRMPrincipal.QUEClientesCLI_CIDADE.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_ESTADO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FormatFloat('(00)0000-0000',FRMPrincipal.QUEClientesCLI_TELEFONE.AsFloat)+'</TD>');
    if FRMPrincipal.QUEClientesCLI_TELEFONE2.Value <>'' then
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FormatFloat('(00)0000-0000',FRMPrincipal.QUEClientesCLI_TELEFONE2.AsFloat)+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_EMAIL.AsString + '</TD>');
    if FRMPrincipal.QUEClientesCLI_EMAIL2.Value <>'' then
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">'+FRMPrincipal.QUEClientesCLI_EMAIL2.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_DATA_NASC.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FRMPrincipal.QUEClientesCLI_CPF.AsString+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FRMPrincipal.QUEClientesCLI_RG.AsString+'</TD>');
    Writeln(F, '</TR></TABLE>');

    //Imprimindo os dados dos processos do cliente
    Writeln(F, '<BR>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');

    Writeln(F, '<TR>');
    Writeln(F, '<TH> Número Processo </TH>');
    Writeln(F, '<TH> Vara </TH>');
    Writeln(F, '<TH> Cidade </TH>');
    Writeln(F, '<TH> Tipo de Processo </TH>');
    Writeln(F, '<TH> Valor da Causa </TH>');
    Writeln(F, '<TH> Data Distribuição </TH>');
    Writeln(F, '</TR>');

    FRMPrincipal.QUEProcesso.Close;
      FRMPrincipal.QUEProcesso.SQL.Clear;
      FRMPrincipal.QUEProcesso.SQL.Add('SELECT *');
      FRMPrincipal.QUEProcesso.SQL.Add('FROM PROCESSO');
      FRMPrincipal.QUEProcesso.SQL.Add('WHERE CLI_CPF = ''' + FRMPrincipal.QUEClientesCLI_CPF.AsString+'''');
      FRMPrincipal.QUEProcesso.Open;
    while not FRMPrincipal.QUEProcesso.Eof do
    if  FRMPrincipal.QUEProcessoCLI_CPF.AsString = FRMPrincipal.QUEClientesCLI_CPF.AsString then

    begin
      Writeln(F, '<TR>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEProcessoNUMERO_PROCESSO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEProcessoNUMERO_VARA_PROCESSO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEClientesCLI_CIDADE.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEProcessoTIPO_PROCESSO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FormatFloat('R$ 0.00',FRMPrincipal.QUEProcessoVALOR_CAUSA.AsFloat)+'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' + FRMPrincipal.QUEProcessoDATA_DISTRIBUICAO.AsString+'</TD>');
      Writeln(F, '</TR>');
      FRMPrincipal.QUEProcesso.Next;
    end;

    Writeln(F, '</TABLE>');
          //Imprimindo os dados do ANDAMENTO do cliente
    Writeln(F, '<BR>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');

    Writeln(F, '<TR>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Parte Contrária </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Andamento </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Comp/prazo </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Histórico </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Imagem </TH>');
    Writeln(F, '</TR>');

    FRMPrincipal.QUEAndamento_processo.Close;
    FRMPrincipal.QUEAndamento_processo.SQL.Clear;
    FRMPrincipal.QUEAndamento_processo.SQL.Add('SELECT *');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('FROM ANDAMENTO_PROCESSO');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('WHERE NOME_CLI = ''' + FRMPrincipal.QUEClientesCLI_NOME.AsString+'''');
    FRMPrincipal.QUEAndamento_processo.SQL.Add('ORDER BY CONVERT(DATE,DATA_ANDAMENTO)');
    FRMPrincipal.QUEAndamento_processo.Open;
    while not FRMPrincipal.QUEAndamento_processo.Eof do
    begin
      Writeln(F, '<TR>');
      Aux := FRMPrincipal.QUEAndamento_processoHISTORICO.AsString;
      Aux1 := '';
      while Length(Aux) > 0 do
      begin
        Aux1 := Aux1 + '<BR>' +Copy(Aux,1,76);
        Aux := Copy(Aux,77);
      end;

      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoPARTE_CONT.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_ANDAMENTO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_COMP_PRAZO.AsString +'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP">'+ Aux1+'</TD>');
      Writeln(F, '<TD align= center NOWRAP="NOWRAP"><a href="'+FRMPrincipal.QUEAndamento_processoN_2.AsString +'" target="_blank" title="Imagem">'+FRMPrincipal.QUEAndamento_processoV_1.AsString +' </a></TD>');
      Writeln(F, '</TR>');
      FRMPrincipal.QUEAndamento_processo.Next;
  end;
    Writeln(F, '</TABLE>');
    Writeln(F, '<hr>');
    FRMPrincipal.QUEClientes.Next;
  end;
  CloseFile(F);
  ShellExecute(Handle, 'Open', Pchar ('C:\TCC-Gerenciamento\TodosCli_proc.html'),'','', SW_ShowMaximized);
end;

end.
