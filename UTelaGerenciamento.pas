unit UTelaGerenciamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFRMGerenciamento = class(TForm)
    PNLRodape: TPanel;
    SBPermitir: TSpeedButton;
    SBRevogar: TSpeedButton;
    SBFechar: TSpeedButton;
    QUEGrupo: TADOQuery;
    QUEGrupoCOD_GRUPO: TAutoIncField;
    QUEGrupoDESCRICAO_GRUPO: TStringField;
    QUEUsuario: TADOQuery;
    QUEUsuarioCOD_USUARIO: TAutoIncField;
    QUEUsuarioNOME: TStringField;
    QUEItensAssociados: TADOQuery;
    QUEItensAssociadosCOD_ITEM: TAutoIncField;
    QUEItensAssociadosDESCRICAO_ITEM: TStringField;
    QUEItensDisponiveis: TADOQuery;
    DTSGrupo: TDataSource;
    DTSUsuario: TDataSource;
    DTSItensAssociados: TDataSource;
    DTSItensDisponiveis: TDataSource;
    QUEItensDisponiveisCOD_ITEM: TAutoIncField;
    QUEItensDisponiveisDESCRICAO_ITEM: TStringField;
    PNLCentral: TPanel;
    DBGItensAssociados: TDBGrid;
    PNLDireita: TPanel;
    DBGItensDisponiveis: TDBGrid;
    PNLEsquerda: TPanel;
    PNLSuperior: TPanel;
    DBGGrupo: TDBGrid;
    PNLInferior: TPanel;
    DBGUsuario: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBPermitirClick(Sender: TObject);
    procedure SBRevogarClick(Sender: TObject);
    procedure SBFecharClick(Sender: TObject);
    procedure DBGItensDisponiveisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGItensAssociadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGUsuarioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGGrupoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMGerenciamento: TFRMGerenciamento;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMGerenciamento.DBGGrupoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Odd(QUEGrupo.RecNo) then
  begin
    //verifica se a célula não está selecionada
    if not (gdSelected in State) then
    begin
      //define a cor de fundo
      DBGGrupo.Canvas.Brush.Color := $D3d3d3;
      DBGGrupo.Canvas.FillRect(Rect);
      //destacando os agendamentos realizados
      //pinta o texto padrão
      DBGGrupo.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TFRMGerenciamento.DBGItensAssociadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Odd(QUEItensAssociados.RecNo) then
  begin
    //verifica se a célula não está selecionada
    if not (gdSelected in State) then
    begin
      //define a cor de fundo
      DBGItensAssociados.Canvas.Brush.Color := $D3d3d3;
      DBGItensAssociados.Canvas.FillRect(Rect);
      //destacando os agendamentos realizados
      //pinta o texto padrão
      DBGItensAssociados.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TFRMGerenciamento.DBGItensDisponiveisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Odd(QUEItensDisponiveis.RecNo) then
  begin
    //verifica se a célula não está selecionada
    if not (gdSelected in State) then
    begin
      //define a cor de fundo
      DBGItensDisponiveis.Canvas.Brush.Color := $D3d3d3;
      DBGItensDisponiveis.Canvas.FillRect(Rect);
      //destacando os agendamentos realizados
      //pinta o texto padrão
      DBGItensDisponiveis.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TFRMGerenciamento.DBGUsuarioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not Odd(QUEUsuario.RecNo) then
  begin
    //verifica se a célula não está selecionada
    if not (gdSelected in State) then
    begin
      //define a cor de fundo
      DBGUsuario.Canvas.Brush.Color := $D3d3d3;
      DBGUsuario.Canvas.FillRect(Rect);
      //destacando os agendamentos realizados
      //pinta o texto padrão
      DBGUsuario.DefaultDrawDataCell(Rect,Column.Field,State);
    end;
  end;
end;

procedure TFRMGerenciamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
  QUEGrupo.Close;
  QUEUsuario.Close;
  QUEItensDisponiveis.Close;
  QUEItensAssociados.Close;
end;

procedure TFRMGerenciamento.FormCreate(Sender: TObject);
begin
  QUEGrupo.Open;
  QUEUsuario.Open;
  QUEItensDisponiveis.Open;
  QUEItensAssociados.Open;
end;

procedure TFRMGerenciamento.SBFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFRMGerenciamento.SBPermitirClick(Sender: TObject);
begin
  if QUEItensDisponiveis.RecordCount = 0 then
  begin
    ShowMessage('Não há itens a permitir');
    Abort;
  end;
  if trim (FRMPrincipal.TIPO)='' then
  begin
    ShowMessage('Somente membros do grupo administrador podem alterar direitos');
    Abort;
  end;
    //Colocar aqui a checagem para ver se o usuario é membro do grupo administrador

    If MessageDlg ('Deseja realmente associar o item ao grupo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then Abort;
    FRMPrincipal.QUEGenerica.Close;
    FRMPrincipal.QUEGenerica.SQL.Clear;
    FRMPrincipal.QUEGenerica.SQL.ADD('Insert Into Grupo_Item Values(' +QUEGrupoCOD_GRUPO.AsString +','+ QUEItensDisponiveisCOD_ITEM.AsString+')');
    FRMPrincipal.QUEGenerica.ExecSQL;
    QUEItensDisponiveis.Close;
    QUEItensDisponiveis.Open;
    QUEItensAssociados.Close;
    QUEItensAssociados.Open;
end;

procedure TFRMGerenciamento.SBRevogarClick(Sender: TObject);
begin
  if QUEItensAssociados.RecordCount = 0 then
  begin
    ShowMessage('Não há itens a Revogar');
    Abort;
  end;
  if trim (FRMPrincipal.TIPO)='' then
  begin
    ShowMessage('Somente membros do grupo administrador podem alterar direitos');
    Abort;
  end;
    //Colocar aqui a checagem para ver se o usuario é membro do grupo administrador

    If MessageDlg ('Deseja realmente revogar o item ao grupo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then Abort;
    FRMPrincipal.QUEGenerica.Close;
    FRMPrincipal.QUEGenerica.SQL.Clear;
    FRMPrincipal.QUEGenerica.SQL.ADD('Delete From Grupo_Item Where Cod_Grupo = ' + QUEGrupoCOD_GRUPO.AsString +'and cod_item ='+ QUEItensAssociadosCOD_ITEM.AsString);
    FRMPrincipal.QUEGenerica.ExecSQL;
    QUEItensDisponiveis.Close;
    QUEItensDisponiveis.Open;
    QUEItensAssociados.Close;
    QUEItensAssociados.Open;
end;

end.
