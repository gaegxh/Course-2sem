object NewStyleForm: TNewStyleForm
  Left = 0
  Top = 0
  Caption = 'NewStyle'
  ClientHeight = 391
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 80
    Top = 8
    Width = 473
    Height = 37
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1089#1090#1080#1083#1103' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI Symbol'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 146
    Width = 260
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 308
    Top = 146
    Width = 257
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1085#1080#1078#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 207
    Width = 274
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1086#1076#1077#1083#1100' '#1076#1083#1103' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 327
    Top = 207
    Width = 271
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1086#1076#1077#1083#1100' '#1076#1083#1103' '#1085#1080#1078#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 51
    Width = 317
    Height = 28
    Caption = #1055#1088#1080#1076#1091#1081#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1074#1072#1096#1077#1084#1091' '#1089#1090#1080#1083#1102
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 0
    Top = 268
    Width = 253
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1076#1083#1103' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 300
    Top = 268
    Width = 253
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1074#1077#1090' '#1076#1083#1103' '#1074#1077#1088#1093#1085#1077#1081' '#1086#1076#1077#1078#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 32
    Top = 167
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = ComboBox1Exit
  end
  object ComboBox2: TComboBox
    Left = 356
    Top = 167
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 32
    Top = 233
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = ComboBox3Change
  end
  object ComboBox4: TComboBox
    Left = 356
    Top = 233
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnChange = ComboBox4Change
  end
  object Edit1: TEdit
    Left = 170
    Top = 85
    Width = 247
    Height = 23
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnExit = Edit1Exit
  end
  object ComboBox5: TComboBox
    Left = 32
    Top = 294
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnChange = ComboBox5Change
  end
  object ComboBox6: TComboBox
    Left = 356
    Top = 294
    Width = 145
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnChange = ComboBox6Change
  end
  object Button1: TButton
    Left = 200
    Top = 336
    Width = 161
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 7
    OnClick = Button1Click
  end
end
