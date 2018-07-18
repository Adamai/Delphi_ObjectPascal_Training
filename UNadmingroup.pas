unit UNadmingroup;

interface

uses
  system.Generics.collections;

type
  TComandos = (admCMDIncluir, admCMDAlterar, admCMDExcluir, admCMDDetalhes);
  TAdminGroup = class(TObject)
    private
      Fadmingroupid: string;
      Fdescription: string;
      Fcomando : Tcomandos;
    public
      property admingroupid : string read Fadmingroupid write Fadmingroupid;
      property description : string read Fdescription write Fdescription;
      property comando : TComandos read Fcomando write Fcomando;
  end;

implementation



end.
