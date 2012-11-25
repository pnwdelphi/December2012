unit FormClientUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXDataSnap, DBXCommon, DBClient, DSConnect, DB, SqlExpr, StdCtrls,
  ExtCtrls, DBCtrls, Grids, DBGrids, IPPeerClient;

type
  TForm3 = class(TForm)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
  ClientDataSet1.Active := CheckBox1.Checked;
end;

end.
