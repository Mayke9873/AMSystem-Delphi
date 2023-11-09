object fConsultaCompra: TfConsultaCompra
  Left = 0
  Top = 0
  Caption = 'Consulta de Compras'
  ClientHeight = 627
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  DesignSize = (
    975
    627)
  TextHeight = 13
  object Label9: TLabel
    Left = 8
    Top = 35
    Width = 50
    Height = 13
    Caption = 'Pesquisar:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edPesquisa: TEdit
    Left = 64
    Top = 31
    Width = 256
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    TabOrder = 0
    OnChange = edPesquisaChange
    ExplicitWidth = 252
  end
  object Panel1: TPanel
    Left = 0
    Top = 61
    Width = 975
    Height = 566
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 971
    ExplicitHeight = 565
    object dbgVendas: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 967
      Height = 560
      Margins.Left = 4
      Margins.Right = 4
      Align = alClient
      DataSource = dCompras
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgVendasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Fornecedor'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCONTO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'Desconto'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Caption = 'R$ Total'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA_VENDA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Venda'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 95
          Visible = True
        end>
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlBotoes'
    Padding.Left = 4
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 971
    object tbNovo: TSkSvg
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Hint = 'Novo'
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      OnClick = tbNovoClick
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"add-file-5" data-name="Flat Line" xmlns="http://www.w3.org/2000' +
        '/svg" class="icon flat-line"><path id="secondary" d="M11.5,19A6.' +
        '5,6.5,0,0,1,18,12.5V5H16V3H5A1,1,0,0,0,4,4V20a1,1,0,0,0,1,1h6.82' +
        'A6.3,6.3,0,0,1,11.5,19Z" style="fill: rgb(44, 169, 188); stroke-' +
        'width: 2;"></path><path id="primary" d="M18,13V5L16,3H5A1,1,0,0,' +
        '0,4,4V20a1,1,0,0,0,1,1h7" style="fill: none; stroke: rgb(0, 0, 0' +
        '); stroke-linecap: round; stroke-linejoin: round; stroke-width: ' +
        '2;"></path><path id="primary-2" data-name="primary" d="M16,19h4m' +
        '-2-2v4M8,13h2m4-4H8m8-6V5h2Z" style="fill: none; stroke: rgb(0, ' +
        '0, 0); stroke-linecap: round; stroke-linejoin: round; stroke-wid' +
        'th: 2;"></path></svg>'
      ExplicitTop = 5
    end
    object tbEditar: TSkSvg
      AlignWithMargins = True
      Left = 37
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Hint = 'Editar Venda'
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      Visible = False
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"agenda-pencil" data-name="Flat Line" xmlns="http://www.w3.org/2' +
        '000/svg" class="icon flat-line"><path id="secondary" d="M20.71,7' +
        '.69l-1.4-1.4a1,1,0,0,0-1.4,0L13,11.2V14h2.8l4.91-4.91A1,1,0,0,0,' +
        '20.71,7.69Z" style="fill: rgb(44, 169, 188); stroke-width: 2;"><' +
        '/path><path id="primary" d="M18,18v2a1,1,0,0,1-1,1H5a1,1,0,0,1-1' +
        '-1V4A1,1,0,0,1,5,3H15" style="fill: none; stroke: rgb(0, 0, 0); ' +
        'stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"' +
        '></path><path id="primary-2" data-name="primary" d="M20.71,9.09,' +
        '15.8,14H13V11.2l4.91-4.91a1,1,0,0,1,1.4,0l1.4,1.4A1,1,0,0,1,20.7' +
        '1,9.09ZM3,8H5M3,12H5M3,16H5" style="fill: none; stroke: rgb(0, 0' +
        ', 0); stroke-linecap: round; stroke-linejoin: round; stroke-widt' +
        'h: 2;"></path></svg>'
      ExplicitLeft = 33
      ExplicitTop = 5
    end
    object tbSair: TSkSvg
      AlignWithMargins = True
      Left = 103
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Hint = 'Sair'
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      OnClick = tbSairClick
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"sign-out-alt-2" data-name="Flat Line" xmlns="http://www.w3.org/' +
        '2000/svg" class="icon flat-line"><rect id="secondary" x="3" y="3' +
        '" width="10" height="18" rx="1" style="fill: rgb(44, 169, 188); ' +
        'stroke-width: 2;"></rect><line id="primary" x1="8" y1="12" x2="2' +
        '1" y2="12" style="fill: none; stroke: rgb(0, 0, 0); stroke-linec' +
        'ap: round; stroke-linejoin: round; stroke-width: 2;"></line><pol' +
        'yline id="primary-2" data-name="primary" points="17 16 21 12 17 ' +
        '8" style="fill: none; stroke: rgb(0, 0, 0); stroke-linecap: roun' +
        'd; stroke-linejoin: round; stroke-width: 2;"></polyline><path id' +
        '="primary-3" data-name="primary" d="M13,8V4a1,1,0,0,0-1-1H4A1,1,' +
        '0,0,0,3,4V20a1,1,0,0,0,1,1h8a1,1,0,0,0,1-1V16" style="fill: none' +
        '; stroke: rgb(0, 0, 0); stroke-linecap: round; stroke-linejoin: ' +
        'round; stroke-width: 2;"></path></svg>'
      ExplicitTop = 1
    end
    object tbCancelar: TSkSvg
      AlignWithMargins = True
      Left = 70
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Hint = 'Cancelar Venda'
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      Visible = False
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"delete-file" data-name="Flat Line" xmlns="http://www.w3.org/200' +
        '0/svg" class="icon flat-line"><path id="secondary" d="M6,21a1,1,' +
        '0,0,1-1-1V4A1,1,0,0,1,6,3h9l4,4V20a1,1,0,0,1-1,1Z" style="fill: ' +
        'rgb(44, 169, 188); stroke-width: 2;"></path><line id="primary" x' +
        '1="10.5" y1="10.5" x2="13.5" y2="13.5" style="fill: none; stroke' +
        ': rgb(0, 0, 0); stroke-linecap: round; stroke-linejoin: round; s' +
        'troke-width: 2;"></line><line id="primary-2" data-name="primary"' +
        ' x1="13.5" y1="10.5" x2="10.5" y2="13.5" style="fill: none; stro' +
        'ke: rgb(0, 0, 0); stroke-linecap: round; stroke-linejoin: round;' +
        ' stroke-width: 2;"></line><path id="primary-3" data-name="primar' +
        'y" d="M6,21a1,1,0,0,1-1-1V4A1,1,0,0,1,6,3h9l4,4V20a1,1,0,0,1-1,1' +
        'Z" style="fill: none; stroke: rgb(0, 0, 0); stroke-linecap: roun' +
        'd; stroke-linejoin: round; stroke-width: 2;"></path></svg>'
      ExplicitTop = 1
    end
    object ToolButton1: TSkSvg
      AlignWithMargins = True
      Left = 146
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Hint = 'Relat'#243'rio de Vendas'
      Margins.Left = 10
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton1Click
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"chart-presentation" data-name="Flat Line" xmlns="http://www.w3.' +
        'org/2000/svg" class="icon flat-line"><circle id="secondary" cx="' +
        '11" cy="16" r="3" style="fill: rgb(44, 169, 188); stroke-width: ' +
        '2;"></circle><polyline id="primary" points="8 10 10 8 14 10 16 7' +
        '" style="fill: none; stroke: rgb(0, 0, 0); stroke-linecap: round' +
        '; stroke-linejoin: round; stroke-width: 2;"></polyline><path id=' +
        '"primary-2" data-name="primary" d="M4,15V3H20V15a1,1,0,0,1-1,1H1' +
        '8" style="fill: none; stroke: rgb(0, 0, 0); stroke-linecap: roun' +
        'd; stroke-linejoin: round; stroke-width: 2;"></path><path id="pr' +
        'imary-3" data-name="primary" d="M8.83,18.12,6,21M11,13a3,3,0,1,0' +
        ',3,3A3,3,0,0,0,11,13ZM3,3H21" style="fill: none; stroke: rgb(0, ' +
        '0, 0); stroke-linecap: round; stroke-linejoin: round; stroke-wid' +
        'th: 2;"></path></svg>'
      ExplicitLeft = 140
      ExplicitTop = 1
    end
  end
  object qCompras: TZReadOnlyQuery
    SortedFields = 'ID'
    SortType = stDescending
    Connection = DM.zCon
    SQL.Strings = (
      
        'SELECT a.ID, a.Fornecedor cliente, a.VALOR, a.DESCONTO, a.VALOR_' +
        'TOTAL, a.DATA_COMPRA DATA_VENDA, b.NOME'
      
        '  FROM COMPRA a LEFT JOIN  FUNCIONARIO b on  a.USUARIO = b.ID WH' +
        'ERE ex = 0'
      '    order by id desc;')
    Params = <>
    IndexFieldNames = 'ID Desc'
    Left = 848
    Top = 96
    object qComprasID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qComprasCLIENTE: TWideStringField
      FieldName = 'CLIENTE'
      ReadOnly = True
      Size = 250
    end
    object qComprasVALOR: TZBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 6
      Size = 2
    end
    object qComprasDESCONTO: TZBCDField
      FieldName = 'DESCONTO'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 6
      Size = 2
    end
    object qComprasVALOR_TOTAL: TZBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      DisplayFormat = '###,###,##0.00'
      Precision = 6
      Size = 2
    end
    object qComprasDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      ReadOnly = True
    end
    object qComprasNOME: TWideStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 255
    end
  end
  object dCompras: TDataSource
    DataSet = qCompras
    Left = 912
    Top = 96
  end
end
