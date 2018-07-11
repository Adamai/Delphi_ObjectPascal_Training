unit UNcontroller;


interface

uses UNspeciality, database, Data.DBXMySQL, Data.FMTBcd,
    Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.StdCtrls;

type
  TController = class(TObject)
  strict private
    class var FInstance : TController;
  private
    class procedure ReleaseInstance();
  public
    class function GetInstance(): TController;
    function ctrlspeciality(CSpeciality:Tspeciality; ClientDataSet : TClientDataSet) : Tspeciality;
    procedure clientrefresh(ClientDataSet:TClientDataSet);
    procedure pesquisar(especialidade,OS : String; ClientDataSet : TClientDataSet);
    procedure carregarCBAdmGroup(Cb : TCombobox);
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
  begin
    TDatamodule1.getinstance.SQLQuery1.SQL.Clear;
    TDatamodule1.getinstance.SQLQuery1.SQL.Add('SELECT * FROM speciality;');
    TDatamodule1.getinstance.SQLQuery1.Open;
    TDatamodule1.getinstance.SQLQuery1.First;
    ClientDataSet.DisableControls;
    try
      ClientDataSet.EmptyDataSet;
      ClientDataSet.First;
    while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
    begin
      ClientDataSet.Append;
      ClientDataSet.FieldByName('specialityid').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('specialityid').AsString;
      ClientDataSet.FieldByName('description').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('description').AsString;
      ClientDataSet.FieldByName('flag_funcao_oper').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('flag_funcao_oper').AsString;
      ClientDataSet.FieldByName('codg_admingroup_fk').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('codg_admingroup_fk').AsString;
      ClientDataSet.Next;
      TDatamodule1.getinstance.SQLQuery1.Next;
    end;
    ClientDataSet.First;
    finally
      ClientDataSet.EnableControls;
    end;
  end;

  procedure TController.pesquisar(especialidade, OS : String; ClientDataSet : TClientDataSet);
  begin
    TDatamodule1.getinstance.SQLQuery1.SQL.Clear;
    if (Length(OS)=0) then
    begin
      TDatamodule1.getinstance.SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE description LIKE "%'+ especialidade + '%";');
      end
      else
    begin
      TDatamodule1.getinstance.SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE description LIKE "%'+ especialidade + '%" AND codg_admingroup_fk LIKE "%' + OS + '%";');
    end;
    TDatamodule1.getinstance.SQLQuery1.Open;
    TDatamodule1.getinstance.SQLQuery1.First;
    ClientDataSet.DisableControls;
    try
      ClientDataSet.EmptyDataSet;
      ClientDataSet.First;
    while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
    begin
      ClientDataSet.Append;
      ClientDataSet.FieldByName('specialityid').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('specialityid').AsString;
      ClientDataSet.FieldByName('description').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('description').AsString;
      ClientDataSet.FieldByName('flag_funcao_oper').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('flag_funcao_oper').AsString;
      ClientDataSet.FieldByName('codg_admingroup_fk').AsString := TDatamodule1.getinstance.SQLQuery1.FieldByName('codg_admingroup_fk').AsString;
      ClientDataSet.Next;
      TDatamodule1.getinstance.SQLQuery1.Next;
    end;
    ClientDataSet.First;
    finally
      ClientDataSet.EnableControls;
    end;
  end;

  procedure TController.carregarCBAdmGroup(Cb : TCombobox);
  begin
    cb.Clear;
    TDatamodule1.getinstance.SQLQuery1.SQL.Clear;
    TDatamodule1.getinstance.SQLQuery1.SQL.Add('SELECT * FROM admingroup');
    TDatamodule1.getinstance.SQLQuery1.Open;
    TDatamodule1.getinstance.SQLQuery1.First;
    while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
    begin
      Cb.Items.Add(TDatamodule1.getinstance.SQLQuery1.FieldByName('admingroupid').AsString);
      TDatamodule1.getinstance.SQLQuery1.Next;
    end;
  end;

initialization
finalization
TController.ReleaseInstance();

end.
