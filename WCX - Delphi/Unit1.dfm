object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 284
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 67
    Height = 13
    Caption = 'Clicked word: '
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 68
    Height = 13
    Caption = 'Left Context: '
  end
  object Label3: TLabel
    Left = 24
    Top = 99
    Width = 74
    Height = 13
    Caption = 'Right Context: '
  end
  object Label4: TLabel
    Left = 24
    Top = 139
    Width = 60
    Height = 13
    Caption = 'Paragraph:  '
  end
  object clickedWord: TEdit
    Left = 120
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'clickedWord'
  end
  object leftContext: TEdit
    Left = 120
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'leftContext'
  end
  object rightContext: TEdit
    Left = 120
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'rightContext'
  end
  object paragraph: TEdit
    Left = 120
    Top = 136
    Width = 265
    Height = 129
    AutoSize = False
    TabOrder = 3
    Text = 'paragraph'
  end
end
