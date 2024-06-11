unit Cloth;

interface
  uses TmyList,SysUtils;
type

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

    Tsize=(XXS,XS,S,M,L,XL,XXL);
    Tgender=(Man,Women);

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

   TCloses = record
    id: integer;
    model: Tmodel;
    name: string[12];
    size: string[5];
    waist: integer;
    shoulders: integer;
    hips: integer;
    color: Tcolor;
    gender:Tgender;
  end;

  TSearch=record
    name:string[15];
    index:integer;
  end;

  var
  ListSearch:TmyList<TCloses>;
  ListCloses:TmyList<TCloses>;


implementation


procedure Initializ(var List:TmyList<TCloses>);
var
tempClose:TCloses;
begin


end;








end.
