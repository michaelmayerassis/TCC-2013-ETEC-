unit ULocalizarProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFRMLocalizarProc = class(TForm)
    DBGrResultado: TDBGrid;
    Panel1: TPanel;
    SBLimpar: TSpeedButton;
    SBLocalizar: TSpeedButton;
    EdtLocalizar: TEdit;
    QueLocalizar: TADOQuery;
    DtsLocalizar: TDataSource;
    RGOpcao: TRadioGroup;
    procedure SBLocalizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBLimparClick(Sender: TObject);
    procedure SBFecharClick(Sender: TObject);
    procedure DBGrResultadoDblClick(Sender: TObject);
    procedure EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RGOpcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMLocalizarProc: TFRMLocalizarProc;

implementation

uses UProcessos, UPrincipal;

{$R *.dfm}

procedure TFRMLocalizarProc.DBGrResultadoDblClick(Sender: TObject);
begin
  if (QueLocalizar.Active) and (QueLocalizar.RecordCount > 0 ) then //recordcount retorna a quantidade de dados da Que
  begin
      FRMProcessos.QUEProcesso.Close;
      FRMProcessos.QUEProcesso.SQL.Clear;
      FRMProcessos.QUEProcesso.SQL.Add('SELECT *');
      FRMProcessos.QUEProcesso.SQL.Add('FROM PROCESSO');
      if RGOpcao.ItemIndex = 0 then
      BEGIN
      FRMProcessos.QUEProcesso.SQL.Add('WHERE NUMERO_PROCESSO = ''' + QueLocalizar.FieldByName('NUMERO_PROCESSO').AsString+'''');
      END;
       if RGOpcao.ItemIndex = 1 then
      BEGIN
      FRMProcessos.QUEProcesso.SQL.Add('WHERE NUMERO_PROCESSO = ''' + QueLocalizar.FieldByName('NUMERO_PROCESSO').AsString+'''');
      END;
      if RGOpcao.ItemIndex = 2 then
      BEGIN
      FRMProcessos.QUEProcesso.SQL.Add('WHERE CLI_CPF = ''' + QueLocalizar.FieldByName('CLI_CPF').AsString+'''');
      END;
       if RGOpcao.ItemIndex = 3 then
      BEGIN
      FRMProcessos.QUEProcesso.SQL.Add('WHERE CLI_CPF = ''' + QueLocalizar.FieldByName('CLI_CPF').AsString+'''');
      END;
      FRMProcessos.QUEProcesso.Open;
      Close;
  end;
end;

procedure TFRMLocalizarProc.EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SBLocalizar.Click;
    key := #0;
  end;
end;

procedure TFRMLocalizarProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  QueLocalizar.Close;
 // QUEClientes.Close;
end;

procedure TFRMLocalizarProc.FormShow(Sender: TObject);
begin
  EdtLocalizar.SetFocus;
end;

procedure TFRMLocalizarProc.RGOpcaoClick(Sender: TObject);
begin
  EdtLocalizar.Clear;
  EdtLocalizar.SetFocus;
end;

procedure TFRMLocalizarProc.SBFecharClick(Sender: TObject);
begin
  FRMLocalizarProc.Close;
end;

procedure TFRMLocalizarProc.SBLimparClick(Sender: TObject);
begin
  EdtLocalizar.Text := '';
  QueLocalizar.Close;
  EdtLocalizar.SetFocus;
end;

procedure TFRMLocalizarProc.SBLocalizarClick(Sender: TObject);
begin
  if Trim (EdtLocalizar.Text) = '' then
  begin
      ShowMessage('Digite parte do Número do Processo');
      EdtLocalizar.SetFocus;
      Abort;
  end;

  QueLocalizar.Close;
  QueLocalizar.SQL.Clear;
  if RGOpcao.ItemIndex = 0 then
  begin
    QueLocalizar.SQL.Add('SELECT  NUMERO_PROCESSO');
    QueLocalizar.SQL.Add('FROM PROCESSO');
    QueLocalizar.SQL.Add('WHERE NUMERO_PROCESSO LIKE''%' + EdtLocalizar.Text + '%''');
  end
  else
  if RGOpcao.ItemIndex = 1 then
  begin
    QueLocalizar.SQL.Add('SELECT  NUMERO_PROCESSO');
    QueLocalizar.SQL.Add('FROM PROCESSO');
    QueLocalizar.SQL.Add('WHERE NUMERO_VARA_PROCESSO LIKE''%' + EdtLocalizar.Text + '%''');
    QueLocalizar.SQL.Add('ORDER BY NUMERO_PROCESSO');
  end
  else
  if RGOpcao.ItemIndex = 2 then
  begin
    QueLocalizar.SQL.Add('SELECT  CLI_CPF, CLI_NOME');
    QueLocalizar.SQL.Add('FROM CLIENTE');
    QueLocalizar.SQL.Add('WHERE CLI_NOME LIKE''%' + EdtLocalizar.Text + '%''');
    QueLocalizar.SQL.Add('ORDER BY CLI_NOME');
  end
  else
  if RGOpcao.ItemIndex = 3 then
  begin
    QueLocalizar.SQL.Add('SELECT  CLI_CPF, CLI_NOME');
    QueLocalizar.SQL.Add('FROM CLIENTE');
    QueLocalizar.SQL.Add('WHERE CLI_CIDADE LIKE''%' + EdtLocalizar.Text + '%''');
    QueLocalizar.SQL.Add('ORDER BY CLI_NOME');
  end;

  QueLocalizar.Open;

  if QueLocalizar.RecordCount > 0 then
    DBGrResultado.SetFocus;
end;

end.
