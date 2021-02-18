inherited frmFormFiltroClientes: TfrmFormFiltroClientes
  Caption = 'FILTRO DE CLIENTES'
  ClientHeight = 591
  ClientWidth = 1032
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  ExplicitWidth = 1048
  ExplicitHeight = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1032
    Color = 10676479
    ParentBackground = False
    ExplicitWidth = 1032
    inherited Label1: TLabel
      Left = 15
      Top = 12
      Width = 80
      Caption = 'Nome do cliente:'
      ExplicitLeft = 15
      ExplicitTop = 12
      ExplicitWidth = 80
    end
    inherited cxEdtFiltro: TcxTextEdit
      Left = 15
      Top = 27
      DragCursor = crIBeam
      Properties.CharCase = ecUpperCase
      ExplicitLeft = 15
      ExplicitTop = 27
      ExplicitWidth = 257
      Width = 257
    end
    inherited Panel2: TPanel
      Left = 921
      Width = 110
      ExplicitLeft = 921
      ExplicitWidth = 110
      inherited cxButton1: TcxButton
        Width = 100
        Font.Height = -12
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 100
      end
    end
    object cxLabel1: TcxLabel [3]
      Left = 295
      Top = 10
      Caption = 'CPF:'
    end
    object cxEdtCPF: TcxTextEdit [4]
      Left = 295
      Top = 27
      HelpType = htKeyword
      DragCursor = crIBeam
      TabOrder = 2
      TextHint = 'somente n'#250'meros'
      OnKeyPress = cxEdtCPFKeyPress
      Width = 119
    end
    object cxEdtCod: TcxTextEdit [5]
      Left = 422
      Top = 27
      DragCursor = crIBeam
      Properties.CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = cxEdtCodKeyPress
      Width = 66
    end
    object cxLabel2: TcxLabel [6]
      Left = 422
      Top = 8
      Caption = 'C'#243'digo:'
    end
    object cxbtnNovo: TcxButton [7]
      AlignWithMargins = True
      Left = 661
      Top = 6
      Width = 100
      Height = 69
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Novo'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
        462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
        A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
        6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
        2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
        20793D22307078222076696577426F783D223020302033322033322220737479
        6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
        2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
        262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
        73706163653D227072657365727665223E2E57686974657B66696C6C3A234646
        464646463B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
        233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
        6C6C3A233033394332333B7D3C2F7374796C653E0D0A3C672069643D22D0A1D0
        BBD0BED0B95F32223E0D0A09093C7061746820636C6173733D22426C61636B22
        20643D224D32302C3231632D322E362D302E372D332D322E332D332D3363312E
        362D312E362C332D342E372C332D3863302D302E322C302D302E352C302D3163
        302D322E352D322E382D352D352E392D3563302C302D302E312C302D302E312C
        3020202623393B2623393B63302C302D302E312C302D302E312C304331302E38
        2C342C382C362E352C382C3963302C302E352C302C302E382C302C3163302C33
        2E332C312E342C362E342C332C3863302C302E372D302E342C322E332D332C33
        632D352C312E342D362C312E312D362C3768313268313220202623393B262339
        3B4332362C32322E312C32352C32322E342C32302C32317A222F3E0D0A09093C
        7061746820636C6173733D22477265656E2220643D224D32332C313863332E39
        2C302C372C332E312C372C37732D332E312C372D372C37732D372D332E312D37
        2D375331392E312C31382C32332C31387A222F3E0D0A09093C636972636C6520
        636C6173733D225768697465222063783D223139222063793D2232352220723D
        2231222F3E0D0A09093C636972636C6520636C6173733D225768697465222063
        783D223233222063793D2232352220723D2231222F3E0D0A09093C636972636C
        6520636C6173733D225768697465222063783D223237222063793D2232352220
        723D2231222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxbtnNovoClick
    end
    object cxbtnVisualizar: TcxButton [8]
      AlignWithMargins = True
      Left = 771
      Top = 6
      Width = 100
      Height = 69
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 50
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Visualizar'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'McSkin'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C0000000F744558745469746C650053686F773B4579653B49E307
        25000000B449444154785ECDD3BB09C3301006E0A4CA1AAA33836A2D90D2CBB8
        74A1F4EA0C4EE5495CC4AD20631834C0E537FC86E340B85091145F710F0E3D2F
        22D2E40F0678EFAD004F5860A385B960FB75E0204201A928EC71768083179B4E
        B1D7E9015115DF8C47F8D0089135A1780C086AD909EED083183D6B496D27EC03
        5626E6E36411671023ABFACCDCAA5790E07A3660EF616F8160CFA0835B6D0BAC
        758C63ED162678C0009906E626730BCDEFA0FD25FEFE337D01EA94DB206117C5
        C60000000049454E44AE426082}
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxbtnVisualizarClick
    end
    inherited btnFiltro: TcxButton
      AlignWithMargins = True
      Left = 551
      Top = 6
      Width = 100
      Height = 69
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      TabOrder = 8
      Font.Height = -12
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnFiltroClick
      ExplicitLeft = 551
      ExplicitTop = 6
      ExplicitWidth = 100
      ExplicitHeight = 69
    end
  end
  object cxGridClientes: TcxGrid [1]
    Left = 0
    Top = 81
    Width = 1032
    Height = 510
    Align = alClient
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Caramel'
    object cxGridClientesDBTableViewClientes: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsFiltro
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'ID'
          Column = cxGridClientesDBTableViewClientesColumn1
          DisplayText = 'Total: '
          VisibleForCustomization = False
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object cxGridClientesDBTableViewClientesColumn10: TcxGridDBColumn
        Caption = 'C'#243'd.:'
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 50
      end
      object cxGridClientesDBTableViewClientesColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'CPF'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object cxGridClientesDBTableViewClientesColumn1: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'CLIENTE'
        Options.Editing = False
        Width = 200
      end
      object cxGridClientesDBTableViewClientesColumn2: TcxGridDBColumn
        Caption = 'Celular'
        DataBinding.FieldName = 'CELULAR'
        Options.Editing = False
        Width = 90
      end
      object cxGridClientesDBTableViewClientesColumn4: TcxGridDBColumn
        Caption = 'Endere'#231'o'
        DataBinding.FieldName = 'ENDERECO'
        Options.Editing = False
        Width = 200
      end
      object cxGridClientesDBTableViewClientesColumn5: TcxGridDBColumn
        Caption = 'N'#186
        DataBinding.FieldName = 'NUMERO'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 50
      end
      object cxGridClientesDBTableViewClientesColumn6: TcxGridDBColumn
        Caption = 'Bairro'
        DataBinding.FieldName = 'BAIRRO'
        Options.Editing = False
        Width = 150
      end
      object cxGridClientesDBTableViewClientesColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'CEP'
        Options.Editing = False
        Width = 90
      end
      object cxGridClientesDBTableViewClientesColumn8: TcxGridDBColumn
        Caption = 'Email'
        DataBinding.FieldName = 'EMAIL'
        Options.Editing = False
        Width = 150
      end
      object cxGridClientesDBTableViewClientesColumn9: TcxGridDBColumn
        Caption = 'Cidade'
        DataBinding.FieldName = 'CIDADE'
        Width = 150
      end
    end
    object cxGridClientesLevelClientes: TcxGridLevel
      GridView = cxGridClientesDBTableViewClientes
    end
  end
  inherited FDFiltro: TFDQuery
    SQL.Strings = (
      'SELECT C.ID, C.NOME CLIENTE, C.CPF, C.CELULAR,'
      '       C.EMAIL, C.ENDERECO, C.NUMERO,'
      '       C.BAIRRO, C.CEP, CID.NOME CIDADE,'
      '       E.NOME ESTADO, PS.NOME PAIS'
      'FROM CLIENTE C'
      '    LEFT JOIN CIDADE CID ON (CID.ID = C.ID_CIDADE)'
      '    LEFT JOIN ESTADO E ON (E.ID = CID.ID_ESTADO)'
      '    LEFT JOIN PAIS PS ON (PS.ID = E.ID_PAIS)'
      'WHERE C.DATA_EXCLUIDO IS NULL')
    Left = 488
    Top = 240
    object FDFiltroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDFiltroCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'NOME'
      Required = True
      Size = 200
    end
    object FDFiltroCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object FDFiltroCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object FDFiltroEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 150
    end
    object FDFiltroENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 150
    end
    object FDFiltroNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 15
    end
    object FDFiltroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 150
    end
    object FDFiltroCEP: TIntegerField
      FieldName = 'CEP'
      Origin = 'CEP'
    end
    object FDFiltroCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object FDFiltroESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object FDFiltroPAIS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PAIS'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  inherited dsFiltro: TDataSource
    Left = 488
    Top = 192
  end
  inherited FDTFiltro: TFDTransaction
    Left = 488
    Top = 288
  end
end
