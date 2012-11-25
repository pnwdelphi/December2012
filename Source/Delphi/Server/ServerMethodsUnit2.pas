unit ServerMethodsUnit2;

interface

uses
  SysUtils, Classes, DSServer;

type
{$METHODINFO ON}
  TServerMethods2 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation

uses StrUtils;

function TServerMethods2.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods2.ReverseString(Value: string): string;
begin
  Result := StrUtils.ReverseString(Value);
end;
end.

