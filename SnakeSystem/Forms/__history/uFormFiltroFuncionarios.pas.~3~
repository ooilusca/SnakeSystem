unit uFormFiltroFuncionarios;

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
  cxTextEdit, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmFormFiltroFuncionario = class(TfrmFormFiltroPadrao)
    FDFiltroID: TIntegerField;
    FDFiltroNOME: TStringField;
    FDFiltroCPF: TStringField;
    Label3: TLabel;
    Label4: TLabel;
    cxEdtCPF: TcxTextEdit;
    cxEdtFuncionario: TcxTextEdit;
    cxGridFuncionarioDBTableView1: TcxGridDBTableView;
    cxGridFuncionarioLevel1: TcxGridLevel;
    cxGridFuncionario: TcxGrid;
    cxGridFuncionarioDBTableView1Column1: TcxGridDBColumn;
    cxGridFuncionarioDBTableView1Column2: TcxGridDBColumn;
    cxGridFuncionarioDBTableView1Column3: TcxGridDBColumn;
    cxbtnVisualizar: TcxButton;
    cxbtnNovo: TcxButton;
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
  frmFormFiltroFuncionario: TfrmFormFiltroFuncionario;

implementation

uses
  uFormCadFuncionario;

{$R *.dfm}

procedure TfrmFormFiltroFuncionario.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TfrmFormFiltroFuncionario.cxbtnNovoClick(Sender: TObject);
begin
  inherited;
  frmCadFuncionario := TfrmCadFuncionario.Create(Self);
  try
    frmCadFuncionario.FDCadPadrao.Insert;
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmFormFiltroFuncionario.cxbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  ValidaFDQVazia;
  frmCadFuncionario := TfrmCadFuncionario.Create(Self);
  try
    frmCadFuncionario.FDCadPadrao.Locate('ID', FDFiltroID.AsInteger, []);
    frmCadFuncionario.bitbtnExcluir.Enabled := True;
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmFormFiltroFuncionario.Filtrar;
  var
    sSQL, Where, OrderBy :string;
begin
  sSQL    := EmptyStr;
  Where   := EmptyStr;
  OrderBy := EmptyStr;

  FDFiltro.Close;
  FDFiltro.SQL.Clear;

   sSQL:=' SELECT FUN.ID, FUN.NOME,         '+
         '        FUN.CPF, FUN.CELULAR      '+
         '   FROM FUNCIONARIO FUN           '+
         ' WHERE FUN.DATA_EXCLUIDO IS NULL  ';

OrderBy := ' ORDER BY FUN.NOME ';

  if StrToIntDef(cxEdtFiltro.Text, 0) > 0 then
  begin
    Where := Where + ' AND PRO.ID = '+ cxEdtFiltro.Text;
  end;
  if (Trim(cxEdtFuncionario.Text) <> '') or (Trim(cxEdtFuncionario.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(FUN.NOME) COLLATE WIN_PRBT LIKE '+ QuotedStr(Chr(37)+Trim(cxEdtFuncionario.Text)+Chr(37));
  end;

  if (Trim(cxEdtCPF.Text) <> '') or (Trim(cxEdtCPF.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(REPLACE(REPLACE(REPLACE(FUN.CPF, ''.'', ''''), ''/'', ''''), ''-'', '''')) = ' + QuotedStr(Chr(37)+Trim(cxEdtCPF.Text)+Chr(37));
  end;

  FDFiltro.SQL.text := sSQL + Where + OrderBy;
  FDFiltro.Open();
end;

end.
