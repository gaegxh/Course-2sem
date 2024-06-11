object MyStyleForm: TMyStyleForm
  Left = 0
  Top = 0
  Caption = 'MyStyleForm'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 224
    Top = 22
    Width = 144
    Height = 28
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1090#1080#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 32
    Top = 56
    Width = 561
    Height = 241
    ItemHeight = 15
    TabOrder = 0
  end
  object Button1: TButton
    Left = 480
    Top = 376
    Width = 121
    Height = 41
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 1
    OnClick = Button1Click
  end
end
