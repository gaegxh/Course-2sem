unit Mystyle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Styles;

type
  TMyStyleForm = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private

  public type
    MyStylesName = array of string;

  var
    liststyle: pStyle;
    Myname: MyStylesName;
    name: Tstringlist;

  end;

var
  MyStyleForm: TMyStyleForm;

implementation

{$R *.dfm}

uses Main;

procedure TMyStyleForm.Button1Click(Sender: TObject);
begin
  MyStyleForm.Close;
end;

procedure TMyStyleForm.FormHide(Sender: TObject);
begin
  destroyStyles(liststyle);
end;

procedure ReadFileIntoArray(FileName: string; var Lines: Tstringlist);
begin
  FileName := FileName + '\Name.txt';
  if not FileExists(FileName) then
  begin
    Writeln('Файл не найден: ', FileName);
    Exit;
  end;

  Lines.Clear;
  Lines.LoadFromFile(FileName);
end;

procedure FillListBoxFromStringList(const ListBox: TListBox; const StringList: TStringList);
begin
  ListBox.Items.BeginUpdate;
  try
    ListBox.Items.Clear;
    ListBox.Items.AddStrings(StringList);
  finally
    ListBox.Items.EndUpdate;
  end;
end;


procedure TMyStyleForm.FormShow(Sender: TObject);
var
  FileName: string;
begin
  name:=TstringList.Create;
  FileName := 'D:\Курсовая\Win32\Debug\' + MainForm.FCurrentUser.login;
  ReadFileIntoArray(FileName, name);
  FillListBoxFromStringList(ListBox1,name);


end;

end.
