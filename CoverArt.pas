unit CoverArt;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, IniFilesDX, System.IOUtils, System.Types,
  Vcl.Filectrl, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, HideListView, SpTBXItem, SpTBXControls, SpTBXDkPanels, TB2Item,
  Vcl.Menus;

type
  TfrmCoverArt = class(TForm)
    lvwList: THideListView;
    imgCover: TImageList;
    Splitter: TSpTBXSplitter;
    SpTBXPanel1: TSpTBXPanel;
    imgView: TImage;
    lblInfo: TLabel;
    popCover: TSpTBXPopupMenu;
    popCoverExport: TSpTBXItem;
    popView: TSpTBXPopupMenu;
    popView_Export: TSpTBXItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lvwListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvwListCreateItemClass(Sender: TCustomListView;
      var ItemClass: TListItemClass);
    procedure popCoverExportClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvwListCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure popView_ExportClick(Sender: TObject);
  private
    { Private 宣言 }
    procedure _LoadSettings;
    procedure _SaveSettings;
    procedure _DestroyListItems;
  public
    { Public 宣言 }
    procedure _LoadCoverArt(const sFilename: String);
  end;

var
  frmCoverArt: TfrmCoverArt;
  bCoverList : array of TBitmap;

implementation

{$R *.dfm}

uses
  HideUtils,
  Main,
  TagsLibrary,
  Utils,
  dp;

type
  TCover = class(TListItem)
  private
    sMediaFilename: String;
    sFilesize     : String;
    sDescription  : String;
    sPictureType  : String;
    iPictureType  : Integer;
    iAPICIndex    : Integer;
    bmpCoverArt   : TBitmap;
  end;

procedure TfrmCoverArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _DestroyListItems;
  _SaveSettings;
  Release;
  frmCoverArt := nil;   //フォーム名に変更する
end;

procedure TfrmCoverArt.FormCreate(Sender: TObject);
begin
  DisableVclStyles(Self);
  _LoadSettings;
end;

procedure TfrmCoverArt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : Close;
  end;
end;

procedure TfrmCoverArt.lvwListCreateItemClass(Sender: TCustomListView;
  var ItemClass: TListItemClass);
begin
  ItemClass := TCover;
end;

procedure TfrmCoverArt.lvwListCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  lvwList.ColorizeLines(Item, State, DefaultDraw);
end;

procedure TfrmCoverArt.lvwListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  imgView.Picture.Assign(TCover(Item).bmpCoverArt);
  imgView.Hint := TCover(Item).sMediaFilename;
  imgView.Tag  := TCover(Item).iAPICIndex;
  lblInfo.Caption := Format('%s / %s / %s',
                            [StrDef(TCover(Item).sPictureType, '<no picture type>'),
                             TCover(Item).sFilesize,
                             StrDef(TCover(Item).sDescription, '<no description>')]);
end;

procedure TfrmCoverArt.popCoverExportClick(Sender: TObject);
var
  item : TCover;
  idx : Integer;
begin
  item := TCover(lvwList.Selected);
  if item <> nil then
  begin
    idx := TCover(lvwList.Selected).iAPICIndex;
    ut_ExportAPIC(TCover(lvwList.Selected).sMediaFilename, idx);
  end;
end;

procedure TfrmCoverArt.popView_ExportClick(Sender: TObject);
begin
  ut_ExportAPIC(imgView.Hint, imgView.Tag);
end;

procedure TfrmCoverArt._DestroyListItems;
var
  i : Integer;
begin
  for i := lvwList.Items.Count-1 downto 0 do
    TCover(lvwList.Items[i]).bmpCoverArt.Free;
end;

procedure TfrmCoverArt._LoadCoverArt(const sFilename: String);
var
  ms : TMemoryStream;
  item : TCover;
  t : TTags;
  i : Integer;
  bmp, bmpList : TBitmap;
begin
  t := TTags.Create;
  ms := TMemoryStream.Create;
  try
    ms.LoadFromFile(sFilename);
    t.LoadFromStream(ms);
//    t.LoadFromFile(sFilename);
    if t.Loaded then
    begin
      for i := 0 to t.CoverArtCount-1 do
      begin
        bmp := TBitmap.Create;
        bmpList := TBitmap.Create;
        try
          t.LoadCoverArt(bmp, t, i);
          //Add to ImageList
          ut_ResizeImage(bmp, bmpList, 90);
          imgCover.AddMasked(bmpList, clFuchsia);
          //Create Listitem
          item := TCover(lvwList.Items.Add);
          item.ImageIndex     := imgCover.Count-1;
          item.Caption        := ut_ConvertPictureID2String(t.CoverArts[i].CoverType);
          item.sMediaFilename := sFilename;
          item.sFilesize      := Format('%d x %d', [bmp.Width, bmp.Height]);
          item.sDescription   := t.CoverArts[i].Description;
          item.sPictureType   := item.Caption;
          item.iPictureType   := t.CoverArts[i].CoverType;
          item.iAPICIndex     := i;
          item.bmpCoverArt    := TBitmap.Create;
          item.bmpCoverArt.Assign(bmp);
        finally
          bmp.Free;
          bmpList.Free;
        end;
      end;
      item := TCover(lvwList.Items[0]);
      //カバーを表示する
      imgView.Picture.Assign(item.bmpCoverArt);// (lvwList.Items[0]).bmpCoverArt);
      //カバーを表示する
      imgView.Picture.Assign(item.bmpCoverArt);// TCover(lvwList.Items[0]).bmpCoverArt);
      imgView.Hint := item.sMediaFilename;// TCover(lvwList.Items[0]).sMediaFilename;
      imgView.Tag  := item.iAPICIndex;// TCover(lvwList.Items[0]).iAPICIndex;
//      item := TCover(lvwList.Items[0]);
      lblInfo.Caption := Format('%s / %d x %d / %s',
                                [StrDef(item.sPictureType, '<no picture type>'),
                                 item.bmpCoverArt.width,
                                 item.bmpCoverArt.Height,
                                 StrDef(item.sDescription, '<no description>')]);
    end;
  finally
    t.Free;
    ms.Free;
  end;
end;

procedure TfrmCoverArt._LoadSettings;
var
  ini : TMemIniFile;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.ReadWindowPosition(Self.Name, Self);
    lvwList.Width := ini.ReadInteger(Self.Name, 'lvwList.Width', lvwList.Width);
    Self.Font.Name := ini.ReadString('Font', 'FontName', '游ゴシック Medium');
    Self.Font.Size := ini.ReadInteger('Font', 'FontSize', 10);
  finally
    ini.Free;
  end;
end;

procedure TfrmCoverArt._SaveSettings;
var
  ini : TMemIniFile;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.WriteWindowPosition(Self.Name, Self);
    ini.WriteInteger(Self.Name, 'lvwList.Width', lvwList.Width);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

end.
