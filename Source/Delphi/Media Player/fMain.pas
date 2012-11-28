unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Media,
  FMX.Layouts, FMX.ListBox;

type
  TForm1 = class(TForm)
    MainLayout: TLayout;
    ControlPlayLayout: TLayout;
    TextLayout: TLayout;
    MediaPlayerControl1: TMediaPlayerControl;
    PreviousButton: TButton;
    PlayButton: TButton;
    PauseButton: TButton;
    StopButton: TButton;
    NextButton: TButton;
    VolumeTrackBar: TTrackBar;
    PositionTrackBar: TTrackBar;
    ShuffleCheckBox: TCheckBox;
    NameLabel: TLabel;
    DurationLabel: TLabel;
    PlayListLayout: TLayout;
    ControlListLayout: TLayout;
    PlayListBox: TListBox;
    LoadFileButton: TButton;
    ClearAllButton: TButton;
    ClearButton: TButton;
    MediaPlayer1: TMediaPlayer;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    procedure LoadFileButtonClick(Sender: TObject);
    procedure ClearAllButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);
    procedure PlayListBoxDblClick(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure PreviousButtonClick(Sender: TObject);
    procedure VolumeTrackBarChange(Sender: TObject);
    procedure PositionTrackBarChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ShuffleCheckBoxChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Played: array of integer;
    CurrentPlayedIndex: integer;
    procedure AddToPlayedList(Index: integer);
    procedure DisplayText(str: string);
    procedure PlayNext();
    procedure FindAndPlay(index: integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.AddToPlayedList(Index: integer);
var
  Len: Integer;
begin
  Len := Length(Played);
  SetLength(Played, Len + 1);
  Played[Len] := Index;
  CurrentPlayedIndex := Len;
  PlayListBox.ItemIndex := Index;
end;

procedure TForm1.ClearAllButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if (PlayListBox.Count > 0) then
  begin
    for I := 0 to PlayListBox.Count -1 do
      PlayListBox.Items.Objects[i].Free;
    PlayListBox.Clear;
    PlayListBox.ItemIndex := -1;
    SetLength(Played, 0);
    CurrentPlayedIndex := -1;
    MediaPlayer1.Clear;
    NameLabel.Text := EmptyStr;
    DurationLabel.Text := EmptyStr;
  end;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
var
  i, j: integer;
begin
  if PlayListBox.Count < 0 then
    Exit;

  PlayListBox.Items.Objects[PlayListBox.ItemIndex].Free;
  PlayListBox.Items.Delete(PlayListBox.ItemIndex);
  j := 0;
  // Makes sure that deleted media is not on the playlist
  while j < Length(Played) - 1 do
  begin
    if (Played[j] = PlayListBox.ItemIndex)  then
    begin
      for i := j to Length(Played)-1 do
        Played[i] := Played[I+1];
      SetLength(Played, Length(Played)-1);
    end;
    j := j + 1;
  end;
end;

procedure TForm1.DisplayText(str: string);
var
  DurationMin: integer;
  DurationSec: integer;
begin
  NameLabel.Text := str;
  DurationMin := MediaPlayer1.Duration div 10000 div 60000;
  DurationSec := MediaPlayer1.Duration div 10000 mod 60000 div 1000;
  DurationLabel.Text := IntToStr(DurationMin) + ':' + IntToStr(DurationSec);
end;

procedure TForm1.FindAndPlay(index: integer);
begin
  MediaPlayer1.Clear;
  PositionTrackBar.Value := PositionTrackbar.Min;
  MediaPlayer1.FileName := TMedia(PlayListBox.Items.Objects[index]).FileName;
  if Assigned(MediaPlayer1.Media) then
  begin
    MediaPlayer1.Play;
    PositionTrackBar.Max := MediaPlayer1.Duration;
    DisplayText(extractFileName(MediaPlayer1.FileName));
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  I: integer;
begin
  if (PlayListBox.Count > 0) then
    for I := 0 to PlayListBox.Count - 1 do
      PlayListBox.Items.Objects[I].Free;
end;

procedure TForm1.LoadFileButtonClick(Sender: TObject);
var
  Files: TStrings;
  i: Integer;
  Media: TMedia;
begin
  Files := TStrings.Create;
  // Only supported files
  OpenDialog1.Filter := TMediaCodecManager.GetFilterString;
  if (OpenDialog1.Execute) then
  begin
    Files := OpenDialog1.Files;
    for i := 0 to Files.Count -1 do
    begin
      Media := TMedia.Create(Files[i]);
      PlayListBox.Items.AddObject(ExtractFileName(Files[i]), Media);
    end;
  end;
  Files.Free;
end;


procedure TForm1.NextButtonClick(Sender: TObject);
begin
  if (PlayListBox.Count > 0) then
  begin
    PlayNext;
  end;
end;

procedure TForm1.PauseButtonClick(Sender: TObject);
begin
  if Assigned(MediaPlayer1.Media) then
  begin
    MediaPlayer1.Stop;
  end;
end;

procedure TForm1.PlayButtonClick(Sender: TObject);
begin
  if Assigned(MediaPlayer1.Media)  then
  begin
    if (MediaPlayer1.State = TMediaState.Stopped)and
       (MediaPlayer1.CurrentTime < MediaPlayer1.Duration) then
    begin
      MediaPlayer1.Play;
      PositionTrackBar.Max := MediaPlayer1.Duration;
      DisplayText(extractFileName(MediaPlayer1.FileName));
    end
    else
    begin
      MediaPlayer1.CurrentTime := 0;
    end;
  end
  else
  begin
    if (PlayListBox.Count = 0) then
      Exit;
    if (PlayListBox.ItemIndex = -1) then
      PlayListBox.ItemIndex := 0;
    FindAndPlay(PlayListBox.ItemIndex);
    if (ShuffleCheckBox.IsChecked) then
      AddToPlayedList(PlayListBox.ItemIndex);
  end;
end;

procedure TForm1.PlayListBoxDblClick(Sender: TObject);
begin
  if (PlayListBox.Count < 0) then
    Exit;
  MediaPlayer1.Clear;
  MediaPlayer1.FileName := TMedia(PlayListBox.Items.Objects[PlayListBox.ItemIndex]).FileName;
  if Assigned(MediaPlayer1.Media) then
  begin
    MediaPlayer1.Play;
    PositionTrackBar.Max := MediaPlayer1.Duration;
    DisplayText(ExtractFileName(MediaPlayer1.FileName));
    AddToPlayedList(PlayListBox.Items.IndexOf(ExtractFileName(MediaPlayer1.FileName)));
  end;
end;

procedure TForm1.PlayNext;
begin
  if (ShuffleCheckBox.IsChecked) then
  begin
    if (CurrentPlayedIndex < Length(Played) - 1) then
    begin
      CurrentPlayedIndex := CurrentPlayedIndex + 1;
      FindAndPlay(Played[CurrentPlayedIndex]);
    end
    else
    begin
      index := Random(PlayListBox.Count - 1);
      FindAndPlay(index);
      AddToPlayedList(index);
    end;
    PlayListBox.ItemIndex := Played[CurrentPlayedIndex];
  end
  else
  begin
    FindAndPlay(PlayListBox.ItemIndex + 1);
    PlayListBox.ItemIndex := PlayListBox.ItemIndex + 1;
  end;
end;

procedure TForm1.PositionTrackBarChange(Sender: TObject);
begin
  if PositionTrackBar.Tag = 0 then
    MediaPlayer1.CurrentTime :=  Round(PositionTrackBar.Value);
end;

procedure TForm1.PreviousButtonClick(Sender: TObject);
begin
  if ShuffleCheckBox.IsChecked then
  begin
    if (Length(Played) > 0) and (CurrentPlayedIndex > 0) then
    begin
      CurrentPlayedIndex := CurrentPlayedIndex - 1;
      FindAndPlay(Played[CurrentPlayedIndex]);
      PlayListBox.ItemIndex := Played[CurrentPlayedIndex];
    end;
  end
  else if (PlayListBox.ItemIndex > 0) then
  begin
    FindAndPlay(PlayListBox.ItemIndex - 1);
    PlayListBox.ItemIndex := PlayListBox.ItemIndex - 1;
  end;
end;

procedure TForm1.ShuffleCheckBoxChange(Sender: TObject);
begin
  if (not ShuffleCheckBox.IsChecked) then
  begin
    SetLength(Played, 0);
    CurrentPlayedIndex := -1;
  end;
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  if Assigned(MediaPlayer1.Media) then
  begin
    MediaPlayer1.Stop;
    MediaPlayer1.CurrentTime := 0;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  PositionTrackBar.Tag := 1;
  PositionTrackBar.Value := MediaPlayer1.CurrentTime;
  PositionTrackBar.Tag := 0;
  if (MediaPlayer1.State = TMediaState.Playing) and
     (MediaPlayer1.CurrentTime = MediaPlayer1.Duration) then
    PlayNext;

end;

procedure TForm1.VolumeTrackBarChange(Sender: TObject);
begin
  MediaPlayer1.Volume := VolumeTrackBar.Value;
end;

end.
