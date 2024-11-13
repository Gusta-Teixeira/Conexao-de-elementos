program TesteLogico;

uses
  QForms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {frMenuPrincipal},
  uNetwork in 'uNetwork.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrMenuPrincipal, frMenuPrincipal);
  Application.Run;
end.
