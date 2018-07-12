unit UNspeciality;

interface

type
TComandos = (CMDIncluir, CMDAlterar, CMDExcluir, CMDDetalhes);
TSpeciality = class(TObject)
  private
    Fcodg_admin_group: String;
    Fflag_funcao_oper: String;
    Fdescription: String;
    Fspecialityid: String;
    FComando : TComandos;
    public
  property specialityid : String read Fspecialityid write Fspecialityid;
  property description : String read Fdescription write Fdescription;
  property flag_funcao_oper : String read Fflag_funcao_oper write Fflag_funcao_oper;
  property codg_admin_group : String read Fcodg_admin_group write Fcodg_admin_group;
  property comando : TComandos read FComando write FComando;
end;

implementation





end.
