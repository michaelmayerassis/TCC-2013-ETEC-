unit UAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, ExtCtrls, DB, ADODB, Buttons, ToolWin,
  ComCtrls;

type
  TFRMAgenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEData_comp_prazo: TDBEdit;
    DBMHistorico: TDBMemo;
    DBEHorario: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    QUEAgenda: TADOQuery;
    QUEAgendaDATA_COMP_PRAZO: TStringField;
    QUEAgendaHORARIO: TWideStringField;
    QUEAgendaLEMBRETE: TMemoField;
    QUEAgendaASSUNTO: TStringField;
    DTSAgenda: TDataSource;
    QUEAgendaCOD_AGENDA: TAutoIncField;
    QUEAgendaCOD_ANDAMENTO: TIntegerField;
    BTNCadastrar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNCancelar: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SBTNPrimeiro: TSpeedButton;
    SBTNAnterior: TSpeedButton;
    SBTNProximo: TSpeedButton;
    SBTNUltimo: TSpeedButton;
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEData_comp_prazoExit(Sender: TObject);
    procedure DBEData_comp_prazoClick(Sender: TObject);
    procedure DBEHorarioClick(Sender: TObject);
    procedure DBMHistoricoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMAgenda: TFRMAgenda;

implementation

uses UProcessos, UAndamento_Processo;

{$R *.dfm}

procedure TFRMAgenda.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEAgenda.Insert;
end;

procedure TFRMAgenda.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEAgenda.Cancel;
end;

procedure TFRMAgenda.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEAgenda.Edit;
end;

procedure TFRMAgenda.BTNExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir ?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
QUEAgenda.Delete;
end;

procedure TFRMAgenda.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEAgenda.Post;
end;

procedure TFRMAgenda.DBEData_comp_prazoClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMAgenda.DBEData_comp_prazoExit(Sender: TObject);
begin
if DBEData_comp_prazo.Text=DateToStr(date)then
ShowMessage('Data inválida');
end;

procedure TFRMAgenda.DBEHorarioClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMAgenda.DBMHistoricoClick(Sender: TObject);
begin
  BTNEditar.Enabled:=False;
  BTNCadastrar.Enabled:=False;
  BTNCancelar.Enabled:=True;
  BTNsalvar.Enabled:=True;
end;

procedure TFRMAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QUEAgenda.Close;
end;

procedure TFRMAgenda.FormCreate(Sender: TObject);
begin
QUEAgenda.Open;
end;

procedure TFRMAgenda.SBTNAnteriorClick(Sender: TObject);
begin
  QUEAgenda.Prior;
  BTNCancelar.Click;
end;

procedure TFRMAgenda.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEAgenda.First;
  BTNCancelar.Click;
end;

procedure TFRMAgenda.SBTNProximoClick(Sender: TObject);
begin
  QUEAgenda.Next;
  BTNCancelar.Click;
end;

procedure TFRMAgenda.SBTNUltimoClick(Sender: TObject);
begin
  QUEAgenda.Last;
  BTNCancelar.Click;
end;

end.
