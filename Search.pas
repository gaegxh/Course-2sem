unit Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cloth, TmyList, Vcl.Grids, Vcl.StdCtrls,
  Styles, LookFashion;

type
  TSearForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StringGrid1: TStringGrid;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ClothList: TmyList<TCloth>;
    ClothListDown: TmyList<TCloth>;
    liststyle: pStyle;
    listMatch: Tlistlook;

  end;

var
  SearForm: TSearForm;

implementation

{$R *.dfm}

uses Mystyle, Main, GenreteLook;


procedure FillStringGridFromArray(var StringGrid: TStringGrid; const LookArray: Tlistlook; var List: PStyle);
var
  i: Integer;
  current: PStyle;
begin
  // Очищаем таблицу перед заполнением
  StringGrid.RowCount := 1; // Оставить только заголовок

  // Установка количества строк (заголовок + количество элементов массива)
  StringGrid.RowCount := Length(LookArray) + 1;

  // Установка заголовков столбцов
  StringGrid.Cells[0, 0] := 'Одежда1';
  StringGrid.Cells[1, 0] := 'Одежда2';
  StringGrid.Cells[2, 0] := 'Модель1';
  StringGrid.Cells[3, 0] := 'Модель2';
  StringGrid.Cells[4, 0] := 'Цвет1';
  StringGrid.Cells[5, 0] := 'Цвет2';

  // Перемещаем current на первый элемент списка
  current := List^.next;
    showMessage(']]');
  // Заполняем StringGrid данными из массива
  for i := 0 to High(LookArray) do
  begin

    // Проверка на переполнение текущего списка стилей
    if current <> nil then
    begin
    showMessage(']]');
      // Заполнение ячеек строк значениями из массива
      StringGrid.Cells[0, i + 1] := ClothToStr(LookArray[i].cloth1.Name);
      StringGrid.Cells[1, i + 1] := ClothToStr(LookArray[i].Cloth2.Name);
      StringGrid.Cells[2, i + 1] := TModelToStr(current^.Elem.model1);
      StringGrid.Cells[3, i + 1] := TModelToStr(current^.Elem.model2);
      //StringGrid.Cells[4, i + 1] := ColorToStr(current^.Elem.color1);
      //StringGrid.Cells[5, i + 1] := ColorToStr(current^.Elem.color2);

      // Переход к следующему элементу списка
      current := current^.next;
    end
    else
    begin
      // Очищаем строки, если список стилей закончился
      StringGrid.Cells[0, i + 1] := '';
      StringGrid.Cells[1, i + 1] := '';
      StringGrid.Cells[2, i + 1] := '';
      StringGrid.Cells[3, i + 1] := '';
      StringGrid.Cells[4, i + 1] := '';
      StringGrid.Cells[5, i + 1] := '';
    end;
  end;

  // Принудительное обновление StringGrid
  StringGrid.Repaint;
end;




procedure TSearForm.Button1Click(Sender: TObject);
var
  Filename: string;
begin
   createList(liststyle);
  Filename := 'D:\Курсовая\Win32\Debug\OldMoney.dat';
  LoadStyles(liststyle, Filename);


  SearchLook(ClothList,Liststyle,mainForm.FCurrentUser,listmatch);
  showmessage(inttostr(high(listMatch)));
  FillStringGridFromArray(StringGrid1,Listmatch,liststyle);
  DestroyStyles(liststyle);
  DestroyListLook(listMatch);

end;

procedure TSearForm.Button2Click(Sender: TObject);
var
  Filename: string;
begin
  createList(liststyle);
  Filename := 'D:\Курсовая\Win32\Debug\Modern.dat';
  LoadStyles(liststyle, Filename);

SearchLook(ClothList,Liststyle,mainForm.FCurrentUser,listmatch);
FillStringGridFromArray(StringGrid1,Listmatch,liststyle);
  DestroyStyles(liststyle);
  DestroyListLook(listMatch);

end;

procedure TSearForm.Button3Click(Sender: TObject);
var
Filename:string;
begin
MyStyleForm.Show;
createList(liststyle);
  Filename := 'D:\Курсовая\Win32\Debug\Classic.dat';
  LoadStyles(liststyle, Filename);

SearchLook(ClothList,Liststyle,mainForm.FCurrentUser,listmatch);
FillStringGridFromArray(StringGrid1,Listmatch,liststyle);
  DestroyStyles(liststyle);
  DestroyListLook(listMatch);


end;

procedure TSearForm.Button4Click(Sender: TObject);
var
  Filename: string;
begin
  createList(liststyle);
  Filename := 'D:\Курсовая\Win32\Debug\OldMoney.dat';
  LoadStyles(liststyle, Filename);

  SearchLook(ClothList,Liststyle,mainForm.FCurrentUser,listmatch);
  DestroyStyles(liststyle);
  DestroyListLook(listMatch);

end;

procedure TSearForm.Button5Click(Sender: TObject);
begin
  SearForm.close;
  MainForm.Show;
   // Закрываем текущую форму
    // Показываем основную форму
end;

procedure TSearForm.FormCreate(Sender: TObject);
begin
  ClothList := TmyList<TCloth>.Create;
  LoadFromcloth(ClothList);


end;

end.
