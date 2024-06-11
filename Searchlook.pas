unit Searchlook;

interface

uses Styles,LookFashion, Users, TmyList;

 procedure SearchLook(var ListCloth: TmyList<TCloth>; var ListStyle: Pstyle;
  var user: tuser; var mas: Tlistlook);
implementation


uses Cloth;





function ValidLookuser(var elem: TCloth; var user: tuser): Boolean;
var
  fl: Boolean;
  fl1: Boolean;
begin
  fl := HasSize(elem, user.Size);
  fl1 := Hasgender(elem, user.gender);
  if fl and fl1 then
  begin
    Result := true;
  end
  else
    Result := false;

end;

procedure SearchLook(var ListCloth: TmyList<TCloth>; var ListStyle: Pstyle;
  var user: tuser; var mas: Tlistlook);

var
  Current: Pstyle;
  Cloth: TCloth;
  Temp: look;
  i: integer;
  fl1: Boolean;
  fl2: Boolean;
  ColorCheckTable: TDictionary<string, Boolean>;
  ModelCheckTable: TDictionary<string, Boolean>;
  UserCheckTable: TDictionary<string, Boolean>;

  function CheckModelChached(var Cloth: TCloth; var model: TModel): Boolean;
  var
    Key: string;
  begin
    Key := ClothTostr(Cloth.name) + TModelToStr(model);
    if not ModelCheckTable.TryGetValue(Key, Result) then
    begin
      Result := HasModel(Cloth, model);
      ModelCheckTable.Add(Key, Result);
    end;

  end;

  function ChekColorChached(var Cloth: TCloth; var color: TColor): Boolean;
  var
    Key: string;
  begin
    Key := ClothTostr(Cloth.name) + ColorToStr(color);
    if not ColorCheckTable.TryGetValue(Key, Result) then
    begin
      Result := HasColor(Cloth, color);
      ColorCheckTable.Add(Key, Result);
    end;

  end;

  function ChekUserChached(var Cloth: TCloth; var user: tuser): Boolean;
  var
    Key: string;
  begin
    Key := ClothTostr(Cloth.name) + user.name;
    if not UserCheckTable.TryGetValue(Key, Result) then
    begin
      Result := ValidLookuser(Cloth, user);
      UserCheckTable.Add(Key, Result);

    end;

  end;

begin
  i := 1;
  ColorCheckTable := TDictionary<string, Boolean>.Create;
  ModelCheckTable := TDictionary<string, Boolean>.Create;
  UserCheckTable := TDictionary<string, Boolean>.Create;

  Current := ListStyle.next;
  while Current <> nil do
  begin
    setlength(mas, i);
    Temp.cloth1 := BinarySearch(ListCloth, Current.elem.fashion1);
    Temp.Cloth2 := BinarySearch(ListCloth, Current.elem.fashion2);

    fl1 := ChekColorChached(Temp.cloth1, Current.elem.color1) and
      CheckModelChached(Temp.cloth1, Current.elem.model1) and
      ChekUserChached(Temp.cloth1, user);
    fl2 := ChekColorChached(Temp.Cloth2, Current.elem.color2) and
      CheckModelChached(Temp.Cloth2, Current.elem.model2) and
      ChekUserChached(Temp.Cloth2, user);

    if fl1 or fl2 then
    begin
      Inc(i);
      setlength(mas, i);
      if fl1 then
      begin
        mas[i - 1].cloth1 := Temp.cloth1;
      end
      else
      begin
        mas[i - 1].cloth1 := Temp.Cloth2;
      end;
    end;

    Current := Current.next;

  end;

end;

end.
