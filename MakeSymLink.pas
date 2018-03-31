unit MakeSymLink;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, IniFilesDX, System.IOUtils, System.Types,
  Vcl.Filectrl, SpTBXEditors, Vcl.StdCtrls, Vcl.ComCtrls, HideTreeView,
  untOpenFolder, Vcl.ExtCtrls, HideBack;

type
  TfrmMakeSymLink = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtNewFolder: TEdit;
    HideBack1: THideBack;
    Label1: TLabel;
    Label2: TLabel;
    edtSrc: TButtonedEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtSrcRightButtonClick(Sender: TObject);
  private
    { Private 宣言 }
    procedure _LoadSettings;
    procedure _SaveSettings;
    procedure _Execute;
  public
    { Public 宣言 }
  end;

var
  frmMakeSymLink: TfrmMakeSymLink;

implementation

{$R *.dfm}

uses
  Main,
  HideUtils,
  Utils,
  dp;

procedure TfrmMakeSymLink.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMakeSymLink.btnOkClick(Sender: TObject);
begin
  _Execute;
  Close;
end;

procedure TfrmMakeSymLink.edtSrcRightButtonClick(Sender: TObject);
var
  sRoot, sSelect : String;
begin
  if SelectDirectory('音楽ファイルのあるフォルダを選択', sRoot, sSelect) then
    edtSrc.Text := sSelect;
end;

procedure TfrmMakeSymLink.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _SaveSettings;
  Release;
  frmMakeSymLink := nil;   //フォーム名に変更する
end;

procedure TfrmMakeSymLink.FormCreate(Sender: TObject);
begin
  DisableVclStyles(Self);
  _LoadSettings;
end;

procedure TfrmMakeSymLink._Execute;
const
  m_InvalidName = 'フォルダ名に使用できない文字が含まれています。';
var
  n : TTreeNode;
  s, sSrcPath, sDstPath : String;
  sl : TStringList;
begin
  s := Trim(edtNewFolder.Text);
  if Not IsValidFileName(s) then
  begin
    ShowMessage(m_InvalidName, mtError);
  	Exit;
  end;

  //処理開始
  sl := TStringList.Create;
  try
    n := frmMain.tvwTree.Selected;
    sSrcPath := av.sMusicFolder + frmMain.tvwTree.GetFullNodePath(n) + '\' + edtNewFolder.Text;
    sDstPath := Trim(edtSrc.Text);
    sl.Add('chcp');
    sl.Add('chcp 65001');
    sl.Add('@echo on');
    sl.Add('SET srcDir="' + sSrcPath + '"');
    sl.Add('SET dstDir="' + sDstPath + '"');
    sl.Add('mklink /d %srcDir% %dstDir%');
    sl.Add('pause');
    sl.SaveToFile('MakeSymLink.bat', TEncoding.UTF8);
  finally
    sl.Free;
  end;
//  frmMain.tvwTree.AddChildNode(s, ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_OPEN);
  frmMain.tvwTree.AddChildNode(s, ICO_MUSIC_FOLDER_CLOSE_SYM, ICO_MUSIC_FOLDER_OPEN_SYM);
  n.AlphaSort(True);
  ShellExecuteSimple('MakeSymLink.bat');
end;

procedure TfrmMakeSymLink._LoadSettings;
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
end;

procedure TfrmMakeSymLink._SaveSettings;
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
