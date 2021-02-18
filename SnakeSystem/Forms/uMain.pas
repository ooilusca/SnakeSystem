unit uMain;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvPreviewMenu,
  AdvPreviewMenuStylers, AdvShapeButton, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvGlowButton ,
  uFormCadProduto, uFormCadFornecedor, uFormCadCliente, uFormCadFuncionario, uFormFiltroClientes, uFormFiltroFornecedores, uFormFiltroProdutos, uFormFiltroFuncionarios, uSysParams;

type
  TfrmMain = class(TAdvToolBarForm)
    AdvToolBarPager1: TAdvToolBarPager;
    AdvPage1: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvToolBar1: TAdvToolBar;
    AdvOfficeStatusBar1: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvShapeButton1: TAdvShapeButton;
    AdvPage2: TAdvPage;
    AdvPage3: TAdvPage;
    advCadProduto: TAdvGlowButton;
    advCadCliente: TAdvGlowButton;
    advCadFuncionário: TAdvGlowButton;
    advCadFornecedor: TAdvGlowButton;
    AdvPage4: TAdvPage;
    AdvPage5: TAdvPage;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    btnFiltroClientes: TAdvGlowButton;
    btnFiltroFornecedores: TAdvGlowButton;
    btnFiltroProdutos: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    AdvCadVenda: TAdvGlowButton;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton6: TAdvGlowButton;
    procedure advCadClienteClick(Sender: TObject);
    procedure advCadProdutoClick(Sender: TObject);
    procedure advCadFornecedorClick(Sender: TObject);
    procedure advCadFuncionárioClick(Sender: TObject);
    procedure AdvShapeButton1Click(Sender: TObject);
    procedure btnFiltroClientesClick(Sender: TObject);
    procedure btnFiltroFornecedoresClick(Sender: TObject);
    procedure btnFiltroProdutosClick(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvCadVendaClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFormCadVenda;


{$R *.dfm}

procedure TfrmMain.advCadClienteClick(Sender: TObject);
begin
  frmCadCliente := TfrmCadCliente.Create(Self);
  try
    frmCadCliente.ShowModal;
  finally
    FreeAndNil(frmCadCliente);
  end;

end;

procedure TfrmMain.advCadProdutoClick(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(Self);
  try
    frmCadProduto.ShowModal;
  finally
    FreeAndNil(frmCadProduto);
  end;
end;

procedure TfrmMain.AdvGlowButton3Click(Sender: TObject);
begin
  try
    frmFormFiltroFuncionario := TfrmFormFiltroFuncionario.Create(Self);
    frmFormFiltroFuncionario.Show;
  finally
  end;
end;

procedure TfrmMain.AdvCadVendaClick(Sender: TObject);
begin
  frmCadVenda := TfrmCadVenda.Create(Self);
  try
    frmCadVenda.ShowModal;
  finally
    FreeAndNil(frmCadCliente);
  end;

end;

procedure TfrmMain.AdvShapeButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.btnFiltroClientesClick(Sender: TObject);
begin
  try
    frmFormFiltroClientes := TfrmFormFiltroClientes.Create(Self);
    frmFormFiltroClientes.Show;
  finally
  end;
end;

procedure TfrmMain.btnFiltroFornecedoresClick(Sender: TObject);
begin
  try
    frmFormFiltroFornecedores := TfrmFormFiltroFornecedores.Create(Self);
    frmFormFiltroFornecedores.Show;
  finally
  end;
end;

procedure TfrmMain.btnFiltroProdutosClick(Sender: TObject);
begin
  try
    frmFormFiltroProdutos := TfrmFormFiltroProdutos.Create(Self);
    frmFormFiltroProdutos.Show;
  finally
  end;
end;

procedure TfrmMain.advCadFuncionárioClick(Sender: TObject);
begin
  frmCadFuncionario := TfrmCadFuncionario.Create(Self);
  try
    frmCadFuncionario.ShowModal;
  finally
    FreeAndNil(frmCadFuncionario);
  end;
end;

procedure TfrmMain.advCadFornecedorClick(Sender: TObject);
begin
  frmCadFornecedor := TfrmCadFornecedor.Create(Self);
  try
    frmCadFornecedor.ShowModal;
  finally
    FreeAndNil(frmCadFornecedor);
  end;
end;


end.
