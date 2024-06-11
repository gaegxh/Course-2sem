unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, Reg, DataBaseUser, Users,Search;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Label1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    //rocedure Button1Click(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDateBase: TDateBase;

    SearchForm:TSearForm;

  public
    { Public declarations }
    FCurrentUser: TUser;

    constructor Create(AOwner: TComponent); override;
    procedure readUser(User: TUser);

  end;

var
  MainForm: TMainForm;


implementation

uses
  Autor, AddStyle;

var
  counter: integer;

{$R *.dfm}




procedure TMainForm.Button1Click(Sender: TObject);
begin
MainForm.Hide;
  if not Assigned(SearchForm) then
  Application.CreateForm(TSearForm, SearchForm);
 SearchForm.Show;

end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
NewStyleForm.Show;
end;

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDateBase := TDateBase.Create; // Создание экземпляра TDateBase

end;

procedure TMainForm.readUser(User: TUser);
begin
  FCurrentUser := User;

end;

procedure TMainForm.Edit1Change(Sender: TObject);
var
  a: string;
begin
  // Ваш код здесь
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  Label1.Visible := False;

  Label1.Visible := True;
  if Label1.Caption <> FCurrentUser.name then
  begin
    AutForm.Show;
    MainForm.Hide;
  end;
end;

end.

