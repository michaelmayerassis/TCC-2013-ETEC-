program Gerenciamento_Escritorio_Advocacia;

uses
  SysUtils,
  Forms,
  UPrincipal in 'UPrincipal.pas' {FRMPrincipal},
  UClientes in 'UClientes.pas' {FRMClientes},
  UProcessos in 'UProcessos.pas' {FRMProcessos},
  UAndamento_Processo in 'UAndamento_Processo.pas' {FRMAndamento_Processo},
  UPesquisa in 'UPesquisa.pas' {FRMLocalizar},
  ULocalizarProc in 'ULocalizarProc.pas' {FRMLocalizarProc},
  UTelaGerenciamento in 'UTelaGerenciamento.pas' {FRMGerenciamento},
  ULogin in 'ULogin.pas' {FRMLogin},
  UCadUsuario in 'UCadUsuario.pas' {FRMCadUsuarios},
  UCadGrupo in 'UCadGrupo.pas' {FRMCadGrupo},
  UCadItensMenu in 'UCadItensMenu.pas' {FRMCadItensMenu},
  UAgenda in 'UAgenda.pas' {FRMAgenda},
  URelatorio_Cliente_proc in 'URelatorio_Cliente_proc.pas' {FRMRe_cli_proc},
  UCreditos in 'UCreditos.pas' {FRMCreditos},
  UTermosDeUso in 'UTermosDeUso.pas' {FRMTermosDeUso},
  USplash in 'USplash.pas' {FRMSplash},
  URelatorio_And_Proc in 'URelatorio_And_Proc.pas' {FRMRAnd_Proc};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  Application.CreateForm(TFRMCreditos, FRMCreditos);
  Application.CreateForm(TFRMTermosDeUso, FRMTermosDeUso);
  Application.CreateForm(TFRMRAnd_Proc, FRMRAnd_Proc);
  Application.Run;
end.
