unit LookFashion;

interface

uses Cloth;

type
  Look = record
    cloth1: Tcloth;
    Cloth2: Tcloth;
  end;

  Tlistlook = array of Look;

procedure DestroyListLook(var ListLook: Tlistlook);

implementation

procedure DestroyListLook(var ListLook: Tlistlook);
var
  i: Integer;
begin

  SetLength(ListLook, 0);
end;

end.
