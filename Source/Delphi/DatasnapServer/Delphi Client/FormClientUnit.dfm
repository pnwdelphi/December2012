object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Delphi DataSnap  Client'
  ClientHeight = 337
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 581
    Height = 296
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 240
      Height = 25
      DataSource = DataSource1
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 273
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Active'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object Button1: TButton
      Left = 344
      Top = 9
      Width = 105
      Height = 25
      Caption = 'Apply Updates'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=$ASSEMBLY_VERSION$,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'Filters={}')
    Connected = True
    Left = 57
    Top = 81
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 160
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmployee'
    RemoteServer = DSProviderConnection1
    Left = 264
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
    Top = 72
  end
end
