program atv1Proj;

uses
  Vcl.Forms,
  Atividade1 in 'Atividade1.pas' {Form1},
  Atividade1Janela2 in 'Atividade1Janela2.pas' {Form2},
  database in 'database.pas' {DataModule1: TDataModule},
  UNadmingroup in 'UNadmingroup.pas',
  UNspeciality in 'UNspeciality.pas',
  UNcontroller in 'UNcontroller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
