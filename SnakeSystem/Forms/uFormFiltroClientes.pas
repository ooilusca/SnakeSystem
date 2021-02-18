unit uFormFiltroClientes;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxTextEdit,
  Vcl.ExtCtrls, cxFilterControl, cxDBFilterControl, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, cxLabel, uFormCadCliente;

type
  TfrmFormFiltroClientes = class(TfrmFormFiltroPadrao)
    cxGridClientesDBTableViewClientes: TcxGridDBTableView;
    cxGridClientesLevelClientes: TcxGridLevel;
    cxGridClientes: TcxGrid;
    cxGridClientesDBTableViewClientesColumn1: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn2: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn3: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn4: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn5: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn6: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn7: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn8: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn9: TcxGridDBColumn;
    cxGridClientesDBTableViewClientesColumn10: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxEdtCPF: TcxTextEdit;
    cxEdtCod: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxbtnNovo: TcxButton;
    cxbtnVisualizar: TcxButton;
    FDFiltroID: TIntegerField;
    FDFiltroCLIENTE: TStringField;
    FDFiltroCPF: TStringField;
    FDFiltroCELULAR: TStringField;
    FDFiltroEMAIL: TStringField;
    FDFiltroENDERECO: TStringField;
    FDFiltroNUMERO: TStringField;
    FDFiltroBAIRRO: TStringField;
    FDFiltroCEP: TIntegerField;
    FDFiltroCIDADE: TStringField;
    FDFiltroESTADO: TStringField;
    FDFiltroPAIS: TStringField;
    procedure btnFiltroClick(Sender: TObject);
    procedure cxbtnNovoClick(Sender: TObject);
    procedure cxbtnVisualizarClick(Sender: TObject);
    procedure cxEdtCodKeyPress(Sender: TObject; var Key: Char);
    procedure cxEdtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    procedure Filtrar;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormFiltroClientes: TfrmFormFiltroClientes;

implementation

uses
  uSysParams;

{$R *.dfm}

procedure TfrmFormFiltroClientes.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TfrmFormFiltroClientes.cxbtnNovoClick(Sender: TObject);
begin

  frmCadCliente := TfrmCadCliente.Create(Self);
  try
    frmCadCliente.FDCadPadrao.Insert;
    frmCadCliente.ShowModal;
  finally
    FreeAndNil(frmCadCliente);
  end;
end;

procedure TfrmFormFiltroClientes.cxbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  ValidaFDQVazia;
  frmCadCliente := TfrmCadCliente.Create(Self);
  try
    frmCadCliente.FDCadPadrao.Locate('ID', FDFiltroID.AsInteger, []);
    frmCadCliente.bitbtnExcluir.Enabled := True;
    frmCadCliente.ShowModal;
  finally
    FreeAndNil(frmCadCliente);
  end;
end;

procedure TfrmFormFiltroClientes.cxEdtCodKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(key in ['0'..'9',#8,#13]) then
   key := #0;
end;

procedure TfrmFormFiltroClientes.cxEdtCPFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not(key in ['0'..'9','.',',',#8,#13]) then
   key := #0;
end;

procedure TfrmFormFiltroClientes.Filtrar;
var
  sSQL, OrderBy, Where:string;

begin

  sSQL    := EmptyStr;
  Where   := EmptyStr;
  OrderBy := EmptyStr;

  FDFiltro.Close;
  FDFiltro.SQL.Clear;

  sSQL:=' SELECT C.ID, C.NOME CLIENTE, C.CPF, C.CELULAR,     '+
        '        C.EMAIL, C.ENDERECO, C.NUMERO,              '+
        '        C.BAIRRO, C.CEP, CID.NOME CIDADE,           '+
        '        E.NOME ESTADO, PS.NOME PAIS                 '+
        ' FROM CLIENTE C                                     '+
        '     LEFT JOIN CIDADE CID ON (CID.ID = C.ID_CIDADE) '+
        '     LEFT JOIN ESTADO E ON (E.ID = CID.ID_ESTADO)   '+
        '     LEFT JOIN PAIS PS ON (PS.ID = E.ID_PAIS)       '+
        ' WHERE C.DATA_EXCLUIDO IS NULL                      ';
  OrderBy:= ' ORDER BY C.NOME ';


  if (Trim(cxEdtFiltro.Text) <> '') or (Trim(cxEdtFiltro.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(C.NOME) LIKE '+ QuotedStr(Chr(37)+Trim(cxEdtFiltro.Text)+Chr(37));
  end;

  if (Trim(cxEdtCPF.Text) <> '') or (Trim(cxEdtCPF.Text) <> EmptyStr) then
  begin
    Where := Where + ' AND TRIM(REPLACE(REPLACE(C.CPF, ''.'', ''''), ''-'', '''')) = ' + QuotedStr(Chr(37)+Trim(cxEdtCPF.Text)+Chr(37));
  end;

  if StrToIntDef(cxEdtCod.Text, 0) > 0 then
  begin
    Where := Where + ' AND C.ID = ' + cxEdtCod.Text;
  end;

  FDFiltro.SQL.text := sSQL + Where + OrderBy;
  FDFiltro.Open();
  //FDFiltro.FetchAll;
end;
procedure TfrmFormFiltroClientes.FormCreate(Sender: TObject);
begin
  inherited;
// VERIFICA SE EXISTE O ARQUIVO DENTRO DA PASTA
  if FileExists(ExtractFilePath(Application.ExeName)+'\TraducaoDev.ini') then
  begin
    uSysParam.cxLocalizerTraducaoDev.LoadFromFile(ExtractFilePath(Application.ExeName)+
'\TraduçãoDev.ini');
    uSysParam.cxLocalizerTraducaoDev.LanguageIndex := 1; // MUDA DE LINGUAGEM
    uSysParam.cxLocalizerTraducaoDev.Active := TRUE;     // ATIVA O COMPONENTE
  end;
end;

end.
