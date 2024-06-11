unit Reg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataBaseUser, Users;

type
  TRegForm = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);

    procedure Edit1Exit(Sender: TObject);

    procedure Edit4Exit(Sender: TObject);

    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit2MouseEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegForm: TRegForm;
  Data: TDateBase;
  User: Tuser;
  procedure CreatePackege(var Packegename: string);
implementation

{$R *.dfm}

uses Cloth, Autor;

function ValidatePassword(const Password: string): Boolean;
var
  i: Integer;
  HasUpper, HasLower, HasDigit, HasSpecial: Boolean;
begin
  Result := False;
  HasUpper := False;
  HasLower := False;
  HasDigit := False;
  HasSpecial := False;

  if Length(Password) < 8 then
    Exit;

  for i := 1 to Length(Password) do
  begin
    if CharInSet(Password[i], ['A' .. 'Z']) then
      HasUpper := True;
    if CharInSet(Password[i], ['a' .. 'z']) then
      HasLower := True;
    if CharInSet(Password[i], ['0' .. '9']) then
      HasDigit := True;
    if CharInSet(Password[i], ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
      '-', '_', '=', '+', '[', ']', '{', '}', '|', ':', ';', '"', '''', '<',
      '>', ',', '.', '?', '/', '\']) then
      HasSpecial := True;
  end;

  if HasUpper and HasLower and HasDigit and HasSpecial then
    Result := True;
end;

procedure TRegForm.Button1Click(Sender: TObject);
begin

  if not(User.name = '') and not(User.size = None) and not(User.gender = gNone)
    and not(User.Password = '') and not(User.name = '') then
  begin
    CreatePackege(User.Login);
    Data.SafeDateElem(User);
    Data.Destroy;
    RegForm.Destroy;
    AutForm.show;
  end
  Else
  begin
    showmessage('Заполните все поля для регистрации');
  end;
end;

procedure TRegForm.ComboBox1Change(Sender: TObject);
var
  Temp: Tsize;
begin

end;

procedure TRegForm.ComboBox1Exit(Sender: TObject);
var
  Temp: Tgender;
begin
  Temp := strtogender(ComboBox1.Text);
  User.gender := Temp;
end;

procedure TRegForm.ComboBox2Exit(Sender: TObject);
var
  Temp: Tsize;
begin
  Temp := Strtosize(ComboBox2.Text);
  User.size := Temp;
end;

procedure TRegForm.Edit1Exit(Sender: TObject);
begin

  User.Login := Edit1.Text;
  if Data.ValidNameInFile(User.Login) then
  begin
    showmessage('Этот логин уже существует пробуйте снова');
    Edit1.Text := '';
  end;
end;

procedure TRegForm.Edit2Exit(Sender: TObject);
var
  Temp: string;
begin
  Temp := Edit2.Text;
  if ValidatePassword(Temp) then
  begin
    User.Password := Temp;
  end
  else
  begin
    showmessage('Пароль не соответствует требованиям');
  end;
end;

procedure TRegForm.Edit2MouseEnter(Sender: TObject);
begin
//showmessage
//    ('Требование к паролю: латинские символы, длина 8 символов, одна строчная буква, одна заглавная буква, одна цифра, один специальный символ');
end;

procedure TRegForm.Edit4Exit(Sender: TObject);
begin
  User.name := Edit4.Text;
end;

procedure TRegForm.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.add('Man');
  ComboBox1.Items.add('Women');
  ComboBox2.Items.add('XXS');
  ComboBox2.Items.add('XS');
  ComboBox2.Items.add('S');
  ComboBox2.Items.add('M');
  ComboBox2.Items.add('L');
  ComboBox2.Items.add('XL');
  ComboBox2.Items.add('XXL');
  Data := TDateBase.Create;
  User.Id := random(7868) mod 13;
end;

procedure CreatePackege(var Packegename: string);
var
Filename:string;
begin
Filename:='D:\Курсовая\Win32\Debug\'+Packegename;
if not Createdir(Filename) then
begin
  showMessage('АААААААААА!Ошибка');
end;

end;


end.
