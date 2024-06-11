unit Cloth;

interface

uses TmyList, SysUtils, Generics.Collections;

type
  TCheckTable = TDictionary<string, Boolean>;

  TClothing = (
    // Верхняя одежда
    TShirt, // Футболка
    Shirt, // Рубашка
    TankTop, // Майка
    PoloShirt, // Поло
    Sweatshirt, // Свитшот
    Hoodie, // Худи
    Jacket, // Куртка
    Blazer, // Блейзер
    Vest, // Жилет
    Cardigan, // Кардиган
    Turtleneck, // Водолазка
    Coat, // Пальто
    Parka, // Парка
    Windbreaker, // Ветровка
    PeaCoat, // Пилотка
    Poncho, // Пончо
    Cape, // Плащ
    Tuxedo, // Смокинг
    Suit, // Костюм
    Overall, // Комбинезон

    // Нижняя одежда
    Jeans, // Джинсы
    Pants, // Брюки
    Joggers, // Джоггеры
    Shorts, // Шорты
    Skirt, // Юбка
    Leggings, // Леггинсы
    Capris, // Капри
    Culottes, // Кюлоты
    Jumpsuit, // Комбинезон
    Tights, // Тайтсы
    CargoPants, // Карго-брюки
    Chinos, // Чиносы
    TrackPants, // Спортивные брюки
    Bermuda, // Бермуды
    FlarePants, // Брюки-клеш
    Palazzo, // Палантин
    Gauchos, // Гаучос
    Sarong, // Саронг
    Salwar, // Сальвары
    HaremPants // Брюки-харем
    );

  TColor = (Red, // Красный
    Blue, // Синий
    Green, // Зеленый
    Yellow, // Желтый
    Orange, // Оранжевый
    Purple, // Фиолетовый
    Pink, // Розовый
    Brown, // Коричневый
    Black, // Черный
    White, // Белый
    Gray, // Серый
    Cyan, // Голубой
    Magenta, // Пурпурный
    Turqun, // Коричнево-красный
    Indigo, // Индиго
    Teal, // Сине-зеленый
    Goloise, // Бирюзовый
    Lavender, // Лавандовый
    Marood, // Золотой
    Silver,
    NavyBlue,
    Grey
    );

  Tsize = (None, XXS, XS, S, M, L, XL, XXL);
  Tgender = (gNone, Man, Women);

type
  TModel = (oversize, // большой размер
    slimfit, // подходит для стройных
    regular, // стандартный
    athletic, // атлетический
    tall, // высокий
    petite, // маленький рост
    plus_size, // плюс размер
    curvy, // пышная фигура
    hourglass, // песочные часы
    pear // груша
    );

  TSizeMask = byte;
  TmodelMask = byte;
  TgenderMask = byte;
  TcolorMask = word;

  TCloth = record
    id: integer;
    model: TmodelMask;
    name: TClothing;
    sizeMask: TSizeMask;
    color: TcolorMask; // Битовая маска для размеров
    gender: TgenderMask;
  end;

  TSearch = record
    name: TClothing; // Имя одежды в массиве ListCloth;
    index: integer; // Индекс d массиве ListCloth;
  end;

var
  ListSearch: TmyList<TSearch>;
  ListCloth: TmyList<TCloth>;

procedure InitializeArrays(var ListSearch: TmyList<TSearch>;
  var ListCloth: TmyList<TCloth>);
procedure InsertionSort(var ListSearch: TmyList<TCloth>);
function StrToGender(gender: string): Tgender;

function ClothTostr(name: TClothing): string;
function TModelToStr(model: TModel): string;
function StrToCloth(name: string): TClothing;
function StrToSize(const SizeStr: string): Tsize;
function ColorToStr(color: TColor): string;
function StrToModel(name: string): TModel;
function StrToColor(name: string): TColor;
procedure SafeToCloth(var ListCloth: TmyList<TCloth>);
procedure LoadFromCloth(var ListCloth: TmyList<TCloth>);
procedure InitSearchList(var SearchList: TmyList<TSearch>;
  var ClothList: TmyList<TCloth>);
