unit TMyList;

interface

type
  TMyList<T> = class
  private type
    TList = array of T;

  var
    List: TList;
    Counter: Integer;
    Capacity: Integer;
    procedure Grow;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const Item: T);
    function GetItemsCounter(const Number: Integer): T;
    procedure DeleteCounter(const Number: Integer);
    function LengthList: Integer;
    procedure Assigment( counter1:integer; counter2:integer);overload;
    procedure Assigment( counter1:integer;var asign:t);overload;
     procedure Swap( Item1:integer; Item2:integer);



  end;

implementation
uses
System.SysUtils;

constructor TMyList<T>.Create;
begin
  Counter := 0;
  Capacity := 5;
  SetLength(List, Capacity);
end;

destructor TMyList<T>.Destroy;
begin
  SetLength(List, 0);
  inherited;
end;

procedure TMyList<T>.Grow;
begin
  if Counter = Capacity then
  begin
    Capacity := Capacity * 2;
    SetLength(List, Capacity);
  end;
end;

procedure TMyList<T>.Add(const Item: T);
begin
  Grow;
  List[Counter] := Item;
  Inc(Counter);
end;
function TMyList<T>.GetItemsCounter(const Number: Integer): T;
begin
  if (Number >= 0) and (Number < Counter) then
    Result := List[Number]
  else
    raise Exception.Create('Index out of bounds');
end;

procedure TMyList<T>.DeleteCounter(const Number: Integer);
begin
  if (Number >= 0) and (Number < Counter) then
  begin
    if Number < Counter - 1 then
      System.Move(List[Number + 1], List[Number], (Counter - Number - 1) * SizeOf(T));
    Dec(Counter);
    SetLength(List, Counter);
    Dec(Capacity);
  end
  else
    raise Exception.Create('Index out of bounds');
end;

function TMyList<T>.LengthList: Integer;
begin
  Result := Counter;
end;

procedure TMyList<T>.Assigment(counter1: Integer; counter2: Integer);
begin
  if (counter1 >= 0) and (counter1 < Counter) and (counter2 >= 0) and (counter2 < Counter) then
    List[counter1] := List[counter2]
  else
    raise Exception.Create('Index out of bounds');
end;

procedure TMyList<T>.Assigment(counter1: Integer; var asign: T);
begin
  if (counter1 >= 0) and (counter1 < Counter) then
    List[counter1] := asign
  else
    raise Exception.Create('Index out of bounds');
end;

procedure TMyList<T>.Swap(Item1: Integer; Item2: Integer);
var
  temp: T;
begin
  if (Item1 >= 0) and (Item1 < Counter) and (Item2 >= 0) and (Item2 < Counter) then
  begin
    temp := List[Item1];
    List[Item1] := List[Item2];
    List[Item2] := temp;
  end
  else
    raise Exception.Create('Index out of bounds');
end;


end.

