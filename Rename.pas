unit Rename;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, IniFilesDX, System.IOUtils, System.Types,
  Vcl.Filectrl, Vcl.StdCtrls, Vcl.ComCtrls, HideListView, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmRename = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    lblCurrentName: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    radInputName: TRadioButton;
    edtInputName: TEdit;
    radCreateFromTag: TRadioButton;
    edtFormat: TEdit;
    lblFormat: TStaticText;
    imgNext: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure radInputNameClick(Sender: TObject);
    procedure radCreateFromTagClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgNextClick(Sender: TObject);
  private
    { Private 宣言 }
    procedure _LoadSettings;
    procedure _SaveSettings;
    procedure _RenameByInput;
    procedure _RenameByTag;
  public
    { Public 宣言 }
  end;

var
  frmRename: TfrmRename;

implementation

{$R *.dfm}

uses
  HideUtils,
  Main,
  TagsLibrary,
  dp;

procedure TfrmRename.btnCancelClick(Sender: TObject);
begin
   close;
end;

procedure TfrmRename.btnOKClick(Sender: TObject);
begin
  btnOK.Enabled := False;
  if radInputName.Checked then
    _RenameByInput
  else
    _RenameByTag;
  btnOK.Enabled := True;
end;

procedure TfrmRename.FormActivate(Sender: TObject);
var
  item : TListItemEx;
  s : String;
begin
  item := TListItemEx(frmMain.lvwList.Selected);
  if item <> nil then
  begin
    s := ExtractFileBody(item.sFullPath);
    lblCurrentName.Caption := s;
    edtInputName.Text := s;
  end;
end;

procedure TfrmRename.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _SaveSettings;
  Release;
  frmRename := nil;   //フォーム名に変更する
end;

procedure TfrmRename.FormCreate(Sender: TObject);
begin
  DisableVclStyles(Self);
  _LoadSettings;
end;

procedure TfrmRename.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : Close;
  end;
end;

procedure TfrmRename.imgNextClick(Sender: TObject);
var
  item : TListItemEx;
  s : String;
begin
  item := TListItemEx(frmMain.lvwList.Selected);
  if (item <> nil) and (item.Index < frmMain.lvwList.Items.Count-2) then
  begin
    item.Selected := False;
    item := TListItemEx(frmMain.lvwList.Items[item.Index+1]);
    s := ExtractFileBody(item.sFullPath);
    lblCurrentName.Caption := s;
    edtInputName.Text := s;
    item.Selected := True;
  end;
end;

procedure TfrmRename.radCreateFromTagClick(Sender: TObject);
begin
  edtFormat.Enabled    := True;
  edtInputName.Enabled := False;
  edtFormat.SetFocus;
end;

procedure TfrmRename.radInputNameClick(Sender: TObject);
begin
  edtInputName.Enabled := True;
  edtFormat.Enabled    := False;
  edtInputName.SetFocus;
end;

procedure TfrmRename._LoadSettings;
const
  FORMAT_STR = '%TrackNum = トラック番号(01,02,03...)' + #13#10 +
               '%Title = タイトル' + #13#10 +
               '%Artist = アーティスト' + #13#10 +
               '%AlbumArtist = アルバムアーティスト' + #13#10 +
               '%Year = 年';
var
  ini : TMemIniFile;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.ReadWindow(Self.Name, Self);
    Self.Font.Name := ini.ReadString('Font', 'FontName', '游ゴシック Medium');
    Self.Font.Size := ini.ReadInteger('Font', 'FontSize', 10);
  finally
    ini.Free;
  end;
  lblFormat.Caption := FORMAT_STR;
end;

procedure TfrmRename._RenameByInput;
var
  t : TTags;
  item : TListItemEx;
  sDir, sExt, sNewPath : String;
begin
  item := TListItemEx(frmMain.lvwList.Selected);
  if item = nil then
    Exit;

  sDir := ExtractFilePath(item.sFullPath);
  sExt := ExtractFileExt(item.sFullPath);
  sNewPath := Format('%s%s%s', [sDir, Trim(edtInputName.Text), sExt]);
  RenameFile(item.sFullPath, sNewPath);
  //リストの情報を更新する
  t := TTags.Create;
  try
    t.LoadFromFile(sNewPath);
    item.Caption := StrDef(t.GetTag(TAG_TITLE), Trim(edtInputName.Text));
    item.sFullPath := sNewPath;
  finally
    t.Free;
  end;
end;

procedure TfrmRename._RenameByTag;
var
  item : TListItemEx;
  t : TTags;
  sExt, sFilename, sDir, sName, sFormat, sTrackNum, sTitle, sArtist, sAlbumArtist, sYear : String;
  i : Integer;
begin
  for i := 0 to frmMain.lvwList.Items.Count-1 do
  begin
    item := TListItemEx(frmMain.lvwList.Items[i]);
    if item.Selected then
    begin
      sFilename := item.sFullPath;
      sExt := ExtractFileExt(sFilename);
      t := TTags.Create;
      try
        t.LoadFromFile(sFilename);
        sTrackNum     := t.GetTag(TAG_TRACKNUMBER);
        sTitle        := t.GetTag(TAG_TITLE);
        sArtist       := t.GetTag(TAG_ARTIST);
        sAlbumArtist  := t.GetTag(TAG_ALBUMARTIST);
        sYear         := t.GetTag(TAG_YEAR);
        sFormat       := Trim(edtFormat.Text);
        if sTrackNum <> '' then
        begin
          sTrackNum := Format('%.2d', [StrToInt(sTrackNum)]);
        end;
        sName := ReplaceTextEx(sFormat, ['%TrackNum', '%Title', '%Artist', '%AlbumArtist', '%Year'],
                                        [ sTrackNum,   sTitle,   sArtist,    sAlbumArtist,  sYear]);
        sDir := ExtractFilePath(sFilename);
        RenameFile(sFilename, sDir + sName + sExt);
      finally
        t.Free;
      end;
    end;
  end;
  frmMain._ListMusicFiles;
end;

procedure TfrmRename._SaveSettings;
var
  ini : TMemIniFile;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.WriteWindow(Self.Name, Self);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

end.
