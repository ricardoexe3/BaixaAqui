program ProjDownload;

uses
  Vcl.Forms,
  uDownload.View.Main in 'uDownload.View.Main.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
