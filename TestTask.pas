unit TestTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, ShellAPI, ShlObj,
  Vcl.ComCtrls, Vcl.ExtDlgs, Vcl.Mask;

type
  TMainForm = class(TForm)
    pMainPanel: TPanel;
    pnlAddContact: TPanel;
    gbContactInformation: TGroupBox;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    lblPhoneNumber: TLabel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    btnSave: TButton;
    pContacts: TPanel;
    gbBottom: TGroupBox;
    btnSaveFile: TButton;
    btnLoadFile: TButton;
    lvTable: TListView;
    OpenTxtDlg: TOpenTextFileDialog;
    btnDelete: TButton;
    mEdPhoneNumber: TMaskEdit;
    procedure btnLoadFileClick(Sender: TObject);
    procedure FillListView(line: string);
    procedure btnSaveClick(Sender: TObject);
    procedure lvTableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);

  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  lvTable.Items[lvTable.ItemIndex].Delete;
end;

procedure TMainForm.btnLoadFileClick(Sender: TObject);
var
  reader : TStreamReader;
  stream : TFileStream;
  fileLocation, line : string;
  Encoding : TEncoding;
  EncIndex : Integer;
begin
  if OpenTxtDlg.Execute(Self.Handle) then
  begin
    fileLocation := OpenTxtDlg.FileName;
    EncIndex := OpenTxtDlg.EncodingIndex;
    Encoding := OpenTxtDlg.Encodings.Objects[EncIndex] as TEncoding;

    if FileExists(fileLocation) then
    begin
      stream := TFileStream.Create(fileLocation, fmOpenRead or fmShareDenyNone);
      reader := TStreamReader.Create(stream);
      try
        reader := TStreamReader.Create(stream, TEncoding.Default);
        while not reader.EndOfStream do
        begin
          FillListView(reader.ReadLine);
        end;
        reader.Free;
      finally
        stream.Free;
      end;
    end
    else
    begin
      raise Exception.Create('File does not exist.');
    end;
  end;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
begin
  if (edtFirstName.Text = '') or (edtLastName.Text = '') then
    raise Exception.Create('First and Last name must not be empty!');
  if (lvTable.ItemIndex <> -1) then
  begin
    with lvTable.Items[lvTable.ItemIndex] do
    begin
      Caption := edtFirstName.Text + ' ' + edtLastName.Text;
      SubItems[0] := mEdPhoneNumber.Text;
      SubItems[1] := edtEmail.Text;
    end;
  end
  else
  begin
    FillListView(edtFirstName.Text
                  + ' ' + edtLastName.Text
                  + ' ' + mEdPhoneNumber.Text
                  + ' ' + edtEmail.Text);
  end;
end;

procedure TMainForm.btnSaveFileClick(Sender: TObject);
var
  output : TStreamWriter;
  i: Integer;
begin
  output := TStreamWriter.Create('FullContactsList.txt', false, TEncoding.UTF8);
  try
    for i := 0 to lvTable.Items.Count - 1 do
    begin
      with lvTable.Items[i] do
      begin
        output.WriteLine(Caption + ' ' + SubItems[0] + ' ' + SubItems[1]);
      end;
    end;
  finally
    output.Close;
    output.Free;
  end;
end;

procedure TMainForm.FillListView(line: string);
var
  i: Integer;
  lineSplit : TArray<string>;
begin
  lineSplit := line.Trim.Split([' ']);
  with lvTable.Items.Add do begin
    Caption := lineSplit[0] + ' ' + lineSplit[1];
    SubItems.Add(lineSplit[2]);
    SubItems.Add(lineSplit[3]);
    lvTable.Refresh;
  end;
end;

procedure TMainForm.lvTableSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  captionSplit : TArray<string>;
begin
  if Item.Selected then
  begin
    btnDelete.Enabled := true;
    with lvTable.Items[lvTable.ItemIndex] do
    begin
      captionSplit := Caption.Split([' ']);
      edtFirstName.Text := captionSplit[0];
      edtLastName.Text := captionSplit[1];
      mEdPhoneNumber.EditText := SubItems[0];
      edtEmail.Text := SubItems[1];
    end;
  end
  else
  begin
    btnDelete.Enabled := false;
    edtFirstName.Clear;
    edtLastName.Clear;
    mEdPhoneNumber.Clear;
    edtEmail.Clear;
  end;
end;

end.
