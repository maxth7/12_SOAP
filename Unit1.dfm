object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client SOAP'
  ClientHeight = 441
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 184
    Top = 432
    Width = 311
    Height = 21
    Caption = #1055#1086#1089#1083#1077' '#1087#1072#1088#1089#1080#1085#1075#1072' '#1086#1090#1074#1077#1090#1072' '#1089' SOAP '#1089#1077#1088#1074#1077#1088#1072' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 294
    Height = 25
    Caption = #1057'lient received from SOAP server'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 408
    Width = 320
    Height = 25
    Caption = 'GetBankAccountInfo'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object MemoOutParseXML: TMemo
    Left = 8
    Top = 49
    Width = 320
    Height = 353
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
end
