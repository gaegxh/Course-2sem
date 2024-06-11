unit Autor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Users, DataBaseUser, Main;

type
  TAutForm = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label2: TLabel;
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);

    procedure Edit2Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    //FDateBase: TDateBase;

  public
    { Public declarations }

  end;

var
  AutForm: TAutForm;

implementation

{$R *.dfm}

uses Reg;
var
DateBase:TdateBase;
user:Tuser;



function Autoriz(const Login, Password: string;  out User: TUser): Boolean;
begin
  datebase:=TdateBase.Create;
  Result := False;
  if DateBase.ValidNameInFile(Login) then
  begin
    if DateBase.ValidPasswordInFile(Password, DateBase.GetKeyInFile(Login)) then
    begin
      DateBase.ReadUserData(DateBase.GetKeyInFile(Login),user);
      Result := True;
    end;
  end;
end;



procedure TAutForm.Button2Click(Sender: TObject);
var
  Login, Password: string;

begin
  Login := Edit1.Text;
  Password := Edit2.Text;
  if Autoriz(Login, Password,  User) then
  begin
    AutForm.Close;
    MainForm.readUser(user);
    mainForm.Label1.Caption:=user.name;
    MainForm.Show;
  end
  else
  showMessage('Неверный логин или пароль');
end;

procedure TAutForm.Edit1Enter(Sender: TObject);
begin
  if Edit1.Text = 'Введите логин' then
  begin
    Edit1.Text := '';
    Edit1.Font.Color := clBlack;
  end;
end;

procedure TAutForm.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Edit1.Text := 'Введите логин';
    Edit1.Font.Color := clGray;
  end;
end;

procedure TAutForm.Edit2Enter(Sender: TObject);
begin
  if Edit2.Text = 'Введите пароль' then
  begin
    Edit2.Text := '';
    Edit2.Font.Color := clBlack;
  end;
end;

procedure TAutForm.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    Edit2.Text := 'Введите пароль';
    Edit2.Font.Color := clGray;
  end;
end;

procedure TAutForm.Label2Click(Sender: TObject);
begin
  AutForm.Hide;
  RegForm.Show;
end;

end.

