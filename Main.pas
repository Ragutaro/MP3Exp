unit Main;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, IniFilesDX, System.IOUtils, System.Types,
  Vcl.Filectrl, Vcl.StdCtrls, Vcl.ComCtrls, HideListView, SpTBXItem,
  SpTBXControls, SpTBXDkPanels, HideTreeView, Vcl.OleCtrls, WMPLib_TLB, TB2Item,
  TB2Dock, TB2Toolbar, System.ImageList, Vcl.ImgList, SpTBXSkins, PngImageList,
  SpTBXTabs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ExtDlgs, System.UITypes, DragDrop,
  DropTarget, DragDropFile, jpeg, PNGImage, Vcl.Themes, Winapi.shellapi;


type
  TListItemEx = class(TListItem)
  public
    sFullPath : String;
  end;

  TfrmMain = class(TForm)
    wmp: TWindowsMediaPlayer;
    SpTBXDock1: TSpTBXDock;
    tbrControl: TSpTBXToolbar;
    tbrStop: TSpTBXItem;
    tbrPlay: TSpTBXItem;
    tbrPause: TSpTBXItem;
    btnNext: TSpTBXItem;
    btnBefore: TSpTBXItem;
    pngToolbar: TPngImageList;
    SpTBXTabControl1: TSpTBXTabControl;
    tabTag: TSpTBXTabItem;
    tabTagDetail: TSpTBXTabSheet;
    tabSearch: TSpTBXTabItem;
    tabSearchMusic: TSpTBXTabSheet;
    tabMusic: TSpTBXTabItem;
    tabSelectMusic: TSpTBXTabSheet;
    splVert: TSpTBXSplitter;
    panRight: TSpTBXPanel;
    lvwList: THideListView;
    SpTBXSplitter2: TSpTBXSplitter;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    tbrRepeat: TSpTBXItem;
    SpTBXSeparatorItem2: TSpTBXSeparatorItem;
    tbrSelectFolder: TSpTBXItem;
    tbrEditTag: TSpTBXItem;
    tbrProgress: TSpTBXToolWindow;
    traPosition: TSpTBXTrackBar;
    lblTime: TLabel;
    timPosition: TTimer;
    panLeft: TPanel;
    tvwTree: THideTreeView;
    imgJacket: TImageList;
    memTagInfo: TMemo;
    popTvw: TSpTBXPopupMenu;
    popTvwReload: TSpTBXItem;
    popTvwDeletePRIVTags: TSpTBXItem;
    popLvw: TSpTBXPopupMenu;
    popLvwRename: TSpTBXItem;
    popTvwOpenExplorer: TSpTBXItem;
    cmbSearch: TComboBox;
    radSelected: TRadioButton;
    radRoot: TRadioButton;
    Label1: TLabel;
    lvwSearch: THideListView;
    SavePictureDialog: TSavePictureDialog;
    popTvwRenameFolder: TSpTBXItem;
    SpTBXSeparatorItem3: TSpTBXSeparatorItem;
    SpTBXSeparatorItem4: TSpTBXSeparatorItem;
    popTvwDelete: TSpTBXItem;
    popLvwDelete: TSpTBXItem;
    DropFileTarget: TDropFileTarget;
    popTvwCreateFolder: TSpTBXItem;
    Panel1: TPanel;
    SpTBXSubmenuItem1: TSpTBXSubmenuItem;
    SpTBXSeparatorItem5: TSpTBXSeparatorItem;
    popTvwPlayFolder_Shuffle: TSpTBXItem;
    popTvwPlayFolder_Numeric: TSpTBXItem;
    tbrShuffle: TSpTBXItem;
    popLvwShowAlbumArt: TSpTBXItem;
    SpTBXSeparatorItem6: TSpTBXSeparatorItem;
    popTvwNewPlaylist: TSpTBXItem;
    popLvwAddToPlaylist: TSpTBXSubmenuItem;
    popTvwSendToMP3Gain: TSpTBXItem;
    ScrollBox1: TScrollBox;
    imgLyrics: TImage;
    popTvwAdd2iTunes: TSpTBXItem;
    popLvwAdd2iTunes: TSpTBXItem;
    popTvwMakeSSymLink: TSpTBXItem;
    imgBackground: TImage;
    imgCover: TImage;
    lblAlbumYear: TLabel;
    lblArtist: TLabel;
    lblComposer: TLabel;
    lblLyricist: TLabel;
    lblTitle: TLabel;
    pngLvw: TPngImageList;
    pngTvw: TPngImageList;
    popLvwNoItems: TSpTBXItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lvwListDblClick(Sender: TObject);
    procedure tbrStopClick(Sender: TObject);
    procedure tbrPlayClick(Sender: TObject);
    procedure tbrPauseClick(Sender: TObject);
    procedure btnBeforeClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure lvwListCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure wmpPlayStateChange(ASender: TObject; NewState: Integer);
    procedure lvwListCreateItemClass(Sender: TCustomListView;
      var ItemClass: TListItemClass);
    procedure tvwTreeCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure timPositionTimer(Sender: TObject);
    procedure traPositionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure traPositionMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure traPositionMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbrEditTagClick(Sender: TObject);
    procedure lvwListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvwTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure popTvwReloadClick(Sender: TObject);
    procedure popTvwDeletePRIVTagsClick(Sender: TObject);
    procedure popLvwRenameClick(Sender: TObject);
    procedure popTvwOpenExplorerClick(Sender: TObject);
    procedure cmbSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwSearchDblClick(Sender: TObject);
    procedure lvwSearchCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tbrSelectFolderClick(Sender: TObject);
    procedure tvwTreeClick(Sender: TObject);
    procedure imgCoverClick(Sender: TObject);
    procedure popTvwRenameFolderClick(Sender: TObject);
    procedure tvwTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvwTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvwTreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popTvwDeleteClick(Sender: TObject);
    procedure lvwSearchColumnClick(Sender: TObject; Column: TListColumn);
    procedure popLvwDeleteClick(Sender: TObject);
    procedure DropFileTargetDragOver(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure DropFileTargetDrop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure popTvwCreateFolderClick(Sender: TObject);
    procedure tbrRepeatClick(Sender: TObject);
    procedure popTvwPlayFolder_NumericClick(Sender: TObject);
    procedure popTvwPlayFolder_ShuffleClick(Sender: TObject);
    procedure tbrShuffleClick(Sender: TObject);
    procedure popLvwShowAlbumArtClick(Sender: TObject);
    procedure popTvwPopup(Sender: TObject);
    procedure popTvwNewPlaylistClick(Sender: TObject);
    procedure popLvwPopup(Sender: TObject);
    procedure lvwListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvwListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure popTvwSendToMP3GainClick(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure popTvwAdd2iTunesClick(Sender: TObject);
    procedure popLvwAdd2iTunesClick(Sender: TObject);
    procedure popTvwMakeSSymLinkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvwTreeDblClick(Sender: TObject);
    procedure SpTBXSplitter2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private 宣言 }
    procedure _LoadSettings;
    procedure _SaveSettings;
    procedure _SearchFolders(node: TTreeNode; path: String);
    procedure _CreatePlayList;
    procedure _ShowLyrics(const LyricText: String);
    procedure _LoadAlbumCover;
    procedure _LoadCoverArt(bmp: TBitmap);
    procedure _SearchMedia;
    procedure _AddToPlaylist(Sender: TObject);
    procedure _PlayFromPlaylist;
    procedure _ListMediaFiles;
    procedure _ListPlaylistFiles;
    procedure _SetColors;
    procedure _ClearListItems;
    procedure _LoadAlbumCoverWhenClick;
  public
    { Public 宣言 }
    procedure _ListMusicFiles;
 end;

  TApplicationValues = record
    sMusicFolder, sCurrentSong, sCurrentDir : String;
    sValidExtentions, sPlaylistDir : String;
    sMp3Gain, sLyricsMaster : String;
    cNowPlay, cNowPlayFont, cTotal, cTotalFont, cAlbumArt : TColor;
    iX1, iY1, iX2, iY2, iX3, iY3, iX4, iY4 : Integer;
  end;

var
  frmMain: TfrmMain;
  av : TApplicationValues;

implementation

{$R *.dfm}

uses
  HideUtils,
  TagsLibrary,
  EditTag,
  Utils,
  Rename,
  CoverArt,
  MakeSymLink,
  Colors,
  dp;

const
  F_TreeView : String = 'Treeview.txt';

procedure TfrmMain.btnBeforeClick(Sender: TObject);
begin
  //
  wmp.controls.previous;
end;

procedure TfrmMain.btnNextClick(Sender: TObject);
begin
  wmp.controls.next;
end;

procedure TfrmMain.cmbSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : _SearchMedia;
  end;
end;

procedure TfrmMain.DropFileTargetDragOver(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
var
  n : TTreeNode;
begin
  n := tvwTree.GetNodeAt(APoint.X, APoint.Y);
  if n <> nil then
  	n.Selected := True;
end;

procedure TfrmMain.DropFileTargetDrop(Sender: TObject; ShiftState: TShiftState;
  APoint: TPoint; var Effect: Integer);
var
  nTarget : TTreeNode;
  sSource, sTarget, sName, sExt : String;
  i : Integer;
  sList : TStringDynArray;
begin
  nTarget := tvwTree.GetNodeAt(APoint.X, APoint.Y);
  if nTarget = nil then
    Exit;

  sSource := DropFileTarget.Files.Text;
  sTarget := av.sMusicFolder + tvwTree.GetFullNodePath(nTarget);
  if TDirectory.Exists(sSource) then
  begin
    sList := TDirectory.GetDirectories(sSource, '*', TSearchOption.soAllDirectories);
    if sList = nil then
      //サブフォルダがない場合
      tvwTree.AddChildNode(ExtractFileName(sSource), ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_OPEN)
    else
      //サブフォルダがある場合
      tvwTree.AddChildNodes(nTarget, sList, ExtractFilePath(sSource), ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_OPEN);
    //フォルダの場合
    sName := ExtractFileName(sSource);
    MoveFolder(sSource, sTarget + '\' + sName);
  end
  else
  begin
    //ファイルの場合
    for i := 0 to DropFileTarget.Files.Count-1 do
    begin
      sSource := DropFileTarget.Files[i];
      sExt := ExtractFileExt(sSource);
      sName := ExtractFileName(sSource);
      if ContainsText(av.sValidExtentions, sExt) then
        RenameFile(sSource, sTarget + '\' + sName)
      else
        ShowMessage(sName + 'は再生できない種類のファイルです。', mtError);
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wmp.controls.stop;
  wmp.close;
  _SaveSettings;
  Release;
  frmMain := nil;   //フォーム名に変更する
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  n : TTreeNode;
begin
  DisableVclStyles(Self, 'TspTBXTrackBar');
  _LoadSettings;
  if FileExists(GetApplicationPath + F_TreeView) then
  begin
  	tvwTree.LoadFromFileEx(GetApplicationPath + F_TreeView);
    _ListMusicFiles;
    //最後に開いていたアルバムを表示する
    n := tvwTree.Selected;
    if n <> nil then
    begin
    	n.MakeVisible;
    end;
  end
  else
    _SearchFolders(tvwTree.Items[0], av.sMusicFolder);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  with imgLyrics.Canvas do
  begin
  	Brush.Style := bsSolid;
    Brush.Color := $00F3F3F3;
    Pen.Style := psSolid;
    Pen.Color := $00F3F3F3;
    Rectangle(0, 0, imgLyrics.Width, imgLyrics.Height);
  end;
  Panel1.Color := av.cAlbumArt;
end;

procedure TfrmMain.imgCoverClick(Sender: TObject);
begin
  //デバッグ時はこの処理を飛ばす
	if (av.sCurrentSong = '') or (FindWindow('TfrmCoverArt', 'Album Art List')<>0) then
    Exit;
  Application.CreateForm(TfrmCoverArt, frmCoverArt);
  frmCoverArt.Show;
  frmCoverArt._LoadCoverArt(av.sCurrentSong);
end;

procedure TfrmMain.lvwListCreateItemClass(Sender: TCustomListView;
  var ItemClass: TListItemClass);
begin
  ItemClass := TListItemEx;
end;

procedure TfrmMain.lvwListCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  lvwList.ColorizeLines(Item, State, DefaultDraw);

  with lvwList.Canvas do
  begin
    Brush.Style := bsSolid;
    //再生中のアイコン
    if TListItemEx(Item).sFullPath = av.sCurrentSong then
    begin
      if ContainsText(wmp.status, '再生中') then
        Item.ImageIndex := ICO_NOW_PLAYING
      else
        Item.ImageIndex := ICO_NOT_PLAYING;

      Item.MakeVisible(True);
      Brush.Color := av.cNowPlay;
      Font.Color  := av.cNowPlayFont;
      Font.Style  := [fsBold];
    end else
      Item.ImageIndex := -1;

    //トータルタイム列
    if LeftStr(Item.Caption, 12) = 'Total Songs:' then
    begin
      Brush.Color := av.cTotal;
      Font.Color  := av.cTotalFont;
    end;
  end;
end;

procedure TfrmMain.lvwListDblClick(Sender: TObject);
var
  item : TListItemEx;
  m : IWMPMedia;
begin
  item := TListItemEx(lvwList.Selected);
  if (item <> Nil) and (LeftStr(Item.Caption, 12) <> 'Total Songs:') then
  begin
    Case tvwTree.Selected.ImageIndex of
      ICO_MUSIC_ALBUM_CLOSE, ICO_MUSIC_ALBUM_CLOSE_SYM : _CreatePlayList;
      ICO_PLAYLIST_FILE                                : _PlayFromPlaylist;
    end;
    wmp.settings.volume := 100;
    m := wmp.currentPlaylist.Item[item.Index];
    wmp.controls.playItem(m);
  end;
end;

procedure TfrmMain.lvwListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  item, itemDst, itemSrc: TListItemEx;
  sl : TStringList;
  m : IWMPMedia;
  i : Integer;
  sFile : String;
begin
  itemSrc := TListItemEx(lvwList.Selected);
  itemDst := TListItemEx(lvwList.GetItemAt(X, Y));
  if (itemDst <> nil) and (tvwTree.Selected.ImageIndex = ICO_PLAYLIST_FILE) then
  begin
    itemDst := TListItemEx(lvwList.Items.Insert(itemDst.Index));
    itemDst.Assign(itemSrc);
    itemDst.sFullPath := itemSrc.sFullPath;
    itemDst.Selected := True;
    itemDst.Focused := True;
    itemDst.ImageIndex := -1;
    itemSrc.Delete;
    //Playlistを保存する
    sl := TStringList.Create;
    try
      sFile := Format('%s\%s.m3u', [av.sPlaylistDir, tvwTree.Selected.Text]);
      sl.Add('#EXTM3U');
      for i := 0 to lvwList.Items.Count-2 do
      begin
        item := TListItemEx(lvwList.Items[i]);
        m := wmp.newMedia(item.sFullPath);
        sl.Add(Format('#EXTINF:%d, %s - %s',
                      [Trunc(m.duration), m.getItemInfo('Artist'), m.getItemInfo('Title')]));
        sl.Add(item.sFullPath);
      end;
      sl.SaveToFile(sFile, TEncoding.UTF8);
    finally
      sl.Free;
    end;
  end;
end;

procedure TfrmMain.lvwListDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (tvwTree.Selected.ImageIndex = ICO_PLAYLIST_FILE) and (Source = lvwList) then
    Accept := True;
end;

procedure TfrmMain.lvwListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_RETURN : lvwListDblClick(sender);
    VK_F2     : popLvwRenameClick(nil);
  end;
end;

procedure TfrmMain.lvwSearchColumnClick(Sender: TObject; Column: TListColumn);
begin
  Case Column.Index of
    0..2 : lvwSearch.ColumnClickEx(Column, True);
  end;
end;

procedure TfrmMain.lvwSearchCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  lvwSearch.ColorizeLines(Item, State, DefaultDraw);
end;

procedure TfrmMain.lvwSearchDblClick(Sender: TObject);
var
  m : IWMPMedia;
  item : TListItem;
begin
  item := lvwSearch.Selected;
  if item = nil then
    Exit;

  wmp.currentPlaylist.clear;
  m := wmp.newMedia(Format('%s\%s\%s%s',
                           [av.sMusicFolder, item.Caption, item.SubItems[0], item.SubItems[1]]));
  wmp.currentMedia := m;
  wmp.controls.play;
  av.sCurrentDir := Format('%s\%s', [av.sMusicFolder, item.Caption]);
end;

procedure TfrmMain.popLvwAdd2iTunesClick(Sender: TObject);
var
  item : TListItemEx;
  sl : TStringList;
  i : Integer;
begin
  sl := TStringList.Create;
  try
    sl.Add('@echo');
    sl.Add('chcp 65001'); //コマンドプロンプトをUTF-8に変更する
    for i := 0 to lvwList.Items.Count-2 do
    begin
      item := TListItemEx(lvwList.Items[i]);
      if item.Selected then
      begin
        sl.Add(Format('AddiPod.exe "%s" /itunes', [item.sFullPath]));
      end;
    end;
    sl.SaveToFile(GetApplicationPath + 'iTunes.bat', TEncoding.UTF8);
  finally
    sl.Free;
  end;
  ShellExecuteSimple(GetApplicationPath + 'iTunes.bat');
end;

procedure TfrmMain.popLvwDeleteClick(Sender: TObject);
const
  MSG = '削除します。よろしいですか？';
var
  item : TListItemEx;
  n : TTreeNode;
  sl : TStringList;
  m : IWMPMedia;
  i, iTotal : Integer;
  dTotal : Double;
begin
  if MessageDlg(MSG, mtWarning) = mrNo then
    Exit;

  lvwList.Items.BeginUpdate;
  try
    n := tvwTree.Selected;
    //ファイルの削除
    if n.ImageIndex in [ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_ALBUM_CLOSE] then
    begin
      for i := lvwList.Items.Count-1 downto 0 do
      begin
        item := TListItemEx(lvwList.Items[i]);
        if (LeftStr(Item.Caption, 12) <> 'Total Songs:') and (item.Selected) then
        begin
          DeleteFile(item.sFullPath);
          item.Delete;
        end;
      end;
    end
    //Playlistの削除
    else if n.ImageIndex = ICO_PLAYLIST_FILE then
    begin
      sl := TStringList.Create;
      try
        iTotal := 0;
        dTotal := 0;
        lvwList.Items[lvwList.Items.Count-1].Delete;
        for i := lvwList.Items.Count-1 downto 0 do
        begin
          item := TListItemEx(lvwList.Items[i]);
          if Not item.Selected then
          begin
            m := wmp.newMedia(item.sFullPath);
            sl.Insert(0, item.sFullPath);
            sl.Insert(0, Format('#EXTINF:%d, %s - %s',
                                [Trunc(m.duration), m.getItemInfo('Artist'), m.getItemInfo('Title')]));
            dTotal := dTotal + m.duration;
            iTotal := iTotal + StrToIntDef(m.getItemInfo('Filesize'), 0) div 1000;
          end
          else
            item.Delete;
        end;
        sl.Insert(0, '#EXTM3U');
        sl.SaveToFile(Format('%s\%s.m3u', [av.sPlaylistDir, n.Text]), TEncoding.UTF8);
      finally
        sl.Free;
      end;

      ut_CalculateTotals(Trunc(dTotal), iTotal);
    end;
  finally
    lvwList.Items.EndUpdate;
  end;
end;

procedure TfrmMain.popLvwPopup(Sender: TObject);
  procedure in_LoadPlayList;
  var
    m : TSpTBXItem;
    sl : TStringList;
    s : String;
    i : Integer;
  begin
    //まずはプレイリストを初期化する
    for i := popLvwAddToPlaylist.Count-1 downto 0 do
      popLvwAddToPlaylist.Delete(i);

    //プレイリストのロード
    sl := TStringList.Create;
    try
      GetFiles(av.sPlaylistDir, '*.m3u', sl, False);
      for s in sl do
      begin
        m := TSpTBXItem.Create(self);
        m.Caption := ExtractFileBody(s);
        m.OnClick := _AddToPlaylist;
        popLvwAddToPlaylist.Add(m);
      end;
    finally
      sl.Free;
    end;
  end;

begin
  popLvwNoItems.Visible       := True;
  popLvwShowAlbumArt.Visible  := True;
  popLvwRename.Visible        := True;
  popLvwAddToPlaylist.Visible := True;
  popLvwAdd2iTunes.Visible    := True;
  popLvwDelete.Visible        := True;

  Case tvwTree.Selected.ImageIndex of
    ICO_MUSIC_ROOT :
      begin
        popLvwShowAlbumArt.Visible  := False;
        popLvwRename.Visible        := False;
        popLvwAddToPlaylist.Visible := False;
        popLvwAdd2iTunes.Visible    := False;
        popLvwDelete.Visible        := False;
      end;
    ICO_MUSIC_FOLDER_CLOSE :
      begin
        popLvwShowAlbumArt.Visible  := False;
        popLvwRename.Visible        := False;
        popLvwAddToPlaylist.Visible := False;
        popLvwAdd2iTunes.Visible    := False;
        popLvwDelete.Visible        := False;
      end;
    ICO_MUSIC_FOLDER_CLOSE_SYM :
      begin
        popLvwNoItems.Visible       := False;
        popLvwShowAlbumArt.Visible  := False;
        popLvwRename.Visible        := False;
        popLvwAddToPlaylist.Visible := False;
        popLvwAdd2iTunes.Visible    := False;
        popLvwDelete.Visible        := False;
      end;
    ICO_MUSIC_ALBUM_CLOSE :
      begin
        popLvwNoItems.Visible       := False;
        in_LoadPlayList;
      end;
    ICO_MUSIC_ALBUM_CLOSE_SYM :
      begin
        popLvwNoItems.Visible       := False;
        popLvwRename.Visible        := False;
        popLvwDelete.Visible        := False;
        in_LoadPlayList;
      end;
    ICO_PLAYLIST_ROOT :
      begin
        popLvwShowAlbumArt.Visible  := False;
        popLvwRename.Visible        := False;
        popLvwAddToPlaylist.Visible := False;
        popLvwAdd2iTunes.Visible    := False;
        popLvwDelete.Visible        := False;
      end;
    ICO_PLAYLIST_FILE :
      begin
        popLvwNoItems.Visible       := False;
        popLvwRename.Visible        := False;
        popLvwAddToPlaylist.Visible := False;
      end;
  end;
end;

procedure TfrmMain.popLvwRenameClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRename, frmRename);
  frmRename.Show;
end;

procedure TfrmMain.popLvwShowAlbumArtClick(Sender: TObject);
begin
	if FindWindow('TfrmCoverArt', 'Album Art List')<>0 then
    Exit;
  Application.CreateForm(TfrmCoverArt, frmCoverArt);
  frmCoverArt.Show;
  frmCoverArt._LoadCoverArt(TListItemEx(lvwList.Selected).sFullPath);
end;

procedure TfrmMain.popTvwAdd2iTunesClick(Sender: TObject);
var
  sl, sm : TStringList;
  s, sPath, sExt : String;
begin
  sl := TStringList.Create;
  sm := TStringList.Create;
  try
    sPath := av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected);
    GetFiles(sPath, '*.*', sl, True);
    sm.Add('@echo');
    sm.Add('chcp 65001'); //コマンドプロンプトをUTF-8に変更する
    for s in sl do
    begin
      sExt := ExtractFileExt(s);
      if ContainsText(av.sValidExtentions, sExt) then
        sm.Add(Format('AddiPod.exe "%s" /itunes', [s]));
    end;
    sm.SaveToFile(GetApplicationPath + 'iTunes.bat', TEncoding.UTF8);
  finally
    sl.Free;
    sm.Free;
  end;
  ShellExecuteSimple(GetApplicationPath + 'iTunes.bat');
end;

procedure TfrmMain.popTvwCreateFolderClick(Sender: TObject);
var
  n : TTreeNode;
  sNewName, sNewPath : String;
begin
  n := tvwTree.Selected;
  if n = nil then
    Exit;

  sNewName := InputBox('フォルダの作成', 'フォルダ名を入力して下さい。', '', [ibFileName]);
  if sNewName <> '' then
  begin
    if IsValidFileName(sNewName) then
    begin
      sNewPath := Format('%s%s\%s', [av.sMusicFolder, tvwTree.GetFullNodePath(n), sNewName]);
      if TDirectory.Exists(sNewPath) then
        ShowMessage('同じ名称のフォルダが存在します。変更して下さい。', mtError)
      else
      begin
        CreateFolder(sNewPath);
        tvwTree.AddChildNode(sNewName, ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_OPEN);
      end;
    end;
    n.AlphaSort(True);
  end;
end;

procedure TfrmMain.popTvwDeleteClick(Sender: TObject);
const
  C_DelFolder  = 'フォルダを削除します。よろしいですか?';
  C_DelList    = 'プレイリストを削除します。よろしいですか？';
  C_DelSymLink = 'シンボリックリンクを削除しようとしています。' + #13#10 +
                 'シンボリックリンクを削除しても、音楽ファイルは削除されません。' + #13#10 +
                 'このシンボリックリンクを削除しますか?';
var
  sl : TStringList;
  n : TTreeNode;
  s : String;
begin
  n := tvwTree.Selected;
  if (n = nil) or (n.ImageIndex = ICO_MUSIC_ROOT) then
    Exit;

  Case tvwTree.Selected.ImageIndex of
    ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_ALBUM_CLOSE :
      begin
        s := av.sMusicFolder + tvwTree.GetFullNodePath(n);
        //削除処理
        if MessageDlg(C_DelFolder, mtWarning) = mrYes then
        begin
          DeleteFolder(s);
          n.Delete;
        end;
      end;
    ICO_MUSIC_FOLDER_CLOSE_SYM, ICO_MUSIC_ALBUM_CLOSE_SYM :
      begin
        if MessageDlg(C_DelSymLink, mtWarning) = mrYes then
        begin
          sl := TStringList.Create;
          try
            sl.Add('chcp');
            sl.Add('chcp 65001');
            sl.Add('@echo on');
            sl.Add(Format('rmdir /S /Q "%s"', [av.sMusicFolder + tvwTree.GetFullNodePath(n)]));
            sl.SaveToFile('DeleteSymLink.bat', TEncoding.UTF8);
          finally
            sl.Free;
          end;
          ShellExecuteSimple('DeleteSymLink.bat');
          n.Delete;
        end;
      end;
    ICO_PLAYLIST_FILE :
      begin
        if MessageDlg(C_DelList, mtWarning) = mrYes then
        begin
          DeleteFile(Format('%s\%s.m3u', [av.sPlaylistDir, tvwTree.Selected.Text]));
          n.Delete;
        end;
      end;
  end;
end;

procedure TfrmMain.popTvwDeletePRIVTagsClick(Sender: TObject);
var
  n : TTreeNode;
  sl : TStringList;
  s, sRoot : String;
  i, iCnt, iTotal : Integer;
  t : TTags;
begin
  n := tvwTree.Selected;
  if n = nil then
    Exit;

  iTotal := 0;
  SpTBXTabControl1.ActiveTabIndex := 2;
  memTagInfo.Lines.Add('PRIVタグの除去を始めます');
  Application.ProcessMessages;

  sl := TStringList.Create;
  try
    sRoot := av.sMusicFolder + tvwTree.GetFullNodePath(n);
    GetFiles(sRoot, '*.mp3', sl, True);
    for s in sl do
    begin
      t := TTags.Create;
      try
        iCnt := 0;
        t.LoadFromFile(s);
        for i := t.Count-1 downto 0 do
        begin
          if SameText('PRIV', t.Tags[i].Name) then
          begin
            t.Delete(i);
            Inc(iCnt);
            Inc(iTotal);
          end;
        end;
        t.SaveToFile(s);
        memTagInfo.Lines.Add(Format('Deleted: %d個のPRIV Tag = %s', [iCnt, s]));
        Application.ProcessMessages;
      finally
        t.Free;
      end;
    end;
    memTagInfo.Lines.Add(Format('%d個のMP3ファイルを調査しました。', [sl.Count]));
    memTagInfo.Lines.Add(Format('%d個のPRIVタグを除去しました。', [iTotal]));
  finally
    sl.Free;
  end;
end;

procedure TfrmMain.popTvwMakeSSymLinkClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMakeSymLink, frmMakeSymLink);
  frmMakeSymLink.Show;
end;

procedure TfrmMain.popTvwNewPlaylistClick(Sender: TObject);
var
  n : TTreeNode;
  sl : TStringList;
  s, sFile : String;
begin
  s := InputBox('Playlistの作成', 'Playlistの名称を入力して下さい。', '', [ibFileName]);
  if (s <> '') and IsValidFileName(s) then
  begin
    n := tvwTree.Items.AddChild(tvwTree.Selected, s);
    n.ImageIndex    := ICO_PLAYLIST_FILE;
    n.SelectedIndex := ICO_PLAYLIST_FILE;
    sl := TStringList.Create;
    try
      sFile := Format('%s\%s.m3u', [av.sPlaylistDir, s]);
      CreateFolder(ExtractFilePath(sFile));
      sl.Add('#EXTM3U');
      sl.SaveToFile(sFile, TEncoding.UTF8);
    finally
      sl.Free;
    end;
  end;
end;

procedure TfrmMain.popTvwOpenExplorerClick(Sender: TObject);
begin
  tvwTree.ExecuteByExplorer(av.sMusicFolder);
end;

procedure TfrmMain.popTvwPlayFolder_NumericClick(Sender: TObject);
var
  m : IWMPMedia;
  sl : TStringList;
  i : Integer;
  sExt : String;
begin
  wmp.currentPlaylist.clear;
  sl := TStringList.Create;
  try
    GetFiles(av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected), '*.*', sl, True);
    for i := 0 to sl.Count-1 do
    begin
      sExt := ExtractFileExt(sl[i]);
      if ContainsText(av.sValidExtentions, sExt) then
      begin
        m := wmp.newMedia(sl[i]);
        wmp.currentPlaylist.appendItem(m);
      end;
    end;
  finally
    sl.Free;
  end;
  //再生する
  wmp.controls.play;
