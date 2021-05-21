unit uDownload.View.Historico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons,
  uDownload.Controller.Interfaces,
  uDownload.Controller.Historico;

type
  TFrmHistorico = class(TForm)
    GbHistrorico: TGroupBox;
    DBGHistoricos: TDBGrid;
    BtnRepetir: TBitBtn;
    BtnFechar: TBitBtn;
    DsHistorico: TDataSource;
    LblTot: TLabel;
    procedure BtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnRepetirClick(Sender: TObject);
  private
    { Private declarations }
   FHistorico:iController_Historico;
  public
    { Public declarations }
  end;

var
  FrmHistorico: TFrmHistorico;

implementation

uses
  uDownload.View.Main;

{$R *.dfm}

procedure TFrmHistorico.BtnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmHistorico.BtnRepetirClick(Sender: TObject);
begin
 FrmMain.EdtLink.Text := DsHistorico.DataSet.FieldByName('URL').Text;
 FrmMain.BtnIniciar.Click;
 BtnFechar.Click;
end;

procedure TFrmHistorico.FormCreate(Sender: TObject);
begin
 FHistorico          := TController_Historico.New;
 DsHistorico.DataSet := FHistorico.Fn_Historico
                                  .Fn_CarregarHistorico
                                  .Fn_GetDataSet;

 LblTot.Caption := Format('Total de downloads realizados: %s',
                          [DsHistorico.DataSet.RecordCount.ToString]);
end;

end.
