unit AddStyle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Styles, Cloth;

type
  TNewStyleForm = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    ComboBox3: TComboBox;
    Label4: TLabel;
    ComboBox4: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    ComboBox5: TComboBox;
    Label7: TLabel;
    ComboBox6: TComboBox;
    Label8: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);

  private
    { Private declarations }
  public
    Mystyle: Tstyle;
    FileName: string;
  end;

var
  NewStyleForm: TNewStyleForm;

implementation

{$R *.dfm}

uses Main;

procedure SaveStyle(var Style: Tstyle; var namepackege: string);
var
  F: file of Tstyle;
  RecordCount:integer;
  FileName: string;
begin
Style.Name:=trim(Style.name);
  try
    FileName := 'D:\Курсовая\Win32\Debug\' + namepackege +'\'+Style.Name + '.dat';
    AssignFile(F, FileName);
    if not FileExists(Filename) then
    begin
    Rewrite(F);
    write(F, Style);
    end
    else
    begin
      Reset(F);
      RecordCount := FileSize(F);
      Seek(F, RecordCount);
      Write(F, Style);
    end;
  finally
    close(F);
  end;

end;

procedure SaveNameStyle(var Style: Tstyle; var namepackege: string);
var
F:TextFile;
Filename:string;
begin
try
Style.Name:=trim(Style.name);
 FileName := 'D:\Курсовая\Win32\Debug\' + namepackege +'\Name.txt';
 AssignFile(F, FileName);
 if FileExists(Filename) then
 begin
   Append(F);
   writeln(F,Style.Name);
 end
 else
 begin
 Rewrite(F);
 writeln(F,Style.Name);
 end;
finally
  Close(F);
end;




end;
procedure TNewStyleForm.Button1Click(Sender: TObject);
begin
  NewStyleForm.close;
  SaveStyle(Mystyle, MainForm.FCurrentUser.login);
  SaveNameStyle(Mystyle, MainForm.FCurrentUser.login);
  ComboBox1.Text := '';
  ComboBox2.Text := '';
  ComboBox3.Text := '';
  ComboBox4.Text := '';
  ComboBox5.Text := '';
  ComboBox6.Text := '';

end;

procedure TNewStyleForm.ComboBox1Exit(Sender: TObject);
var
  temp: Tclothing;
begin
  temp := strtocloth(ComboBox1.Text);
  Mystyle.fashion1 := temp;

end;

procedure TNewStyleForm.ComboBox2Change(Sender: TObject);
var
  temp: Tclothing;
begin
  temp := strtocloth(ComboBox2.Text);
  Mystyle.fashion2 := temp;

end;

procedure TNewStyleForm.ComboBox3Change(Sender: TObject);
var
  temp: Tmodel;
begin
  temp := strtomodel(ComboBox3.Text);
  Mystyle.model1 := temp;

end;

procedure TNewStyleForm.ComboBox4Change(Sender: TObject);
var
  temp: Tmodel;
begin
  temp := strtomodel(ComboBox4.Text);
  Mystyle.model2 := temp;

end;

procedure TNewStyleForm.ComboBox5Change(Sender: TObject);
var
  temp: Tcolor;
begin
  temp := strtocolor(ComboBox4.Text);
  Mystyle.color1 := temp;

end;

procedure TNewStyleForm.ComboBox6Change(Sender: TObject);
var
  temp: Tcolor;
begin
  temp := strtocolor(ComboBox4.Text);
  Mystyle.color2 := temp;

end;

procedure TNewStyleForm.Edit1Exit(Sender: TObject);
begin

  Mystyle.Name := Edit1.Text;

end;

