object dmLookup: TdmLookup
  OldCreateOrder = False
  Height = 256
  Width = 286
  object FDConEstado: TFDQuery
    Connection = Dados.FDConexao
    Transaction = FDTransaction
    SQL.Strings = (
      'SELECT EST.ID ID_ESTADO, EST.ID_PAIS, '
      '       EST.NOME ESTADO, EST.UF'
      'FROM ESTADO EST'
      'ORDER BY EST.UF')
    Left = 56
    Top = 56
    object FDConEstadoID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID'
    end
    object FDConEstadoID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
      Origin = 'ID_PAIS'
    end
    object FDConEstadoESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'NOME'
      Size = 200
    end
    object FDConEstadoUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
  end
  object dsConEstado: TDataSource
    DataSet = FDConEstado
    Left = 16
    Top = 56
  end
  object FDTransaction: TFDTransaction
    Connection = Dados.FDConexao
    Left = 200
    Top = 8
  end
  object FDConCidade: TFDQuery
    Connection = Dados.FDConexao
    Transaction = FDTransaction
    SQL.Strings = (
      'SELECT CID.ID ID_CIDADE, CID.ID_ESTADO, CID.NOME CIDADE'
      'FROM CIDADE CID')
    Left = 56
    Top = 8
    object FDConCidadeID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID'
      Required = True
    end
    object FDConCidadeID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
    end
    object FDConCidadeCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'NOME'
      Required = True
      Size = 200
    end
  end
  object dsConCidade: TDataSource
    DataSet = FDConCidade
    Left = 16
    Top = 8
  end
  object FDConPais: TFDQuery
    Connection = Dados.FDConexao
    Transaction = FDTransaction
    SQL.Strings = (
      'SELECT PS.ID ID_PAIS, PS.NOME PAIS, PS.ABR'
      'FROM PAIS PS'
      'ORDER BY PS.ABR')
    Left = 56
    Top = 104
    object FDConPaisID_PAIS: TIntegerField
      FieldName = 'ID_PAIS'
      Origin = 'ID'
    end
    object FDConPaisPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'NOME'
      Size = 50
    end
    object FDConPaisABR: TStringField
      FieldName = 'ABR'
      Origin = 'ABR'
      FixedChar = True
      Size = 2
    end
  end
  object dsConPais: TDataSource
    DataSet = FDConPais
    Left = 17
    Top = 104
  end
  object FDTipoProduto: TFDQuery
    Connection = Dados.FDConexao
    SQL.Strings = (
      'SELECT TPR.ID ID_TPRODUTO, TPR.TIPO,'
      '       TPR.DESCRICAO PRODUTO'
      'FROM TIPO_PROD TPR')
    Left = 56
    Top = 152
  end
  object dsTipoProduto: TDataSource
    DataSet = FDTipoProduto
    Left = 16
    Top = 152
  end
  object dsFornecedor: TDataSource
    DataSet = FDFornecedor
    Left = 151
    Top = 65
  end
  object FDFornecedor: TFDQuery
    Connection = Dados.FDConexao
    SQL.Strings = (
      'SELECT FNC.ID ID_FORNECEDOR, FNC.NOME FORNECEDOR, '
      '       FNC.ID_CIDADE, FNC.CNPJ, FNC.CONTATO'
      ' FROM FORNECEDOR FNC')
    Left = 192
    Top = 65
  end
  object FDCliente: TFDQuery
    Connection = Dados.FDConexao
    SQL.Strings = (
      'SELECT C.ID ID_CLIENTE, C.NOME CLIENTE'
      ' FROM CLIENTE C')
    Left = 192
    Top = 148
  end
  object dsCliente: TDataSource
    DataSet = FDCliente
    Left = 151
    Top = 148
  end
  object dsProduto: TDataSource
    DataSet = FDProduto
    Left = 151
    Top = 108
  end
  object FDProduto: TFDQuery
    Connection = Dados.FDConexao
    SQL.Strings = (
      '  SELECT PRO.* --ID, PRO.DESCRICAO, PRO.PRECO_VENDA'
      '   FROM PRODUTO PRO')
    Left = 192
    Top = 108
    object FDProdutoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object FDProdutoPRECO_VENDA: TSingleField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Required = True
    end
  end
end
