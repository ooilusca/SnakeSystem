unit uBiblioteca;

interface
uses System.IniFiles, System.SysUtils, Vcl.Forms, FireDAC.Comp.Client, uSysParams;

  procedure setValorini(pLocal, pSessao, pSubSessao, pValor: string);
  procedure AtualizaFDQuery(const pFDQuery: TFDQuery; pSQL: string);
  function getValorIni(pLocal, pSessao, pSubSessao: string): string;

implementation
  procedure setValorini(pLocal, pSessao, pSubSessao: string; pValor: string);
  var vArquivo: TiniFile;
  begin
    vArquivo := TIniFile.Create(pLocal);
    vArquivo.WriteString(pSessao, pSubSessao, pValor);
    vArquivo.Free;

  end;

  function GetValorIni(pLocal, pSessao, pSubSessao: string): string;
  var vArquivo: TIniFile;
  begin
    vArquivo:= TIniFile.Create(pLocal);

    Result:= vArquivo.ReadString(pSessao, pSubSessao, '');
    vArquivo.Free;
  end;

  procedure AtualizaFDQuery(const pFDQuery: TFDQuery; pSQL: string);
  begin
    pFDQuery.Close;
    if Trim(pSQl) <> '' then
    begin
      pFDQuery.SQL.Clear;
      pFDQuery.SQL.Text := pSQL;
    end;
    pFDQuery.Open;
    pFDQuery.FetchAll;
    pFDQuery.First;

  end;

end.
