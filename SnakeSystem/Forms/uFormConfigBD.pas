unit uFormConfigBD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, uBiblioteca;

type
  TfrmConfigBD = class(TForm)
    edtLocal: TEdit;
    Label1: TLabel;
    btnConfig: TButton;
    img1: TImage;
    opnPastas: TOpenDialog;
    procedure btnConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Configura;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigBD: TfrmConfigBD;

implementation

{$R *.dfm}

{ TfrmConfigBD }

procedure TfrmConfigBD.btnConfigClick(Sender: TObject);
begin
  Configura;
end;

procedure TfrmConfigBD.Configura;
var
  vFileName: string;
begin
  if opnPastas.Execute then
  begin
    edtLocal.Text := opnPastas.FileName;
    vFileName     := ExtractFilePath(Application.ExeName) + 'config.ini';
    setValorini(vFileName, 'CONFIGURAÇÃO', 'LOCAL_DB', edtLocal.Text);
    ShowMessage('Banco configurado!');
    Application.Terminate;
  end;
end;

procedure TfrmConfigBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
