unit uFormCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDm, uFormCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Data.DB, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxDBEdit,
  cxTextEdit, Vcl.StdCtrls, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Buttons, Vcl.ExtCtrls, uLookUp, uBiblioteca, Vcl.Menus, cxButtons;

type
  TfrmCadProduto = class(TfrmCadPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBEdtProduto: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxDBcrEdtPrecoVenda: TcxDBCurrencyEdit;
    cxDBcrEdtPrecoCompra: TcxDBCurrencyEdit;
    cxDBlkupCBFornecedor: TcxDBLookupComboBox;
    cxDBlkupCBTProduto: TcxDBLookupComboBox;
    FDCadPadraoID_FORNECEDOR: TIntegerField;
    FDCadPadraoID_TIPO_PROD: TIntegerField;
    FDCadPadraoPRECO_VENDA: TSingleField;
    FDCadPadraoPRECO_COMPRA: TSingleField;
    FDCadPadraoDESCRICAO: TStringField;
    FDCadPadraoID: TFDAutoIncField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaFDQuery(dmLookup.FDTipoProduto, '');
  AtualizaFDQuery(dmLookup.FDFornecedor, '');
  AtualizaFDQuery(FDCadPadrao, '');
  cxDBEdtProduto.SetFocus;
end;

end.
