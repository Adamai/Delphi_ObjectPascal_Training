unit database;

interface

uses
System.SysUtils,Winapi.Messages,Vcl.ExtCtrls, System.Classes, Data.DBXMySQL, Data.FMTBcd,
Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.Forms, Vcl.StdCtrls,
Vcl.Dialogs, Vcl.Controls, UNspeciality,System.Generics.Collections, UNadmingroup;

type
  TComandosDM = (CMDIncluirDM, CMDAlterarDM);
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    strict private
      class var FInstance : TDataModule1;
    private
      class procedure ReleaseInstance();
    public
      procedure excluirSpeciality(ClientDataSet : TClientDataSet);
      procedure alterarSpeciality(description, flag, admingroup, id : String);
      function inserirSpeciality(id,description,flag,admingroup : String) : Boolean;
      function carregarSpeciality(id : String) : TSpeciality;
      class function GetInstance(): TDataModule1;
      function ListaSpecialityF : TObjectlist<TSpeciality>;
      function pesquisar(especialidade, OS : String) : TObjectlist<TSpeciality>;
      function ListaAdminGroup : TObjectList<TAdmingroup>;
      function pesquisaradm(descricao, OS : String) : TObjectlist<TAdminGroup>;
      function carregarAdmingroup(id : String) : TAdmingroup;
      procedure excluiradmingroup(ClientDataSet : TClientDataSet);
      procedure alteraradmingroup(description,id : String);
      function inseriradmingroup(id,description: String) : boolean;
  end;

var
  Cspeciality : Tspeciality;
  listSpeciality : TObjectlist<TSpeciality>;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

class function TDatamodule1.GetInstance: TDataModule1;
begin
  if not Assigned(FInstance) then
    FInstance := TDataModule1.Create(nil);
  Result := Self.FInstance;
end;

class procedure TDatamodule1.ReleaseInstance;
begin
  if Assigned(Self.FInstance) then
    Self.FInstance.Free;
end;

function Tdatamodule1.carregarSpeciality(id : String) : TSpeciality;
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE specialityid ="'+ id + '";');
  SQLQuery1.Open;
  SQLQuery1.First;
  result := TSpeciality.create;
  result.specialityid := SQLQuery1.FieldByName('specialityid').AsString;
  result.description := SQLQuery1.FieldByName('description').AsString;
  result.flag_funcao_oper := SQLQuery1.FieldByName('flag_funcao_oper').AsString;
  result.codg_admin_group := SQLQuery1.FieldByName('codg_admingroup_fk').AsString;
  result.comando := CMDDetalhes;
end;

function TDataModule1.inserirSpeciality(id,description,flag,admingroup : String) : boolean;
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE specialityid ="'+ id + '";');
  SQLQuery1.Open;
  SQLQuery1.First;
  if not (SQLQuery1.Eof) then
  begin
    showmessage('C�digo ja foi inserido');
    Result := false;
    exit;
  end;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('INSERT INTO speciality (specialityid, description, flag_funcao_oper, codg_admingroup_fk) VALUES ("'+id+'", "'+description+'", "'+flag+'", "'+admingroup+'");');
  try
    SQLQuery1.ExecSQL;
    Result := true;
  except
    showmessage('ERRO');
  end;
end;

procedure TDataModule1.alterarSpeciality(description, flag, admingroup, id : String);
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('UPDATE equipmaintdb.speciality SET description="'+description+'", flag_funcao_oper="'+flag+'", codg_admingroup_fk="'+admingroup+'" WHERE specialityid="'+id+'" LIMIT 1;');
  try
    SQLQuery1.ExecSQL;
  except
    showmessage('ERRO');
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.Connected := true;
end;

procedure TDataModule1.excluirSpeciality(ClientDataSet : TClientDataSet);
var
  buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma��o',mtCustom, [MbYes, MbNo], 0);
  if buttonSelected = MrYes then
  begin
    SQLQuery1.SQL.Clear;
    SQLQuery1.SQL.Add('DELETE FROM equipmaintdb.speciality WHERE specialityid="'+ClientDataSet.Fields[0].AsString+'";');
    SQLQuery1.ExecSQL;
  end;
end;

function TDataModule1.ListaSpecialityF : TObjectlist<TSpeciality>;
var
  objSpeciality : TSpeciality;
begin
  TDatamodule1.getinstance.SQLQuery1.SQL.Clear;
  TDatamodule1.getinstance.SQLQuery1.SQL.Add('SELECT * FROM speciality;');
  TDatamodule1.getinstance.SQLQuery1.Open;
  TDatamodule1.getinstance.SQLQuery1.First;
  result := TObjectlist<TSpeciality>.create;
  while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
  begin
    objSpeciality := TSpeciality.create;
    objSpeciality.specialityid := SQLQuery1.FieldByName('specialityid').AsString;
    objSpeciality.description := SQLQuery1.FieldByName('description').AsString;
    objSpeciality.flag_funcao_oper := SQLQuery1.FieldByName('flag_funcao_oper').AsString;
    objSpeciality.codg_admin_group := SQLQuery1.FieldByName('codg_admingroup_fk').AsString;
    objSpeciality.comando := CMDdetalhes;
    result.add(objSpeciality);
    TDatamodule1.getinstance.SQLQuery1.Next;
  end;