procedure TNewStyleForm.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Add('TShirt');
  ComboBox1.Items.Add('Shirt');
  ComboBox1.Items.Add('TankTop');
  ComboBox1.Items.Add('PoloShirt');
  ComboBox1.Items.Add('Sweatshirt');
  ComboBox1.Items.Add('Jacket');
  ComboBox1.Items.Add('Blazer');
  ComboBox1.Items.Add('Vest');
  ComboBox1.Items.Add('Cardigan');
  ComboBox1.Items.Add('Turtleneck');
  ComboBox1.Items.Add('Coat');
  ComboBox1.Items.Add('Parka');
  ComboBox1.Items.Add('Windbreaker');
  ComboBox1.Items.Add('PeaCoat');
  ComboBox1.Items.Add('Poncho');
  ComboBox1.Items.Add('Cape');
  ComboBox1.Items.Add('Tuxedo');
  ComboBox1.Items.Add('Suit');
  ComboBox1.Items.Add('Overall');

  ComboBox2.Items.Add('Jeans'); // Джинсы
  ComboBox2.Items.Add('Pants'); // Брюки
  ComboBox2.Items.Add('Joggers'); // Джоггеры
  ComboBox2.Items.Add('Shorts'); // Шорты
  ComboBox2.Items.Add('Skirt'); // Юбка
  ComboBox2.Items.Add('Leggings'); // Леггинсы
  ComboBox2.Items.Add('Capris'); // Капри
  ComboBox2.Items.Add('Culottes'); // Кюлоты
  ComboBox2.Items.Add('Jumpsuit'); // Комбинезон
  ComboBox2.Items.Add('Tights'); // Тайтсы
  ComboBox2.Items.Add('CargoPants'); // Карго-брюки
  ComboBox2.Items.Add('Chinos'); // Чиносы
  ComboBox2.Items.Add('TrackPants'); // Спортивные брюки
  ComboBox2.Items.Add('Bermuda'); // Бермуды
  ComboBox2.Items.Add('FlarePants'); // Брюки-клеш
  ComboBox2.Items.Add('Palazzo'); // Палантин
  ComboBox2.Items.Add('Gauchos'); // Гаучос
  ComboBox2.Items.Add('Sarong'); // Саронг
  ComboBox2.Items.Add('Salwar'); // Сальвары
  ComboBox2.Items.Add('HaremPants');

  ComboBox3.Items.Add('Slim Fit'); // подходит для стройных
  ComboBox3.Items.Add('Regular'); // стандартный
  ComboBox3.Items.Add('Athletic'); // атлетический
  ComboBox3.Items.Add('Tall'); // высокий
  ComboBox3.Items.Add('Petite'); // маленький рост
  ComboBox3.Items.Add('Plus Size'); // плюс размер
  ComboBox3.Items.Add('Curvy'); // пышная фигура
  ComboBox3.Items.Add('Hourglass'); // песочные часы
  ComboBox3.Items.Add('Pear');

  ComboBox4.Items.Add('Slim Fit'); // подходит для стройных
  ComboBox4.Items.Add('Regular'); // стандартный
  ComboBox4.Items.Add('Athletic'); // атлетический
  ComboBox4.Items.Add('Tall'); // высокий
  ComboBox4.Items.Add('Petite'); // маленький рост
  ComboBox4.Items.Add('Plus Size'); // плюс размер
  ComboBox4.Items.Add('Curvy'); // пышная фигура
  ComboBox4.Items.Add('Hourglass'); // песочные часы
  ComboBox4.Items.Add('Pear');

  ComboBox5.Items.Add('Blue'); // Синий
  ComboBox5.Items.Add('Green'); // Зеленый
  ComboBox5.Items.Add('Yellow'); // Желтый
  ComboBox5.Items.Add('Orange'); // Оранжевый
  ComboBox5.Items.Add('Purple'); // Фиолетовый
  ComboBox5.Items.Add('Pink'); // Розовый
  ComboBox5.Items.Add('Brown'); // Коричневый
  ComboBox5.Items.Add('Black'); // Черный
  ComboBox5.Items.Add('White'); // Белый
  ComboBox5.Items.Add('Gray'); // Серый
  ComboBox5.Items.Add('Cyan'); // Голубой
  ComboBox5.Items.Add('Magenta'); // Пурпурный
  ComboBox5.Items.Add('Turqun'); // Коричнево-красный
  ComboBox5.Items.Add('Indigo'); // Индиго
  ComboBox5.Items.Add('Teal'); // Сине-зеленый
  ComboBox5.Items.Add('Goloise'); // Бирюзовый
  ComboBox5.Items.Add('Lavender'); // Лавандовый
  ComboBox5.Items.Add('Marood'); // Золотой
  ComboBox5.Items.Add('Silver'); // Серебряный
  ComboBox5.Items.Add('Navy Blue'); // Темно-синий
  ComboBox5.Items.Add('Grey');

  ComboBox6.Items.Add('Blue'); // Синий
  ComboBox6.Items.Add('Green'); // Зеленый
  ComboBox6.Items.Add('Yellow'); // Желтый
  ComboBox6.Items.Add('Orange'); // Оранжевый
  ComboBox6.Items.Add('Purple'); // Фиолетовый
  ComboBox6.Items.Add('Pink'); // Розовый
  ComboBox6.Items.Add('Brown'); // Коричневый
  ComboBox6.Items.Add('Black'); // Черный
  ComboBox6.Items.Add('White'); // Белый
  ComboBox6.Items.Add('Gray'); // Серый
  ComboBox6.Items.Add('Cyan'); // Голубой
  ComboBox6.Items.Add('Magenta'); // Пурпурный
  ComboBox6.Items.Add('Turqun'); // Коричнево-красный
  ComboBox6.Items.Add('Indigo'); // Индиго
  ComboBox6.Items.Add('Teal'); // Сине-зеленый
  ComboBox6.Items.Add('Goloise'); // Бирюзовый
  ComboBox6.Items.Add('Lavender'); // Лавандовый
  ComboBox6.Items.Add('Marood'); // Золотой
  ComboBox6.Items.Add('Silver'); // Серебряный
  ComboBox6.Items.Add('Navy Blue'); // Темно-синий
  ComboBox6.Items.Add('Grey');

end;

end.
