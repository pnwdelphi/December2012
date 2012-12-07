unit fScreens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Media, FMX.Layouts, fBase;

type
  TfScreenWall = class(TfrmBase)
    GridLayout1: TGridLayout;
    MediaPlayerControl1: TMediaPlayerControl;
    MediaPlayerControl2: TMediaPlayerControl;
    MediaPlayerControl3: TMediaPlayerControl;
    MediaPlayerControl4: TMediaPlayerControl;
    MediaPlayerControl5: TMediaPlayerControl;
    MediaPlayerControl6: TMediaPlayerControl;
    MediaPlayerControl7: TMediaPlayerControl;
    MediaPlayerControl8: TMediaPlayerControl;
    procedure GridLayout1Resize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fScreenWall: TfScreenWall;

implementation

{$R *.fmx}

procedure TfScreenWall.GridLayout1Resize(Sender: TObject);
begin
  GridLayout1.ItemHeight := (GridLayout1.Height) /2;
  GridLayout1.ItemWidth := (GridLayout1.Width) /4;
end;

procedure TfScreenWall.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caNone;
end;

end.