end;


function TDatamodule1.pesquisar(especialidade, OS : String) : TObjectlist<TSpeciality>;
var
  objSpeciality : TSpeciality;
begin
  SQLQuery1.SQL.Clear;
  if (Length(OS)=0) then
  begin
    SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE description LIKE "%'+ especialidade + '%";');
  end
  else
  begin
    SQLQuery1.SQL.Add('SELECT * FROM speciality WHERE description LIKE "%'+ especialidade + '%" AND codg_admingroup_fk = "' + OS + '";');
  end;
  SQLQuery1.Open;
  SQLQuery1.First;
  result := TObjectlist<TSpeciality>.create;
  while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
  begin
    objSpeciality := TSpeciality.create;
    objSpeciality.specialityid := SQLQuery1.FieldByName('specialityid').AsString;
    objSpeciality.description := SQLQuery1.FieldByName('description').AsString;
    objSpeciality.flag_funcao_oper := SQLQuery1.FieldByName('flag_funcao_oper').AsString;
    objSpeciality.codg_admin_group := SQLQuery1.FieldByName('codg_admingroup_fk').AsString;
    objSpeciality.comando := CMDdetalhes;
    result.add(objSpeciality);
    TDatamodule1.getinstance.SQLQuery1.Next;
  end;
end;

function Tdatamodule1.ListaAdminGroup : TObjectList<TAdmingroup>;
var
  objAdmGrp : TAdminGroup;
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM admingroup');
  SQLQuery1.Open;
  SQLQuery1.First;
  result := TObjectlist<TAdminGroup>.create;
  while not (SQLQuery1.Eof) do
  begin
    ObjAdmGrp := Tadmingroup.Create;
    objadmgrp.admingroupid := SQLQuery1.FieldByName('admingroupid').AsString;
    objadmgrp.description := SQLQuery1.FieldByName('description').AsString;
    result.Add(objadmgrp);
    SQLQuery1.Next;
  end;
end;


function TDatamodule1.pesquisaradm(descricao, OS : String) : TObjectlist<TAdminGroup>;
var
  objadmgrp : TAdmingroup;
begin
  SQLQuery1.SQL.Clear;
  if (Length(OS)=0) then
  begin
    SQLQuery1.SQL.Add('SELECT * FROM admingroup WHERE description LIKE "%'+ descricao + '%";');
    end
  else
  begin
    SQLQuery1.SQL.Add('SELECT * FROM admingroup WHERE description LIKE "%'+ descricao + '%" AND admingroupid = "' + OS + '";');
  end;
  SQLQuery1.Open;
  SQLQuery1.First;
  result := TObjectlist<TAdminGroup>.create;
  while not (TDatamodule1.getinstance.SQLQuery1.Eof) do
  begin
    ObjAdmGrp := Tadmingroup.Create;
    objadmgrp.admingroupid := SQLQuery1.FieldByName('admingroupid').AsString;
    objadmgrp.description := SQLQuery1.FieldByName('description').AsString;
    result.Add(objadmgrp);
    SQLQuery1.Next;
  end;
end;

function Tdatamodule1.carregarAdmingroup(id : String) : TAdmingroup;
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM admingroup WHERE admingroupid ="'+ id + '";');
  SQLQuery1.Open;
  SQLQuery1.First;
  result := Tadmingroup.create;
  result.admingroupid := SQLQuery1.FieldByName('admingroupid').AsString;
  result.description := SQLQuery1.FieldByName('description').AsString;
  result.comando := admCMDDetalhes;
end;

procedure TDataModule1.excluiradmingroup(ClientDataSet : TClientDataSet);
var
  buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Confirma��o',mtCustom, [MbYes, MbNo], 0);
  if buttonSelected = MrYes then
  begin
    SQLQuery1.SQL.Clear;
    //Se der merda pode ser que seja aqui
    SQLQuery1.SQL.Add('DELETE FROM equipmaintdb.admingroup WHERE admingroupid="'+ClientDataSet.Fields[0].AsString+'";');
    SQLQuery1.ExecSQL;
  end;
end;

procedure TDataModule1.alteraradmingroup(description,id : String);
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('UPDATE equipmaintdb.admingroup SET description="'+description+'" WHERE admingroupid="'+id+'";');
  try
    SQLQuery1.ExecSQL;
  except
    showmessage('ERRO');
  end;
end;

function TDataModule1.inseriradmingroup(id,description: String) : boolean;
begin
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('SELECT * FROM admingroup WHERE admingroupid ="'+ id + '";');
  SQLQuery1.Open;
  SQLQuery1.First;
  if not (SQLQuery1.Eof) then
  begin
    showmessage('C�digo ja foi inserido');
    Result := false;
    exit;
  end;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('INSERT INTO admingroup (admingroupid, description) VALUES ("'+id+'", "'+description+'");');
  try
    SQLQuery1.ExecSQL;
    Result := true;
  except
    showmessage('ERRO');
  end;
end;


{ TTeste }

initialization
finalization
  TDataModule1.ReleaseInstance();
end.
