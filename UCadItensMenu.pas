unit UCadItensMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ToolWin,
  ComCtrls;

type
  TFRMCadItensMenu = class(TForm)
    LBLDescItem: TLabel;
    DBEDescItem: TDBEdit;
    DTSItem: TDataSource;
    QUEItem: TADOQuery;
    QUEItemCOD_ITEM: TAutoIncField;
    QUEItemDESCRICAO_ITEM: TStringField;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTNCadastrarClick(Sender: TObject);
    procedure BTNsalvarClick(Sender: TObject);
    procedure BTNEditarClick(Sender: TObject);
    procedure BTNCancelarClick(Sender: TObject);
    procedure BTNExcluirClick(Sender: TObject);
    procedure SBTNPrimeiroClick(Sender: TObject);
    procedure SBTNAnteriorClick(Sender: TObject);
    procedure SBTNProximoClick(Sender: TObject);
    procedure SBTNUltimoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCadItensMenu: TFRMCadItensMenu;

implementation

{$R *.dfm}

procedure TFRMCadItensMenu.BTNCadastrarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEItem.Insert;
end;

procedure TFRMCadItensMenu.BTNCancelarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEItem.Cancel;
end;

procedure TFRMCadItensMenu.BTNEditarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=False;
  BTNEditar.Enabled:=False;
  BTNsalvar.Enabled:=True;
  BTNCancelar.Enabled:=True;
  QUEItem.Edit;
end;

procedure TFRMCadItensMenu.BTNExcluirClick(Sender: TObject);
begin
  QUEItem.Delete;
end;

procedure TFRMCadItensMenu.BTNsalvarClick(Sender: TObject);
begin
  BTNCadastrar.Enabled:=True;
  BTNEditar.Enabled:=True;
  BTNsalvar.Enabled:=False;
  BTNCancelar.Enabled:=False;
  QUEItem.Post;
end;

procedure TFRMCadItensMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QUEItem.Close;
  Action:= caFree;
end;

procedure TFRMCadItensMenu.FormCreate(Sender: TObject);
begin
  QUEItem.Open;

end;

procedure TFRMCadItensMenu.SBTNAnteriorClick(Sender: TObject);
begin
  QUEItem.Prior;
end;

procedure TFRMCadItensMenu.SBTNPrimeiroClick(Sender: TObject);
begin
  QUEItem.First;
end;

procedure TFRMCadItensMenu.SBTNProximoClick(Sender: TObject);
begin
  QUEItem.Next;
end;

procedure TFRMCadItensMenu.SBTNUltimoClick(Sender: TObject);
begin
  QUEItem.Last;
end;

end.
