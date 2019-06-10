unit UAndamento_Processo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolWin,ShellAPI,
  ComCtrls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompLabel, IWDBStdCtrls, Tabs, RpBase, RpSystem, RpCon, RpConDS, RpDefine,
  RpRave;

type
  TFRMAndamento_Processo = class(TForm)
    LBLAndamento: TLabel;
    LBLHistorico: TLabel;
    LBLCliente: TLabel;
    LBLVara: TLabel;
    LBLNome_parte_contraria: TLabel;
    DBEDataAndamento: TDBEdit;
    DBMHistorico: TDBMemo;
    BTNAbrir: TBitBtn;
    DBEVisualizarNome: TDBEdit;
    DBENome_cli: TDBEdit;
    DBEVara: TDBEdit;
    DBEExecutado: TDBEdit;
    QUEAndamento_processo: TADOQuery;
    QUEAndamento_processoDATA_ANDAMENTO: TWideStringField;
    QUEAndamento_processoAND_PATH: TStringField;
    QUEAndamento_processoV_1: TStringField;
    QUEAndamento_processoCOD_ANDAMENTO: TAutoIncField;
    QUEAndamento_processoHISTORICO: TMemoField;
    DTSAndamento_processo: TDataSource;
    OpenDialog1: TOpenDialog;
    QUEAndamento_processoNOME_CLI: TStringField;
    QUEAndamento_processoN_PROC: TStringField;
    QUEAndamento_processoN_VARA: TIntegerField;
    QUEAndamento_processoPARTE_CONT: TStringField;
    LBLNumero_processo: TLabel;
    DBENumero_Processo: TDBEdit;
    BTNCadastrar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNCancelar: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SBTNPrimeiro: TSpeedButton;
    SBTNAnterior: TSpeedButton;
    SBTNProximo: TSpeedButton;
    SBTNUltimo: TSpeedButton;
    BitBtn1: TBitBtn;
    QUEAndamento_processoN_2: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEData_comp_prazo: TDBEdit;
    DBEHorario: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    QUEAndamento_processoNUMERO_PROCESSO: TStringField;
    QUEAndamento_processoDATA_COMP_PRAZO: TStringField;
    QUEAndamento_processoHORARIO: TStringField;
    QUEAndamento_processoTIPO_COMP: TStringField;
    SpeedButton1: TSpeedButton;
    DBEdit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
    procedure BTNAbrirClick(Sender: TObject);
    procedure QUEAndamento_processoAfterPost(DataSet: TDataSet);
    procedure lblAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNAgendarClick(Sender: TObject);
    procedure DBEDataAndamentoExit(Sender: TObject);
    procedure DBMHistoricoClick(Sender: TObject);
    procedure DBEDataAndamentoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEData_comp_prazoExit(Sender: TObject);
    procedure DBEDataAndamentoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEData_comp_prazoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEHorarioKeyPress(Sender: TObject; var Key: Char);
    procedure QUEAndamento_processoBeforePost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function DataOk(Dt:String):Boolean; stdcall;
  end;

var
  FRMAndamento_Processo: TFRMAndamento_Processo;

implementation

uses UPrincipal, UAgenda;

{$R *.dfm}

procedure TFRMAndamento_Processo.BTNAgendarClick(Sender: TObject);
begin
Application.CreateForm(TFRMAgenda,FRMAgenda);
FRMAgenda.Show;
FRMAgenda.BTNCadastrar.Enabled:=false;
FRMAgenda.QUEAgenda.Insert;
FRMAgenda.DBEData_comp_prazo.text:=DBEDataAndamento.Text;
FRMAgenda.DBMHistorico.text:=DBMHistorico.Text;
end;

procedure TFRMAndamento_Processo.BitBtn1Click(Sender: TObject);
begin
if(trim(QUEAndamento_processoAND_PATH.Value)<> '') and (FileExists(QUEAndamento_processoAND_PATH.Value)) then
  begin
    ShellExecute(Handle,'Open',PChar(QUEAndamento_processoAND_PATH.AsString),'','',SW_SHOWMAXIMIZED);
  end;
end;

procedure TFRMAndamento_Processo.BTNAbrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute = True then
  begin
      if OpenDialog1.FileName <> '' then
      Begin
          if QUEAndamento_processo.State = dsBrowse then QUEAndamento_processo.Edit;
          QUEAndamento_processoAND_PATH.Value:=OpenDialog1.FileName;
          QUEAndamento_processoV_1.Value:= ExtractFileName(OpenDialog1.FileName);
          QUEAndamento_processoN_2.Value:=OpenDialog1.FileName;
      End;
  end;
end;

procedure TFRMAndamento_Processo.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEAndamento_processo.Insert;
end;

procedure TFRMAndamento_Processo.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEAndamento_processo.Cancel;
end;

procedure TFRMAndamento_Processo.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEAndamento_processo.Edit;
end;

procedure TFRMAndamento_Processo.BTNExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir o Andamento do Processo?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
  begin
  QUEAndamento_processo.Delete;
  if QUEAndamento_processo.isEmpty  then
  BTNExcluir.Enabled:= False;
  end;
end;

