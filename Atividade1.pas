    unit Atividade1;

    interface

    uses
      Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
      Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, database,
      Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Atividade1Janela2, UNSpeciality, UNadmingroup, UNcontroller,
      Data.DBXMySQL, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Atividade1Janela3;

    type
      TForm1 = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        Edit1: TEdit;
        CheckBox1: TCheckBox;
        Button1: TButton;
        Incluir: TButton;
        Alterar: TButton;
        Excluir: TButton;
    SO: TButton;
        Cancelar: TButton;
        DBGrid1: TDBGrid;
        Label2: TLabel;
        Label3: TLabel;
        DBEdit2: TDBEdit;
        Label4: TLabel;
        Label5: TLabel;
        DBEdit3: TDBEdit;
        ComboBox1: TComboBox;
        DataSource1: TDataSource;
        ClientDataSet1: TClientDataSet;
        procedure IncluirClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure AlterarClick(Sender: TObject);
        procedure ExcluirClick(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure CancelarClick(Sender: TObject);
    procedure SOClick(Sender: TObject);
      private
        { Private declarations }
      public
        { Public declarations }
      end;

    var
      Form1: TForm1;

    implementation

    {$R *.dfm}

    procedure TForm1.AlterarClick(Sender: TObject);
    var
      Form2 : TForm2;
    begin
      Form2 := TForm2.Create(Form2);
      try
        Form2.Alterar := true;
        Form2.ClientDataSet := ClientDataSet1;
        Form2.Edit1.Text := ClientDataSet1.Fields[0].AsString;
        Form2.Edit1.ReadOnly := true;
        Form2.Edit2.Text := ClientDataSet1.Fields[1].AsString;
        if ClientDataSet1.Fields[2].AsString = 'B' then
        begin
          Form2.CheckBox1.Checked := true;
        end;
        //Form2.ComboBox1.Text := ClientDataSet1.Fields[3].AsString;
        Form2.ComboBox1.ItemIndex := Form2.ComboBox1.Items.IndexOf(ClientDataSet1.Fields[3].AsString);
        Form2.ShowModal;
      finally
        Form2.Free;
      end;
    end;

    procedure TForm1.Button1Click(Sender: TObject);
    begin
      if checkbox1.Checked = true then
      begin
      tcontroller.getinstance.pesquisar(edit1.text,combobox1.text, ClientDataSet1);
      end
      else
      begin
      tcontroller.getinstance.pesquisar(edit1.text,'', ClientDataSet1);
      end;
    end;

    procedure TForm1.CancelarClick(Sender: TObject);
    begin
    close;
    end;

    procedure TForm1.CheckBox1Click(Sender: TObject);
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

    procedure TForm1.ExcluirClick(Sender: TObject);
    var
    CSpeciality : TSpeciality;
    begin
    CSpeciality := TSpeciality.Create;
    CSpeciality.specialityid := DBGrid1.Fields[0].AsString;
    CSpeciality.comando := CMDDetalhes;
    CSpeciality := TController.GetInstance.CtrlSpeciality(CSpeciality, ClientDataSet1);   //l
    CSpeciality.comando := CMDExcluir;
    TController.GetInstance.CtrlSpeciality(CSpeciality, ClientDataSet1);
    end;

    procedure TForm1.FormCreate(Sender: TObject);
    begin
      ComboBox1.Clear;
      TController.getinstance.ClientRefresh(ClientDataSet1);
      TController.getinstance.carregarCBAdmGroup(combobox1);
      ComboBox1.Enabled := false;
      ComboBox1.Style := csDropDownList;
    end;

    procedure TForm1.IncluirClick(Sender: TObject);
    var
      Form2 : TForm2;
    begin
      Form2.Alterar :=false;
      Form2 := TForm2.Create(Form2);
      Form2.ClientDataSet := ClientDataSet1;
      try
        Form2.ShowModal;
      finally
        Form2.Free;
      end;

    end;

    procedure TForm1.SOClick(Sender: TObject);
    var
      Form3 : TForm3;
    begin
      Form3 := TForm3.Create(Form3);
      try
        Form3.ShowModal;
      finally
        Form3.Free;
      end;
end;

end.