end;

procedure TfrmMain.popTvwPlayFolder_ShuffleClick(Sender: TObject);
var
  sl : TStringList;
  m : IWMPMedia;
  i, idx : Integer;
  sExt : String;
begin
  if tvwTree.Selected.ImageIndex = ICO_PLAYLIST_FILE then
  begin
    ShowMessage('Playlist再生時はシャッフルできません。', mtError);
    Exit;
  end;

  wmp.currentPlaylist.clear;
  Randomize;

  sl := TStringList.Create;
  try
    GetFiles(av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected), '*.*', sl, True);
    for i := sl.Count-1 downto 0 do
    begin
    	sExt := ExtractFileExt(sl[i]);
      if Not ContainsText(av.sValidExtentions, sExt) then
      begin
        sl.Delete(i);
      end;
    end;
    //シャッフル処理
    for i := 0 to sl.Count-1 do
    begin
      idx := Random(sl.Count-1);
      sl.Exchange(i, idx);
    end;
    //Playlistに追加
    for i := 0 to sl.Count-1 do
    begin
    	m := wmp.newMedia(sl[i]);
      wmp.currentPlaylist.appendItem(m);
    end;
  finally
    sl.Free;
  end;
  //再生する
  wmp.controls.play;
end;

procedure TfrmMain.popTvwPopup(Sender: TObject);
begin
  popTvwRenameFolder.Visible        := True;
  popTvwCreateFolder.Visible        := True;
  SpTBXSubmenuItem1.Visible         := True;
  popTvwNewPlaylist.Visible         := True;
  popTvwSendToMP3Gain.Visible       := True;
  popTvwAdd2iTunes.Visible          := True;
  popTvwReload.Visible              := True;
  popTvwDeletePRIVTags.Visible      := True;
  popTvwMakeSSymLink.Visible        := True;
  popTvwOpenExplorer.Visible        := True;
  popTvwDelete.Visible              := True;
  Case tvwTree.Selected.ImageIndex of
    ICO_MUSIC_ROOT : //Root
      begin
        popTvwRenameFolder.Visible  := False;
        popTvwDelete.Visible        := False;
        popTvwNewPlaylist.Visible   := False;
        popTvwAdd2iTunes.Visible    := False;
        popTvwSendToMP3Gain.Visible := False;
        popTvwDeletePRIVTags.Visible:= False;
      end;
    ICO_MUSIC_FOLDER_CLOSE :
      begin
        popTvwNewPlaylist.Visible   := False;
      end;
    ICO_MUSIC_ALBUM_CLOSE :
      begin
        popTvwCreateFolder.Visible  := False;
        popTvwNewPlaylist.Visible   := False;
        popTvwReload.Visible        := False;
        popTvwMakeSSymLink.Visible  := False;
      end;
    ICO_MUSIC_FOLDER_CLOSE_SYM :
      begin
        popTvwNewPlaylist.Visible   := False;
        popTvwMakeSSymLink.Visible  := False;
      end;
    ICO_MUSIC_ALBUM_CLOSE_SYM :
      begin
        popTvwCreateFolder.Visible  := False;
        popTvwNewPlaylist.Visible   := False;
        popTvwReload.Visible        := False;
        popTvwMakeSSymLink.Visible  := False;
      end;
    ICO_PLAYLIST_ROOT :  //Playlist Root
      begin
        popTvwRenameFolder.Visible  := False;
        popTvwCreateFolder.Visible  := False;
        SpTBXSubmenuItem1.Visible   := False;
        popTvwSendToMP3Gain.Visible := False;
        popTvwAdd2iTunes.Visible    := False;
        popTvwReload.Visible        := False;
        popTvwDeletePRIVTags.Visible:= False;
        popTvwMakeSSymLink.Visible  := False;
        popTvwOpenExplorer.Visible  := False;
        popTvwDelete.Visible        := False;
      end;
    ICO_PLAYLIST_FILE :   //Playlist
      begin
        popTvwCreateFolder.Visible  := False;
        SpTBXSubmenuItem1.Visible   := False;
        popTvwNewPlaylist.Visible   := False;
        popTvwSendToMP3Gain.Visible := False;
        popTvwAdd2iTunes.Visible    := False;
        popTvwReload.Visible        := False;
        popTvwDeletePRIVTags.Visible:= False;
        popTvwMakeSSymLink.Visible  := False;
        popTvwOpenExplorer.Visible  := False;
      end;
  end;
