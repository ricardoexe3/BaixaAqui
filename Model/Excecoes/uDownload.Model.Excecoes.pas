unit uDownload.Model.Excecoes;

interface

uses
  System.SysUtils,
  Vcl.Dialogs,
  Vcl.Forms,
  System.UITypes;
  
 type TModel_Excecoes = class
   private
    FArqLog:string;
    procedure Proc_getException(Sender:TObject; E: Exception);
   public
    procedure Proc_GravarLog(Dados:string);
    constructor Create;
    destructor Destroy; override;
 end;

 var
 Model_Excecoes : TModel_Excecoes;
implementation

uses
  System.Classes;

{ TModel_Excecoes }

constructor TModel_Excecoes.Create;
begin
 FArqLog := ChangeFileExt(ParamStr(0), '.log');
 ReportMemoryLeaksOnShutdown := True;
 Application.OnException     := Proc_getException;
end;

destructor TModel_Excecoes.Destroy;
begin

  inherited;
end;

procedure TModel_Excecoes.Proc_getException(Sender: TObject; E: Exception);
begin
  Proc_GravarLog('*-----------------------------------*');
  if TComponent(Sender) is TForm then
  begin
   Proc_GravarLog('Form: ' + TForm(Sender).Name);
   Proc_GravarLog('Caption: ' + TForm(Sender).Caption);
   Proc_GravarLog('Error: ' + E.ClassName);
   Proc_GravarLog('Error: ' + E.Message);
  end
  else
  begin
   Proc_GravarLog('Form: ' + TForm(TComponent(Sender).Owner).Name);
   Proc_GravarLog('Caption: ' + TForm(TComponent(Sender).Owner).Caption);
   Proc_GravarLog('Error: ' + E.ClassName);
   Proc_GravarLog('Error: ' + E.Message);
  end;
  Proc_GravarLog('*-----------------------------------*');
 MessageDlg(E.Message, mtWarning, [mbOK], 0);
end;

procedure TModel_Excecoes.Proc_GravarLog(Dados: string);
var
 txtLog : TextFile;
begin
 AssignFile(txtLog, FArqLog);
 if FileExists(FArqLog) then
     Append(txtLog)
 else
     Rewrite(txtLog);
 Writeln(txtLog, FormatDateTime('dd/mm/YY hh:mm:ss - ', now) + Dados);
 CloseFile(txtLog);
end;

initialization
 Model_Excecoes := TModel_Excecoes.Create;

finalization
 Model_Excecoes.DisposeOf;

end.
