unit Atividade1Janela3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, UNController, Atividade1Janela4, UNadmingroup;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    Incluir: TButton;
    Alterar: TButton;
    Excluir: TButton;
    Cancelar: TButton;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1admingroupid: TStringField;
    ClientDataSet1description: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure IncluirClick(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AlterarClick(Sender: TObject);
var
      Form4 : TForm4;
    begin
      Form4 := TForm4.Create(Form4);
      try
        Form4.Alterar := true;
        Form4.ClientDataSet := ClientDataSet1;
        //Cuidado aqui tambem pode dar merda
        Form4.Edit1.Text := ClientDataSet1.Fields[0].AsString;
        Form4.Edit1.ReadOnly := true;
        Form4.Edit2.Text := ClientDataSet1.Fields[1].AsString;
        Form4.ShowModal;
      finally
        Form4.Free;
      end;
    end;

procedure TForm3.Button1Click(Sender: TObject);
begin
if checkbox1.Checked = true then
      begin
      tcontroller.getinstance.pesquisaradm(edit1.text,combobox1.text, ClientDataSet1);
      end
      else
      begin
      tcontroller.getinstance.pesquisaradm(edit1.text,'', ClientDataSet1);
      end;
end;

procedure TForm3.CancelarClick(Sender: TObject);
begin
close;
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
      begin
        ComboBox1.Enabled := true;
      end;
      if not CheckBox1.Checked then
      begin
        ComboBox1.Enabled := false;
      end;
end;

procedure TForm3.ExcluirClick(Sender: TObject);
var
    Cadmingroup : Tadmingroup;
    begin
    Cadmingroup := Tadmingroup.Create;
    Cadmingroup.admingroupid := DBGrid1.Fields[1].AsString;
    Cadmingroup.comando := admCMDDetalhes;
    Cadmingroup := TController.GetInstance.Ctrladm(Cadmingroup, ClientDataSet1);   //l
    Cadmingroup.comando := admCMDExcluir;
    TController.GetInstance.Ctrladm(Cadmingroup, ClientDataSet1);
    end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  ComboBox1.Clear;
  ClientDataSet1.CreateDataSet;
  TController.getinstance.AdminRefresh(ClientDataSet1);
  TController.getinstance.carregarCBAdmGroup(combobox1);
  ComboBox1.Enabled := false;
  ComboBox1.Style := csDropDownList;
end;

procedure TForm3.IncluirClick(Sender: TObject);
var
      Form4 : TForm4;
    begin
      Form4.Alterar :=false;
      Form4 := TForm4.Create(Form4);
      Form4.ClientDataSet := ClientDataSet1;
      try
        Form4.ShowModal;
      finally
        Form4.Free;
      end;
end;

end.