end;

procedure TfrmMain.popTvwReloadClick(Sender: TObject);
var
  n : TTreeNode;
begin
  n := tvwTree.Selected;
  if n = nil then
    Exit;

  tvwTree.Items.BeginUpdate;
  try
    n.DeleteChildren;
    _SearchFolders(n, av.sMusicFolder + '\' + tvwTree.GetFullNodePath(n));
    tvwTree.Select(n);
    n.Expanded := True;
  finally
    tvwTree.Items.EndUpdate;
  end;
end;

procedure TfrmMain.popTvwRenameFolderClick(Sender: TObject);
var
  n : TTreeNode;
  sNewName, sOldPath, sNewPath : String;
begin
  n := tvwTree.Selected;
  if n = nil then
    Exit;

  sNewName := InputBox('名称の変更', '新しい名称を入力して下さい。', n.Text, [ibFileName]);
  if (sNewName <> '') and (sNewName <> n.Text) then
  begin
    Case tvwTree.Selected.ImageIndex of
      ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_ALBUM_CLOSE,
      ICO_MUSIC_FOLDER_CLOSE_SYM, ICO_MUSIC_ALBUM_CLOSE_SYM : //Folder
        begin
          sOldPath := av.sMusicFolder + tvwTree.GetFullNodePath(n);
          sNewPath := av.sMusicFolder + tvwTree.GetFullNodePath(n.Parent) + '\' + sNewName;
          RenameFolder(sOldPath, sNewPath);
          n.Text := sNewName;
        end;
      ICO_PLAYLIST_FILE : //Playlist
        begin
          sOldPath := Format('%s\%s.m3u', [av.sPlaylistDir, n.Text]);
          sNewPath := Format('%s\%s.m3u', [av.sPlaylistDir, sNewName]);
          RenameFile(sOldPath, sNewPath);
          n.Text := sNewName;
        end;
    end;
    n.Parent.AlphaSort(True);
  end;
end;

procedure TfrmMain.popTvwSendToMP3GainClick(Sender: TObject);
var
  sl : TStringList;
  sData : String;
begin
  sl := TStringList.Create;
  try
    GetFiles(av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected), '*.*', sl, True);
    sl.Delimiter := ' ';
    sData := sl.DelimitedText;
  finally
    sl.Free;
  end;
  ShellExecuteW(Self.Handle, 'open', PWideChar(av.sMp3Gain), PWideChar(sData), nil, SW_NORMAL);
