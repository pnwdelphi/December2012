//---------------------------------------------------------------------------
// This software is Copyright (c) 2012 Ala Fletcher.
// You may use thius software in any way you want and contribute back to the
// author with any improvements you may have made to it.
// You are also allowed to use this software or part of it for any purposes as long
// as you retain this message and credit the author for it's contribuition.
//---------------------------------------------------------------------------
unit fBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs;

type
  TfrmBase = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    function GetObjectByName(objName: string; Number: integer): TComponent;
  end;

var
  frmBase: TfrmBase;

implementation

{$R *.fmx}

function TfrmBase.GetObjectByName(objName: string; Number: integer): TComponent;
var
  ComponentName: String;
begin
  // Volume Commands can only came from TTrackbar
  ComponentName := objName + IntToStr(Number);
  Result := FindComponent(ComponentName);
end;

end.
