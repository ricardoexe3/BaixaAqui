unit uDownload.View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  uDownload.Controller.Interfaces, Vcl.Samples.Gauges;

type
  TFrmMain = class(TForm)
    GbMain: TGroupBox;
    Label1: TLabel;
    EdtLink: TEdit;
    GbProgresso: TGroupBox;
    EdtLocal: TEdit;
    Label2: TLabel;
    PbMain: TGauge;
    GbControles: TGroupBox;
    BtnIniciar: TBitBtn;
    BtnExibirMSG: TBitBtn;
    BtnStopDownload: TBitBtn;
    BitBtn1: TBitBtn;
    BtnFechar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIniciarClick(Sender: TObject);
    procedure BtnExibirMSGClick(Sender: TObject);
    procedure BtnStopDownloadClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnFecharClick(Sender: TObject);
  private
    { Private declarations }
   FProcessarDownload:iController_ProcessarDownload;
   procedure Proc_AtualizaProgresso(MaxValue, Position:int64);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
uses
uDownload.View.Historico,
uDownload.Controller.ProcessarDownload,
FileCtrl;
{$R *.dfm}

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
 {Invoque do formulário de histórico}
 FrmHistorico := TFrmHistorico.Create(Self);
 FrmHistorico.ShowModal;
end;

procedure TFrmMain.BtnExibirMSGClick(Sender: TObject);
begin
 FProcessarDownload.Fn_Processar
                   .Fn_ExibirMensagemProgresso;
end;

procedure TFrmMain.BtnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmMain.BtnIniciarClick(Sender: TObject);
begin
 FProcessarDownload.Fn_Processar
                   .Fn_SetURL(EdtLink.Text)
                   .Fn_SetLocalArquivo(EdtLocal.Text)
                   .Fn_SetProgresso(Proc_AtualizaProgresso)
                   .Fn_IniciarDownload;
end;

procedure TFrmMain.BtnStopDownloadClick(Sender: TObject);
begin
 FProcessarDownload.Fn_Processar
                   .Fn_PararDownload;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if PbMain.Progress >0 then
  begin
   CanClose := FProcessarDownload.Fn_Processar
                                 .Fn_PararDownload;
  end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 FProcessarDownload := TController_ProcessarDownload.New;
end;

procedure TFrmMain.Proc_AtualizaProgresso(MaxValue, Position: int64);
begin
 PbMain.MaxValue := MaxValue;
 PbMain.Progress := Position;
 PbMain.Refresh;
end;

end.
