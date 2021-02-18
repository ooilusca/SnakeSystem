unit uFormCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadPadrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
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
  dxSkinXmas2008Blue, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, uLookUp,
  cxCheckBox, uFormCadProduto, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, Vcl.Menus,
  cxButtons, uBiblioteca, uDm;

type
  TfrmCadVenda = class(TfrmCadPadrao)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    cxDBdtEdtFaturamento: TcxDBDateEdit;
    cxDBlkcbCliente: TcxDBLookupComboBox;
    cxDBdtEdtVenda: TcxDBDateEdit;
    Label1: TLabel;
    cxDBcbFaturado: TcxDBCheckBox;
    dsVendaItem: TDataSource;
    FDVendaItem: TFDQuery;
    FDVendaItemID: TIntegerField;
    FDVendaItemID_PRODUTO: TIntegerField;
    FDVendaItemID_VENDA: TIntegerField;
    FDVendaItemQTD: TSingleField;
    FDVendaItemDESCONTO: TSingleField;
    Panel3: TPanel;
    cxDBlkcbEdtProduto: TcxDBLookupComboBox;
    Label4: TLabel;
    FDCadPadraoID: TFDAutoIncField;
    FDCadPadraoID_CLIENTE: TIntegerField;
    FDCadPadraoDATA_VENDA: TIntegerField;
    FDCadPadraoVALOR_TOTAL: TFMTBCDField;
    FDCadPadraoFATURADO: TStringField;
    FDCadPadraoDT_FATURADO: TDateField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxbtnAdicionar: TcxButton;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    FDVendaItemDESCRICAO_PRO: TStringField;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    FDVendaItemSUBTOTAL: TFloatField;
    FDVendaItemTOTAL: TFloatField;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    FDTVendaItem: TFDTransaction;
    Panel2: TPanel;
    cxDBedtID: TcxDBTextEdit;
    cxEdtQTD: TcxCurrencyEdit;
    cxEdtValorUnitario: TcxCurrencyEdit;
    cxEdtDesconto: TcxCurrencyEdit;
    cxEdtSubTotal: TcxCurrencyEdit;
    cxEdtTotal: TcxCurrencyEdit;
    cxEdtDescontoT: TcxCurrencyEdit;
    cxEdtSubTotalT: TcxCurrencyEdit;
    cxcxEdtTotalT: TcxCurrencyEdit;
    FDVendaItemPRECO_VENDA: TSingleField;
    procedure FormShow(Sender: TObject);
    procedure FDCadPadraoBeforePost(DataSet: TDataSet);
    procedure FDCadPadraoAfterInsert(DataSet: TDataSet);
    procedure FDVendaItemAfterInsert(DataSet: TDataSet);
    procedure FDCadPadraoAfterOpen(DataSet: TDataSet);
    procedure FDCadPadraoAfterScroll(DataSet: TDataSet);
    procedure FDVendaItemCalcFields(DataSet: TDataSet);
    procedure FDVendaItemAfterPost(DataSet: TDataSet);
    procedure FDVendaItemAfterDelete(DataSet: TDataSet);
    procedure FDVendaItemAfterCancel(DataSet: TDataSet);
    procedure cxbtnAdicionarClick(Sender: TObject);
    procedure cxDBlkcbEdtProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure setItens(pIDVenda: Integer);
    procedure gravarProduto;
    procedure setDadosProduto(pIDProduto: Integer);
    procedure Totaliza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVenda: TfrmCadVenda;

implementation

{$R *.dfm}

procedure TfrmCadVenda.cxbtnAdicionarClick(Sender: TObject);
begin
  inherited;
  gravarProduto;
end;

procedure TfrmCadVenda.cxDBlkcbEdtProdutoClick(Sender: TObject);
begin
  inherited;
  setDadosProduto(Integer(cxDBlkcbEdtProduto.Properties.KeyFieldNames));
end;

procedure TfrmCadVenda.FDCadPadraoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  FDCadPadraoDATA_VENDA.AsDateTime := Date;
end;

procedure TfrmCadVenda.FDCadPadraoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  setItens(FDCadPadraoID.AsInteger);
end;

procedure TfrmCadVenda.FDCadPadraoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  setItens(FDCadPadraoID.AsInteger);
end;

procedure TfrmCadVenda.FDCadPadraoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (FDCadPadraoDT_FATURADO.IsNull) and (FDCadPadraoFATURADO.AsAnsiString = 'S')  then
  begin
    FDCadPadraoDT_FATURADO.AsDateTime := Date;

  end;

