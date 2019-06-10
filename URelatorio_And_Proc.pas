unit URelatorio_And_Proc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,ShellAPI;

type
  TFRMRAnd_Proc = class(TForm)
    Panel1: TPanel;
    LblNome: TLabel;
    SBLimpar: TSpeedButton;
    SBLocalizar: TSpeedButton;
    EdtLocalizar: TEdit;
    QUENome: TADOQuery;
    DTSNome: TDataSource;
    QUENomeCOD_ANDAMENTO: TAutoIncField;
    QUENomeNOME_CLI: TStringField;
    QUENomeDATA_ANDAMENTO: TStringField;
    DBGrResultado: TDBGrid;
    procedure SBLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SBLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrResultadoDblClick(Sender: TObject);
    procedure EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMRAnd_Proc: TFRMRAnd_Proc;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMRAnd_Proc.DBGrResultadoDblClick(Sender: TObject);
var
  F:TextFile;
  Aux, Aux1 : String;
begin
 FRMPrincipal.QUEAndamento_processo.Close;
  FRMPrincipal.QUEAndamento_processo.Open;


  if (QUENome.Active) and (QUENome.RecordCount > 0 ) then //recordcount retorna a quantidade de dados da Que
  begin
      FRMPrincipal.QUEAndamento_processo.Close;
      FRMPrincipal.QUEAndamento_processo.SQL.Clear;
      FRMPrincipal.QUEAndamento_processo.SQL.Add('SELECT *');
      FRMPrincipal.QUEAndamento_processo.SQL.Add('FROM ANDAMENTO_PROCESSO');
      FRMPrincipal.QUEAndamento_processo.SQL.Add('WHERE COD_ANDAMENTO = ''' + QUENomeCOD_ANDAMENTO.AsString+'''');
      FRMPrincipal.QUEAndamento_processo.Open;
  end;

  AssignFile(F,'C:\TCC-Gerenciamento\AND_PROC.html');
  RewRite(F);
  Writeln(F, '<HTML>');
  Writeln(F, '<HEAD>');
  Writeln(F, '<TITLE>');
  Writeln(F, '<Relatório de andamento>');
  Writeln(F, '</TITLE>');
  Writeln(F, '</HEAD>');
  Writeln(F, '<BODY style="font-family:Segoe UI,Arial,Microsoft Sans Serif;">');
  Writeln(F, '<H1> <CENTER> Relatório de andamento </CENTER> </H1>');

  begin
    Writeln(F, '<h2> <center>' +FRMPrincipal.QUEAndamento_processoNOME_CLI.AsString +'</h2>');
    Writeln(F, '<TABLE BORDER="2" WIDTH="100%">');
    Writeln(F, '<TR>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Número Processo </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Parte Contrária </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Número da Vara </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Andamento </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Data Comp/prazo </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Histórico </TH>');
    Writeln(F, '<TH NOWRAP="NOWRAP"> Imagem </TH>');
    Writeln(F, '</TR>');
//    if QUENomeCOD_ANDAMENTO= FRMPrincipal.QUEAndamento_processoCOD_ANDAMENTO then
//    begin
      Aux := FRMPrincipal.QUEAndamento_processoHISTORICO.AsString;
     while Length(Aux) > 0 do
  begin
    Aux1 := Aux1 + '<BR>' +Copy(Aux,1,76);
    Aux := Copy(Aux,77);
//  end;
    end;
    Writeln(F, '<TR>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoN_PROC.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoPARTE_CONT.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoN_VARA.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_ANDAMENTO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">' +FRMPrincipal.QUEAndamento_processoDATA_COMP_PRAZO.AsString +'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP">'+ aux1+'</TD>');
    Writeln(F, '<TD align= center NOWRAP="NOWRAP"><a href="'+FRMPrincipal.QUEAndamento_processoN_2.AsString +'" target="_blank" title="Imagem">'+FRMPrincipal.QUEAndamento_processoV_1.AsString +' </a></TD>');
    Writeln(F, '</TR></TABLE>');
  end;
  CloseFile(F);
  ShellExecute(Handle, 'Open', Pchar ('C:\TCC-Gerenciamento\AND_PROC.html'),'','', SW_ShowMaximized);
end;

procedure TFRMRAnd_Proc.EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SBLocalizar.Click;
    key := #0;
  end;
end;

procedure TFRMRAnd_Proc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:= caFree;
QUENome.Close;
//QUEAndamento.Close;
end;

procedure TFRMRAnd_Proc.FormCreate(Sender: TObject);
begin
//QUEAndamento.Open;
end;

procedure TFRMRAnd_Proc.FormShow(Sender: TObject);
begin
  EdtLocalizar.SetFocus;
end;

procedure TFRMRAnd_Proc.SBLimparClick(Sender: TObject);
begin
  EdtLocalizar.Text := '';
  QUENome.Close;
  EdtLocalizar.SetFocus;
end;

procedure TFRMRAnd_Proc.SBLocalizarClick(Sender: TObject);
begin
 if Trim (EdtLocalizar.Text) = '' then
  begin
    ShowMessage('Digite parte do nome do Cliente');
    EdtLocalizar.SetFocus;
    Abort;
  end;

  QUENome.Close;
  QUENome.SQL.Clear;
  QUENome.SQL.Add('SELECT  COD_ANDAMENTO, NOME_CLI,DATA_ANDAMENTO');
  QUENome.SQL.Add('FROM ANDAMENTO_PROCESSO');
  QUENome.SQL.Add('WHERE NOME_CLI LIKE ''%' + EdtLocalizar.Text + '%''');
  QUENome.SQL.Add('ORDER BY NOME_CLI');
  QUENome.Open;

  if QUENome.RecordCount > 0 then
    DBGrResultado.SetFocus;
end;

end.
