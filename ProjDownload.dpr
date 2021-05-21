program ProjDownload;

uses
  Vcl.Forms,
  uDownload.View.Main in 'View\uDownload.View.Main.pas' {FrmMain},
  uDownload.View.Historico in 'View\uDownload.View.Historico.pas' {FrmHistorico},
  uDownload.Controller.ProcessarDownload in 'Controller\uDownload.Controller.ProcessarDownload.pas',
  uDownload.Controller.Interfaces in 'Controller\uDownload.Controller.Interfaces.pas',
  uDownload.Model.ProcessarDownload in 'Model\uDownload.Model.ProcessarDownload.pas',
  uDownload.Model.Interfaces in 'Model\uDownload.Model.Interfaces.pas',
  uDownload.Model.Conexao in 'Model\Conexao\uDownload.Model.Conexao.pas',
  uDownload.Model.Interfaces.Conexao in 'Model\Conexao\uDownload.Model.Interfaces.Conexao.pas',
  uDownload.Controller.Historico in 'Controller\uDownload.Controller.Historico.pas',
  uDownload.Model.Historico in 'Model\uDownload.Model.Historico.pas',
  uDownload.Model.Excecoes in 'Model\Excecoes\uDownload.Model.Excecoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
