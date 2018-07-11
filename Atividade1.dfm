object Form1: TForm1
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
  object Label2: TLabel
    Left = 200
    Top = 128
    Width = 64
    Height = 13
    Caption = 'admingroupid'
  end
  object Label3: TLabel
    Left = 200
    Top = 296
    Width = 52
    Height = 13
    Caption = 'description'
    FocusControl = DBEdit2
  end
  object Label4: TLabel
    Left = 176
    Top = 128
    Width = 64
    Height = 13
    Caption = 'admingroupid'
  end
  object Label5: TLabel
    Left = 176
    Top = 296
    Width = 52
    Height = 13
    Caption = 'description'
    FocusControl = DBEdit3
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 473
    Height = 49
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 64
      Height = 13
      Caption = 'Especialidade'
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
  object Confirmar: TButton
    Left = 328
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 4
  end
  object Cancelar: TButton
    Left = 409
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = CancelarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 63
    Width = 472
    Height = 144
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'specialityid'
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Title.Caption = 'Especialidade'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codg_admingroup_fk'
        Title.Caption = 'Sistema Organizacional'
        Width = 150
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit
    Left = 200
    Top = 376
    Width = 2604
    Height = 21
    DataField = 'description'
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 176
    Top = 376
    Width = 2604
    Height = 21
    DataField = 'description'
    TabOrder = 8
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 328
    Top = 160
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      340200009619E0BD010000001800000004001300000003000000FB000C737065
      6369616C69747969640100490004000100055749445448020002001E000B6465
      736372697074696F6E010049000000010005574944544802000200C80010666C
      61675F66756E63616F5F6F706572010049000000010005574944544802000200
      010012636F64675F61646D696E67726F75705F666B0100490000000100055749
      445448020002001E0004000D44454641554C545F4F5244455204008200010000
      00018000000B5052494D4152595F4B4559020082000100000001000A554E4951
      55455F4B4559040082000100000001800000044C434944040001000000000000
      00067A617A617A61056767676167014501310000057A617A617A036664730145
      01310000087465737465616263056173646667014201310050066B6B726F746F
      0761616161616161000004494B5553067069706F636101450132000005617A78
      6376053534333231014201330000056161616262067465737465350145013300
      5005616161616101620040043837363504383736350145004003363534033635
      34014200500135036565650040013405746573746501420000033336300A7465
      7374652061616161014501310040013303746573014200000132127465737465
      206465736372697074696F6E3201420132004003313839073138353934313801
      4200000331353903616C6F014201320000013111746573746520646573637269
      7074696F6E01450131000004303030300361616101420132}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 152
  end
end
