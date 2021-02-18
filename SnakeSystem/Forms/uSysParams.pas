unit uSysParams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxClasses, cxLocalization;

type
  TuSysParam = class(TForm)
    cxLocalizerTraducaoDev: TcxLocalizer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uSysParam: TuSysParam;

implementation

{$R *.dfm}

end.