function HasSize(Cloth: TCloth; Size: Tsize): Boolean;
function Hasgender(Cloth: TCloth; gender: Tgender): Boolean;
function HasModel(Cloth: TCloth; model: TModel): Boolean;
function SizeToStr(Size: Tsize): string;
function BinarySearch(var A: TmyList<TCloth>; const S: TClothing): TCloth;
function GenderToStr(gender: TGender): string;
function HasColor(Cloth: TCloth; color: TColor): Boolean;




implementation

uses Styles, LookFashion,users;



function SizeToMask(Size: Tsize): TSizeMask;
begin
  Result := 1 shl Ord(Size);
end;

procedure AddSize(var Cloth: TCloth; Size: Tsize);
begin
  Cloth.sizeMask := Cloth.sizeMask or SizeToMask(Size);
end;

procedure RemoveSize(var Cloth: TCloth; Size: Tsize);
begin
  Cloth.sizeMask := Cloth.sizeMask and not SizeToMask(Size);
end;

function HasSize(Cloth: TCloth; Size: Tsize): Boolean;
begin
  Result := (Cloth.sizeMask and SizeToMask(Size)) <> 0;
end;

function ModelToMask(model: TModel): TmodelMask;
begin
  Result := 1 shl Ord(model);
end;

procedure RemoveModel(var Cloth: TCloth; model: TModel);
begin
  Cloth.model := Cloth.model and not ModelToMask(model);
end;

function HasModel(Cloth: TCloth; model: TModel): Boolean;
begin
  Result := (Cloth.model and ModelToMask(model)) <> 0;
end;

procedure AddModel(var Cloth: TCloth; model: TModel);
begin
  Cloth.model := Cloth.model or ModelToMask(model);
end;

function GenderToMask(gender: Tgender): TgenderMask;
begin
  Result := 1 shl Ord(gender);
end;

procedure Removegender(var Cloth: TCloth; gender: Tgender);
begin
  Cloth.gender := Cloth.gender and not GenderToMask(gender);
end;

function Hasgender(Cloth: TCloth; gender: Tgender): Boolean;
begin
  Result := (Cloth.gender and GenderToMask(gender)) <> 0;
end;

procedure Addgender(var Cloth: TCloth; gender: Tgender);
begin
  Cloth.gender := Cloth.gender or GenderToMask(gender);
end;

function ColorToMask(color: TColor): TcolorMask;
begin
  Result := 1 shl Ord(color);
end;

procedure AddColor(var Cloth: TCloth; color: TColor);
begin
  Cloth.color := Cloth.color or ColorToMask(color);
end;

procedure RemoveColor(var Cloth: TCloth; color: TColor);
begin
  Cloth.color := Cloth.color and not ColorToMask(color);
end;

function HasColor(Cloth: TCloth; color: TColor): Boolean;
begin
  Result := (Cloth.color and ColorToMask(color)) <> 0;
end;

