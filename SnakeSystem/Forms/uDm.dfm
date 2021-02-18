object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 179
  Width = 351
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\lucas\Documents\PROGRAMA'#199#195'O\BANCO DE DADOS\DBS' +
        'NAKE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\lucas\Documents\PROGRAMA'#199#195'O\DELPHI\golusSystem\Driver\W' +
      'OW64\fbclient.dll'
    Left = 24
    Top = 64
  end
end
