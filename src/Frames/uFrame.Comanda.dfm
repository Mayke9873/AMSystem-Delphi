object FrameComanda: TFrameComanda
  Left = 0
  Top = 0
  Width = 117
  Height = 84
  TabOrder = 0
  object spColor: TShape
    Left = 0
    Top = 0
    Width = 117
    Height = 84
    Align = alClient
    Brush.Color = clSkyBlue
    Pen.Style = psClear
    Shape = stRoundRect
    ExplicitLeft = 3
    ExplicitWidth = 310
    ExplicitHeight = 265
  end
  object pnlFrame: TPanel
    Left = 0
    Top = 0
    Width = 117
    Height = 84
    Cursor = crHandPoint
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlFrame'
    Locked = True
    ParentShowHint = False
    ShowCaption = False
    ShowHint = True
    TabOrder = 0
    object lNumeroComanda: TLabel
      Left = 0
      Top = 0
      Width = 117
      Height = 30
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'lNumeroComanda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 1
      ExplicitTop = 69
      ExplicitWidth = 66
    end
    object lNome: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 34
      Width = 111
      Height = 17
      Margins.Top = 4
      Align = alTop
      Alignment = taCenter
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 37
    end
    object lValor: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 58
      Width = 111
      Height = 15
      Margins.Top = 4
      Align = alTop
      Alignment = taCenter
      Caption = 'valor'
      ExplicitWidth = 26
    end
  end
end