function ClothTostr(name: TClothing): string;
begin
  case Name of
    TShirt:
      Result := 'T-Shirt';
    Shirt:
      Result := 'Shirt';
    TankTop:
      Result := 'Tank Top';
    PoloShirt:
      Result := 'Polo Shirt';
    Sweatshirt:
      Result := 'Sweatshirt';
    Hoodie:
      Result := 'Hoodie';
    Jacket:
      Result := 'Jacket';
    Blazer:
      Result := 'Blazer';
    Vest:
      Result := 'Vest';
    Cardigan:
      Result := 'Cardigan';
    Turtleneck:
      Result := 'Turtleneck';
    Coat:
      Result := 'Coat';
    Parka:
      Result := 'Parka';
    Windbreaker:
      Result := 'Windbreaker';
    PeaCoat:
      Result := 'Pea Coat';
    Poncho:
      Result := 'Poncho';
    Cape:
      Result := 'Cape';
    Tuxedo:
      Result := 'Tuxedo';
    Suit:
      Result := 'Suit';
    Overall:
      Result := 'Overall';
    Jeans:
      Result := 'Jeans';
    Pants:
      Result := 'Pants';
    Joggers:
      Result := 'Joggers';
    Shorts:
      Result := 'Shorts';
    Skirt:
      Result := 'Skirt';
    Leggings:
      Result := 'Leggings';
    Capris:
      Result := 'Capris';
    Culottes:
      Result := 'Culottes';
    Jumpsuit:
      Result := 'Jumpsuit';
    Tights:
      Result := 'Tights';
    CargoPants:
      Result := 'Cargo Pants';
    Chinos:
      Result := 'Chinos';
    TrackPants:
      Result := 'Track Pants';
    Bermuda:
      Result := 'Bermuda';
    FlarePants:
      Result := 'Flare Pants';
    Palazzo:
      Result := 'Palazzo';
    Gauchos:
      Result := 'Gauchos';
    Sarong:
      Result := 'Sarong';
    Salwar:
      Result := 'Salwar';
    HaremPants:
      Result := 'Harem Pants';

  end;
end;

function TModelToStr(model: TModel): string;
begin
  case model of
    oversize:
      Result := 'oversize';
    slimfit:
      Result := 'slim fit';
    regular:
      Result := 'regular';
    athletic:
      Result := 'athletic';
    tall:
      Result := 'tall';
    petite:
      Result := 'petite';
    plus_size:
      Result := 'plus size';
    curvy:
      Result := 'curvy';
    hourglass:
      Result := 'hourglass';
    pear:
      Result := 'pear';

  end;
end;

function SizeToStr(Size: Tsize): string;
begin
  case Size of
    XXS:
      Result := 'XXS';
    XS:
      Result := 'XS';
    S:
      Result := 'S';
    M:
      Result := 'M';
    L:
      Result := 'L';
    XL:
      Result := 'XL';
    XXL:
      Result := 'XXL';
  else
    Result := 'Unknown Size';
  end;
end;

function StrToGender(gender: string): Tgender;
begin
  if gender = 'Man' then
    Result := Man
  else if gender = 'Women' then
    Result := Women
  else
    raise Exception.Create('Invalid gender string: ' + gender);
end;


function GenderToStr(gender: TGender): string;
begin
  case gender of
    Man:
      Result := 'Man';
    Women:
      Result := 'Women';
    else
      raise Exception.Create('Invalid gender value');
  end;
end;
function StrToSize(const SizeStr: string): Tsize;
begin
  if SizeStr = 'XXS' then
    Result := XXS
  else if SizeStr = 'XS' then
    Result := XS
  else if SizeStr = 'S' then
    Result := S
  else if SizeStr = 'M' then
    Result := M
  else if SizeStr = 'L' then
    Result := L
  else if SizeStr = 'XL' then
    Result := XL
  else if SizeStr = 'XXL' then
    Result := XXL
  else
    raise Exception.Create('Invalid size string: ' + SizeStr);
end;

function StrToModel(name: string): TModel;
begin
  if Name = 'oversize' then
    Result := oversize
  else if Name = 'slim fit' then
    Result := slimfit
  else if Name = 'regular' then
    Result := regular
  else if Name = 'athletic' then
    Result := athletic
  else if Name = 'tall' then
    Result := tall
  else if Name = 'petite' then
    Result := petite
  else if Name = 'plus size' then
    Result := plus_size
  else if Name = 'curvy' then
    Result := curvy
  else if Name = 'hourglass' then
    Result := hourglass
  else if Name = 'pear' then
    Result := pear
end;

procedure InitializeArrays(var ListSearch: TmyList<TSearch>;
  var ListCloth: TmyList<TCloth>);
var
  Cloth: TCloth;
  Search: TSearch;
  i: integer;
