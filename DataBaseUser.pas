unit DataBaseUser;

interface

uses TmyList, Users;

type
  TDateBase = class
  private
    data: TmyList<TUser>;
    FileName: string;
  public
    constructor Create;
    destructor Destroy;
    procedure SafeDateMas(data: TmyList<TUser>);
    procedure SafeDateElem(data: TUser);
    function ValidNameInFile(const Login: string): boolean;
    function GetKeyInFile(Login: string): integer;
    procedure ReadUserData(const UserId: integer; var UserData: TUser);
    function ValidPasswordInFile(const Password: string;
      keys1: integer): boolean;
    procedure UserFile(const data: TUser);

  end;

implementation

uses
  System.IniFiles, System.SysUtils, System.IOUtils, System.Classes, Cloth;

constructor TDateBase.Create;
begin
  data := TmyList<TUser>.Create;
  FileName := 'D:\Курсовая\Win32\Debug\Users.data';
end;

destructor TDateBase.Destroy;
begin
  data.Destroy;
end;

procedure TDateBase.SafeDateMas(data: TmyList<TUser>);
var
  i: integer;
begin
  for i := 0 to data.LengthList - 1 do
  begin
    SafeDateElem(data.GetItemsCounter(i));
  end;
end;

procedure TDateBase.SafeDateElem(data: TUser);
var
  IniFile: TIniFile;
  i: integer;
begin
  try
    IniFile := TIniFile.Create(FileName);
    try
      begin
        IniFile.WriteString('Login', inttostr(data.Id), data.Login);
        IniFile.WriteString('UserName', inttostr(data.Id), data.name);
        IniFile.WriteString('Password', inttostr(data.Id), data.Password);
        Inifile.WriteString('Size', inttostr(data.Id),SIzetostr(data.size));
        Inifile.WriteString('Gender', inttostr(data.Id),gendertostr(data.gender));

      end;
    finally
      IniFile.Free;
    end;
  except
    writeln('Не удалось открыть файл');

  end;

end;

function TDateBase.ValidNameInFile(const Login: string): boolean;
var
  IniFile: TIniFile;
  keys: TStringList;
  i: integer;
begin
  try
    Result := False;
    IniFile := TIniFile.Create(FileName);
    keys := TStringList.Create;
    try
      IniFile.ReadSection('Login', keys);
      for i := 0 to keys.Count - 1 do
      begin
        if SameText(IniFile.ReadString('Login', keys[i], ''), Login) then
        begin
          Result := true;
        end;
      end;

    finally
      IniFile.Free;
      keys.Free;
    end;
  except
    writeln('Не удалось открыть файл');

  end;

end;

function TDateBase.GetKeyInFile(Login: string): integer;
var
  IniFile: TIniFile;
  keys: TStringList;
  i: integer;
begin
  try
    Result := 0;
    IniFile := TIniFile.Create(FileName);
    keys := TStringList.Create;
    try
      IniFile.ReadSection('Login', keys);
      for i := 0 to keys.Count - 1 do
      begin
        if SameText(IniFile.ReadString('Login', keys[i], ''), Login) then
        begin
          Result := StrToInt(keys[i]);
        end;
      end;

    finally
      IniFile.Free;
      keys.Free;
    end;
  except
    writeln('Не удалось открыть файл');

  end;
end;

procedure TDateBase.ReadUserData(const UserId: integer; var UserData: TUser);
var
  IniFile: TIniFile;
  SectionName: string;
begin
  IniFile := TIniFile.Create(FileName);
  try
    SectionName := inttostr(UserId);
    // if (IniFile.SectionExists('Login')) and (IniFile.SectionExists('UserName'))
    // and (IniFile.SectionExists('Hips')) and (IniFile.SectionExists('Waist'))
    // and (IniFile.SectionExists('Password')) and (IniFile.SectionExists('Shoulders'))
    // then
    begin

      UserData.Id := UserId;
      UserData.Login := IniFile.ReadString('Login', SectionName, '');
      UserData.name := IniFile.ReadString('UserName', SectionName, '');
      Userdata.size:=strtosize(IniFile.ReadString('Size',SectionName,''));
      Userdata.gender:=strtogender(IniFile.ReadString('Gender',SectionName,''));
      // end
      // else
      // begin
      // UserData.Id := -1;
      // UserData.Login := '';
      // UserData.name := '';
      // UserData.hips := 0;
      // UserData.waist := 0;
      // UserData.shoulders := 0;
      // UserData.Password := '';
    end;
  finally
    IniFile.Free;
  end;
end;

function TDateBase.ValidPasswordInFile(const Password: string;
  keys1: integer): boolean;
var
  IniFile: TIniFile;
  keys: string;
  i: integer;
begin
  try
    Result := False;
    IniFile := TIniFile.Create(FileName);

    try

      begin
        if SameText(IniFile.ReadString('Password', inttostr(keys1), ''),
          Password) then
        begin
          Result := true;
        end;
      end;

    finally
      IniFile.Free;

    end;
  except
    writeln('Не удалось открыть файл');

  end;

end;

procedure TDateBase.UserFile(const data: TUser);
var
  IniFile: TIniFile;
  UserId: string;
  UserLogin: string;
begin
  try
    UserId := inttostr(data.Id);

    IniFile := TIniFile.Create(FileName);
    IniFile.WriteString('FileUser', UserId, data.Login);
  finally

  end;

end;



end.
