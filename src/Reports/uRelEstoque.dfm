object fRelEstoque_I: TfRelEstoque_I
  Left = 0
  Top = 0
  Caption = 'fRelEstoque_I'
  ClientHeight = 679
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object rpEstoque: TRLReport
    Left = 72
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      object RLLabel6: TRLLabel
        Left = 261
        Top = 22
        Width = 196
        Height = 22
        Align = faCenter
        Caption = 'Relat'#243'rio de estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 598
        Top = 0
        Width = 120
        Height = 16
        Align = faRightTop
        Alignment = taRightJustify
        Info = itNow
        Text = 'Impresso em: '
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 21
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLLabel1: TRLLabel
        Left = 3
        Top = 0
        Width = 49
        Height = 20
        Align = faTopOnly
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 83
        Top = 0
        Width = 54
        Height = 20
        Align = faTopOnly
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 423
        Top = 0
        Width = 55
        Height = 20
        Align = faTopOnly
        Caption = 'Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 491
        Top = 0
        Width = 97
        Height = 20
        Align = faTopOnly
        Caption = 'R$ tot. Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 602
        Top = 0
        Width = 87
        Height = 20
        Align = faTopOnly
        Caption = 'R$ tot. Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDados: TRLBand
      Left = 38
      Top = 126
      Width = 718
      Height = 19
      BeforePrint = rlbDadosBeforePrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 1
        Width = 16
        Height = 16
        DataField = 'ID'
        DataSource = DS
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 83
        Top = 1
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = DS
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 411
        Top = 1
        Width = 67
        Height = 16
        Alignment = taRightJustify
        DataField = 'ESTOQUE'
        DataSource = DS
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 524
        Top = 1
        Width = 64
        Height = 16
        Alignment = taRightJustify
        DataField = 'totCompra'
        DataSource = DS
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 633
        Top = 1
        Width = 56
        Height = 16
        Alignment = taRightJustify
        DataField = 'totVenda'
        DataSource = DS
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 40
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBResult1: TRLDBResult
        Left = 335
        Top = 18
        Width = 143
        Height = 16
        Alignment = taRightJustify
        DataField = 'ESTOQUE'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = 'Total '
      end
      object RLDBResult2: TRLDBResult
        Left = 441
        Top = 18
        Width = 147
        Height = 16
        Alignment = taRightJustify
        DataField = 'totCompra'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = 'Total '
      end
      object RLDBResult3: TRLDBResult
        Left = 551
        Top = 18
        Width = 138
        Height = 16
        Alignment = taRightJustify
        DataField = 'totVenda'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = 'Total '
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 21
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel5: TRLLabel
        Left = 0
        Top = 5
        Width = 69
        Height = 16
        Align = faLeftBottom
        Caption = 'AmSystem'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 466
        Top = 5
        Width = 252
        Height = 16
        Align = faRightBottom
        Alignment = taRightJustify
        Info = itPagePreview
        Text = 'P'#225'g.: # de '
      end
    end
  end
  object DS: TDataSource
    Left = 896
    Top = 32
  end
end
