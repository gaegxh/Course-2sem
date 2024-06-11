program Fashion_course;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Windows,
  DateUtils,
  Cloth in 'Cloth.pas',
  Users in 'Users.pas',
  TmyList in 'TmyList.pas',
  DataBaseUser in 'DataBaseUser.pas',
  Styles in 'Styles.pas',
  DataBaseStyles in 'DataBaseStyles.pas',
  LookFashion in 'LookFashion.pas',
  GenreteLook in 'GenreteLook.pas';

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

var
  Database: TDateBase;
  dataBase1:TDateBaseStyle;
  UserList: TmyList<TUser>;
  User: TUser;
   ListSearch:TmyList<TSearch>;
  ListCloth:TmyList<TCloth>;
  ListIndex:TmyList<Integer>;
  StartTime, EndTime: TDateTime;
  mas:TlistLook;
  temp:Tcloth;
  i:integer;
  id:integer;
  Name:string;
  OldMoneyStyle: pStyle;
  temp2:Tstyle;



  intList:Tmylist<integer>;
begin
  StartTime := Now;
  oldmoneystyle:=nil;
  database1:=TDateBaseStyle.Create;
 ListCloth:=Tmylist<TCloth>.Create;
 createList(OldMoneyStyle);
 user.size:=M;
 User.gender:=Man;

 temp2.Name:='OldMoney';
 temp2.fashion1:=strtocloth('Shirt');
 temp2.fashion2:=strtocloth('Chinos');
 temp2.model1:=strtomodel('athletic');
 temp2.model2:=strtomodel('petite');
 temp2.color1:=strtocolor('Teal');
 temp2.color2:=strtocolor('Magenta');
 name:='';
 //SaveStyle(temp2,name);



//  ListSearch:=Tmylist<TSearch>.Create;
  //ListIndex:=Tmylist<Integer>.Create;

//InitializeArrays(ListSearch,ListCloth);
//safetocloth(ListCloth);
LoadFromCloth(ListCloth);
InsertionSort(Listcloth);
name:='D:\Курсовая\Win32\Debug\OldMoney.dat';
LoadStyles(OldMoneyStyle,Name);
SearchLook(ListCloth,OldmoneyStyle,User,mas);

for I := 0 to ListCloth.LengthList-1 do
  begin
    write(ClothTostr(ListCloth.GetItemsCounter(i).name),' ');
  end;
  writeln;

  writeln(ClothTostr(temp.name));



//InitSearchList(ListSearch,ListCloth);
//SortList(ListSearch);
//BlockSearch(ListSearch,Hoodie,ListIndex);
  EndTime := Now;
   Writeln('Программа выполнялась ', SecondsBetween(EndTime, StartTime), ' секунд ');
//listSearch.Destroy;
ListCloth.Destroy;



  readln;
end.

