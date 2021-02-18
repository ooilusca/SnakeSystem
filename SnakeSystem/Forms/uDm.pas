unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, Vcl.Forms,
  FireDAC.Phys.IBBase;

type
  TDados = class(TDataModule)
    FDConexao: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure carregaBD;
  public

  end;
var
  Dados: TDados;

implementation

uses
  uFormConfigBD, uBiblioteca;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDados.carregaBD;
begin
  try
    FDConexao.Params.Database := GetValorIni(ExtractFilePath(Application.ExeName) + 'config.ini', 'CONFIGURAÇÃO', 'LOCAL_DB');
    FDConexao.Connected := True;
  except
    frmConfigBD.ShowModal;

  end;
end;

procedure TDados.DataModuleCreate(Sender: TObject);
begin
  carregaBD;
end;

end.
