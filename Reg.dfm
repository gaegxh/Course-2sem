object RegForm: TRegForm
  Left = 0
  Top = 0
  Caption = 'RegForm'
  ClientHeight = 475
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 8
    Width = 203
    Height = 45
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 249
    Width = 100
    Height = 21
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 112
    Top = 77
    Width = 134
    Height = 21
    Caption = #1055#1088#1080#1076#1091#1084#1072#1081#1090#1077' '#1083#1086#1075#1080#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 102
    Top = 193
    Width = 144
    Height = 21
    Caption = #1055#1088#1080#1076#1091#1084#1072#1081#1090#1077' '#1087#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 61
    Top = 135
    Width = 222
    Height = 21
    Caption = #1055#1088#1080#1076#1091#1084#1072#1081#1090#1077' '#1080#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 211
    Top = 249
    Width = 126
    Height = 21
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1088#1072#1079#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 276
    Width = 81
    Height = 23
    TabOrder = 0
    TabStop = False
    OnChange = ComboBox1Change
    OnExit = ComboBox1Exit
  end
  object Edit4: TEdit
    Left = 66
    Top = 162
    Width = 217
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = Edit4Exit
  end
  object Edit1: TEdit
    Left = 66
    Top = 104
    Width = 217
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 66
    Top = 220
    Width = 217
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = Edit2Exit
    OnMouseEnter = Edit2MouseEnter
  end
  object ComboBox2: TComboBox
    Left = 240
    Top = 276
    Width = 81
    Height = 23
    TabOrder = 4
    TabStop = False
    OnExit = ComboBox2Exit
  end
  object Button1: TButton
    Left = 94
    Top = 336
    Width = 181
    Height = 73
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 19
    Font.Name = 'Hack'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
end
