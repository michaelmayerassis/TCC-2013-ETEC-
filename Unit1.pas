unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TFRMAndamento_Processo = class(TForm)
    LBLData: TLabel;
    DBEData: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMAndamento_Processo: TFRMAndamento_Processo;

implementation

{$R *.dfm}

end.
