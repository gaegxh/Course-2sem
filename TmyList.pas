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
  end;

implementation

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
  Result := List[Number];
end;

procedure TMyList<T>.DeleteCounter(const Number: Integer);
var
  I: Integer;
begin
  if (Number >= Low(List)) and (Number <= High(List)) then
  begin
    for I := Number to High(List) - 1 do
    begin
      List[I] := List[I + 1];
    end;
    SetLength(List, Capacity - 1);
    Dec(Counter);
  end;
end;

function TMyList<T>.LengthList: Integer;
begin
  Result := Counter;
end;

end.

