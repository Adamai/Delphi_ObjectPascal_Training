object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Especialidades'
  ClientHeight = 246
  ClientWidth = 488
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
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 472
    Height = 194
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 128
      Top = 0
      Width = 64
      Height = 13
      Caption = 'Especialidade'
    end
    object Label3: TLabel
      Left = 0
      Top = 54
      Width = 110
      Height = 13
      Caption = 'Sistema Organizacional'
    end
    object Edit1: TEdit
      Left = 0
      Top = 19
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 127
      Top = 19
      Width = 219
      Height = 21
      TabOrder = 1
    end
    object CheckBox1: TCheckBox
      Left = 352
      Top = 21
      Width = 113
      Height = 17
      Caption = 'Fun'#231#227'o Operacional'
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 0
      Top = 73
      Width = 145
      Height = 21
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 208
    Width = 472
    Height = 30
    TabOrder = 1
    object Confirmar: TButton
      Left = 311
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = ConfirmarClick
    end
    object Cancelar: TButton
      Left = 392
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = CancelarClick
    end
  end
end
