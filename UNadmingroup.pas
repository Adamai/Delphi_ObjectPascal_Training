unit UNadmingroup;

interface

uses
  system.Generics.collections;

type
  TAdminGroup = class(TObject)
    private
    Fadmingroupid: string;
    Fdescription: string;
    public
    property admingroupid : string read Fadmingroupid write Fadmingroupid;
    property description : string read Fdescription write Fdescription;
    //function teste : TObjectlist<TAdminGroup>;
  end;

implementation

var
  list : TObjectlist<TAdminGroup>;

{ TAdminGroup }

function TAdminGroup.teste: TObjectlist<TAdminGroup>;
var
  lAdminGroup : TAdminGroup;
begin
  {result := TObjectlist<TAdminGroup>.create;
  lAdminGroup := TAdminGroup.Create;
  lAdminGroup.admingroupid := '01';
  lAdminGroup.description := 'teste 01';
  result.Add(lAdminGroup);


  lAdminGroup := TAdminGroup.Create;
  lAdminGroup.admingroupid := '02';
  lAdminGroup.description := 'teste 02';
  result.Add(lAdminGroup);}
end;

end.
