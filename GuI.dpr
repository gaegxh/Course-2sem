program GuI;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Autor in 'Autor.pas' {AutForm},
  Reg in 'Reg.pas' {RegForm},
  TmyList in 'TmyList.pas',
  Users in 'Users.pas',
  DataBaseUser in 'DataBaseUser.pas',
  Cloth in 'Cloth.pas',
  Search in 'Search.pas' {SearForm},
  AddStyle in 'AddStyle.pas' {NewStyleForm},
  Mylook in 'Mylook.pas' {MylookForm},
  Styles in 'Styles.pas',
  LookFashion in 'LookFashion.pas',
  Mystyle in 'Mystyle.pas' {MyStyleForm},
  EditUser in 'EditUser.pas' {EditForm},
  GenreteLook in 'GenreteLook.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAutForm, AutForm);
  Application.CreateForm(TRegForm, RegForm);
  Application.CreateForm(TSearForm, SearForm);
  Application.CreateForm(TNewStyleForm, NewStyleForm);
  Application.CreateForm(TMylookForm, MylookForm);
  Application.CreateForm(TMyStyleForm, MyStyleForm);
  Application.CreateForm(TEditForm, EditForm);
  Application.Run;
end.
