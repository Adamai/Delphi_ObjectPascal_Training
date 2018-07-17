  unit UNcontroller;


  interface

  uses UNspeciality, database, Data.DBXMySQL, Data.FMTBcd, Vcl.Dialogs,Vcl.Forms,
      Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.StdCtrls, Unadmingroup,
      system.SysUtils;

  type
    IAtualizaTela = interface
     ['{8FF85A15-68A4-4284-AF2E-CE7521D70C14}']
     procedure AtualizaTela;
     end;
    TController = class(TObject)
    strict private
      class var FInstance : TController;
    private
      class
    procedure ReleaseInstance();
    private
    FTelaPrincipal: TForm;
    FTelaSecundaria: TForm;
    procedure SetTelaPrincipal(const Value: TForm);
    procedure SetTelaSecundaria(const Value: TForm);
    public
      class function GetInstance(): TController;
      function ctrlspeciality(CSpeciality:Tspeciality; ClientDataSet : TClientDataSet) : Tspeciality;
      procedure clientrefresh(ClientDataSet:TClientDataSet);
      procedure pesquisar(especialidade,OS : String; ClientDataSet : TClientDataSet);
      procedure carregarCBAdmGroup(Cb : TCombobox);
      procedure AdminRefresh(ClientDataSet : TClientDataSet);
      procedure pesquisaradm(descricao, OS : String; ClientDataSet : TClientDataSet);
      function ctrladm(Cadmingroup:TAdmingroup; ClientDataSet : TClientDataSet) : Tadmingroup;
      procedure AtualizarTelas();
      property TelaPrincipal : TForm read FTelaPrincipal write SetTelaPrincipal;
      property TelaSecundaria : TForm read FTelaSecundaria write SetTelaSecundaria;
  end;


  implementation

  class function TController.GetInstance: TController;
  begin
    if not Assigned(FInstance) then
      FInstance := TController.Create;
  Result := FInstance;
  end;

  class procedure TController.ReleaseInstance;
  begin
    if Assigned(FInstance) then
      FInstance.Free;
  end;

  procedure TController.SetTelaPrincipal(const Value: TForm);
begin
  FTelaPrincipal := Value;
end;

procedure TController.SetTelaSecundaria(const Value: TForm);
begin
  FTelaSecundaria := Value;
end;