end;

procedure TfrmMain.ScrollBox1Resize(Sender: TObject);
begin
  imgLyrics.Picture.Bitmap.Height := imgLyrics.Height;
  imgLyrics.Picture.Bitmap.Width  := imgLyrics.Width;
end;

procedure TfrmMain.SpTBXSplitter2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ms : TMemoryStream;
  t : TTags;
begin
  t := TTags.Create;
  ms := TMemoryStream.Create;
  try
    ms.LoadFromFile(wmp.currentMedia.sourceURL);
    t.LoadFromStream(ms);
    if t.Loaded then
    begin
      _ShowLyrics(t.GetTag(TAG_LYRICS));
    end;
  finally
    t.Free;
    ms.Free;
  end;
end;

procedure TfrmMain.tbrEditTagClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEditTag, frmEditTag);
  frmEditTag.Show;
end;

procedure TfrmMain.tbrPauseClick(Sender: TObject);
begin
  wmp.controls.pause;
end;

procedure TfrmMain.tbrPlayClick(Sender: TObject);
begin
  wmp.controls.play;
end;

procedure TfrmMain.tbrRepeatClick(Sender: TObject);
var
  m : IWMPMedia;
  s : String;
  i, iCurIndex : Integer;
begin
//ボタン押下時は一曲リピートで、非押下時は全曲リピートとする。
  tbrRepeat.Checked := Not tbrRepeat.Checked;

  iCurIndex := 0;
  //まず、現在再生中の曲のindexを取得する
  for i := 0 to lvwList.Items.Count-1 do
  begin
    if lvwList.Items[i].ImageIndex = 3 then
    begin
    	iCurIndex := i;
      Break;
    end;
  end;

  if tbrRepeat.Checked then
  begin
    //一曲リピート
    tbrRepeat.Hint := '一曲リピートが有効です';
    s := TListItemEx(lvwList.Items[iCurIndex]).sFullPath;
    for i := wmp.currentPlaylist.count-1 downto 0 do
    begin
      if Not SameText(wmp.currentPlaylist.Item[i].sourceURL, s) then
      begin
        m := wmp.currentPlaylist.Item[i];
        wmp.currentPlaylist.removeItem(m);
      end;
    end;
  end
  else
  begin
    tbrRepeat.Hint := '全曲リピートが有効です';
    //全曲リピート
    for i := iCurIndex+1 to lvwList.Items.Count-2 do
    begin
      if iCurIndex = lvwList.Items.Count-2 then
        Break;
      m := wmp.newMedia(TListItemEx(lvwList.Items[i]).sFullPath);
      wmp.currentPlaylist.appendItem(m);
    end;
    for i := 0 to iCurIndex-1 do
    begin
      if iCurIndex = 0 then
        Break;
      m := wmp.newMedia(TListItemEx(lvwList.Items[i]).sFullPath);
      wmp.currentPlaylist.appendItem(m);
    end;
  end;
