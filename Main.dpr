program Main;

uses
  Vcl.Forms,
  TestTask in 'TestTask.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
