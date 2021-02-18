unit uFormCadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtons, uSysParams;

type
  TfrmCadPadrao = class(TForm)
    pnlHeader: TPanel;
    FDCadPadrao: TFDQuery;
    FDUCadPadrao: TFDUpdateSQL;
    FDTCadPadrao: TFDTransaction;
    dsCadPadrao: TDataSource;
    bitbtnSair: TcxButton;
    bitbtnExcluir: TcxButton;
    bitbtnCancelar: TcxButton;
    bitbtnGravar: TcxButton;
    bitbtnNovo: TcxButton;
    procedure bitbtnNovoClick(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
    procedure bitbtnCancelarClick(Sender: TObject);
    procedure bitbtnExcluirClick(Sender: TObject);
    procedure bitbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

uses
  uDm;

{$R *.dfm}

procedure TfrmCadPadrao.bitbtnNovoClick(Sender: TObject);
begin
  if not (FDCadPadrao.State in [dsEdit, dsInsert]) then
  begin
    FDCadPadrao.Insert;
  end;
end;

procedure TfrmCadPadrao.bitbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadPadrao.FormCreate(Sender: TObject);
begin
  FDCadPadrao.Close;
  FDCadPadrao.Open();
end;

procedure TfrmCadPadrao.bitbtnCancelarClick(Sender: TObject);
begin
  if FDCadPadrao.State in [dsEdit, dsInsert] then
  begin
  FDCadPadrao.Cancel;
  FDTCadPadrao.RollbackRetaining;
  end;
end;

procedure TfrmCadPadrao.bitbtnExcluirClick(Sender: TObject);
//var
  //sSQL :string;
begin
  //sSQL := EmptyStr;

  FDCadPadrao.Edit;
  //sSQL := '  '+
  FDCadPadrao.FieldByName('DATA_EXCLUIDO').AsDateTime := Date;
  FDTCadPadrao.StartTransaction;
  FDCadPadrao.Post;
  FDTCadPadrao.CommitRetaining;
end;

procedure TfrmCadPadrao.bitbtnGravarClick(Sender: TObject);
begin
  if FDCadPadrao.State in [dsEdit, dsInsert] then
  begin
    FDTCadPadrao.StartTransaction;
    FDCadPadrao.Post;
//    FDCadPadrao.CommitUpdates;
    FDTCadPadrao.CommitRetaining;
    ShowMessage('Salvo com sucesso!');
    bitbtnNovo.Click;
  end;
end;

end.
