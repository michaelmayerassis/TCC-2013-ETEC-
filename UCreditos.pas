unit UCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TFRMCreditos = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    BTNFechar1: TBitBtn;
    BTNFechar2: TBitBtn;
    BTNAceitar: TBitBtn;
    procedure BTNAceitarClick(Sender: TObject);
    procedure BTNFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTNFechar1Click(Sender: TObject);
    procedure BTNFechar2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMCreditos: TFRMCreditos;

implementation

uses UTermosDeUso;

{$R *.dfm}

procedure TFRMCreditos.BTNFechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFRMCreditos.BTNFechar2Click(Sender: TObject);
begin
  close;
end;

procedure TFRMCreditos.BitBtn1Click(Sender: TObject);
begin
 Application.CreateForm(TFRMTermosDeUso,FRMTermosDeUso);
  FRMTermosDeUso.ShowModal;
end;

procedure TFRMCreditos.BTNAceitarClick(Sender: TObject);
begin
  Application.CreateForm(TFRMTermosDeUso,FRMTermosDeUso);
  FRMTermosDeUso.ShowModal;
end;

procedure TFRMCreditos.BTNFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFRMCreditos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
