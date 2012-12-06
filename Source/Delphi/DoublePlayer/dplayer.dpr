program dplayer;

uses
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  MediaPlayer.StateConversion in 'MediaPlayer.StateConversion.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
