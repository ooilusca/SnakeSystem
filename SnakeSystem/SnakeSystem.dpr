program SnakeSystem;

uses
  Vcl.Forms,
  uDm in 'Forms\uDm.pas' {Dados: TDataModule},
  uBiblioteca in 'Classes\uBiblioteca.pas',
  uFormConfigBD in 'Forms\uFormConfigBD.pas' {frmConfigBD},
  uFormCadPadrao in 'Forms\uFormCadPadrao.pas' {frmCadPadrao},
  uFormCadCliente in 'Forms\uFormCadCliente.pas' {frmCadCliente},
  uLookUp in 'Shared\uLookUp.pas' {dmLookup: TDataModule},
  uMain in 'Forms\uMain.pas' {frmMain},
  uFormCadProduto in 'Forms\uFormCadProduto.pas' {frmCadProduto},
  uFormCadFornecedor in 'Forms\uFormCadFornecedor.pas' {frmCadFornecedor},
  uFormCadFuncionario in 'Forms\uFormCadFuncionario.pas' {frmCadFuncionario},
  uFormFiltroPadrao in 'Forms\uFormFiltroPadrao.pas' {frmFormFiltroPadrao},
  uFormFiltroClientes in 'Forms\uFormFiltroClientes.pas' {frmFormFiltroClientes},
  uFormFiltroFornecedores in 'Forms\uFormFiltroFornecedores.pas' {frmFormFiltroFornecedores},
  uFormFiltroProdutos in 'Forms\uFormFiltroProdutos.pas' {frmFormFiltroProdutos},
  uFormFiltroFuncionarios in 'Forms\uFormFiltroFuncionarios.pas' {frmFormFiltroFuncionario},
  uFormCadVenda in 'Forms\uFormCadVenda.pas' {frmCadVenda},
  uSysParams in 'Forms\uSysParams.pas' {uSysParam};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfigBD, frmConfigBD);
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TdmLookup, dmLookup);
  Application.CreateForm(TuSysParam, uSysParam);
  Application.Run;
end.
