unit DataBaseStyles;

interface

uses
  TmyList, Cloth, Styles;

type
  TDateBaseStyle = class
  private
    data: TmyList<TStyl>;
    FileName: string;
  public
    constructor Create;
    destructor Destroy;
    procedure SafeStyleData(var Name: String; Var Id: integer);
    procedure SafeStyleElemData(var data: TStyl);
    Function GetKeywithName(var Name: string): integer;
    procedure ReadDatawithFile(var data: TStyl; var Key: integer);


  end;

implementation

uses
  System.IniFiles, System.SysUtils, System.IOUtils, System.Classes;





constructor TDateBaseStyle.Create;
begin
  data := TmyList<TStyl>.Create;
  FileName := 'D:\Курсовая\Win32\Debug\Style.data';
end;

destructor TDateBaseStyle.Destroy;
begin
  data.Free;
end;

procedure TDateBaseStyle.SafeStyleData(var Name: String; Var Id: integer);
var
  UserId: String;
  IniFile: TIniFile;
begin
  try
    IniFile := TIniFile.Create(FileName);
    UserId := intTostr(Id);
    IniFile.WriteString('Style', UserId, Name);
  finally
    IniFile.Destroy;
  end;

end;

procedure TDateBaseStyle.SafeStyleElemData(var data: TStyl);
var
  IniFile: TIniFile;
  UserId: string;
begin
  try
    IniFile := TIniFile.Create(FileName);

    IniFile.WriteString('Fashion1', UserId, Clothtostr(data.Elem.fashion1));
    IniFile.WriteString('Fashion2', UserId, Clothtostr(data.Elem.fashion2));
    IniFile.WriteString('Model1', UserId, TmodelTostr(data.Elem.model1));
    IniFile.WriteString('Model2', UserId, TmodelTostr(data.Elem.model2));
    IniFile.WriteString('Color1', UserId, Colortostr(data.Elem.color1));
    IniFile.WriteString('Color2', UserId, Colortostr(data.Elem.color2));


  finally
    IniFile.Destroy;
  end;
end;

Function TDateBaseStyle.GetKeywithName(var Name: string): integer;
var
  IniFile: TIniFile;
  keys: TstringList;
  I: integer;
begin
  IniFile := TIniFile.Create(FileName);
  try
    IniFile.ReadSection('Login', keys);
    for I := 0 to keys.Count - 1 do
    begin
      if SameText(IniFile.ReadString('Style', keys[I], ''), Name) then
      begin
        Result := StrToInt(keys[I]);
      end;
    end;

  finally
    IniFile.Destroy;
  end;
end;

procedure TDateBaseStyle.ReadDatawithFile(var data: TStyl; var Key: integer);
var
  IniFile: TIniFile;
  UserId: string;
begin
  try
    IniFile := TIniFile.Create(FileName);
    UserId := intTostr(Key);
    data.Elem.fashion1 := StrtoCloth(IniFile.ReadString('Fashion1', UserId, ''));
    data.Elem.fashion2 := StrtoCloth(IniFile.ReadString('Fashion2', UserId, ''));
    data.Elem.model1 := StrtoModel(IniFile.ReadString('Model1', UserId, ''));
    data.Elem.model2 := StrtoModel(IniFile.ReadString('Model2', UserId, ''));
    data.Elem.color1 := strtocolor(IniFile.ReadString('Color1', UserId, ''));
    data.Elem.color2 := strtocolor(IniFile.ReadString('Color2', UserId, ''));

  finally
    IniFile.Destroy;
  end;

end;

end.