end;

procedure TfrmMain.tbrSelectFolderClick(Sender: TObject);
var
  s : String;
begin
	if av.sCurrentDir = '' then Exit;
  try
    s := ReplaceText(av.sCurrentDir, av.sMusicFolder + '\', '');
    tvwTree.VisibleNode(s);
    tvwTreeClick(nil);
  except
    //
  end;
end;

procedure TfrmMain.tbrShuffleClick(Sender: TObject);
begin
  popTvwPlayFolder_ShuffleClick(nil);
end;

procedure TfrmMain.tbrStopClick(Sender: TObject);
begin
  wmp.controls.stop;
  wmp.close;
end;

procedure TfrmMain.timPositionTimer(Sender: TObject);
begin
  traPosition.Position := Trunc(wmp.controls.currentPosition);
  lblTime.Caption := Format('%s/%s', [wmp.controls.currentPositionString, wmp.currentMedia.durationString]);
end;

procedure TfrmMain.traPositionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timPosition.Enabled := False;
end;

procedure TfrmMain.traPositionMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssLeft in Shift then
  begin
  	wmp.controls.currentPosition := traPosition.Position;
    lblTime.Caption := Format('%s/%s', [wmp.controls.currentPositionString, wmp.currentMedia.durationString]);
  end;
end;

procedure TfrmMain.traPositionMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timPosition.Enabled := True;
end;

procedure TfrmMain.tvwTreeClick(Sender: TObject);
begin
  _ListMusicFiles;
end;

procedure TfrmMain.tvwTreeCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Parent = nil then
    Exit;

  with Sender.Canvas do
  begin
    tvwTree.ColorizeNodes(Node, State, DefaultDraw);
    Brush.Style := bsSolid;
    //現在再生中のフォルダ
    if SameText(av.sMusicFolder + tvwTree.GetFullNodePath(Node), av.sCurrentDir) then
    begin
    	Brush.Color := av.cNowPlay;
      Font.Color  := av.cNowPlayFont;
  	  Font.Style  := [fsBold];
    end;

    if cdsSelected in State then
    begin
    	Brush.Color := av.cTotal;
      Font.Color  := av.cTotalFont;
    end;
  end;
end;

procedure TfrmMain.tvwTreeDblClick(Sender: TObject);
var
  n : TTreeNode;
  item : TListItemEx;
  m : IWMPMedia;
begin
  n := tvwTree.Selected;
  if n <> nil then
  begin
    if n.ImageIndex in [ICO_MUSIC_ALBUM_CLOSE, ICO_MUSIC_ALBUM_CLOSE_SYM] then
    begin
      _ListMediaFiles;
      item := TListItemEx(lvwList.Items[0]);
      if (item <> Nil) and (LeftStr(Item.Caption, 12) <> 'Total Songs:') then
      begin
        _CreatePlayList;
        wmp.settings.volume := 100;
        m := wmp.currentPlaylist.Item[item.Index];
        wmp.controls.playItem(m);
      end;
    end;
  end;
end;

procedure TfrmMain.tvwTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  nFrom, nTo : TTreeNode;
  item : TListItemEx;
  sFrom, sTo, sName : String;
  i : Integer;
begin
  if Source is THideTreeView then
  begin
    nFrom := tvwTree.Selected;
    nTo   := tvwTree.DropTarget;
    Case nTo.ImageIndex of
      ICO_MUSIC_ROOT : //rootに
        begin
          sFrom := av.sMusicFolder + tvwTree.GetFullNodePath(nFrom);
          sTo   := av.sMusicFolder + '\' + nFrom.Text;
        end;
      ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_CLOSE_SYM : //Folderに
        begin
          sFrom := av.sMusicFolder + tvwTree.GetFullNodePath(nFrom);
          sTo   := av.sMusicFolder + tvwTree.GetFullNodePath(nTo) + '\' + nFrom.Text;
        end;
      ICO_MUSIC_ALBUM_CLOSE, ICO_MUSIC_ALBUM_CLOSE_SYM : //Albumに
        Exit;
    end;
    if sFrom <> sTo then
    begin
      MoveFolder(sFrom, sTo);
      nFrom.MoveTo(nTo, naAddChild);
      nTo.AlphaSort(True);
    end;
  end
  //リストビューからのドロップ
  else if Source is THideListView then
  begin
    nTo := tvwTree.DropTarget;
    sTo := av.sMusicFolder + tvwTree.GetFullNodePath(nTo);
    for i := lvwList.Items.Count-1 downto 0 do
    begin
    	item := TListItemEx(lvwList.Items[i]);
      if (item.Selected) and (LeftStr(Item.Caption, 12) <> 'Total Songs:') then
      begin
        sName := ExtractFileName(item.sFullPath);
        begin
          if GetKeyState(VK_SHIFT) < 0 then
            CopyFile(item.sFullPath, sTo + '\' + sName)
          else
          begin
        	  //move
            RenameFile(item.sFullPath, sTo + '\' + sName);
            item.Delete;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.tvwTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TfrmMain.tvwTreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F2 : popTvwRenameFolderClick(nil);
  end;
end;

procedure TfrmMain.tvwTreeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  _ListMusicFiles;
end;

procedure TfrmMain.wmpPlayStateChange(ASender: TObject; NewState: Integer);
begin
  Case NewState of
    wmppsPlaying :
      begin
        av.sCurrentSong := wmp.currentMedia.sourceURL;
        traPosition.Max := Trunc(wmp.currentMedia.duration);
        traPosition.Enabled := True;
        timPosition.Enabled := True;
        lvwList.Refresh;
        Application.ProcessMessages;
        _LoadAlbumCover;
        av.sCurrentDir := ExtractFileDir(av.sCurrentSong);
        _SetColors;
        tvwTree.Repaint;
      end;
    wmppsStopped :
      begin
        traPosition.Position := 0;
        traPosition.Enabled := False;
        timPosition.Enabled := False;
        lblTime.Caption := '00:00/00:00';
      end;
    wmppsPaused :
      begin

      end;
    wmppsReady :
      begin

      end;
  end;
end;

procedure TfrmMain._AddToPlaylist(Sender: TObject);
var
  m : IWMPMedia;
  item : TListItemEx;
  i : Integer;
  sl : TStringList;
  sFile : String;
begin
  sl := TStringList.Create;
  try
    sFile := Format('%s\%s.m3u', [av.sPlaylistDir, TSpTBXItem(Sender).Caption]);
    sl.LoadFromFile(sFile, TEncoding.UTF8);
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TListItemEx(lvwList.Items[i]);
      if item.Selected then
      begin
        m := wmp.newMedia(item.sFullPath);
        sl.Add(Format('#EXTINF:%d, %s - %s', [Trunc(m.duration), m.getItemInfo('Artist'), m.getItemInfo('Title')]));
        sl.Add(item.sFullPath);
      end;
    end;
    sl.SaveToFile(sFile, TEncoding.UTF8);
  finally
    sl.Free;
  end;
end;

procedure TfrmMain._ClearListItems;
begin
  lvwList.Items.BeginUpdate;
  lvwList.Items.Clear;
  lvwList.Items.EndUpdate;
end;

procedure TfrmMain._CreatePlayList;
var
  sl : TStringList;
  m : IWMPMedia;
  s, sExt : String;
begin
  wmp.currentPlaylist.clear;
  s := av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected);
  sl := TStringList.Create;
  try
    GetFiles(s, '*.*', sl, False);
    for s in sl do
    begin
      sExt := LowerCase(ExtractFileExt(s));
      if PosText(sExt, av.sValidExtentions) > 0 then
      begin
        m := wmp.newMedia(s);
        wmp.currentPlaylist.appendItem(m);
      end;
    end;
  finally
    sl.Free;
  end;
end;

procedure TfrmMain._ListMediaFiles;
var
  n : TTreeNode;
  m : IWMPMedia;
  item : TListItemEx;
  sr : TSearchRec;
  sRootDir, sExt, sFilename, sTitle, sSubTitle : String;
  iBit, iSize, iTotal : Integer;
  dTotal : Double;
  bMedia : Boolean;
begin
  sRootDir := av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected) + '\';
  lvwList.Items.BeginUpdate;
  try
    dTotal := 0;  iTotal := 0;
    bMedia := False;
    lvwList.Items.Clear;
    if FindFirst(sRootDir + '*.*', faAnyFile, sr) = 0 then
    begin
      repeat
        sExt := ExtractFileExt(sr.Name);
        if (sr.Name <> '.') and (sr.Name <> '..') and ContainsText(av.sValidExtentions, sExt) then
        begin
          sFilename := sRootDir + sr.Name;
          //タイトル、サブタイトル、拡張子を取得
          m := wmp.newMedia(sFilename);
          sTitle := m.getItemInfo('Title');                             //以下、タイトルとサブタイトルの取得
          sSubTitle := m.getItemInfo(TAG_SUBTITLE);
          if sSubTitle <> '' then
            sTitle := Format('%s ～%s～', [sTitle, sSubTitle]);
          sExt := ExtractFileExt(sFilename);                            //拡張子
          iBit  := StrToIntDef(m.getItemInfo('Bitrate'), 0) div 1000;   //ビットレート
          iSize := StrToIntDef(m.getItemInfo('Filesize'), 0) div 1000;  //ファイルサイズ

          //リストに追加
          item  := TListItemEx(lvwList.Items.Add);
          item.Caption := sTitle;
          item.SubItems.Add(m.durationString);
          item.SubItems.Add(IntToStr(iBit) + 'K');
          item.SubItems.Add(FormatFloat('#,###', iSize) + 'KB');
          item.SubItems.Add(sExt);
          item.sFullPath := sFilename;
          item.ImageIndex := -1;
          dTotal := dTotal + m.duration;
          iTotal := iTotal + iSize;
          bMedia := True;
        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
    ut_CalculateTotals(Trunc(dTotal), iTotal);

    if bMedia then
    begin
      n := tvwTree.Selected;
      Case n.ImageIndex of
        ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_ALBUM_CLOSE :
          begin
            n.ImageIndex    := ICO_MUSIC_ALBUM_CLOSE;
            n.SelectedIndex := ICO_MUSIC_ALBUM_OPEN;
          end;
        ICO_MUSIC_FOLDER_CLOSE_SYM, ICO_MUSIC_ALBUM_CLOSE_SYM :
          begin
            n.ImageIndex    := ICO_MUSIC_ALBUM_CLOSE_SYM;
            n.SelectedIndex := ICO_MUSIC_ALBUM_OPEN_SYM;
          end;
      end;
    end
    else
    //ファイルが存在しない場合は、フォルダアイコンに変更
    begin
      n := tvwTree.Selected;
      if ut_IsSymbolicLink(sRootDir) then
      begin
      	n.ImageIndex    := ICO_MUSIC_FOLDER_CLOSE_SYM;
        n.SelectedIndex := ICO_MUSIC_FOLDER_OPEN_SYM;
      end else
      begin
      	n.ImageIndex    := ICO_MUSIC_FOLDER_CLOSE;
        n.SelectedIndex := ICO_MUSIC_FOLDER_OPEN;
      end;
    end;
  finally
    lvwList.SelectFirstItem;
    lvwList.Items.EndUpdate;
  end;
end;

procedure TfrmMain._ListMusicFiles;
begin
  Case tvwTree.Selected.ImageIndex of
    ICO_MUSIC_ROOT                                     : _ClearListItems;
    ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_CLOSE_SYM : _ListMediaFiles;
    ICO_MUSIC_ALBUM_CLOSE, ICO_MUSIC_ALBUM_CLOSE_SYM   : _ListMediaFiles;
    ICO_PLAYLIST_ROOT                                  : _ClearListItems;
    ICO_PLAYLIST_FILE                                  : _ListPlaylistFiles;
  end;
  _LoadAlbumCoverWhenClick;
end;

procedure TfrmMain._ListPlaylistFiles;
var
  m : IWMPMedia;
  item : TListItemEx;
  sl : TStringList;
  i, iBit, iSize, iTotal : Integer;
  dTotal : Double;
begin
  lvwList.Items.BeginUpdate;
  sl := TStringList.Create;
  try
    iTotal := 0;
    dTotal := 0;
    lvwList.Items.Clear;
    sl.LoadFromFile(Format('%s%s.m3u', [av.sPlaylistDir, tvwTree.GetFullNodePath(tvwTree.Selected)]), TEncoding.UTF8);
    for i := 0 to sl.Count-1 do
    begin
      if LeftStr(sl[i], 1) <> '#' then
      begin
        m := wmp.newMedia(sl[i]);
        iBit  := StrToIntDef(m.getItemInfo('Bitrate'), 0) div 1000;
        iSize := StrToIntDef(m.getItemInfo('Filesize'), 0) div 1000;
        item := TListItemEx(lvwList.Items.Add);
        item.Caption := m.getItemInfo('Title');
        item.SubItems.Add(m.durationString);
        item.SubItems.Add(IntToStr(iBit) + 'K');
        item.SubItems.Add(FormatFloat('#,###', iSize) + 'KB');
        item.SubItems.Add(ExtractFileExt(sl[i]));
        item.sFullPath := sl[i];
        item.ImageIndex := -1;
        dTotal := dTotal + m.duration;
        iTotal := iTotal + iSize;
      end;
    end;
    ut_CalculateTotals(Trunc(dTotal), iTotal);
  finally
    sl.Free;
    lvwList.Items.EndUpdate;
  end;
end;

procedure TfrmMain._LoadAlbumCover;
var
  ms : TMemoryStream;
  t : TTags;
  bmp : TBitmap;
  i : Integer;
  s, sTag, sTitle, sSubTitle : String;
begin
  ms := TMemoryStream.Create;
  t := TTags.Create;
  bmp := TBitmap.Create;
  try
    ms.LoadFromFile(wmp.currentMedia.sourceURL);
    t.LoadFromStream(ms);
    if t.Loaded then
    begin
      try
        t.LoadCoverArt(bmp, t, 0);
        _LoadCoverArt(bmp);
      except
        //
      end;
      sTitle := StrDef(t.GetTag(TAG_TITLE),  '<No Title>');
      sSubTitle := StrDef(t.GetTag(TAG_SUBTITLE), '');
      if sSubTitle <> '' then
        sTitle := Format('%s ～%s～', [sTitle, sSubTitle]);
      lblTitle.Caption    := sTitle;// StrDef(t.GetTag(TAG_TITLE),  '<No Title>');
      lblArtist.Caption   := StrDef(t.GetTag(TAG_ARTIST), '<No Artist>');
      lblAlbumYear.Caption := StrDef(t.GetTag(TAG_ALBUM), '<No Album>');;

      //年  まずは ReleaseDateを優先的に読み込み、値が無い場合に Year を読み込む
      s := StrDef(t.GetTag(TAG_RELEASEDATE), t.GetTag(TAG_YEAR));
      if s <> '' then
        lblAlbumYear.Caption := Format('%s (%s)', [lblAlbumYear.Caption, s]);

      lblLyricist.Caption := '作詞:' + StrDef(t.GetTag(TAG_LYRICIST), '<No Data>');
      lblComposer.Caption := '作曲:' + StrDef(t.GetTag(TAG_COMPOSER), '<No Data>');

      Application.ProcessMessages;
      _ShowLyrics(t.GetTag(TAG_LYRICS));
      memTagInfo.Clear;
      for i:= 0 to t.Count-1 do
        memTagInfo.Lines.Add(t.Tags[i].Name + '=' + t.Tags[i].Value);
      for i := 0 to t.CoverArtCount-1 do
      begin
      	memTagInfo.Lines.Add(t.CoverArts[i].Name + '.Size='        + FormatFloat('###,###B', t.CoverArts[i].Stream.Size));
      	memTagInfo.Lines.Add(t.CoverArts[i].Name + '.CoverType='   + ut_ConvertPictureID2String(t.CoverArts[i].CoverType));
      	memTagInfo.Lines.Add(t.CoverArts[i].Name + '.Description=' + t.CoverArts[i].Description);
      end;
    end;

    //WMPのタグ情報
    memTagInfo.Lines.Add('');
    memTagInfo.Lines.Add(sTag + '==== Windows Media Player Tag Infomation ====');
    //取得できる項目の数だけ処理
    for i := 0 to wmp.currentMedia.attributeCount-1 do
    begin
      //項目名を取得
      sTag := wmp.currentMedia.getAttributeName(i);  //項目名
      //項目の値を取得
      s := wmp.currentMedia.getItemInfo(sTag);  //値を取得
      memTagInfo.Lines.Add(sTag + '=' + s);
    end;
    memTagInfo.Lines.Add('WMP/TotalTags=' + IntToStr(wmp.currentMedia.attributeCount));
  finally
    ms.Free;
    t.Free;
    bmp.Free;
  end;
end;

procedure TfrmMain._LoadAlbumCoverWhenClick;
var
  t : TTags;
  bmp : TBitmap;
  sFilename : String;
  jpg : TJPEGImage;
begin
  Application.ProcessMessages;
  t := TTags.Create;
  bmp := TBitmap.Create;
  jpg := TJPEGImage.Create;
  try
    //まず、フォルダに表示用の画像があるか調べる。
    //あればそれを読み込み、無ければMP3から取得する。
    sFilename := av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected) + '\Folder.jpg';
    if FileExists(sFilename) then
    begin
      jpg.LoadFromFile(sFilename);
      bmp.Assign(jpg);
      _LoadCoverArt(bmp);
    end
    else
    begin
      if lvwList.Items.Count > 0 then
      begin
        t.LoadFromFile(TListItemEx(lvwList.Items[0]).sFullPath);
        if t.Loaded then
        begin
          try
            t.LoadCoverArt(bmp, t, 0);
            _LoadCoverArt(bmp);
          except
            //
          end;
        end;
      end
      else
        _LoadCoverArt(bmp);
    end;
  finally
    t.Free;
    bmp.Free;
    jpg.Free;
  end;