function TController.ctrlspeciality(CSpeciality:Tspeciality; ClientDataSet : TClientDataSet) : Tspeciality;
  begin
    try
     case Cspeciality.comando of
    CMDDetalhes: result := TDataModule1.GetInstance.carregarSpeciality(Cspeciality.specialityid);
    CMDExcluir: Tdatamodule1.getinstance.excluirspeciality(ClientDataSet);
    CMDAlterar: Tdatamodule1.getinstance.alterarSpeciality(Cspeciality.description,CSpeciality.flag_funcao_oper,CSpeciality.codg_admin_group, Cspeciality.specialityid);
    CMDIncluir: TDataModule1.getinstance.inserirSpeciality(Cspeciality.specialityid, Cspeciality.description, CSpeciality.flag_funcao_oper, CSpeciality.codg_admin_group);
    end;
    finally
    begin
      if Cspeciality.comando <> CMDDetalhes then
      begin
        ClientRefresh(ClientDataSet);
      end;
    end;
    end;
  end;

  procedure TController.ClientRefresh(ClientDataSet : TClientDataSet);
    var
    i : integer;
    begin
      ClientDataSet.DisableControls;
      i:=0;
      try
        ClientDataSet.EmptyDataSet;
        ClientDataSet.First;
      while (i < Tdatamodule1.getinstance.ListaSpecialityF.count) do
      begin
        ClientDataSet.Append;
        ClientDataSet.FieldByName('specialityid').AsString := Tdatamodule1.getinstance.ListaSpecialityF[i].specialityid;
        ClientDataSet.FieldByName('description').AsString := TDatamodule1.getinstance.ListaSpecialityF[i].description;
        ClientDataSet.FieldByName('flag_funcao_oper').AsString := TDatamodule1.getinstance.ListaSpecialityF[i].flag_funcao_oper;
        ClientDataSet.FieldByName('codg_admingroup_fk').AsString := TDatamodule1.getinstance.ListaSpecialityF[i].codg_admin_group;
        ClientDataSet.Next;
        i:=i+1;
      end;
      ClientDataSet.First;
      finally
        ClientDataSet.EnableControls;
      end;
    end;

    procedure TController.pesquisar(especialidade, OS : String; ClientDataSet : TClientDataSet);
    var i : integer;
    begin
      ClientDataSet.DisableControls;
      i := 0;
      try
        ClientDataSet.EmptyDataSet;
        ClientDataSet.First;
      while (i < Tdatamodule1.getinstance.pesquisar(especialidade, OS).count) do
      begin
        ClientDataSet.Append;
        ClientDataSet.FieldByName('specialityid').AsString := Tdatamodule1.getinstance.pesquisar(especialidade, OS)[i].specialityid;
        ClientDataSet.FieldByName('description').AsString := TDatamodule1.getinstance.pesquisar(especialidade, OS)[i].description;
        ClientDataSet.FieldByName('flag_funcao_oper').AsString := TDatamodule1.getinstance.pesquisar(especialidade, OS)[i].flag_funcao_oper;
        ClientDataSet.FieldByName('codg_admingroup_fk').AsString := TDatamodule1.getinstance.pesquisar(especialidade, OS)[i].codg_admin_group;
        ClientDataSet.Next;
        i := i + 1;
      end;
      ClientDataSet.First;
      finally
        ClientDataSet.EnableControls;
      end;
    end;

    procedure TController.carregarCBAdmGroup(Cb : TCombobox);
    var
    i : integer;
    begin
      i:=0;
      cb.Clear;
      while (i < TDatamodule1.getinstance.ListaAdminGroup.Count) do
      begin
        Cb.Items.Add(TDatamodule1.getinstance.ListaAdminGroup[i].admingroupid);
        i := i + 1;
      end;
    end;

    procedure TController.AdminRefresh(ClientDataSet : TClientDataSet);
    var
    i : integer;
    begin
    ClientDataSet.First;
      ClientDataSet.DisableControls;
      i:=0;
      try
        ClientDataSet.EmptyDataSet;
        ClientDataSet.First;
      while (i < Tdatamodule1.getinstance.ListaAdminGroup.count) do
      begin
        ClientDataSet.Append;
        ClientDataSet.Fields[0].AsString := Tdatamodule1.getinstance.ListaAdminGroup[i].admingroupid;
        ClientDataSet.Fields[1].AsString := TDatamodule1.getinstance.ListaAdminGroup[i].description;
        ClientDataSet.Next;
        i:=i+1;
      end;
      ClientDataSet.First;
      finally
        ClientDataSet.EnableControls;
      end;
    end;


    procedure TController.pesquisaradm(descricao, OS : String; ClientDataSet : TClientDataSet);
    var i : integer;
    begin
      ClientDataSet.DisableControls;
      i := 0;
      try
        ClientDataSet.EmptyDataSet;
        ClientDataSet.First;
      while (i < Tdatamodule1.getinstance.pesquisaradm(descricao, OS).count) do
      begin
        ClientDataSet.Append;
        ClientDataSet.FieldByName('admingroupid').AsString := Tdatamodule1.getinstance.pesquisaradm(descricao, OS)[i].admingroupid;
        ClientDataSet.FieldByName('description').AsString := Tdatamodule1.getinstance.pesquisaradm(descricao, OS)[i].description;
        ClientDataSet.Next;
        i := i + 1;
      end;
      ClientDataSet.First;
      finally
        ClientDataSet.EnableControls;
      end;
    end;

    procedure TController.AtualizarTelas();
    var
      lAtualizaTela : IAtualizaTela;
      lAtualizaTela2 : IAtualizaTela;
    begin
      //(FTelaPrincipal as IAtualizaTela).atualizaTela;
      if supports(FTelaPrincipal, IAtualizaTela, lAtualizaTela) then
      begin
        lAtualizaTela.atualizaTela;
      end;
      if supports(FTelaSecundaria, IAtualizaTela, lAtualizaTela2) then
      begin
        lAtualizaTela2.atualizaTela;
      end;
    end;


    function TController.ctrladm(Cadmingroup:TAdmingroup; ClientDataSet : TClientDataSet) : Tadmingroup;
  begin
    try
     case Cadmingroup.comando of
    admCMDDetalhes: result := TDataModule1.GetInstance.carregaradmingroup(Cadmingroup.admingroupid);
    admCMDExcluir: Tdatamodule1.getinstance.excluiradmingroup(ClientDataSet);
    admCMDAlterar: Tdatamodule1.getinstance.alteraradmingroup(Cadmingroup.description, Cadmingroup.admingroupid);
    admCMDIncluir: TDataModule1.getinstance.inseriradmingroup(Cadmingroup.admingroupid, Cadmingroup.description);
    end;
    finally
    begin
      if Cadmingroup.comando <> admCMDDetalhes then
      begin
        //adminRefresh(ClientDataSet);
        AtualizarTelas;

      end;
    end;
    end;
  end;


  initialization
  finalization
  TController.ReleaseInstance();

  end.
