unit UTermosDeUso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, DBCtrls;

type
  TFRMTermosDeUso = class(TForm)
    LBLConcordar: TCheckBox;
    QUETermosDeUso: TADOQuery;
    DTSTermosDeUso: TDataSource;
    QUETermosDeUsoaceitar_termos: TStringField;
    BTNFechar1: TBitBtn;
    QUETermosDeUsotermos: TMemoField;
    BTNFechar2: TBitBtn;
    DBMemo1: TDBMemo;
    BTNProximo: TBitBtn;
    procedure LBLConcordarClick(Sender: TObject);
    procedure BTNFecharClick(Sender: TObject);
    procedure BTNProximoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNFechar1Click(Sender: TObject);
    procedure BTNFechar2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMTermosDeUso: TFRMTermosDeUso;

implementation

uses UPrincipal, ULogin, UCreditos, UCadUsuario;

{$R *.dfm}

procedure TFRMTermosDeUso.BitBtn1Click(Sender: TObject);
begin
Application.CreateForm(TFRMCadUsuarios, FRMCadUsuarios);
  FRMCadUsuarios.ShowModal;
//  QUETermosDeUso.Edit;
//  QUETermosDeUsotermos.Value:=Memo1.Text;
//  QUETermosDeUso.Post;
end;

procedure TFRMTermosDeUso.BTNFechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFRMTermosDeUso.BTNProximoClick(Sender: TObject);
begin
  Application.CreateForm(TFRMCadUsuarios, FRMCadUsuarios);
  FRMCadUsuarios.ShowModal;
//  QUETermosDeUso.Edit;
//  QUETermosDeUsotermos.Value:=Memo1.Text;
//  QUETermosDeUso.Post;
end;

procedure TFRMTermosDeUso.BTNFechar2Click(Sender: TObject);
begin
  close;
end;

procedure TFRMTermosDeUso.BTNFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFRMTermosDeUso.LBLConcordarClick(Sender: TObject);
begin
if LBLConcordar.Checked then
begin
  BTNProximo.Enabled:=True;
end
else
  BTNProximo.Enabled:=false;
end;

procedure TFRMTermosDeUso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  QUETermosDeUso.Close;
end;

procedure TFRMTermosDeUso.FormCreate(Sender: TObject);
begin
  QUETermosDeUso.Open;
end;

procedure TFRMTermosDeUso.FormShow(Sender: TObject);
begin
  FRMCreditos.Close;
   DBMemo1.Text:=QUETermosDeUsotermos.Value;

end;

end.