begin
  ListCloth := TmyList<TCloth>.Create;
  ListSearch := TmyList<TSearch>.Create;
  Randomize;

  // Создаем список доступных моделей одежды
  for i := Ord(Low(TClothing)) to Ord(High(TClothing)) do
  begin

    Cloth.id := ((((i + 3) * 1000) mod 13) * 4) div 17;
    Cloth.name := TClothing(i);

    Cloth.sizeMask := $FF;
    Cloth.model := $FF;
    Cloth.gender := $FF;
    Cloth.color := $FF;

    Search.name := Cloth.name;
    Search.index := i;

    ListSearch.Add(Search);
    ListCloth.Add(Cloth);
  end;
end;

procedure InsertionSort(var ListSearch: TmyList<TCloth>);

var
  i, j: integer;
  x: TCloth;
  y: integer;
  n: integer;
begin
  n := ListSearch.LengthList;
  for i := 1 to n - 1 do
  begin
    writeln('a');

    begin

      x := ListSearch.GetItemsCounter(i);
      j := i - 1;

      while ((j >= 0) and (ListSearch.GetItemsCounter(j).name > x.name)) do
      begin

        ListSearch.Assigment(j + 1, j);
        j := j - 1;

      end;
      ListSearch.Assigment(j + 1, x);

    end;

  end;

end;


function BinarySearch(var A: TmyList<TCloth>; const S: TClothing): TCloth;
var
  L, R, M: integer;
begin

  L := 0;
  R := A.LengthList - 1;

  while L <= R do
  begin
    M := (L + R) div 2;

    if A.GetItemsCounter(M).name = S then
    begin
      Result := A.GetItemsCounter(M);
      Exit;
    end
    else if A.GetItemsCounter(M).name < S then
      L := M + 1
    else
      R := M - 1;
  end;
end;

function StrToCloth(name: string): TClothing;
begin
  if Name = 'T-Shirt' then
    Result := TShirt
  else if Name = 'Shirt' then
    Result := Shirt
  else if Name = 'Tank Top' then
    Result := TankTop
  else if Name = 'Polo Shirt' then
    Result := PoloShirt
  else if Name = 'Sweatshirt' then
    Result := Sweatshirt
  else if Name = 'Hoodie' then
    Result := Hoodie
  else if Name = 'Jacket' then
    Result := Jacket
  else if Name = 'Blazer' then
    Result := Blazer
  else if Name = 'Vest' then
    Result := Vest
  else if Name = 'Cardigan' then
    Result := Cardigan
  else if Name = 'Turtleneck' then
    Result := Turtleneck
  else if Name = 'Coat' then
    Result := Coat
  else if Name = 'Parka' then
    Result := Parka
  else if Name = 'Windbreaker' then
    Result := Windbreaker
  else if Name = 'Pea Coat' then
    Result := PeaCoat
  else if Name = 'Poncho' then
    Result := Poncho
  else if Name = 'Cape' then
    Result := Cape
  else if Name = 'Tuxedo' then
    Result := Tuxedo
  else if Name = 'Suit' then
    Result := Suit
  else if Name = 'Overall' then
    Result := Overall
  else if Name = 'Jeans' then
    Result := Jeans
  else if Name = 'Pants' then
    Result := Pants
  else if Name = 'Joggers' then
    Result := Joggers
  else if Name = 'Shorts' then
    Result := Shorts
  else if Name = 'Skirt' then
    Result := Skirt
  else if Name = 'Leggings' then
    Result := Leggings
  else if Name = 'Capris' then
    Result := Capris
  else if Name = 'Culottes' then
    Result := Culottes
  else if Name = 'Jumpsuit' then
    Result := Jumpsuit
  else if Name = 'Tights' then
    Result := Tights
  else if Name = 'Cargo Pants' then
    Result := CargoPants
  else if Name = 'Chinos' then
    Result := Chinos
  else if Name = 'Track Pants' then
    Result := TrackPants
  else if Name = 'Bermuda' then
    Result := Bermuda
  else if Name = 'Flare Pants' then
    Result := FlarePants
  else if Name = 'Palazzo' then
    Result := Palazzo
  else if Name = 'Gauchos' then
    Result := Gauchos
  else if Name = 'Sarong' then
    Result := Sarong
  else if Name = 'Salwar' then
    Result := Salwar
  else if Name = 'Harem Pants' then
    Result := HaremPants
