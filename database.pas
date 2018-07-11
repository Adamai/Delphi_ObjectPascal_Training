    unit database;

    interface

    uses
      System.SysUtils,Winapi.Messages,Vcl.ExtCtrls, System.Classes, Data.DBXMySQL, Data.FMTBcd,
      Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.Forms, Vcl.StdCtrls,
      Vcl.Dialogs, Vcl.Controls, UNspeciality;

    type
      TComandosDM = (CMDIncluirDM, CMDAlterarDM);

    type
      TDataModule1 = class(TDataModule)
        SQLConnection1: TSQLConnection;
        SQLQuery1: TSQLQuery;
        procedure DataModuleCreate(Sender: TObject);
      strict private
      class var FInstance : TDataModule1;

      private
        class procedure ReleaseInstance();
      public
        //cmd : TComandosDM;
        //procedure carregarCBAdmGroup(Cb : TCombobox);
        procedure excluirSpeciality(ClientDataSet : TClientDataSet);
        procedure alterarSpeciality(description, flag, admingroup, id : String);
        function inserirSpeciality(id,description,flag,admingroup : String) : Boolean;
        function carregarSpeciality(id : String) : TSpeciality;
        class function GetInstance(): TDataModule1;
      end;

    var
      //: TDataModule1;
      Cspeciality : Tspeciality;


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

    initialization
    finalization
    TDataModule1.ReleaseInstance();
    end.