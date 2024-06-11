unit Styles;

interface

uses Cloth;

type

  TStyle = record
     Name: String[20];

    fashion1: TClothing; //������� ������
    fashion2: TClothing; // ������ ������
    model1: TModel;//������ ��� ������� ������
    model2:Tmodel; //������ ��� ������ ������
    color1: TColor; //���� ��� ������� ������
    color2: TColor; // ���� ������ ������

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




  // ������� � ����� �����;

end;

procedure SafeStyles(var List: PStyle; filename: String);
var
  F: File of TStyle;
  Current: PStyle;
begin

  if List = nil then
  begin
    Writeln('������ ����, ������ ���������.');
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
  // ��������� ������� ����� ����� ��� ���������
  if not FileExists(filename) then
  begin
    Writeln('���� ', filename, ' �� ������.');
    Exit;
  end;

  // ��������� ���� � ��������� ��� ��� ������
  AssignFile(F, filename);
  Reset(F);

  try
    Current := List; // �������� � ���������� ����
    while not Eof(F) do
    begin
      // ������ ��������� ����� �� �����
      Read(F, TempStyle);

      // ������� ����� ������� ������
      New(NewStyle);
      NewStyle^.Elem := TempStyle;
      NewStyle^.next := nil;

      // ��������� ����� ������� � ����� ������
      Current^.next := NewStyle;
      Current := NewStyle;
    end;
  finally
    // ��������� ����
    CloseFile(F);
  end;
end;






end.
