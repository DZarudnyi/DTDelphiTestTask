unit TestTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids;

type
  TMainForm = class(TForm)
    pMainPanel: TPanel;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    pAddContact: TPanel;
    lblFirstName: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
