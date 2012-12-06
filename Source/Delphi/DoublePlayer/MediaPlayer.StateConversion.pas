unit MediaPlayer.StateConversion;

interface

uses System.Classes, System.SysUtils, Data.Bind.Components, System.Bindings.Helper, System.Generics.Collections,
  FMX.Types, FMX.Media;


implementation

uses System.Bindings.EvalProtocol, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Consts;



const
  sMediaPlayerStateToString = 'MediaPlayerStateToString';
  sThisUnit = 'MediaPlayer.StateConversion';
  sMediaPlayerStateToStringDesc = 'Assigns a Media Player State to a String';

procedure RegisterOutputConversions;
begin
  // Assign String from State
    TValueRefConverterFactory.RegisterConversion(TypeInfo(TMediaState), TypeInfo(string),
    TConverterDescription.Create(
        procedure(const InValue: TValue; var OutValue: TValue)
        begin
          Assert(InValue.IsType(TypeInfo(TMediaState)), 'Input needs to be MediaState');

          case TMediaState(InValue.AsOrdinal) of
          TMediaState.Unavailable:
            OutValue := TValue.From<string>('Unavailable');
          TMediaState.Playing:
            OutValue := TValue.From<string>('Playing');
          TMediaState.Stopped:
            OutValue := TValue.From<string>('Stopped');
          else
            OutValue := TValue.From<string>('UNKNOW!');
          end;
        end,
    sMediaPlayerStateToString,
    sMediaPlayerStateToString,
    sThisUnit, True, sMediaPlayerStateToStringDesc, FMX.Types.TStyledControl)  // fmx only
  );
end;

procedure UnregisterOutputConversions;
begin
  TValueRefConverterFactory.UnRegisterConversion(
    TypeInfo(TMediaState), TypeInfo(string));
end;


initialization
  RegisterOutputConversions;
finalization
  UnregisterOutputConversions;
end.
