unit UPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TFRMLocalizar = class(TForm)
    LblNome: TLabel;
    SBLocalizar: TSpeedButton;
    SBLimpar: TSpeedButton;
    DBGrResultado: TDBGrid;
    EdtLocalizar: TEdit;
    QueLocalizar: TADOQuery;
    DtsLocalizar: TDataSource;
    Panel1: TPanel;
    procedure SBLocalizarClick(Sender: TObject);
    procedure SBLimparClick(Sender: TObject);
    procedure SBFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrResultadoDblClick(Sender: TObject);
    procedure EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMLocalizar: TFRMLocalizar;

implementation

uses UPrincipal, UClientes;

{$R *.dfm}

procedure TFRMLocalizar.DBGrResultadoDblClick(Sender: TObject);
begin
  if (QueLocalizar.Active) and (QueLocalizar.RecordCount > 0 ) then //recordcount retorna a quantidade de dados da Que
  begin
      FRMClientes.QUEClientes.Close;
      FRMClientes.QUEClientes.SQL.Clear;
      FRMClientes.QUEClientes.SQL.Add('SELECT *');
      FRMClientes.QUEClientes.SQL.Add('FROM CLIENTE');
      FRMClientes.QUEClientes.SQL.Add('WHERE CLI_CPF = ''' + QueLocalizar.FieldByName('CLI_CPF').AsString+'''');
      FRMClientes.QUEClientes.Open;
      Close;
  end
end;

procedure TFRMLocalizar.EdtLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SBLocalizar.Click;
    key := #0;
  end;
end;

procedure TFRMLocalizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QueLocalizar.Close;
end;

procedure TFRMLocalizar.FormShow(Sender: TObject);
begin
  EdtLocalizar.SetFocus;
end;

procedure TFRMLocalizar.SBFecharClick(Sender: TObject);
begin
  FRMLocalizar.Close;
end;

procedure TFRMLocalizar.SBLimparClick(Sender: TObject);
begin
  EdtLocalizar.Text := '';
  QueLocalizar.Close;
  EdtLocalizar.SetFocus;
end;

procedure TFRMLocalizar.SBLocalizarClick(Sender: TObject);
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
      if (QueLocalizar.Active) and (QueLocalizar.RecordCount =0 ) then
  if (Application.MessageBox(' Cliente não cadastrado deseja prosseguir?','Atenção!',mb_YESNO+mb_iconInformation) = mrYes) then
   begin
   FRMClientes.BTNCadastrar.Enabled:=False;
   FRMClientes.BTNEditar.Enabled:=False;
   FRMClientes.BTNsalvar.Enabled:=True;
   FRMClientes.BTNCancelar.Enabled:=True;
   FRMClientes.QUEClientes.Insert;
   FRMClientes.edtnome.Visible:=True;
   FRMClientes.DBENome.Visible:=False;
   FRMClientes.edtnome.Text:=EdtLocalizar.Text;
   FRMClientes.QUEClientesCLI_NOME.Value:=FRMClientes.edtnome.Text;
   FRMClientes.edtnome.SetFocus;
   close;
   end;
end;

end.
