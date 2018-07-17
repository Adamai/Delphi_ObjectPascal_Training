object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
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
    Width = 473
    Height = 49
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Edit1: TEdit
      Left = 0
      Top = 19
      Width = 209
      Height = 21
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 215
      Top = -1
      Width = 137
      Height = 17
      Caption = 'Sistema Organizacional'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button1: TButton
      Left = 391
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 215
      Top = 19
      Width = 170
      Height = 21
      TabOrder = 3
      Text = 'ComboBox1'
    end
  end
  object Incluir: TButton
    Left = 8
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = IncluirClick
  end
  object Alterar: TButton
    Left = 89
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = AlterarClick
  end
  object Excluir: TButton
    Left = 170
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = ExcluirClick
  end
  object Cancelar: TButton
    Left = 409
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = CancelarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 63
    Width = 472
    Height = 144
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ClientDataSetAdm: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 136
    object ClientDataSetAdmadmingroupid: TStringField
      FieldName = 'admingroupid'
      Size = 30
    end
    object ClientDataSetAdmdescription: TStringField
      FieldName = 'description'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSetAdm
    Left = 320
    Top = 136
  end
end