end;

procedure TfrmMain._LoadCoverArt(bmp: TBitmap);
  function in_CreateColor(bmpSrc: TBitmap): TColor;
  var
    r, g, b : Cardinal;
    c : TColor;
  begin
    //左上
    c := bmpSrc.Canvas.Pixels[av.iX1, av.iY1];
    r := GetRValue(c);
    g := GetGValue(c);
    b := GetBValue(c);
    //右上
    c := bmpSrc.Canvas.Pixels[av.iX2, av.iY2];
    r := r + GetRValue(c);
    g := g + GetGValue(c);
    b := b + GetBValue(c);
    //左下
    c := bmpSrc.Canvas.Pixels[av.iX3, av.iY3];
    r := r + GetRValue(c);
    g := g + GetGValue(c);
    b := b + GetBValue(c);
    //右下
    c := bmpSrc.Canvas.Pixels[av.iX4, av.iY4];
    r := (r + GetRValue(c)) div 4;
    g := (g + GetGValue(c)) div 4;
    b := (b + GetBValue(c)) div 4;
    Result := RGB(r, g, b);
  end;

var
  c : TColor;
  bmpTmp : TBitmap;
begin
  with imgCover.Canvas do
  begin
    Brush.Style := bsSolid;
    Brush.Color := clBlack;
    FillRect(imgCover.ClientRect);
  end;

  bmpTmp := TBitmap.Create;
  try
    bmpTmp.SetSize(77, 78);
    SetStretchBltMode(bmpTmp.Canvas.Handle, HALFTONE);
    StretchBlt(bmpTmp.Canvas.Handle, 0, 0, 77, 78,
              bmp.Canvas.Handle,     0, 0, bmp.Width, bmp.Height,
              SRCCOPY);

    c := in_CreateColor(bmpTmp);
    av.cAlbumArt := GetOppositeColor(c);
    c := SetTitlebarCaptionColor(av.cAlbumArt);
    if c = clBlack then
      c := $00323232
    else
      c := $00F3F3F3;

    Panel1.Color := av.cAlbumArt;
    lblTitle.Font.Color := c;
    lblArtist.Font.Color := c;
    lblAlbumYear.Font.Color := c;
    lblLyricist.Font.Color := c;
    lblComposer.Font.Color := c;
    imgCover.Canvas.Brush.Color := av.cAlbumArt;
    imgCover.Canvas.FillRect(imgCover.ClientRect);
    BitBlt(imgCover.Canvas.Handle, 11, 1, 77, 78,
           bmpTmp.Canvas.Handle, 0, 0, SRCCOPY);

    if bmp.Width > 0 then
      imgJacket.Draw(imgCover.Canvas, 0, 0, 1)
    else
      imgJacket.Draw(imgCover.Canvas, 0, 0, 0);
  finally
    bmpTmp.Free;
  end;
