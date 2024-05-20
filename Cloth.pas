unit Cloth;

interface

uses TmyList, SysUtils;

type

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
    Silver // Серебряный
    );

  Tsize = (XXS, XS, S, M, L, XL, XXL);
  Tgender = (Man, Women);


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

  TCloth = record
    id: integer;
    model: TModel;
    name: TClothing;
    size: Tsize;
    waist: integer;
    shoulders: integer;
    hips: integer;
    color: TColor;
    gender: Tgender;

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
procedure InsertionSort(var ListSearch: TmyList<TSearch>);
procedure HeapSort(var ListSearch: TmyList<TSearch>); overload;
procedure BlockSearch(var A: TmyList<TSearch>; const S: TClothing);
function ClothTostr(name: TClothing): string;
function TModelToStr(model: TModel): string;
function StrToCloth(Name: string): Tclothing;
function ColorToStr(Color: TColor): string;
function StrToModel(Name: string): TModel;
function StrToColor(Name: string): TColor;
procedure SafeToCloth(var ListCloth: TMyList<TCloth>);
procedure LoadFromCloth(var ListCloth: TMyList<TCloth>);


implementation

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



function StrToModel(Name: string): TModel;
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
  i: integer;
  Cloth: TCloth;
  Search: TSearch;
begin
  // Инициализация массива ListCloth
  ListCloth := TmyList<TCloth>.Create;
  ListSearch := TmyList<TSearch>.Create;
  randomize;
  for i := 0 to 1000000 - 1 do
  begin
    Cloth.id := i;
    Cloth.model := TModel(Random(10)); // Генерация случайной модели
    Cloth.name := TClothing(Random(36)); // Генерация случайного типа одежды
    Cloth.size := Tsize(7);
    // Здесь можно также использовать случайную генерацию
    Cloth.waist := Random(50) + 50; // Генерация случайной талии от 50 до 100
    Cloth.shoulders := Random(50) + 50; // Генерация случайных плеч от 50 до 100
    Cloth.hips := Random(50) + 50; // Генерация случайных бедер от 50 до 100
    Cloth.color := TColor(Random(20)); // Генерация случайного цвета
    Cloth.gender := Tgender(Random(2)); // Генерация случайного пола
    Search.name := Cloth.name;
    Search.index := i;
    ListSearch.Add(Search);
    ListCloth.Add(Cloth);
  end;

end;

procedure InsertionSort(var ListSearch: TmyList<TSearch>);

var
  i, j: integer;
  x: TSearch;
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

procedure Heapify(var ListSearch: TmyList<TSearch>; n, i: integer); overload;
var
  Largest, L, R: integer;
begin
  Largest := i;
  L := 2 * i + 1;
  R := 2 * i + 2;

  if (L < n) and (ListSearch.GetItemsCounter(L).name >
    ListSearch.GetItemsCounter(Largest).name) then
    Largest := L;

  if (R < n) and (ListSearch.GetItemsCounter(R).name >
    ListSearch.GetItemsCounter(Largest).name) then
    Largest := R;

  if Largest <> i then
  begin
    ListSearch.Swap(Largest, i);
    Heapify(ListSearch, n, Largest);
  end;
end;

procedure HeapSort(var ListSearch: TmyList<TSearch>);
var
  n, i: integer;
begin
  n := ListSearch.LengthList;

  for i := n div 2 - 1 downto 0 do
    Heapify(ListSearch, n, i);

  for i := n - 1 downto 0 do
  begin
    ListSearch.Swap(0, i);
    Heapify(ListSearch, i, 0);
  end;
end;

procedure BlockSearch(var A: TmyList<TSearch>; const S: TClothing);
var
  f: boolean;
  right, left, lenblock, M: integer;
begin
  writeln('БЛОЧНЫЙ ПОИСК СТРОКИ');
  M := A.LengthList;

  f := false;
  left := 1;
  lenblock := trunc(sqrt(M));
  right := lenblock;

  while (not f) and (lenblock > 1) do
  begin

    if S > A.GetItemsCounter(right).name then
    begin
      while (S > A.GetItemsCounter(right).name) and (right < M) do
      begin

        right := right + lenblock;
        left := left + lenblock;

        if right > M then
        begin
          writeln(ClothTostr(A.GetItemsCounter(right).name));
          left := left + 1;
          right := M;
          lenblock := right - left + 1;

        end;
      end;

    end;

    if (S < A.GetItemsCounter(right).name) then
    begin
      // writeln(CloseTostr(A.GetItemsCounter(right).name));
      lenblock := trunc(sqrt(lenblock));
      right := left + lenblock - 1;
    end;

    if A.GetItemsCounter(right).name = S then
    begin
      f := true;
      writeln(ClothTostr(A.GetItemsCounter(right).name))

    end;

  end;
  if lenblock = 1 then
  begin
    var
      count: integer;
    while (not f) and (left <= right) do
    begin
      if A.GetItemsCounter(left).name = S then
      begin
        f := true;
        writeln(ClothTostr(A.GetItemsCounter(left).name))
      end
      else
      begin
        left := left + 1;
      end;
    end;

  end;
  if f then
  begin
    writeln('Найдена такая строка');

  end
  else
    writeln('Такой строки нет');

  writeln;
end;

function StrToCloth(Name: string): Tclothing;
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

function ColorToStr(Color: TColor): string;
begin
  case Color of
    Red: Result := 'Red';
    Blue: Result := 'Blue';
    Green: Result := 'Green';
    Yellow: Result := 'Yellow';
    Orange: Result := 'Orange';
    Purple: Result := 'Purple';
    Pink: Result := 'Pink';
    Brown: Result := 'Brown';
    Black: Result := 'Black';
    White: Result := 'White';
    Gray: Result := 'Gray';
    Cyan: Result := 'Cyan';
    Magenta: Result := 'Magenta';
    Turqun: Result := 'Turqun';
    Indigo: Result := 'Indigo';
    Teal: Result := 'Teal';
    Goloise: Result := 'Goloise';
    Lavender: Result := 'Lavender';
    Marood: Result := 'Marood';
    Silver: Result := 'Silver';
  end;
end;

function StrToColor(Name: string): TColor;
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



procedure SafeToCloth(var ListCloth: TMyList<TCloth>);
var
  ClothFile: File of TCloth;
  Filename: string;
  i: Integer;
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


procedure LoadFromCloth(var ListCloth: TMyList<TCloth>);
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




end.