end;

procedure TfrmCadVenda.FDVendaItemAfterCancel(DataSet: TDataSet);
begin
  inherited;
  FDTVendaItem.RollbackRetaining;
end;

procedure TfrmCadVenda.FDVendaItemAfterDelete(DataSet: TDataSet);
begin
  inherited;
  FDTVendaItem.CommitRetaining;
  Totaliza;
end;

procedure TfrmCadVenda.FDVendaItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
  FDVendaItemID_VENDA.AsInteger := FDCadPadraoID.AsInteger;
end;

procedure TfrmCadVenda.FDVendaItemAfterPost(DataSet: TDataSet);
begin
  inherited;
  FDTVendaItem.CommitRetaining;
  Totaliza;
end;

procedure TfrmCadVenda.FDVendaItemCalcFields(DataSet: TDataSet);
begin
  inherited;
  FDVendaItemSUBTOTAL.AsFloat := (FDVendaItemQTD.AsFloat * FDVendaItemPRECO_VENDA.AsFloat);
  FDVendaItemTOTAL.AsFloat := (FDVendaItemQTD.AsFloat * FDVendaItemPRECO_VENDA.AsFloat) - FDVendaItemDESCONTO.AsFloat;
end;

procedure TfrmCadVenda.FormCreate(Sender: TObject);
begin
  inherited;
  AtualizaFDQuery(dmLookup.FDCliente, '');
  AtualizaFDQuery(dmLookup.FDProduto, '');

end;

procedure TfrmCadVenda.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaFDQuery(dmLookup.FDCliente, '');
  AtualizaFDQuery(dmLookup.FDProduto, '');
  AtualizaFDQuery(FDCadPadrao, '');
end;

procedure TfrmCadVenda.gravarProduto;
begin
  FDVendaItem.Append;
  FDVendaItemID_PRODUTO.AsInteger := Integer(cxDBlkcbEdtProduto.Properties.KeyFieldNames);
  FDVendaItemQTD.AsFloat          := cxEdtQTD.Value;
  FDVendaItemPRECO_VENDA.AsFloat  := cxEdtValorUnitario.Value;
  FDVendaItemDESCONTO.AsFloat     := cxEdtDesconto.Value;
  FDVendaItem.Post;
end;

procedure TfrmCadVenda.setDadosProduto(pIDProduto: Integer);
begin
   cxEdtQTD.Value           := 1;
   cxEdtValorUnitario.Value := dmLookup.FDProdutoPRECO_VENDA.AsFloat;
end;

procedure TfrmCadVenda.setItens(pIDVenda: Integer);
begin
  FDVendaItem.Close;
  FDVendaItem.ParamByName('ID_VENDA').AsInteger := pIDVenda;
  AtualizaFDQuery(FDVendaItem, '');
  Totaliza;
end;

procedure TfrmCadVenda.Totaliza;
var
  sSQLTotal : TFDQuery;
  sSQL      : string;

begin
  sSQLTotal             := TFDQuery.Create(nil);
  sSQLTotal.Transaction := FDTVendaItem;
  sSQLTotal.Connection  := Dados.FDConexao;

  try
    sSQL :='  SELECT SUM(VDI.QTD * PRO.PRECO_VENDA) SUBTOTAL,                         '+
           '         SUM((COALESCE(VDI.DESCONTO,0)) DESCONTO,                         '+
           '         SUM((VDI.QTD * PRO.PRECO_VENDA) - (COALESCE(DESCONTO,0))) TOTAL  '+
           '    FROM VENDA_ITEM VDI                                                   '+
           '    JOIN PRODUTO PRO ON (PRO.ID = VDI.ID_PRODUTO)                         '+
           '  WHERE VDI.ID = ' + IntToStr(FDCadPadraoID.AsInteger)                     ;

    AtualizaFDQuery(sSQLTotal, sSQL);

    cxEdtSubTotalT.Value   := sSQLTotal.FieldByName('SUBTOTAL').AsFloat;
    cxEdtDescontoT.Value   := sSQLTotal.FieldByName('DESCONTO').AsFloat;
    cxcxEdtTotalT.Value    := sSQLTotal.FieldByName('TOTAL').AsFloat;

  finally
    sSQLTotal.Close;
    FreeAndNil(sSQLTotal);
  end;
end;

end.
