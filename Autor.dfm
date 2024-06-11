object AutForm: TAutForm
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 508
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clScrollBar
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 80
    Top = 8
    Width = 198
    Height = 40
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 40
    Font.Name = 'Segoe UI Black'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 192
    Width = 186
    Height = 15
    Caption = #1042' '#1087#1077#1088#1074#1099#1081' '#1088#1072#1079'? '#1047#1072#1088#1077#1075#1077#1089#1090#1088#1080#1088#1091#1081#1090#1077#1089#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMediumblue
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = Label2Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 80
    Width = 217
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
    OnEnter = Edit1Enter
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 80
    Top = 136
    Width = 217
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    OnEnter = Edit2Enter
    OnExit = Edit2Exit
  end
  object Button2: TButton
    Left = 80
    Top = 224
    Width = 217
    Height = 81
    Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clScrollBar
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
