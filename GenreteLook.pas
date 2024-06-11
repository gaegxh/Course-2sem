unit GenreteLook;

interface

uses Cloth, Users,System.SysUtils, LookFashion, TmyList, Styles;

procedure SearchLook(var ListCloth: TmyList<TCloth>; var ListStyle: Pstyle;
  var user: tuser; var mas: Tlistlook);
implementation
uses Generics.Collections;


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

procedure SearchLook(var ListCloth: TmyList<TCloth>; var ListStyle: PStyle;
  var user: TUser; var mas: TListLook);
var
  Current: PStyle;
  Temp: look;
  i: integer;
  fl1, fl2: Boolean;
  ColorCheckTable: TDictionary<string, Boolean>;
  ModelCheckTable: TDictionary<string, Boolean>;
  UserCheckTable: TDictionary<string, Boolean>;

  function CheckModelCached(var Cloth: TCloth; var model: TModel): Boolean;
  var
    Key: string;
  begin
    Key := ClothToStr(Cloth.name) + TModelToStr(model);
    if not ModelCheckTable.TryGetValue(Key, Result) then
    begin
      Result := HasModel(Cloth, model);
      ModelCheckTable.Add(Key, Result);
    end;
  end;

  function CheckColorCached(var Cloth: TCloth; var color: TColor): Boolean;
  var
    Key: string;
  begin
    Key := ClothToStr(Cloth.name) + ColorToStr(color);
    if not ColorCheckTable.TryGetValue(Key, Result) then
    begin
      Result := HasColor(Cloth, color);
      ColorCheckTable.Add(Key, Result);
    end;
  end;

  function CheckUserCached(var Cloth: TCloth; var user: TUser): Boolean;
  var
    Key: string;
  begin
    Key := ClothToStr(Cloth.name) + user.name;
    if not UserCheckTable.TryGetValue(Key, Result) then
    begin
      Result := ValidLookUser(Cloth, user);
      UserCheckTable.Add(Key, Result);
    end;
  end;

begin
  i := 0;
  ColorCheckTable := TDictionary<string, Boolean>.Create;
  ModelCheckTable := TDictionary<string, Boolean>.Create;
  UserCheckTable := TDictionary<string, Boolean>.Create;

  try
    Current := ListStyle.next;
    while Current <> nil do
    begin
      Temp.cloth1 := BinarySearch(ListCloth, Current.elem.fashion1);
      Temp.Cloth2 := BinarySearch(ListCloth, Current.elem.fashion2);

      fl1 := CheckColorCached(Temp.cloth1, Current.elem.color1) and
        CheckModelCached(Temp.cloth1, Current.elem.model1) and
        CheckUserCached(Temp.cloth1, user);
      fl2 := CheckColorCached(Temp.Cloth2, Current.elem.color2) and
        CheckModelCached(Temp.Cloth2, Current.elem.model2) and
        CheckUserCached(Temp.Cloth2, user);

      if fl1 or fl2 then
      begin
        Inc(i);
        SetLength(mas, i);
        mas[i - 1].cloth1 := Temp.cloth1;
        mas[i - 1].Cloth2 := Temp.Cloth2; // Correctly set cloth2
      end;

      Current := Current.next;
    end;
  finally
    ColorCheckTable.Free;
    ModelCheckTable.Free;
    UserCheckTable.Free;
  end;
end;


end.
