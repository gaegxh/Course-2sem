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
    function GetKeyInFile(const Login: string): integer;
    procedure ReadUserData(const UserId: Integer; var UserData: TUser);

  end;

implementation

uses
  System.IniFiles, System.SysUtils, System.IOUtils, System.Classes;

constructor TDateBase.Create;
begin
  data := TmyList<TUser>.Create;
  FileName := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Users.data');
end;

destructor TDateBase.Destroy;
begin
  data.Destroy;
end;

procedure TDateBase.SafeDateMas(data: TmyList<TUser>);
var
  i: Integer;
begin
  for i := 0 to data.LengthList - 1 do
  begin
    SafeDateElem(data.GetItemsCounter(i));
  end;
end;

procedure TDateBase.SafeDateElem(data: TUser);
var
  IniFile: TIniFile;
  i: Integer;
begin
  try
    IniFile := TIniFile.Create(FileName);
    try
      begin
        IniFile.WriteString('Login', inttostr(data.Id), data.Login);
        IniFile.WriteString('UserName', inttostr(data.Id), data.name);
        IniFile.WriteInteger('Hips', inttostr(data.Id), data.hips);
        IniFile.WriteInteger('Waist', inttostr(data.Id), data.waist);
        IniFile.WriteInteger('Shoulder', inttostr(data.Id), data.shoulders);
        IniFile.WriteString('Password', inttostr(data.Id), data.password);
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
  i: Integer;
begin
  try
    Result := False;
    IniFile := TIniFile.Create(FileName);
    keys := TStringList.Create;
    try
      IniFile.ReadSection('Login', keys);
      for i := 0 to keys.Count - 1 do
      begin
        if SameText(keys[i], Login) then
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

function TDateBase.GetKeyInFile(const Login: string): integer;
var
  IniFile: TIniFile;
  keys: TStringList;
  i: Integer;
begin
  try
    Result := 0;
    IniFile := TIniFile.Create(FileName);
    keys := TStringList.Create;
    try
      IniFile.ReadSection('User', keys);
      for i := 0 to keys.Count - 1 do
      begin
        if SameText(keys[i], Login) then
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


procedure TDateBase.ReadUserData(const UserId: Integer; var UserData: TUser);
var
  IniFile: TIniFile;
  SectionName: string;
begin
  IniFile := TIniFile.Create(FileName);
  try
    SectionName := IntToStr(UserId);
    if IniFile.SectionExists(SectionName) then
    begin

      UserData.Id := UserId;
      UserData.Login := IniFile.ReadString(SectionName, 'Login', '');
      UserData.Name := IniFile.ReadString(SectionName, 'UserName', '');
      UserData.Hips := IniFile.ReadInteger(SectionName, 'Hips', 0);
      UserData.Waist := IniFile.ReadInteger(SectionName, 'Waist', 0);
      UserData.Shoulders := IniFile.ReadInteger(SectionName, 'Shoulders', 0);
      UserData.Password := IniFile.ReadString(SectionName, 'Password', '');
    end
    else
    begin
      UserData.Id := -1;
      UserData.Login := '';
      UserData.Name := '';
      UserData.Hips := 0;
      UserData.Waist := 0;
      UserData.Shoulders := 0;
      UserData.Password := '';
    end;
  finally
    IniFile.Free;
  end;
end;







end.
