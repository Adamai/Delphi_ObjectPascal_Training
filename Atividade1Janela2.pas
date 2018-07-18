unit Atividade1Janela2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  database, Vcl.Mask, Vcl.DBCtrls, data.dbxcommon, UNspeciality, UNController,
  Data.DBXMySQL, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr;

type
TForm2 = class(TForm)
  Panel1: TPanel;
  Panel2: TPanel;
  Label1: TLabel;
  Label2: TLabel;
  Label3: TLabel;
  Confirmar: TButton;
  Cancelar: TButton;
  Edit1: TEdit;
  Edit2: TEdit;
  CheckBox1: TCheckBox;
  ComboBox1: TComboBox;
  procedure CancelarClick(Sender: TObject);
  procedure ConfirmarClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Alterar: Boolean;
    ClientDataSet : TClientDataSet;
end;

var
  Form2: TForm2;

implementation

uses
  Atividade1;

{$R *.dfm}

procedure TForm2.CancelarClick(Sender: TObject);
begin
  close;
end;

procedure TForm2.ConfirmarClick(Sender: TObject);
var
  res : boolean;
  flag : char;
  CSpeciality : TSpeciality;
begin
  CSpeciality := TSpeciality.Create;
  try
    res := false;
    flag := 'E';
    if CheckBox1.State = cbChecked then
    begin
      flag:='B';
    end;
    if ((CheckBox1.State = cbChecked) or (CheckBox1.State = cbUnchecked))
    and (Edit1.GetTextLen > 0) and (Edit2.GetTextLen > 0) and (ComboBox1.GetTextLen > 0) then
    begin
      if alterar = true then
      begin
        CSpeciality.specialityid := Edit1.Text;
        CSpeciality.comando := CMDDetalhes;
        CSpeciality := Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        CSpeciality.description := Edit2.Text;
        CSpeciality.flag_funcao_oper := flag;
        CSpeciality.codg_admin_group := ComboBox1.Text;
        CSpeciality.comando := CMDAlterar;
        Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        res := true;
      end
      else
      begin
        CSpeciality.specialityid := Edit1.Text;
        CSpeciality.description := Edit2.Text;
        CSpeciality.flag_funcao_oper := flag;
        CSpeciality.codg_admin_group := ComboBox1.Text;
        CSpeciality.comando := CMDIncluir;
        Tcontroller.getinstance.ctrlspeciality(CSpeciality, ClientDataSet);
        res := true;
      end;
      if res = true then
      begin
        close;
      end;
    end
    else
    begin
      showmessage('Todos os campos devem ser preenchidos');
    end;
  finally
    CSpeciality.Free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  tcontroller.getinstance.carregarCBAdmGroup(combobox1);
  ComboBox1.Style := csDropDownList;
end;

end.
