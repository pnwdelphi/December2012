unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.Media;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    MediaPlayer2: TMediaPlayer;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Button3: TButton;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // Only supported files
  OpenDialog1.Filter := TMediaCodecManager.GetFilterString;
  if (OpenDialog1.Execute) then
  begin
      MediaPlayer1.FileName := OpenDialog1.FileName;
  end;

  if (OpenDialog1.Execute) then
  begin
      MediaPlayer2.FileName := OpenDialog1.FileName;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if MediaPlayer1.State <> TMediaState.Unavailable  then
    if MediaPlayer1.State = TMediaState.Stopped  then
      MediaPlayer1.Play
    else
      MediaPlayer1.Stop;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if MediaPlayer2.State <> TMediaState.Unavailable  then
    if MediaPlayer2.State = TMediaState.Stopped  then
      MediaPlayer2.Play
    else
      MediaPlayer2.Stop;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  MediaPlayer1.Volume := TrackBar1.Value/100;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  MediaPlayer2.Volume := TrackBar2.Value/100;
end;

end.
