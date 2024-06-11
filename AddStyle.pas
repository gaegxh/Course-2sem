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
    FileName := 'D:\��������\Win32\Debug\' + namepackege +'\'+Style.Name + '.dat';
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
 FileName := 'D:\��������\Win32\Debug\' + namepackege +'\Name.txt';
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

  ComboBox2.Items.Add('Jeans'); // ������
  ComboBox2.Items.Add('Pants'); // �����
  ComboBox2.Items.Add('Joggers'); // ��������
  ComboBox2.Items.Add('Shorts'); // �����
  ComboBox2.Items.Add('Skirt'); // ����
  ComboBox2.Items.Add('Leggings'); // ��������
  ComboBox2.Items.Add('Capris'); // �����
  ComboBox2.Items.Add('Culottes'); // ������
  ComboBox2.Items.Add('Jumpsuit'); // ����������
  ComboBox2.Items.Add('Tights'); // ������
  ComboBox2.Items.Add('CargoPants'); // �����-�����
  ComboBox2.Items.Add('Chinos'); // ������
  ComboBox2.Items.Add('TrackPants'); // ���������� �����
  ComboBox2.Items.Add('Bermuda'); // �������
  ComboBox2.Items.Add('FlarePants'); // �����-����
  ComboBox2.Items.Add('Palazzo'); // ��������
  ComboBox2.Items.Add('Gauchos'); // ������
  ComboBox2.Items.Add('Sarong'); // ������
  ComboBox2.Items.Add('Salwar'); // ��������
  ComboBox2.Items.Add('HaremPants');

  ComboBox3.Items.Add('Slim Fit'); // �������� ��� ��������
  ComboBox3.Items.Add('Regular'); // �����������
  ComboBox3.Items.Add('Athletic'); // ������������
  ComboBox3.Items.Add('Tall'); // �������
  ComboBox3.Items.Add('Petite'); // ��������� ����
  ComboBox3.Items.Add('Plus Size'); // ���� ������
  ComboBox3.Items.Add('Curvy'); // ������ ������
  ComboBox3.Items.Add('Hourglass'); // �������� ����
  ComboBox3.Items.Add('Pear');

  ComboBox4.Items.Add('Slim Fit'); // �������� ��� ��������
  ComboBox4.Items.Add('Regular'); // �����������
  ComboBox4.Items.Add('Athletic'); // ������������
  ComboBox4.Items.Add('Tall'); // �������
  ComboBox4.Items.Add('Petite'); // ��������� ����
  ComboBox4.Items.Add('Plus Size'); // ���� ������
  ComboBox4.Items.Add('Curvy'); // ������ ������
  ComboBox4.Items.Add('Hourglass'); // �������� ����
  ComboBox4.Items.Add('Pear');

  ComboBox5.Items.Add('Blue'); // �����
  ComboBox5.Items.Add('Green'); // �������
  ComboBox5.Items.Add('Yellow'); // ������
  ComboBox5.Items.Add('Orange'); // ���������
  ComboBox5.Items.Add('Purple'); // ����������
  ComboBox5.Items.Add('Pink'); // �������
  ComboBox5.Items.Add('Brown'); // ����������
  ComboBox5.Items.Add('Black'); // ������
  ComboBox5.Items.Add('White'); // �����
  ComboBox5.Items.Add('Gray'); // �����
  ComboBox5.Items.Add('Cyan'); // �������
  ComboBox5.Items.Add('Magenta'); // ���������
  ComboBox5.Items.Add('Turqun'); // ���������-�������
  ComboBox5.Items.Add('Indigo'); // ������
  ComboBox5.Items.Add('Teal'); // ����-�������
  ComboBox5.Items.Add('Goloise'); // ���������
  ComboBox5.Items.Add('Lavender'); // ����������
  ComboBox5.Items.Add('Marood'); // �������
  ComboBox5.Items.Add('Silver'); // ����������
  ComboBox5.Items.Add('Navy Blue'); // �����-�����
  ComboBox5.Items.Add('Grey');

  ComboBox6.Items.Add('Blue'); // �����
  ComboBox6.Items.Add('Green'); // �������
  ComboBox6.Items.Add('Yellow'); // ������
  ComboBox6.Items.Add('Orange'); // ���������
  ComboBox6.Items.Add('Purple'); // ����������
  ComboBox6.Items.Add('Pink'); // �������
  ComboBox6.Items.Add('Brown'); // ����������
  ComboBox6.Items.Add('Black'); // ������
  ComboBox6.Items.Add('White'); // �����
  ComboBox6.Items.Add('Gray'); // �����
  ComboBox6.Items.Add('Cyan'); // �������
  ComboBox6.Items.Add('Magenta'); // ���������
  ComboBox6.Items.Add('Turqun'); // ���������-�������
  ComboBox6.Items.Add('Indigo'); // ������
  ComboBox6.Items.Add('Teal'); // ����-�������
  ComboBox6.Items.Add('Goloise'); // ���������
  ComboBox6.Items.Add('Lavender'); // ����������
  ComboBox6.Items.Add('Marood'); // �������
  ComboBox6.Items.Add('Silver'); // ����������
  ComboBox6.Items.Add('Navy Blue'); // �����-�����
  ComboBox6.Items.Add('Grey');

end;

end.