procedure TFRMAndamento_Processo.BTNsalvarClick(Sender: TObject);
//var
//Dados: TSHFileOpStruct;
//origem, destino: String;
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
//           origem:=OpenDialog1.FileName;
//          destino:='C:\TCC-Gerenciamento\Arquivos_Andamento';
//           If (origem<>'') and (destino<>'') then
//      begin
//        FillChar(Dados,SizeOf(Dados), 0);
//        with Dados do
//        begin
//          wFunc := FO_COPY;
//          pFrom := PChar(origem);
//          pTo := PChar(destino);
//          fFlags:= FOF_ALLOWUNDO;
//        end;
//        SHFileOperation(Dados);
//        ShowMessage('Processo finalizado. Verifique se sua cópia foi realizada corretamente.');
//      end;

  QUEAndamento_processo.Post;
  ShowMessage('Salvo!');
end;

function TFRMAndamento_Processo.DataOk(Dt: String): Boolean;
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

procedure TFRMAndamento_Processo.DBEDataAndamentoClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMAndamento_Processo.DBEDataAndamentoExit(Sender: TObject);
begin
if not DataOk(DBEDataAndamento.Text)then
ShowMessage('Data inválida');
end;

procedure TFRMAndamento_Processo.DBEDataAndamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
  DBEData_comp_prazo.SetFocus;
    key := #0;
  end;
end;

procedure TFRMAndamento_Processo.DBEData_comp_prazoExit(Sender: TObject);
begin
if not DataOk(DBEDataAndamento.Text)then
ShowMessage('Data inválida');
end;

procedure TFRMAndamento_Processo.DBEData_comp_prazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
  DBEHorario.SetFocus;
    key := #0;
  end;
end;

procedure TFRMAndamento_Processo.DBEHorarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
  DBMHistorico.SetFocus;
    key := #0;
  end;
end;

procedure TFRMAndamento_Processo.DBMHistoricoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMAndamento_Processo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  QUEAndamento_processo.Close;
end;

procedure TFRMAndamento_Processo.FormCreate(Sender: TObject);
begin
QUEAndamento_processo.Open;
end;

procedure TFRMAndamento_Processo.FormShow(Sender: TObject);
begin
if QUEAndamento_processo.isEmpty  then
  BTNExcluir.Enabled:= False;
  DBEdit1.Text:='C:\TCC-Gerenciamento\Arquivos_Andamento';
end;

procedure TFRMAndamento_Processo.lblAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
          QUEAndamento_processoV_1.Value:=ExtractFileName(OpenDialog1.FileName);
end;

procedure TFRMAndamento_Processo.QUEAndamento_processoAfterPost(
  DataSet: TDataSet);
begin
   QUEAndamento_processo.Close;
   QUEAndamento_processo.Open;
end;

procedure TFRMAndamento_Processo.QUEAndamento_processoBeforePost(
  DataSet: TDataSet);
begin
if trim(DBENome_cli.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o nome do cliente!');
    DBENome_cli.setfocus;
    abort;
  end;

  if trim(DBENumero_Processo.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o número do processo!');
    DBENumero_Processo.setfocus;
    abort;
  end;

  if trim(DBEExecutado.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha a parte contrária!');
    DBEExecutado.setfocus;
    abort;
  end;

  if trim(DBEVara.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o número da vara!');
    DBEVara.setfocus;
    abort;
  end;

  if trim(DBEDataAndamento.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha a data do andamento!');
    DBEDataAndamento.setfocus;
    abort;
  end;

  if trim(DBEData_comp_prazo.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha a data de prazo!');
    DBEData_comp_prazo.setfocus;
    abort;
  end;

  if trim(DBEHorario.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o horário!');
    DBEHorario.setfocus;
    abort;
  end;

  if trim(DBMHistorico.text)=''then
  begin
    BTNsalvar.Enabled:=true;
    showmessage('Preencha o histórico!');
    DBMHistorico.setfocus;
    abort;
  end;
end;

procedure TFRMAndamento_Processo.SBTNAnteriorClick(Sender: TObject);
begin
  QUEAndamento_processo.Prior;
  BTNCancelar.Click;
end;

procedure TFRMAndamento_Processo.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEAndamento_processo.First ;
  BTNCancelar.Click;
end;

procedure TFRMAndamento_Processo.SBTNProximoClick(Sender: TObject);
begin
  QUEAndamento_processo.Next;
  BTNCancelar.Click;
end;

procedure TFRMAndamento_Processo.SBTNUltimoClick(Sender: TObject);
begin
  QUEAndamento_processo.Last;
  BTNCancelar.Click;
end;


procedure TFRMAndamento_Processo.SpeedButton1Click(Sender: TObject);
var
Dados: TSHFileOpStruct;
origem, destino: String;
begin
  origem:=OpenDialog1.FileName;
          destino:='C:\TCC-Gerenciamento\Arquivos_Andamento';
           If (origem<>'') and (destino<>'') then
      begin
        FillChar(Dados,SizeOf(Dados), 0);
        with Dados do
        begin
          wFunc := FO_COPY;
          pFrom := PChar(origem);
          pTo := PChar(destino);
          fFlags:= FOF_ALLOWUNDO;
        end;
        SHFileOperation(Dados);
        ShowMessage('Processo finalizado. Verifique se sua cópia foi realizada corretamente.');
      end;
end;

end.
