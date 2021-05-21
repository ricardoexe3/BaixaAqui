unit uDownload.Controller.ProcessarDownload;

interface

uses
  uDownload.Controller.Interfaces,
  uDownload.Model.Interfaces,
  uDownload.Model.ProcessarDownload;
type
TController_ProcessarDownload = class(TInterfacedObject,iController_ProcessarDownload)
private
 FModel_ProcessarDownload:iModel_ProcessarDownload;
public
 function Fn_Processar:iModel_ProcessarDownload;
 class function New:iController_ProcessarDownload;
 constructor Create;
 destructor Destroy; override;
end;

implementation

{ TController_ProcessarDownload }

constructor TController_ProcessarDownload.Create;
begin
 FModel_ProcessarDownload := TModel_ProcessarDownload.New;
end;

destructor TController_ProcessarDownload.Destroy;
begin

  inherited;
end;

function TController_ProcessarDownload.Fn_Processar: iModel_ProcessarDownload;
begin
 Result := FModel_ProcessarDownload;
end;

class function TController_ProcessarDownload.New: iController_ProcessarDownload;
begin
 Result := Self.Create;
end;

end.
