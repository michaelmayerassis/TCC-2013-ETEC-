unit URelatorio_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB,ShellApi, StdCtrls, OleCtrls, SHDocVw;

type
  TFRMRelatorio_Cliente = class(TForm)
    QUEClientes: TADOQuery;
    DTSClientes: TDataSource;
    QUEClientesCLI_NOME: TStringField;
    QUEClientesCLI_ENDERECO: TStringField;
    QUEClientesCLI_CEP: TStringField;
    QUEClientesCLI_RG: TStringField;
    QUEClientesCLI_COMPLEMENTO: TStringField;
    QUEClientesCLI_CPF: TStringField;
    QUEClientesCLI_ESTADO: TStringField;
    QUEClientesCLI_DATA_NASC: TWideStringField;
    QUEClientesCLI_BAIRRO: TStringField;
    QUEClientesCLI_CIDADE: TStringField;
    QUEClientesCLI_TELEFONE: TStringField;
    QUEClientesCLI_TELEFONE2: TStringField;
    QUEClientesCLI_EMAIL: TStringField;
    QUEClientesCLI_EMAIL2: TStringField;
    QUEClientesCOD_CLI: TAutoIncField;
    QUEClientesCLI_PATH: TStringField;
    WebBrowser1: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMRelatorio_Cliente: TFRMRelatorio_Cliente;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFRMRelatorio_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
QUEClientes.Close;
end;

procedure TFRMRelatorio_Cliente.FormCreate(Sender: TObject);
begin
QUEClientes.Open;
end;

procedure TFRMRelatorio_Cliente.FormShow(Sender: TObject);


end.
