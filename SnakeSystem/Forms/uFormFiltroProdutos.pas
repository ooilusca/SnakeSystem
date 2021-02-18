unit uFormFiltroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormFiltroPadrao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, cxButtons, Vcl.StdCtrls,
  cxTextEdit, Vcl.ExtCtrls, uLookUp, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, uFormCadProduto;

type
  TfrmFormFiltroProdutos = class(TfrmFormFiltroPadrao)
    Label2: TLabel;
    Label3: TLabel;
    cxEdtPVenda: TcxTextEdit;
    cxEdtPCompra: TcxTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxEdtCod: TcxTextEdit;
    Label6: TLabel;
    cxlkcbFornecedor: TcxLookupComboBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    FDFiltroID_PRODUTO: TIntegerField;
    FDFiltroPRODUTO: TStringField;
    FDFiltroID_FORNECEDOR: TIntegerField;
    FDFiltroPRECO_VENDA: TSingleField;
    FDFiltroPRECO_COMPRA: TSingleField;
    FDFiltroFORNECEDOR: TStringField;
    FDFiltroID_TIPO_PRODUTO: TIntegerField;
    FDFiltroTIPO_PRODUTO: TStringField;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    FDFiltroFORNECEDOR_1: TStringField;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxbtnVisualizar: TcxButton;
    cxbtnNovo: TcxButton;
    cxlkcbTProduto: TcxLookupComboBox;
    procedure btnFiltroClick(Sender: TObject);
    procedure cxbtnNovoClick(Sender: TObject);
    procedure cxbtnVisualizarClick(Sender: TObject);
  private
    procedure Filtrar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormFiltroProdutos: TfrmFormFiltroProdutos;

implementation

{$R *.dfm}

procedure TfrmFormFiltroProdutos.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TfrmFormFiltroProdutos.cxbtnNovoClick(Sender: TObject);
begin
  inherited;
  frmCadProduto := TfrmCadProduto.Create(Self);
  try
    frmCadProduto.FDCadPadrao.Insert;
    frmCadProduto.ShowModal;
  finally
    FreeAndNil(frmCadProduto);
  end;
end;

procedure TfrmFormFiltroProdutos.cxbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  ValidaFDQVazia;
  frmCadProduto := TfrmCadProduto.Create(Self);
  try
    frmCadProduto.FDCadPadrao.Locate('ID', FDFiltroID_PRODUTO.AsInteger, []);
    frmCadProduto.ShowModal;
  finally
    FreeAndNil(frmCadProduto);
  end;
end;

procedure TfrmFormFiltroProdutos.Filtrar;
var
  sSQL, Where, OrderBy :string;
begin

  sSQL    := EmptyStr;
  Where   := EmptyStr;
  OrderBy := EmptyStr;

  FDFiltro.Close;
  FDFiltro.SQL.Clear;

  sSQL:=' SELECT PRO.ID ID_PRODUTO, PRO.DESCRICAO PRODUTO,                  '+
        '        PRO.ID_FORNECEDOR, PRO.PRECO_VENDA, PRO.PRECO_COMPRA,      '+
        '        FNC.ID ||'' - ''||FNC.NOME FORNECEDOR, FNC.NOME FORNECEDOR,'+
        '        TPR.ID ID_TIPO_PRODUTO, TPR.TIPO TIPO_PRODUTO              '+
        '   FROM PRODUTO PRO                                                '+
        '     LEFT JOIN FORNECEDOR FNC ON (FNC.ID = PRO.ID_FORNECEDOR)      '+
        '     LEFT JOIN TIPO_PROD TPR ON (TPR.ID = PRO.ID_TIPO_PROD)        '+
        ' WHERE PRO.DATA_EXCLUIDO IS NULL                                   ';
  OrderBy := ' ORDER BY PRO.DESCRICAO ';

  if (Trim(cxEdtFiltro.Text) <> '') or (Trim(cxEdtFiltro.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(PRO.DESCRICAO) COLLATE WIN_PTBR LIKE '+ QuotedStr(Chr(37)+Trim(cxEdtFiltro.Text)+Chr(37));
  end;
  if StrToIntDef(cxEdtCod.Text, 0) > 0 then
  begin
    Where := Where + ' AND PRO.ID = '+ cxEdtCod.Text;
  end;
    if (StrToFloatDef(cxEdtPVenda.Text, 0) > 0) then
  begin
    Where := Where + ' AND PRO.PRECO_VENDA = '+ cxEdtPVenda.Text;
  end;
  if (StrToFloatDef(cxEdtPCompra.Text, 0) > 0) then
  begin
    Where := Where + ' AND PRO.PRECO_COMPRA = '+ cxEdtPCompra.Text;
  end;
    if (Trim(cxlkcbTProduto.Text) <> '') or (Trim(cxlkcbTProduto.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(TPR.TIPO) COLLATE WIN_PTBR LIKE '+ QuotedStr(Chr(37)+Trim(cxlkcbTProduto.Text)+Chr(37));
  end;
      if (Trim(cxlkcbFornecedor.Text) <> '') or (Trim(cxlkcbFornecedor.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(FNC.NOME) COLLATE WIN_PTBR LIKE '+ QuotedStr(Chr(37)+Trim(cxlkcbFornecedor.Text)+Chr(37));
  end;


  FDFiltro.SQL.text := sSQL + Where + OrderBy;
  FDFiltro.Open();

end;
end.