end;

procedure TfrmMain._LoadSettings;
var
  ini : TMemIniFile;
  i : Integer;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.ReadWindowPosition(Self.Name, Self);
    panLeft.Width := ini.ReadInteger(Self.Name, 'panLeft.Width', panLeft.Width);
    lvwList.Height:= ini.ReadInteger(Self.Name, 'lvwList.Height',lvwList.Height);
    for i := 0 to 3 do
      lvwList.Column[i].Width := ini.ReadInteger(Self.Name, Format('lvwList.Column[%d].Width', [i]), lvwList.Column[i].Width);
    for i := 0 to 2 do
      lvwSearch.Column[i].Width := ini.ReadInteger(Self.Name, Format('lvwSearch.Column[%d].Width', [i]), lvwSearch.Column[i].Width);
    tbrControl.DockPos      := ini.ReadInteger(Self.Name, 'tbrControl.DockPos', tbrControl.DockPos);
    tbrProgress.DockPos     := ini.ReadInteger(Self.Name, 'tbrProgress.DockPos', tbrProgress.DockPos);
    av.sMusicFolder         := ini.ReadString(Self.Name, 'MusicFolder', 'D:\Symlink\iTunes Music\Trees');
    av.sValidExtentions     := ini.ReadString(Self.Name, 'ValidExtentions', '.mp3.m4a.m4b.mp4.aac.m4p.wma.wmv.flac.fla.mpc.ape.ogg.oga.wav.wv');
    av.sMp3Gain             := ini.ReadString(Self.Name, 'MP3Gain', 'C:\!MyData\Programs\MP3Gain\MP3GainGUI.exe');
    av.sLyricsMaster        := ini.ReadString(Self.Name, 'LyricsMaster', 'C:\!MyData\Programs\Lyrics Master\ExtSupport.js');
    Self.Font.Name          := ini.ReadString('Font', 'FontName', '游ゴシック Medium');
    Self.Font.Size          := ini.ReadInteger('Font', 'FontSize', 10);
    av.cAlbumArt            := ini.ReadInteger(Self.Name, 'AlbumArtBkColor', clGray);
    av.iX1                  := ini.ReadInteger(Self.Name, 'AlbumX1', 20);
    av.iY1                  := ini.ReadInteger(Self.Name, 'AlbumY1', 20);
    av.iX2                  := ini.ReadInteger(Self.Name, 'AlbumX2', 60);
    av.iY2                  := ini.ReadInteger(Self.Name, 'AlbumY2', 20);
    av.iX3                  := ini.ReadInteger(Self.Name, 'AlbumX3', 20);
    av.iY3                  := ini.ReadInteger(Self.Name, 'AlbumY3', 60);
    av.iX4                  := ini.ReadInteger(Self.Name, 'AlbumX4', 60);
    av.iY4                  := ini.ReadInteger(Self.Name, 'AlbumY4', 60);
  finally
    ini.Free;
  end;
  wmp.settings.setMode('loop', True);
  imgCover.Canvas.Brush.Color := av.cAlbumArt;
  imgCover.Canvas.FillRect(imgCover.ClientRect);
  imgJacket.Draw(imgCover.Canvas, 0, 0, 0);
  lblTitle.Caption      := '';
  lblArtist.Caption     := '';
  lblAlbumYear.Caption  := '';
  lblLyricist.Caption   := '';
  lblComposer.Caption   := '';
  av.sPlaylistDir       := ExtractFilePath(Application.ExeName) + 'Playlist';
  ScrollBox1.Color      := $00F3F3F3;
  _SetColors;
