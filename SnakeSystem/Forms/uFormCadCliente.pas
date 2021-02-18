unit uFormCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinXmas2008Blue, cxDropDownEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Vcl.DBCtrls, uLookUp, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uBiblioteca, Vcl.Menus, cxButtons;

type
  TfrmCadCliente = class(TfrmCadPadrao)
    Label2: TLabel;
    Label3: TLabel;
    cxDBEdtNome: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxdblkCidade: TcxDBLookupComboBox;
    cxdblkcbEstado: TcxDBLookupComboBox;
    cxdblkcbPais: TcxDBLookupComboBox;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBSpinEdit1: TcxDBSpinEdit;
    FDCadPadraoID: TIntegerField;
    FDCadPadraoID_CIDADE: TIntegerField;
    FDCadPadraoCLIENTE: TStringField;
    FDCadPadraoCPF: TStringField;
    FDCadPadraoCELULAR: TStringField;
    FDCadPadraoEMAIL: TStringField;
    FDCadPadraoENDERECO: TStringField;
    FDCadPadraoNUMERO: TStringField;
    FDCadPadraoBAIRRO: TStringField;
    FDCadPadraoCEP: TIntegerField;
    FDCadPadraoDATA_EXCLUIDO: TDateField;
    procedure FDCadPadraoBeforeInsert(DataSet: TDataSet);
    procedure FDCadPadraoBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure bitbtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uDm;

{$R *.dfm}

procedure TfrmCadCliente.bitbtnGravarClick(Sender: TObject);
begin
  if cxDBEdtNome.Text = '' then
  begin
    ShowMessage('Para salvar, � necess�rio digitar um nome!');
    Abort;
  end;
  inherited;
end;

procedure TfrmCadCliente.FDCadPadraoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if Self.Visible then
    cxDBEdtNome.SetFocus;
end;

procedure TfrmCadCliente.FDCadPadraoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if Self.Visible then
    cxDBEdtNome.SetFocus;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaFDQuery(dmLookup.FDConPais, '');
  AtualizaFDQuery(dmLookup.FDConEstado, '');
  AtualizaFDQuery(dmLookup.FDConCidade, '');
  AtualizaFDQuery(FDCadPadrao, '');
  cxDBEdtNome.SetFocus;
end;

end.