end;

function ColorToStr(color: TColor): string;
begin
  case color of
    Red:
      Result := 'Red';
    Blue:
      Result := 'Blue';
    Green:
      Result := 'Green';
    Yellow:
      Result := 'Yellow';
    Orange:
      Result := 'Orange';
    Purple:
      Result := 'Purple';
    Pink:
      Result := 'Pink';
    Brown:
      Result := 'Brown';
    Black:
      Result := 'Black';
    White:
      Result := 'White';
    Gray:
      Result := 'Gray';
    Cyan:
      Result := 'Cyan';
    Magenta:
      Result := 'Magenta';
    Turqun:
      Result := 'Turqun';
    Indigo:
      Result := 'Indigo';
    Teal:
      Result := 'Teal';
    Goloise:
      Result := 'Goloise';
    Lavender:
      Result := 'Lavender';
    Marood:
      Result := 'Marood';
    Silver:
      Result := 'Silver';
  end;
end;

function StrToColor(name: string): TColor;
begin
  if Name = 'Red' then
    Result := Red
  else if Name = 'Blue' then
    Result := Blue
  else if Name = 'Green' then
    Result := Green
  else if Name = 'Yellow' then
    Result := Yellow
  else if Name = 'Orange' then
    Result := Orange
  else if Name = 'Purple' then
    Result := Purple
  else if Name = 'Pink' then
    Result := Pink
  else if Name = 'Brown' then
    Result := Brown
  else if Name = 'Black' then
    Result := Black
  else if Name = 'White' then
    Result := White
  else if Name = 'Gray' then
    Result := Gray
  else if Name = 'Cyan' then
    Result := Cyan
  else if Name = 'Magenta' then
    Result := Magenta
  else if Name = 'Turqun' then
    Result := Turqun
  else if Name = 'Indigo' then
    Result := Indigo
  else if Name = 'Teal' then
    Result := Teal
  else if Name = 'Goloise' then
    Result := Goloise
  else if Name = 'Lavender' then
    Result := Lavender
  else if Name = 'Marood' then
    Result := Marood
  else if Name = 'Silver' then
    Result := Silver
end;

procedure SafeToCloth(var ListCloth: TmyList<TCloth>);
var
  ClothFile: File of TCloth;
  Filename: string;
  i: integer;
  ClothItem: TCloth;
begin
  Filename := 'D:\Курсовая\Win32\Debug\Cloth.dat';
  AssignFile(ClothFile, Filename);
  Rewrite(ClothFile);
  try
    // Проход по всем элементам списка
    for i := 0 to ListCloth.LengthList - 1 do
    begin
      // Получение элемента списка
      ClothItem := ListCloth.GetItemsCounter(i);
      // Запись элемента в файл
      Write(ClothFile, ClothItem);
    end;
  finally
    // Закрытие файла
    CloseFile(ClothFile);
  end;
end;

procedure LoadFromCloth(var ListCloth: TmyList<TCloth>);
var
  ClothFile: File of TCloth;
  Filename: string;
  ClothItem: TCloth;
begin
  Filename := 'D:\Курсовая\Win32\Debug\Cloth.dat';
  AssignFile(ClothFile, Filename);
  Reset(ClothFile);
  try
    // Очищаем список перед загрузкой данны

    // Чтение данных из файла и добавление их в список
    while not Eof(ClothFile) do
    begin
      Read(ClothFile, ClothItem);
      ListCloth.Add(ClothItem);
    end;
  finally
    CloseFile(ClothFile);
  end;
end;

procedure InitSearchList(var SearchList: TmyList<TSearch>;
  var ClothList: TmyList<TCloth>);
var
  i: integer;
  Search: TSearch;

begin
  for i := 0 to ClothList.LengthList - 1 do
  begin
    Search.name := ClothList.GetItemsCounter(i).name;
    Search.index := i;
    SearchList.Add(Search);
  end;

end;



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