end;

procedure TfrmMain._PlayFromPlaylist;
var
  item : TListItemEx;
  m : IWMPMedia;
  i : Integer;
  sExt : String;
begin
  wmp.currentPlaylist.clear;
  for i := 0 to lvwList.Items.Count-1 do
  begin
    item := TListItemEx(lvwList.Items[i]);
    sExt := ExtractFileExt(item.sFullPath);
    if ContainsText(av.sValidExtentions, sExt) then
    begin
      m := wmp.newMedia(item.sFullPath);
      wmp.currentPlaylist.appendItem(m);
    end;
  end;
end;

procedure TfrmMain._SaveSettings;
var
  ini : TMemIniFile;
  i : Integer;
begin
  tvwTree.SaveToFileEx(GetApplicationPath + F_TreeView);
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    ini.WriteWindowPosition(Self.Name, Self);
    ini.WriteInteger(Self.Name, 'panLeft.Width', panLeft.Width);
    ini.WriteInteger(Self.Name, 'lvwList.Height', lvwList.Height);
    for i := 0 to 3 do
      ini.WriteInteger(Self.Name, Format('lvwList.Column[%d].Width', [i]), lvwList.Column[i].Width);
    for i := 0 to 2 do
      ini.WriteInteger(Self.Name, Format('lvwSearch.Column[%d].Width', [i]), lvwSearch.Column[i].Width);
    ini.WriteInteger(Self.Name, 'tbrControl.DockPos', tbrControl.DockPos);
    ini.WriteInteger(Self.Name, 'tbrProgress.DockPos', tbrProgress.DockPos);
    ini.WriteString(Self.Name, 'MusicFolder', av.sMusicFolder);
    ini.WriteString(Self.Name, 'ValidExtentions', av.sValidExtentions);
    ini.WriteString(Self.Name, 'MP3Gain', av.sMp3Gain);
    ini.WriteString(Self.Name, 'LyricsMaster', av.sLyricsMaster);
    ini.WriteString('Font', 'FontName', Self.Font.Name);
    ini.WriteInteger('Font', 'FontSize', Self.Font.Size);
    ini.WriteInteger(Self.Name, 'AlbumX1', av.iX1);
    ini.WriteInteger(Self.Name, 'AlbumY1', av.iY1);
    ini.WriteInteger(Self.Name, 'AlbumX2', av.iX2);
    ini.WriteInteger(Self.Name, 'AlbumY2', av.iY2);
    ini.WriteInteger(Self.Name, 'AlbumX3', av.iX3);
    ini.WriteInteger(Self.Name, 'AlbumY3', av.iY3);
    ini.WriteInteger(Self.Name, 'AlbumX4', av.iX4);
    ini.WriteInteger(Self.Name, 'AlbumY4', av.iY4);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

procedure TfrmMain._SearchFolders(node: TTreeNode; path: String);
var
  add : TTreeNode;
  sr : TSearchRec;
begin
  if FindFirst(path + '\*.*', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') and (sr.Attr and faDirectory > 0) then
      begin
        add := tvwTree.Items.AddChild(node, sr.Name);
        if ut_IsAlbum(path + '\' + sr.Name) then
        begin
          if ut_IsSymbolicLink(path + '\' + sr.Name) then
          begin
            add.ImageIndex    := ICO_MUSIC_ALBUM_CLOSE_SYM;
            add.SelectedIndex := ICO_MUSIC_ALBUM_OPEN_SYM;
          end
          else
          begin
            add.ImageIndex    := ICO_MUSIC_ALBUM_CLOSE;
            add.SelectedIndex := ICO_MUSIC_ALBUM_OPEN;
          end;
        end
        else
        begin
          add.ImageIndex    := ICO_MUSIC_FOLDER_CLOSE;
          add.SelectedIndex := ICO_MUSIC_FOLDER_OPEN;
        end;
        _SearchFolders(add, path + '\' + sr.Name);
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TfrmMain._SearchMedia;
var
  sl : TStringList;
  item : TListItem;
  sDir, sSubstr, sBody : String;
  i : Integer;
begin
  if radRoot.Checked then
    sDir := av.sMusicFolder
  else
    sDir := av.sMusicFolder + tvwTree.GetFullNodePath(tvwTree.Selected);

  lvwSearch.Items.BeginUpdate;
  sl := TStringList.Create;
  try
    lvwSearch.Items.Clear;
    sSubstr := Trim(cmbSearch.Text);
    GetFiles(sDir, Format('*%s*.*', [Trim(cmbSearch.Text)]), sl, True);
    for i := 0 to sl.Count-1 do
    begin
      sBody := ExtractFileBody(sl[i]);
      item := lvwSearch.Items.Add;
      item.Caption := ExtractFileDir(ReplaceText(sl[i], av.sMusicFolder + '\', ''));
      item.SubItems.Add(sBody);
      item.SubItems.Add(ExtractFileExt(sl[i]));
      Application.ProcessMessages;
    end;
  finally
    lvwSearch.Items.EndUpdate;
    sl.Free;
  end;
end;

procedure TfrmMain._SetColors;
begin
  av.cTotal       := GetTitlebarColor;
  av.cTotalFont   := SetTitlebarCaptionColor(av.cTotal);
  av.cNowPlay     := GetOppositeColor(av.cTotal);
  av.cNowPlayFont := SetTitlebarCaptionColor(av.cNowPlay);
end;

procedure TfrmMain._ShowLyrics(const LyricText: String);
var
  sl : TStringList;
  i, iTmp, iMaxWidth, iMaxHeight, iColumns, iTop, iLeft : Integer;
begin
  sl := TStringList.Create;
  try
    sl.Text := LyricText;
    imgLyrics.Canvas.Font.Name := Self.Font.Name;
    imgLyrics.Canvas.Font.Size := 10;
    iMaxWidth := 0;
    iMaxHeight := imgLyrics.Canvas.TextHeight('あ') * sl.Count;
    //一行の最大幅を求める
    for i:= 0 to sl.Count-1 do
    begin
      iTmp := imgLyrics.Canvas.TextWidth(sl[i]);
      if iTmp > iMaxWidth then
        iMaxWidth := iTmp;
    end;
    iMaxWidth := iMaxWidth + 16;
    //列数を決定する
    iColumns := Trunc(iMaxHeight/(imgLyrics.Height-16)+1);
    //imgLyricsの幅を決める
    imgLyrics.Width := iMaxWidth * iColumns;
    imgLyrics.Picture.Bitmap.Width := imgLyrics.Width;
    imgLyrics.Picture.Bitmap.Height := imgLyrics.Height;
    //imgLyricsの背景を塗る
    imgLyrics.Canvas.Brush.Style := bsSolid;
    imgLyrics.Canvas.Brush.Color := $00F3F3F3;
    imgLyrics.Canvas.FillRect(imgLyrics.ClientRect);
    //歌詞を描画する
    iTop := 0;
    iLeft := 0;
    iTmp := imgLyrics.Canvas.TextHeight('あ');
    for i := 0 to sl.Count-1 do
    begin
      if iTop > (imgLyrics.Height - 16) then
      begin
        iTop  := 0;
        iLeft := iLeft + iMaxWidth;
      end;
      imgLyrics.Canvas.TextOut(iLeft, iTop, sl[i]);
      iTop := iTop + iTmp;
    end;
  finally
    sl.Free;
  end;
end;

end.
