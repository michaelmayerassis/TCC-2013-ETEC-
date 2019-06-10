unit UCadGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, ToolWin,
  ComCtrls;

type
  TFRMCadGrupo = class(TForm)
    LBLDescGrupo: TLabel;
    LBLTipo: TLabel;
    DBEDescGrupo: TDBEdit;
    DBCBTipo: TDBComboBox;
    QUEGrupo: TADOQuery;
    QUEGrupoCOD_GRUPO: TAutoIncField;
    QUEGrupoDESCRICAO_GRUPO: TStringField;
    DTSGrupo: TDataSource;
    ToolBar1: TToolBar;
    BTNCadastrar: TSpeedButton;
    BTNsalvar: TSpeedButton;
    BTNEditar: TSpeedButton;
    BTNCancelar: TSpeedButton;
    BTNExcluir: TSpeedButton;
    SBTNPrimeiro: TSpeedButton;
    SBTNAnterior: TSpeedButton;
    SBTNProximo: TSpeedButton;
    SBTNUltimo: TSpeedButton;
    QUEGrupoTIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QUEGrupoBeforePost(DataSet: TDataSet);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadGrupo: TFRMCadGrupo;

implementation

{$R *.dfm}

procedure TFRMCadGrupo.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEGrupo.Insert;
end;

procedure TFRMCadGrupo.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEGrupo.Cancel;
end;

procedure TFRMCadGrupo.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEGrupo.Edit;
end;

procedure TFRMCadGrupo.BTNExcluirClick(Sender: TObject);
begin
  QUEGrupo.Delete;
end;

procedure TFRMCadGrupo.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEGrupo.Post;
end;

procedure TFRMCadGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUEGrupo.Close;
  Action:=  caFree;
end;

procedure TFRMCadGrupo.FormCreate(Sender: TObject);
begin
  QUEGrupo.Open;
end;

procedure TFRMCadGrupo.QUEGrupoBeforePost(DataSet: TDataSet);
begin
  if trim(DBEDescGrupo.Text)='' then
  begin

    ShowMessage('Preencha a descrição do grupo');
    DBEDescGrupo.SetFocus;
    abort;

  end;
end;

procedure TFRMCadGrupo.SBTNAnteriorClick(Sender: TObject);
begin
  QUEGrupo.Prior;
  BTNEditar.Enabled:=True;
  BTNCancelar.Enabled:=False;
  BTNsalvar.Enabled:=False;
end;

procedure TFRMCadGrupo.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEGrupo.First;
  BTNEditar.Enabled:=True;
  BTNCancelar.Enabled:=False;
  BTNsalvar.Enabled:=False;
end;

procedure TFRMCadGrupo.SBTNProximoClick(Sender: TObject);
begin
  QUEGrupo.Next;
  BTNEditar.Enabled:=True;
  BTNCancelar.Enabled:=False;
  BTNsalvar.Enabled:=False;
end;

procedure TFRMCadGrupo.SBTNUltimoClick(Sender: TObject);
begin
  QUEGrupo.Last;
  BTNEditar.Enabled:=True;
  BTNCancelar.Enabled:=False;
  BTNsalvar.Enabled:=False;
end;

end.
