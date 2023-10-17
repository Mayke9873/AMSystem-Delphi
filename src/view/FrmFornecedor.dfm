object fFornecedor: TfFornecedor
  Left = 531
  Top = 374
  Caption = 'Fornecedor'
  ClientHeight = 644
  ClientWidth = 995
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    995
    644)
  TextHeight = 15
  object Label9: TLabel
    Left = 5
    Top = 33
    Width = 59
    Height = 17
    Caption = 'Pesquisar:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 56
    Width = 995
    Height = 588
    ActivePage = pgDados
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 975
    ExplicitHeight = 587
    object pgTabela: TTabSheet
      Caption = 'Tabela'
      object dbgFornecedor: TDBGrid
        Left = 0
        Top = 0
        Width = 987
        Height = 558
        Align = alClient
        DataSource = dmFornecedores.dFornecedor
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgFornecedorDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ie'
            Title.Caption = 'IE'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco'
            Title.Caption = 'Endere'#231'o'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numEndereco'
            Title.Caption = 'N'#186
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'bairro'
            Title.Caption = 'Bairro'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtRegistro'
            Title.Caption = 'Dt. Registro'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ativo'
            Title.Caption = 'Ativo'
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 36
            Visible = True
          end>
      end
    end
    object pgDados: TTabSheet
      Caption = 'Dados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Label1: TLabel
        Left = 8
        Top = 13
        Width = 56
        Height = 18
        Caption = 'C'#243'digo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 70
        Width = 46
        Height = 18
        Caption = 'Nome:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 345
        Top = 70
        Width = 18
        Height = 18
        Caption = 'IE:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 527
        Top = 70
        Width = 46
        Height = 18
        Caption = 'CNPJ:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 129
        Width = 72
        Height = 18
        Caption = 'Endere'#231'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 342
        Top = 129
        Width = 20
        Height = 18
        Caption = 'N'#186':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 405
        Top = 129
        Width = 47
        Height = 18
        Caption = 'Bairro:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object dbchkAtivo: TDBCheckBox
        Left = 282
        Top = 39
        Width = 58
        Height = 17
        Caption = 'Ativo'
        DataField = 'ativo'
        DataSource = dmFornecedores.dFornecedor
        ReadOnly = True
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object Panel1: TPanel
        Left = 8
        Top = 91
        Width = 332
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 1
        object Shape1: TShape
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 332
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = 152
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object DBENome: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 326
          Height = 20
          Margins.Top = 4
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'nome'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 345
        Top = 91
        Width = 178
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 2
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 178
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = 152
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object DBEIE: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 172
          Height = 20
          Margins.Top = 4
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'Ie'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 527
        Top = 91
        Width = 180
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 3
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 180
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = 1
          ExplicitWidth = 331
          ExplicitHeight = 26
        end
        object DBECPF: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 174
          Height = 20
          Margins.Top = 4
          Align = alClient
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'CNPJ'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 8
        Top = 149
        Width = 331
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 4
        object Shape5: TShape
          Left = 0
          Top = 0
          Width = 331
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = 152
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object DBEEndereco: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 325
          Height = 20
          Margins.Top = 4
          Align = alClient
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'endereco'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 342
        Top = 149
        Width = 58
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 5
        object Shape6: TShape
          Left = 0
          Top = 0
          Width = 58
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = 152
          ExplicitTop = 24
          ExplicitWidth = 65
          ExplicitHeight = 65
        end
        object DBENumEnd: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 52
          Height = 20
          Margins.Top = 4
          Align = alClient
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'numEndereco'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        Left = 405
        Top = 150
        Width = 302
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 6
        object Shape7: TShape
          Left = 0
          Top = 0
          Width = 302
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Shape = stRoundRect
          ExplicitLeft = -7
        end
        object DBEBairro: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 296
          Height = 20
          Margins.Top = 4
          Align = alClient
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'bairro'
          DataSource = dmFornecedores.dFornecedor
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel8: TPanel
        Left = 8
        Top = 34
        Width = 78
        Height = 27
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 7
        object Shape8: TShape
          Left = 0
          Top = 0
          Width = 78
          Height = 27
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Brush.Style = bsDiagCross
          Pen.Color = clMedGray
          Pen.Style = psInsideFrame
          Shape = stRoundRect
          ExplicitHeight = 26
        end
        object DBEditID: TDBEdit
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 72
          Height = 21
          Align = alClient
          BorderStyle = bsNone
          DataField = 'id'
          DataSource = dmFornecedores.dFornecedor
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
  end
  object edPesquisa: TEdit
    Left = 70
    Top = 32
    Width = 276
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    CharCase = ecUpperCase
    TabOrder = 1
    OnChange = edPesquisaChange
  end
  object rdbTodos: TRadioButton
    Left = 388
    Top = 34
    Width = 59
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Todos'
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = True
    OnClick = rdbTodosClick
  end
  object rdbAtivo: TRadioButton
    Tag = 1
    Left = 468
    Top = 34
    Width = 57
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Ativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = rdbTodosClick
  end
  object rdbInativo: TRadioButton
    Tag = 2
    Left = 540
    Top = 34
    Width = 65
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Inativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = rdbTodosClick
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 0
    Width = 995
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlBotoes'
    Padding.Left = 4
    ShowCaption = False
    TabOrder = 5
    ExplicitLeft = -16
    object tbNovo: TSkSvg
      AlignWithMargins = True
      Left = 4
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
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
      ExplicitLeft = 0
      ExplicitTop = -3
    end
    object tbEditar: TSkSvg
      AlignWithMargins = True
      Left = 37
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      OnClick = tbEditarClick
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
    object tbSalvar: TSkSvg
      AlignWithMargins = True
      Left = 70
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      OnClick = tbSalvarClick
      Svg.Source = 
        '<?xml version="1.0" encoding="utf-8"?><!-- Uploaded to: SVG Repo' +
        ', www.svgrepo.com, Generator: SVG Repo Mixer Tools -->'#13#10'<svg fil' +
        'l="#000000" width="800px" height="800px" viewBox="0 0 24 24" id=' +
        '"approved-file-3" data-name="Flat Line" xmlns="http://www.w3.org' +
        '/2000/svg" class="icon flat-line"><path id="secondary" d="M19,3H' +
        '8V5H6v8a4.19,4.19,0,0,1,.5,0,7,7,0,0,1,7,7,6.63,6.63,0,0,1-.08,1' +
        'H19a1,1,0,0,0,1-1V4A1,1,0,0,0,19,3Z" style="fill: rgb(44, 169, 1' +
        '88); stroke-width: 2;"></path><polyline id="primary" points="4 1' +
        '9 6 21 10 17" style="fill: none; stroke: rgb(0, 0, 0); stroke-li' +
        'necap: round; stroke-linejoin: round; stroke-width: 2;"></polyli' +
        'ne><path id="primary-2" data-name="primary" d="M13,21h6a1,1,0,0,' +
        '0,1-1V4a1,1,0,0,0-1-1H8L6,5v9" style="fill: none; stroke: rgb(0,' +
        ' 0, 0); stroke-linecap: round; stroke-linejoin: round; stroke-wi' +
        'dth: 2;"></path><path id="primary-3" data-name="primary" d="M16,' +
        '13H13m3-4H10M6,5H8V3Z" style="fill: none; stroke: rgb(0, 0, 0); ' +
        'stroke-linecap: round; stroke-linejoin: round; stroke-width: 2;"' +
        '></path></svg>'
      ExplicitLeft = 66
      ExplicitTop = 5
    end
    object tbCancelar: TSkSvg
      AlignWithMargins = True
      Left = 103
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      OnClick = tbCancelarClick
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
      ExplicitLeft = 99
      ExplicitTop = 5
    end
    object tbSair: TSkSvg
      AlignWithMargins = True
      Left = 136
      Top = 2
      Width = 29
      Height = 25
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 4
      Margins.Bottom = 2
      Align = alLeft
      OnClick = acSairExecute
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
      ExplicitLeft = 132
      ExplicitTop = 5
    end
  end
  object ImageList1: TImageList
    Left = 928
    Bitmap = {
      494C010105000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C527EFF0C527EFF0C527EFF1894E3FF1793E2FF1793E2FF1692
      E1FF1591E0FF1591E0FF1591E0FF0C527EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000D537FFFF3F3F3FFE9E9E9FF1995E4FF1894E3FF1793E2FF1793
      E2FF1692E1FF1591E0FF1591E0FF1591E0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E5581FFF3F3F3FFE9E9E9FF1A96E5FF1995E4FF1894E3FF1794
      E3FF1793E2FF1692E1FF1591E0FF1591E0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000F5683FFF3F3F3FFE9E9E9FF1B97E6FF1A96E5FF1995E4FF1894
      E3FF1894E3FF1793E2FF1692E1FF1591E0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003A3AC8103C3C
      DAFF3A3AC8FF3A3AC8FF3A3AC8FF3A3AC8FF1B98E7FF1B97E6FF1A96E5FF1995
      E4FF1895E4FF1894E3FF1793E2FF1692E1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004040DEFF4040DEFF4040
      DEFF4040DEFF4040DEFF4040DEFF4040DEFF1C99E8FF1B98E7FF1B97E6FF1A96
      E5FF1995E4FF1895E4FF1894E3FF1793E2FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004343E1FF4343E1FF4343E1FF4343
      E1FF4343E1FF4343E1FF4343E1FF4343E1FF1D99E8FF1C99E8FF1C98E7FF1B97
      E6FF1A96E5FF1996E5FF1995E4FF1894E3FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004646E4EF4646E4FF4646
      E4FF4646E4FF4646E4FF4646E4FF4646E4FF1E9AE9FF1D9AE9FF1C99E8FF1C98
      E7FF1B97E6FF1A96E5FF1996E5FF1995E4FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      E7FF00000000155E8DFFF3F3F3FFE9E9E9FF1F9BEAFF1E9AE9FF1D9AE9FF1D99
      E8FF1C98E7FF1B97E6FF1A96E5FF1A96E5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000016608EFFF3F3F3FFE9E9E9FF209CEBFF1F9BEAFF1E9BEAFF1D9A
      E9FF1D99E8FF1C98E7FF1B97E6FF1A97E6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000176190FFF3F3F3FFE9E9E9FF219DECFF209CEBFF1F9BEAFF1E9B
      EAFF1D9AE9FF1D99E8FF1C98E7FF1B97E6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000186392FFF3F3F3FFE9E9E9FF219EEDFF219DECFF209CEBFF1F9B
      EAFF1E9BEAFF1E9AE9FF1D99E8FF1C98E7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000196494FFF3F3F3FFE9E9E9FF229FEEFF229EEDFF219DECFF209C
      EBFF1F9CEBFF1E9BEAFF1E9AE9FF1D99E8FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001A6696FF1A6696FF133C7AFF23A0EFFF229FEEFF229EEDFF219D
      ECFF209DECFF1F9CEBFF1F9BEAFF1A6696FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000002000000080000000E00000012000000110000000B000000040000
      0001000000000000000000000000000000000000000000000000000000000000
      00000000000060AE27FF60AF27FF71CC2EFF71CC2EFF60AE27FF60AE27FF0000
      0000000000000000000000000000000000000000000000000000000000007C70
      67FF7C7067FF7C7067FF7C7067FF7C7067FF7C7067FF7C7067FF7C7067FF7C70
      67FF7C7067FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000020000
      00080000001E000000400000005B00000067000000630000004F0000002B0000
      00100000000400000000000000000000000000000000000000000000000060AE
      27FF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC
      2EFF60AE27FF00000000000000000000000000000000000000007C7067FFE0E0
      E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0
      E0FFE0E0E0FF7C7067FF00000000000000000000000000000000B98029FFB980
      29FFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3
      BDFFB98029FFB98029FF000000000000000000000000FFFFFF000000000D0000
      003B010122AF020145FF0C0B6CFF0A0A85FF050579FF050252FF010131E20000
      096B0000001D00000004000029000000000000000000000000000000000071CC
      2EFF71CC2EFF71CC2EFF71CC2EFF60AE27FF60AE27FF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF00000000000000000000000000000000000000007C7067FFDCDC
      DCFFDBDBDBFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDCDCDCFFDBDB
      DBFFE2E2E2FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFDB9834FFDB9834FF0000000000000000000000010000000A000000420202
      46EC050596FF0606A3FF1515AFFF1616B1FF1110AFFF0A0AA8FF0908A2FF0303
      64FF010125A50000001B0000000200000000000000000000000071CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF000000000000000000000000000000007C7067FFE0E0
      E0FFE0E0E0FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE8E3E2FF0099CCFF0098
      CCFFE6E6E6FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFF1F0ECFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFF1F0
      ECFFDB9834FFDB9834FF0000000000000000000000030000002C03035AEB0707
      B2FF0909B9FF0E0EBEFF2B2AC8FF2D2CD2FF2121CEFF1917BBFF1212B1FF0E0E
      AFFF070687FF01012B8A0000000D00000001000000000000000071CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF000000000000000000000000000000007C7067FFE5E5
      E5FFE5E5E5FFE6E6E6FFE7E7E7FFE7E7E7FF0094CAFF0099CCFF73C7E6FF0099
      CCFFEAEAEAFF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFF1F0ECFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFC7C3BDFFF1F0
      ECFFDB9834FFDB9834FF00000000000000000000000D03034DA30707C2FF0B0B
      CBFF1010BFFFAEAEB6FF504EB8FF3A34D1FF312AD1FF403EB2FFADADB5FF1514
      B3FF1010B8FF090680FF0000002800000002000000006DC42CFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF60AE27FF0000000000000000000000007C7067FFEAEA
      EAFFEBEBEBFFEBEBEBFFECECECFF0094CAFF0098CCFF87EFFEFF0099CCFFEBEB
      EBFFEEEEEEFF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFFDB9834FFDB9834FF00000000000000000000001C080798FF1D1EDCFF1717
      DBFF3E3CC2FFE4E4E4FFEBEBEBFF4844B5FF4542B3FFE4E4E4FFD8D8D8FF3736
      B3FF1B1AC9FF1C1DC5FF03035286000000050000000071CC2EFF71CC2EFF71CC
      2EFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFF71CC2EFF71CC2EFF71CC2EFF0000000000000000000000007C7067FFEFEF
      EFFFEFEFEFFFF0F0F0FF0094CAFF0098CCFF8AEEFEFF0099CCFF76C4DEFFEFEF
      EFFFF1F1F1FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB98
      34FFDB9834FFDB9834FF0000000000000000000000262221C8FF5454F0FF2624
      EEFF322ADFFF534EC3FFF3F3F3FFF4F4F4FFF3F3F3FFF5F5F5FF4F49C1FF322D
      D5FF2524DAFF2324D3FF060689D6000000060000000071CC2EFF71CC2EFF71CC
      2EFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0ECFFF1F0
      ECFF71CC2EFF71CC2EFF71CC2EFF0000000000000000000000007C7067FFF3F3
      F3FFF3F3F3FF0094C9FF0098CCFF8AEEFEFF0099CCFF79C6E0FFF4F4F4FFF3F3
      F3FFF5F5F5FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB98
      34FFDB9834FFDB9834FF0000000000000000000000253333E9FF4140F6FF645F
      F9FF635BF2FF4337CDFF6E68C1FFF8F8F8FFFAFAFAFF6D68C1FF3D35CBFF443A
      ECFF302CE8FF1C1CDCFF0909A4FA000000040000000071CB2EF371CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF55AA55030000000000000000000000007C7067FFF7F7
      F7FF0093C9FF0098CCFF8AEEFEFF0099CCFF79C7E2FFF8F8F8FFF8F8F8FFF7F7
      F7FFF8F8F8FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB9834FFDB98
      34FFDB9834FFDB9834FF00000000000000000000001A2B2AE0FF4644FAFF615B
      F9FF5D55E4FF6B65C3FFF2F2F2FFEFEFEFFFF1F1F1FFF6F6F6FF544FC2FF3F38
      DFFF3430EEFF1D1DE7FF0F0FA3EB00000002000000000000000071CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF000000000000000000000000000000007C7067FF0093
      C9FF0098CCFF8AEEFEFF0099CCFF7BC9E3FFFBFBFBFFC7C1BEFFC8C3BFFFC8C3
      BFFFA59D97FF7C7067FF00000000000000000000000000000000DB9834FFDB98
      34FFB98029FFB98029FFB98029FFB98029FFB98029FFB98029FFB98029FFB980
      29FFDB9834FFDB9834FF0000000000000000000000091C1BBEFF4746FAFF4C47
      EFFF5955C6FFE5E5E5FFE9E9E9FF635CB8FF594EBAFFECECECFFE5E5E5FF4B47
      C1FF302DE9FF1E1FEEFF1D1D9EA000000001000000000000000071CC2EFF71CC
      2EFF71CC2EFF71CC2EFF71CC2EFFF1F0ECFFF1F0ECFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF71CC2EFF00000000000000000000000000000000009CD3FF0098
      CCFF8AEEFEFF0099CCFF7DCBE4FFFDFDFDFFFDFDFDFFC9C5C1FFC9C5C1FFA79E
      98FF7C7067FF0000000000000000000000000000000000000000DB9834FFDB98
      34FFB98029FFF1F0ECFFA6A595FFA6A595FFF1F0ECFFF1F0ECFFF1F0ECFFB980
      29FFDB9834FFDB9834FF0000000000000000000000012121ACD17D7EF4FF4946
      EAFF302CB9FFAEAEB1FF5D55BDFF7061DEFF5A49DEFF554FBDFF919195FF2320
      B9FF2B2AE8FF2927D7FF282889150000000000000000000000000000000071CC
      2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC
      2EFF71CC2EFF000000000000000000000000000000000099CCFF0098CCFFE7F2
      F4FF0099CCFF7DCBE5FFFEFEFEFFFEFEFEFFFEFEFEFFCAC5C2FFA8A09AFF7C70
      67FF000000000000000000000000000000000000000000000000DB9834FFDB98
      34FFB98029FFA6A595FFA6A595FFA6A595FFF1F0ECFFF1F0ECFFF1F0ECFFB980
      29FFDB9834FFDB9734880000000000000000000000002F2F9A1B5454DFFF9897
      EFFF4B47DEFF403AD0FF5248E6FF6457F8FF5B4EF8FF463CE5FF2F2BCFFF2D2B
      DEFF2C2CF4FF4343C5BE00000001000000000000000000000000000000000000
      000071CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC2EFF71CC
      2EFF00000000000000000000000000000000000000000099CCFF7191FFFF0099
      CCFF7ECBE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A19BFF7C7067FF0000
      0000000000000000000000000000000000000000000000000000DB9834FFDB98
      34FFB98029FFC7C3BDFFC7C3BDFFC7C3BDFFF1F0ECFFF1F0ECFFF1F0ECFFB980
      29FFDB97348800000000000000000000000000000000000000014A4ACA697D7D
      EFFFB7B6F6FFA4A2F3FF6E68FAFF615BFEFF5149FFFF5651FAFF6462F4FF504F
      F6FF4F4FD7EB000000035656E000000000000000000000000000000000000000
      0000000000000000000070CB2EEE71CC2EFF71CC2EFF71CC2DC4000000000000
      000000000000000000000000000000000000000000000099CCFF0099CCFF3D85
      9BFF7C7067FF7C7067FF7C7067FF7C7067FF7C7067FF7C7067FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF005050
      CF4D5656E1FFACACFEFFCFCEFEFFC9C8FDFFC1C0FBFF9393FCFF4F4EEBFF5252
      D6B700000002FFFFFF005757E100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005757E1005757E1005757
      E100000000015151D0435454D9A65656DDD55555DBBB5050CF654646B40F5757
      E1005757E1005757E1005757E10000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F800000000000000
      F800000000000000F800000000000000F800000000000000C000000000000000
      800000000000000000000000000000008000000000000000E800000000000000
      F800000000000000F800000000000000F800000000000000F800000000000000
      F800000000000000FFFF000000000000FFFFFFFFFFFFF00FF81FE007FFFFC007
      E007C003C0038001E007C003C0030001C003C003C0030000C003C003C0030000
      8001C003C00300008001C003C00300008001C003C00300008001C003C0030000
      C003C003C0030000C003C007C0030001E007800FC0038001F00F801FC0078001
      FC3F803FFFFF8001FFFFFFFFFFFF800100000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 862
    object acSair: TAction
      Caption = 'Sair'
      ImageIndex = 4
      ImageName = 'ImageList1'
      ShortCut = 27
      OnExecute = acSairExecute
    end
  end
end
