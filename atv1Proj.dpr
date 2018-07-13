program atv1Proj;

uses
  Vcl.Forms,
  Atividade1 in 'Atividade1.pas' {Form1},
  Atividade1Janela2 in 'Atividade1Janela2.pas' {Form2},
  database in 'database.pas' {DataModule1: TDataModule},
  UNadmingroup in 'UNadmingroup.pas',
  UNspeciality in 'UNspeciality.pas',
  UNcontroller in 'UNcontroller.pas',
  Atividade1Janela3 in 'Atividade1Janela3.pas' {Form3},
  Atividade1Janela4 in 'Atividade1Janela4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
