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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  if Assigned(MediaPlayer1.Media) then
     MediaPlayer1.Play;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Assigned(MediaPlayer2.Media) then
    MediaPlayer2.Play;
end;

end.
