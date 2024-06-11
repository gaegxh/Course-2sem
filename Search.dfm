object SearForm: TSearForm
  Left = 0
  Top = 0
  Caption = 'SearForm'
  ClientHeight = 503
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 40
    Top = 24
    Width = 105
    Height = 41
    Caption = 'OldMoney'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 200
    Width = 105
    Height = 41
    Caption = 'Modern'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 296
    Width = 105
    Height = 41
    Caption = #1042#1072#1096#1080' '#1089#1090#1080#1083#1080
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 40
    Top = 112
    Width = 105
    Height = 41
    Caption = 'Classic'
    TabOrder = 3
    OnClick = Button4Click
  end
  object StringGrid1: TStringGrid
    Left = 168
    Top = 24
    Width = 649
    Height = 425
    TabOrder = 4
    RowHeights = (
      24
      24
      24
      35
      36)
  end
  object Button5: TButton
    Left = 680
    Top = 455
    Width = 137
    Height = 40
    Caption = #1053#1072#1079#1072#1076' '#1074' '#1075#1083#1072#1074#1085#1086#1077#13' '#1084#1077#1085#1102
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 40
    Top = 376
    Width = 105
    Height = 41
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#13#1074' '#1080#1079#1073#1088#1072#1085#1085#1086#1077
    TabOrder = 6
    OnClick = Button3Click
  end
end
