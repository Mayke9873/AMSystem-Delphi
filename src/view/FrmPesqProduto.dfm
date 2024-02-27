object fPesProd: TfPesProd
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pesquisa de produto'
  ClientHeight = 218
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label5: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 721
    Height = 30
    Margins.Top = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'Pesquisa de Produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 196
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 53
    Width = 719
    Height = 42
    Margins.Left = 4
    Margins.Top = 10
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 0
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 719
      Height = 42
      Align = alClient
      Brush.Color = clSkyBlue
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 1
      ExplicitTop = 27
      ExplicitWidth = 270
      ExplicitHeight = 55
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 719
      Height = 42
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel11'
      Padding.Left = 2
      Padding.Top = 4
      Padding.Right = 2
      Padding.Bottom = 4
      ShowCaption = False
      TabOrder = 0
      object edCodigo: TEdit
        Left = 2
        Top = 4
        Width = 715
        Height = 34
        Align = alClient
        Alignment = taCenter
        BevelOuter = bvNone
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clSkyBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TextHint = 'C'#243'digo'
        StyleName = 'Windows'
        OnKeyDown = edCodigoKeyDown
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 147
    Width = 727
    Height = 71
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBotoes'
    Padding.Left = 260
    Padding.Top = 16
    Padding.Right = 260
    Padding.Bottom = 4
    ShowCaption = False
    TabOrder = 2
    object Panel9: TPanel
      Left = 260
      Top = 16
      Width = 207
      Height = 51
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel4'
      ShowCaption = False
      TabOrder = 0
      object Shape5: TShape
        Left = 0
        Top = 0
        Width = 207
        Height = 51
        Align = alClient
        Brush.Color = clSkyBlue
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = 80
        ExplicitTop = 24
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
      object SpeedButton4: TSpeedButton
        Left = 0
        Top = 0
        Width = 207
        Height = 51
        Action = acSair
        Align = alClient
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 6
        ExplicitTop = -3
        ExplicitWidth = 185
        ExplicitHeight = 84
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 99
    Width = 727
    Height = 42
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel3'
    Padding.Left = 70
    Padding.Right = 70
    ShowCaption = False
    TabOrder = 1
    object lblDescricao: TLabel
      AlignWithMargins = True
      Left = 73
      Top = 10
      Width = 82
      Height = 29
      Margins.Top = 10
      Align = alLeft
      Caption = 'Descricao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 25
    end
    object lblValor: TLabel
      AlignWithMargins = True
      Left = 594
      Top = 10
      Width = 60
      Height = 29
      Margins.Top = 10
      Align = alRight
      Alignment = taRightJustify
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 25
    end
  end
  object ActionList1: TActionList
    Left = 672
    Top = 168
    object acSair: TAction
      Caption = 'Sair'#13'(Esc)'
      ShortCut = 27
      OnExecute = acSairExecute
    end
  end
end
