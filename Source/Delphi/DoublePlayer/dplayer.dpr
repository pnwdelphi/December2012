program dplayer;

uses
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  MediaPlayer.StateConversion in 'MediaPlayer.StateConversion.pas',
  fScreens in 'fScreens.pas' {fScreenWall},
  fBase in 'fBase.pas' {frmBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfScreenWall, fScreenWall);
  Application.CreateForm(TfrmBase, frmBase);
  Application.Run;
end.
