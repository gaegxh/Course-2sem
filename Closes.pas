unit Cloth;

interface
  uses TmyList,SysUtils;
type

  TColor = (Red, // �������
    Blue, // �����
    Green, // �������
    Yellow, // ������
    Orange, // ���������
    Purple, // ����������
    Pink, // �������
    Brown, // ����������
    Black, // ������
    White, // �����
    Gray, // �����
    Cyan, // �������
    Magenta, // ���������
    Turqun, // ���������-�������
    Indigo, // ������
    Teal, // ����-�������
    Goloise, // ���������
    Lavender, // ����������
    Marood, // �������
    Silver // ����������
    );

    Tsize=(XXS,XS,S,M,L,XL,XXL);
    Tgender=(Man,Women);

type
  TModel = (oversize, // ������� ������
    slimfit, // �������� ��� ��������
    regular, // �����������
    athletic, // ������������
    tall, // �������
    petite, // ��������� ����
    plus_size, // ���� ������
    curvy, // ������ ������
    hourglass, // �������� ����
    pear // �����
    );

   TCloses = record
    id: integer;
    model: Tmodel;
    name: string[12];
    size: string[5];
    waist: integer;
    shoulders: integer;
    hips: integer;
    color: Tcolor;
    gender:Tgender;
  end;

  TSearch=record
    name:string[15];
    index:integer;
  end;

  var
  ListSearch:TmyList<TCloses>;
  ListCloses:TmyList<TCloses>;


implementation


procedure Initializ(var List:TmyList<TCloses>);
var
tempClose:TCloses;
begin


end;








end.
