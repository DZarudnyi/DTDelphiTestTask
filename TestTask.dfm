object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 527
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pMainPanel: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 527
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 168
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 41
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 384
      Height = 525
      Align = alLeft
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 385
      Top = 1
      Width = 426
      Height = 525
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 520
      ExplicitTop = 232
      ExplicitWidth = 185
      ExplicitHeight = 41
      object pAddContact: TPanel
        Left = 1
        Top = 1
        Width = 424
        Height = 248
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 0
        object lblFirstName: TLabel
          Left = 16
          Top = 0
          Width = 81
          Height = 36
          Margins.Left = 0
          Margins.Top = 10
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'First name:'
          Color = clGradientInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          StyleName = 'Windows'
        end
      end
    end
  end
end
