unit Styles;

interface

uses Cloth;

type

  TStyle = record
     Name: String[20];

    fashion1: TClothing; //Верхняя одежда
    fashion2: TClothing; // Нижняя одежда
    model1: TModel;//Модель для верхней одежды
    model2:Tmodel; //Модель для нижней одежды
    color1: TColor; //цвет для верхней одежды
    color2: TColor; // цвет нижней одежды

  end;

  PStyle = ^TStyl;

  TStyl = record
    Elem: TStyle;
    next: PStyle;
  end;

procedure CreateNewStyle(var Style: PStyle; var data:Tstyle );
procedure createList(var head: PStyle);
procedure LoadStyles(var List: PStyle; filename: String);
procedure DestroyStyles(var List: PStyle);


implementation
uses System.SysUtils;

procedure DestroyStyles(var List: PStyle);
var
  Current, Temp: PStyle;
begin
  Current := List;
  while Current <> nil do
  begin
    Temp := Current;
    Current := Current^.next;
    Dispose(Temp);
  end;
  List := nil;
end;

procedure createList(var head: PStyle);
begin
  new(head);
  head.next := nil;
end;

procedure CreateNewStyle(var Style: PStyle; var data:Tstyle );
var
  Current: PStyle;


begin
  Current := Style;
  while Current.next <> nil do
  begin
    Current := Current.next;
  end;
  new(Current.next);
  current:=Current.next;
  current.elem:=data;
  current.next:=nil;




  // Добавлю в самой форме;

end;

procedure SafeStyles(var List: PStyle; filename: String);
var
  F: File of TStyle;
  Current: PStyle;
begin

  if List = nil then
  begin
    Writeln('Список пуст, нечего сохранять.');
    Exit;
  end;


  AssignFile(F, filename);
  Rewrite(F);

  try
    Current := List;
    while Current <> nil do
    begin

      Write(F, Current^.Elem);
      Current := Current^.next;
    end;
  finally

    CloseFile(F);
  end;
end;

procedure LoadStyles(var List: PStyle; filename: String);
var
  F: File of TStyle;
  NewStyle: PStyle;
  TempStyle: TStyle;
  Current: PStyle;
begin
  // Проверяем наличие файла перед его открытием
  if not FileExists(filename) then
  begin
    Writeln('Файл ', filename, ' не найден.');
    Exit;
  end;

  // Назначаем файл и открываем его для чтения
  AssignFile(F, filename);
  Reset(F);

  try
    Current := List; // Начинаем с фиктивного узла
    while not Eof(F) do
    begin
      // Читаем очередной стиль из файла
      Read(F, TempStyle);

      // Создаем новый элемент списка
      New(NewStyle);
      NewStyle^.Elem := TempStyle;
      NewStyle^.next := nil;

      // Добавляем новый элемент в конец списка
      Current^.next := NewStyle;
      Current := NewStyle;
    end;
  finally
    // Закрываем файл
    CloseFile(F);
  end;
end;






end.
