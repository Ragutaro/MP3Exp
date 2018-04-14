unit EditTag;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.StrUtils, IniFilesDX, System.IOUtils, System.Types,
  Vcl.Filectrl, Vcl.ComCtrls, HideListView, Vcl.StdCtrls, HideComboBox,
  SpTBXEditors, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, TB2Dock, SpTBXItem,
  TB2Item, TB2Toolbar, SpTBXTabs, Vcl.ExtDlgs, Winapi.shellAPI, System.UITypes,
  Vcl.Menus, jpeg, PNGImage, GIFImg, HideLabel, WMPLib_TLB;

type
  TfrmEditTag = class(TForm)
    lvwList: THideListView;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cmbData1: THideComboBox;
    cmbData2: THideComboBox;
    cmbData3: THideComboBox;
    cmbData4: THideComboBox;
    cmbData5: THideComboBox;
    cmbData6: THideComboBox;
    cmbData7: THideComboBox;
    cmbData8: THideComboBox;
    cmbData9: THideComboBox;
    cmbData10: THideComboBox;
    cmbData11: THideComboBox;
    cmbData12: THideComboBox;
    grpTitle: TGroupBox;
    Label14: TLabel;
    radFileToTitle: TRadioButton;
    radDeletePrefix: TRadioButton;
    spnDelete: TSpTBXSpinEdit;
    btnSave: TButton;
    SpTBXTabControl1: TSpTBXTabControl;
    tabCover: TSpTBXTabItem;
    SpTBXTabSheet1: TSpTBXTabSheet;
    tabLyric: TSpTBXTabItem;
    SpTBXTabSheet2: TSpTBXTabSheet;
    memLyrics: TMemo;
    lblCoverSize: TLabel;
    lblLyricsInfo: TLabel;
    toolLyrics: TSpTBXToolWindow;
    SpTBXToolbar1: TSpTBXToolbar;
    tbrSaveLyrics: TSpTBXItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    tbrGetLyrics: TSpTBXItem;
    tbrGetNextLyrics: TSpTBXItem;
    tbrSaveCurrentLyrics: TSpTBXItem;
    imgCover: TImageList;
    btnAddAPIC: TButton;
    btnDeleteAPIC: TButton;
    btnDeleteAllAPIC: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    imgList: TImageList;
    lblInfo: TLabel;
    popList: TSpTBXPopupMenu;
    popListDeletePRIV: TSpTBXItem;
    tabEditCover: TSpTBXTabItem;
    SpTBXTabSheet3: TSpTBXTabSheet;
    imgCoverPreview: TImage;
    Label15: TLabel;
    cmbCoverTYpe: TComboBox;
    Label13: TLabel;
    edtCover: TEdit;
    lblCoverPath: TLabel;
    btnAddCover: TButton;
    lblEditCoverSize: TLabel;
    btnEditCoverCancel: TButton;
    popCover: TSpTBXPopupMenu;
    popCoverExport: TSpTBXItem;
    popListExportAPIC: TSpTBXItem;
    lvwCover: THideListView;
    btnRefreshCoverArt: TButton;
    imgLyric: TImageList;
    panHelp: TPanel;
    lblHelp: THideLabel;
    SpTBXToolbar2: TSpTBXToolbar;
    btnCloseHelp: TSpTBXItem;
    timStart: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmbData2Change(Sender: TObject);
    procedure cmbData1Change(Sender: TObject);
    procedure cmbData3Change(Sender: TObject);
    procedure cmbData5Change(Sender: TObject);
    procedure cmbData7Change(Sender: TObject);
    procedure cmbData8Change(Sender: TObject);
    procedure cmbData6Change(Sender: TObject);
    procedure cmbData9Change(Sender: TObject);
    procedure cmbData10Change(Sender: TObject);
    procedure cmbData11Change(Sender: TObject);
    procedure cmbData12Change(Sender: TObject);
    procedure lvwListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure spnDeleteValueChanged(Sender: TObject);
    procedure radFileToTitleClick(Sender: TObject);
    procedure cmbData4Change(Sender: TObject);
    procedure cmbData1DropDown(Sender: TObject);
    procedure cmbData2DropDown(Sender: TObject);
    procedure cmbData3DropDown(Sender: TObject);
    procedure cmbData7DropDown(Sender: TObject);
    procedure cmbData8DropDown(Sender: TObject);
    procedure cmbData9DropDown(Sender: TObject);
    procedure cmbData10DropDown(Sender: TObject);
    procedure cmbData11DropDown(Sender: TObject);
    procedure cmbData1Select(Sender: TObject);
    procedure radDeletePrefixClick(Sender: TObject);
    procedure cmbData4DropDown(Sender: TObject);
    procedure cmbData4Select(Sender: TObject);
    procedure lvwListCreateItemClass(Sender: TCustomListView;
      var ItemClass: TListItemClass);
    procedure lvwListCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure tbrSaveLyricsClick(Sender: TObject);
    procedure lvwCoverCreateItemClass(Sender: TCustomListView;
      var ItemClass: TListItemClass);
    procedure btnAddAPICClick(Sender: TObject);
    procedure btnDeleteAPICClick(Sender: TObject);
    procedure btnDeleteAllAPICClick(Sender: TObject);
    procedure tbrSaveCurrentLyricsClick(Sender: TObject);
    procedure tbrGetLyricsClick(Sender: TObject);
    procedure tbrGetNextLyricsClick(Sender: TObject);
    procedure popListDeletePRIVClick(Sender: TObject);
    procedure btnAddCoverClick(Sender: TObject);
    procedure btnEditCoverCancelClick(Sender: TObject);
    procedure lvwCoverDblClick(Sender: TObject);
    procedure popCoverExportClick(Sender: TObject);
    procedure popListExportAPICClick(Sender: TObject);
    procedure lvwCoverCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshCoverArtClick(Sender: TObject);
    procedure btnCloseHelpClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure timStartTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private 宣言 }
    procedure _LoadSettings;
    procedure _SaveSettings;
    procedure _LoadTags;
    procedure _LoadTagsFiles;
    procedure _LoadTagsPlaylist;
    procedure _InputNewValueToListItems(const idx: Integer; cmb: THideComboBox);
    procedure _GetValueFromListItems(const idx: Integer; cmb: THideComboBox);
    procedure _DrawAlbumCover(bmp: TBitmap; iFrameIndex, iPictureID: Integer; sDescription: String);
    procedure _SaveTags(const iItemIndex: Integer);
    function _GetLyricFromLyricsMaser: String;
    procedure _FreeCoverArtMemory;
  public
    { Public 宣言 }
  end;

var
  frmEditTag: TfrmEditTag;

implementation

{$R *.dfm}

uses
  HideUtils,
  Main,
  TagsLibrary,
  Utils,
  dp;

type
  TlvwList = class(TListItem)
  private
    sFullPath : String;
    bChanged : Boolean;
  end;

  TlvwCover = class(TListItem)
  private
    sDescription : String;
    iPictureID : Integer;
//    bmp : TBitmap;
  end;


procedure TfrmEditTag.cmbData2Change(Sender: TObject);
begin
  _InputNewValueToListItems(1, cmbData2);
end;

procedure TfrmEditTag.cmbData2DropDown(Sender: TObject);
begin
  _GetValueFromListItems(1, cmbData2);
end;

procedure TfrmEditTag.cmbData3Change(Sender: TObject);
begin
  _InputNewValueToListItems(2, cmbData3);
end;

procedure TfrmEditTag.cmbData3DropDown(Sender: TObject);
begin
  _GetValueFromListItems(2, cmbData3);
end;

procedure TfrmEditTag.cmbData4Change(Sender: TObject);
begin
  _InputNewValueToListItems(3, cmbData4);
end;

procedure TfrmEditTag.cmbData4DropDown(Sender: TObject);
begin
  cmbData4.UAddNewItem('<連番>', atBottom);
end;

procedure TfrmEditTag.cmbData4Select(Sender: TObject);
var
  item : TlvwList;
  i, iCnt : Integer;
begin
  if cmbData4.Text = '<連番>' then
  begin
    iCnt := StrToIntDefEx(cmbData4.Text, 1);
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TlvwList(lvwList.Items[i]);
      if item.Selected then
      begin
        item.SubItems[3] := IntToStr(iCnt);
        iCnt := iCnt + 1;
      end;
    end;
  end
  else
  begin
  	item := TlvwList(lvwList.Selected);
    item.SubItems[3] := cmbData4.Text;
  end;
end;

procedure TfrmEditTag.cmbData5Change(Sender: TObject);
begin
  _InputNewValueToListItems(4, cmbData5);
end;

procedure TfrmEditTag.cmbData6Change(Sender: TObject);
begin
  _InputNewValueToListItems(5, cmbData6);
end;

procedure TfrmEditTag.cmbData7Change(Sender: TObject);
begin
  _InputNewValueToListItems(6, cmbData7);
end;

procedure TfrmEditTag.cmbData7DropDown(Sender: TObject);
begin
  _GetValueFromListItems(6, cmbData7);
end;

procedure TfrmEditTag.cmbData8Change(Sender: TObject);
begin
  _InputNewValueToListItems(7, cmbData8);
end;

procedure TfrmEditTag.cmbData8DropDown(Sender: TObject);
begin
  _GetValueFromListItems(7, cmbData8);
end;

procedure TfrmEditTag.cmbData9Change(Sender: TObject);
begin
  _InputNewValueToListItems(8, cmbData9);
end;

procedure TfrmEditTag.cmbData9DropDown(Sender: TObject);
begin
  _GetValueFromListItems(8, cmbData9);
end;

procedure TfrmEditTag.FormActivate(Sender: TObject);
begin
  lvwList.Refresh;
end;

procedure TfrmEditTag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  _SaveSettings;
  Release;
  frmEditTag := nil;   //フォーム名に変更する
end;

procedure TfrmEditTag.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  _FreeCoverArtMemory;
end;

procedure TfrmEditTag.FormCreate(Sender: TObject);
begin
  DisableVclStyles(Self);
  _LoadSettings;
end;

procedure TfrmEditTag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : Close;
  end;
end;

procedure TfrmEditTag.Label4Click(Sender: TObject);
var
  pt : TPoint;
begin
  lblHelp.Caption := '<連番> : 1番目から開始する。' + #13#10 +
                     '<連番>n : n番目から開始する。';
  GetCursorPos(pt);
  pt := ScreenToClient(pt);
  panHelp.Top := pt.Y - 75;
  panHelp.Left := pt.X - 150;
  panHelp.Visible := True;
end;

procedure TfrmEditTag.Label6Click(Sender: TObject);
var
  pt : TPoint;
begin
  lblHelp.Caption := '1枚だけの場合は指定不要。' + #13#10 +
                     '複数枚の場合は、1/3、2/3、3/3 等と指定する。';
  GetCursorPos(pt);
  pt := ScreenToClient(pt);
  panHelp.Top := pt.Y - 75;
  panHelp.Left := pt.X - 150;
  panHelp.Visible := True;
end;

procedure TfrmEditTag.lvwCoverCreateItemClass(Sender: TCustomListView;
  var ItemClass: TListItemClass);
begin
  ItemClass := TlvwCover;
end;

procedure TfrmEditTag.lvwCoverCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  lvwCover.ColorizeLines(Item, State, DefaultDraw);
end;

procedure TfrmEditTag.lvwCoverDblClick(Sender: TObject);
var
  itemList : TlvwList;
  itemCover : TlvwCover;
  bmp : TBitmap;
  tag : TTags;
begin
  itemCover := TlvwCover(lvwCover.Selected);
  itemList := TlvwList(lvwList.Selected);
  if (itemCover <> nil) and (itemList <> nil) then
  begin
    tag := TTags.Create;
    bmp := TBitmap.Create;
    try
      tag.LoadFromFile(itemList.sFullPath);
      tag.LoadCoverArt(bmp, tag, itemCover.Index);
      ut_ResizeImage(bmp, imgCoverPreview.Picture.Bitmap, 150);
      ut_CreateCoverPictureList(cmbCoverTYpe);
      cmbCoverTYpe.ItemIndex  := itemCover.iPictureID;
      edtCover.Text           := itemCover.sDescription;
      lblEditCoverSize.Caption:= Format('%d x %d', [bmp.Width, bmp.Height]);
      lblCoverPath.Caption    := itemList.sFullPath;
      btnAddCover.Caption     := '更新';
      tabEditCover.Caption    := 'アルバムアートの編集';
      tabEditCover.Tag        := 1;
      tabEditCover.Visible    := True;
      SpTBXTabControl1.ActiveTabIndex := 2;
      tabLyric.Visible := False;
      tabCover.Visible := False;
    finally
      tag.Free;
      bmp.Free;
    end;

//    ut_ResizeImage(itemCover.bmp, imgCoverPreview.Picture.Bitmap, 150);
//    ut_CreateCoverPictureList(cmbCoverTYpe);
//    cmbCoverTYpe.ItemIndex  := itemCover.iPictureID;
//    edtCover.Text           := itemCover.sDescription;
//    lblEditCoverSize.Caption:= Format('%d x %d', [itemCover.bmp.Width, itemCover.bmp.Height]);
//    lblCoverPath.Caption    := itemList.sFullPath;
//    btnAddCover.Caption     := '更新';
//    tabEditCover.Caption    := 'アルバムアートの編集';
//    tabEditCover.Tag        := 1;
//    tabEditCover.Visible    := True;
//    SpTBXTabControl1.ActiveTabIndex := 2;
//    tabLyric.Visible := False;
//    tabCover.Visible := False;
  end;
end;

procedure TfrmEditTag.lvwListCreateItemClass(Sender: TCustomListView;
  var ItemClass: TListItemClass);
begin
  ItemClass := TlvwList;
end;

procedure TfrmEditTag.lvwListCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  lvwList.ColorizeLines(Item, State, DefaultDraw);
  if (TlvwList(Item).sFullPath = av.sCurrentSong) and (frmMain.wmp.playState = wmppsPlaying) then
  begin
    with lvwList.Canvas do
    begin
      Brush.Style := bsSolid;
      Brush.Color := $00F7F7FF;
    end;
    Item.ImageIndex := 0;
  end
  else
    Item.ImageIndex := Item.StateIndex;
end;

procedure TfrmEditTag.lvwListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  ms : TMemoryStream;
  i : Integer;
  bmp : TBitmap;
  tag : TTags;
  s : String;
begin
  if lvwList.SelCount = 1 then
  begin
    cmbData2.Enabled := True;
    cmbData9.Enabled := True;
    toolLyrics.Enabled := True;
    for i := 1 to 12 do
      THideComboBox(FindComponent('cmbData' + IntToStr(i))).Text := TlvwList(Item).SubItems[i-1];
    memLyrics.Text := ReplaceText(TlvwList(Item).SubItems[12], '\n', #13#10);

    //Cover
    _FreeCoverArtMemory;
    lvwCover.Items.BeginUpdate;
    try
      lvwCover.Items.Clear;
      imgCover.Clear;
      tag := TTags.Create;
      bmp := TBitmap.Create;
      ms  := TMemoryStream.Create;
      try
        s := TlvwList(Item).sFullPath;
        if (s = av.sCurrentSong) and (frmMain.wmp.playState = wmppsPlaying) then
        begin
        	ms.LoadFromFile(s);
          tag.LoadFromStream(ms);
        end else
          tag.LoadFromFile(s);

        if tag.Loaded then
        begin
          for i := 0 to tag.CoverArtCount-1 do
          begin
            tag.LoadCoverArt(bmp, tag, i);
            _DrawAlbumCover(bmp, i, tag.CoverArts[i].CoverType, tag.CoverArts[i].Description);
          end;
        end;
      finally
        tag.Free;
        bmp.Free;
        ms.Free;
      end;
    finally
      lvwCover.Items.EndUpdate;
    end;
    lblInfo.Caption := TlvwList(Item).sFullPath;
  end else
  begin
    for i := 1 to 12 do
      THideComboBox(FindComponent('cmbData' + IntToStr(i))).Text := '<維持>';
    memLyrics.Text := '';
    toolLyrics.Enabled := False;
    lblInfo.Caption := '複数選択時は歌詞の編集と特定のアルバムアートの削除は出来ません。';
  end;
end;

procedure TfrmEditTag.popCoverExportClick(Sender: TObject);
var
  itemCover : TlvwCover;
  itemList : TlvwList;
begin
  itemCover := TlvwCover(lvwCover.Selected);
  itemList := TlvwList(lvwList.Selected);
  if (itemCover <> nil) and (itemList <> nil) then
    ut_ExportAPIC(itemList.sFullPath, itemCover.Index);
end;

procedure TfrmEditTag.popListDeletePRIVClick(Sender: TObject);
var
  item : TlvwList;
  tag : TTags;
  i, j, iCnt : Integer;
begin
  iCnt := 0;
  for i := 0 to lvwList.Items.Count-1 do
  begin
  	item :=  TlvwList(lvwList.Items[i]);
    if item.Selected then
    begin
      tag := TTags.Create;
      try
        tag.LoadFromFile(item.sFullPath);
        for j := tag.Count-1 downto 0 do
        begin
          if SameText('PRIV', tag.Tags[i].Name) then
          begin
          	tag.Delete(i);
            Inc(iCnt);
            lblInfo.Caption := Format('Deleted:FrameID[%d] %s', [j, ExtractFileBody(item.sFullPath)]);
            Application.ProcessMessages;
          end;
        end;
        tag.SaveToFile(item.sFullPath);
      finally
        tag.Free;
      end;
    end;
  end;
  lblInfo.Caption := Format('%d個のPRIVタグを除去しました。', [iCnt]);
end;

procedure TfrmEditTag.popListExportAPICClick(Sender: TObject);
var
  itemList : TlvwList;
begin
  itemList := TlvwList(lvwList.Selected);
  if itemList <> nil then
    ut_ExportAPIC(itemList.sFullPath, 0);
end;

procedure TfrmEditTag.radDeletePrefixClick(Sender: TObject);
var
  item : TlvwList;
  i : Integer;
begin
  for i := 0 to lvwList.Items.Count-1 do
  begin
    item := TlvwList(lvwList.Items[i]);
    if item.Selected then
    begin
      item.SubItems[0] := RemoveLeft(Item.Caption, Trunc(spnDelete.Value));
      item.bChanged := True;
    end;
  end;
end;

procedure TfrmEditTag.radFileToTitleClick(Sender: TObject);
var
  item : TlvwList;
  i : Integer;
begin
  for i := 0 to lvwList.Items.Count-1 do
  begin
    item := TlvwList(lvwList.Items[i]);
    if item.Selected then
    begin
      item.SubItems[0] := Item.Caption;
      item.bChanged := True;
    end;
  end;
end;

procedure TfrmEditTag.spnDeleteValueChanged(Sender: TObject);
begin
  if spnDelete.Value < 1 then
    spnDelete.Value := 0
  else
    cmbData1Change(Sender);
end;

procedure TfrmEditTag.tbrGetLyricsClick(Sender: TObject);
var
  item : TlvwList;
  tag : TTags;
  sTitle, sArtist, sExec : String;
begin
  item := TlvwList(lvwList.Selected);
  if item <> nil then
  begin
    tag := TTags.Create;
    try
      tag.LoadFromFile(item.sFullPath);
      sTitle := tag.GetTag(TAG_TITLE);
      sArtist:= tag.GetTag(TAG_ARTIST);
    finally
      tag.Free;
    end;
    if (sTitle <> '') or (sArtist <> '') then
    begin
      sExec :=  Format('"%s" multi "%s" "%s"' ,[av.sLyricsMaster, sTitle, sArtist]);
      ShellExecuteW(Self.Handle, 'OPEN', 'C:\WINDOWS\system32\wscript.exe', pchar(sExec), nil, SW_SHOWNORMAL);
    end;
  end;
end;

procedure TfrmEditTag.tbrGetNextLyricsClick(Sender: TObject);
begin
  lvwList.SelectNextItem;
  tbrGetLyrics.OnClick(nil);
end;

procedure TfrmEditTag.tbrSaveCurrentLyricsClick(Sender: TObject);
begin
  memLyrics.Text := _GetLyricFromLyricsMaser;
  tbrSaveLyrics.OnClick(nil);
end;

procedure TfrmEditTag.tbrSaveLyricsClick(Sender: TObject);
var
  item : TlvwList;
  tag : TTags;
  sFile, sLyric, sComposer : String;
  i : Integer;
begin
  item := TlvwList(lvwList.Selected);
  if (item = nil) or (memLyrics.Text = '') then
    Exit;

  //作詞･作曲者名が空欄の場合、入力する。
  for i := 0 to memLyrics.Lines.Count-1 do
  begin
    if (item.SubItems[8] = '') and ContainsText(memLyrics.Lines[i], '作詞') then
    begin
    	sLyric := ReplaceTextEx(CopyStrToEnd(memLyrics.Lines[i], '作詞'), ['作詞', '：', '　'], ['','','']);
      item.SubItems[8] := Trim(sLyric);
    end
    else if (item.SubItems[9] = '') and ContainsText(memLyrics.Lines[i], '作曲') then
    begin
    	sComposer := ReplaceTextEx(CopyStrToEnd(memLyrics.Lines[i], '作曲'), ['作曲', '：', '　'], ['','','']);
      item.SubItems[9] := Trim(sComposer);
      Break;
    end;
  end;

  sFile := item.sFullPath;
  tag := TTags.Create;
  try
    tag.LoadFromFile(sFile);
    if tag.Loaded then
    begin
      tag.SetTag(TAG_LYRICS, memLyrics.Text);
      tag.SetTag(TAG_LYRICIST, item.SubItems[8]);
      tag.SetTag(TAG_COMPOSER, item.SubItems[9]);
      tag.SaveToFile(sFile);
      item.SubItems[12] := ReplaceText(memLyrics.Text, #13#10, '\n');
    end;
  finally
    tag.Free;
  end;
  lblLyricsInfo.Caption := '歌詞を保存しました。';
end;

procedure TfrmEditTag.timStartTimer(Sender: TObject);
begin
  timStart.Enabled := False;
  _LoadTags;
end;

procedure TfrmEditTag.btnAddAPICClick(Sender: TObject);
var
  sFilename : String;
  bmp : TBitmap;
begin
  if OpenPictureDialog.Execute then
  begin
    sFilename := OpenPictureDialog.FileName;
    bmp := TBitmap.Create;
    try
      ut_CreateCoverArtBMPFromFile(sFilename, bmp);
      ut_ResizeImage(bmp, imgCoverPreview.Picture.Bitmap, 150);
      ut_CreateCoverPictureList(cmbCoverTYpe);
      cmbCoverTYpe.ItemIndex    := 3;
      lblEditCoverSize.Caption  := Format('%d x %d', [bmp.Width, bmp.Height]);
      lblCoverPath.Caption      := sFilename;
      btnAddCover.Caption       := '追加';
      tabEditCover.Caption      := 'アルバムアートの追加';
      tabEditCover.Tag          := 0;
      tabEditCover.Visible      := True;
      tabCover.Visible          := False;
      edtCover.Text             := '';
      SpTBXTabControl1.ActiveTabIndex := 2;
    finally
      bmp.Free;
    end;
  end;
end;

procedure TfrmEditTag.btnAddCoverClick(Sender: TObject);
var
  item : TlvwList;
  i, idx : Integer;
  bmp : TBitmap;
  tag : TTags;
  ms : TMemoryStream;
begin
  if tabEditCover.Tag = 0 then
  begin
    //追加
    lvwList.Items.BeginUpdate;
    try
      for i := 0 to lvwList.Items.Count-1 do
      begin
        item := TlvwList(lvwList.Items[i]);
        if item.Selected then
        begin
          tag := TTags.Create;
          try
            tag.LoadFromFile(item.sFullPath);
            tag.MakeCoverArtData(item.sFullPath, lblCoverPath.Caption, StrDef(edtCover.Text, ' '), cmbCoverTYpe.ItemIndex);
            tag.SaveToFile(item.sFullPath);
          finally
            tag.Free;
          end;

          if item.ImageIndex = -1 then
          begin
            bmp := TBitmap.Create;
            try
              ut_ResizeImage(imgCoverPreview.Picture.Bitmap, bmp, 24);
              imgList.AddMasked(bmp, clFuchsia);
              item.StateIndex := imgList.Count-1;
            finally
              bmp.Free;
            end;
          end;
          lblInfo.Caption := ExtractFileName(item.sFullPath) + 'に追加中...';
        end;
      end;
    finally
      lvwList.Items.EndUpdate;
    end;
  end
  else
  begin
    //編集
    item := TlvwList(lvwList.Selected);
    if item <> nil then
    begin
      tag := TTags.Create;
//      ms := TMemoryStream.Create;
      try
//        ms.LoadFromFile(lblCoverPath.Caption);
        idx := lvwCover.Selected.Index;
        tag.LoadFromFile(item.sFullPath);
        tag.CoverArts[idx].Description := StrDef(edtCover.Text, ' ');
        tag.CoverArts[idx].CoverType := cmbCoverTYpe.ItemIndex;
//        tag.CoverArts[idx].Stream.CopyFrom(ms, ms.Size);
        tag.SaveToFile(item.sFullPath);
      finally
        tag.Free;
//        ms.Free;
      end;
      lblInfo.Caption := ExtractFileName(item.sFullPath) + 'のアルバムアートの情報を更新しました。';
      Application.ProcessMessages;
    end;
  end;
  tabEditCover.Visible := False;
  tabLyric.Visible := True;
  tabCover.Visible := True;
  SpTBXTabControl1.ActiveTabIndex := 1;
end;

procedure TfrmEditTag.btnCloseHelpClick(Sender: TObject);
begin
  panHelp.Visible := False;
end;

procedure TfrmEditTag.btnDeleteAllAPICClick(Sender: TObject);
var
  tag : TTags;
  itemList : TlvwList;
  sFilename : String;
  i : Integer;
begin
  if MessageDlg('全てのアルバムアートを削除します。よろしいですか？', mtConfirmation) = mrNo then
    Exit;

  for i := 0 to lvwList.Items.Count-1 do
  begin
    itemList := TlvwList(lvwList.Items[i]);
    if itemList.Selected then
    begin
      sFilename := itemList.sFullPath;
      tag := TTags.Create;
      try
        tag.LoadFromFile(sFilename);
        tag.DeleteAllCoverArts;
        tag.SaveToFile(sFilename);
        lvwCover.Items.Clear;
      finally
        tag.Free;
      end;
      itemList.StateIndex := -1;
    end;
    lblInfo.Caption := '処理中:' + itemList.sFullPath;
    Application.ProcessMessages;
  end;
  lblInfo.Caption := '全てのアルバムアートを削除して更新しました。'
end;

procedure TfrmEditTag.btnDeleteAPICClick(Sender: TObject);
var
  tag : TTags;
  itemList : TlvwList;
  itemCover : TlvwCover;
  sFilename : String;
begin
  if lvwList.SelCount > 1 then
  begin
    ShowMessage('複数選択時は、特定のアルバムアートを削除できません。', mtError);
  	Exit;
  end;

  if MessageDlg('選択しているアルバムアートを削除します。よろしいですか？', mtConfirmation) = mrNo then
    Exit;

  itemCover := TlvwCover(lvwCover.Selected);
  itemList := TlvwList(lvwList.Selected);
  if (itemCover <> nil) and (itemList <> nil) then
  begin
    sFilename := itemList.sFullPath;
    tag := TTags.Create;
    try
      tag.LoadFromFile(sFilename);
      tag.CoverArts[itemCover.Index].Delete;
      tag.SaveToFile(sFilename);
      if tag.CoverArtCount = 0 then
      	itemList.StateIndex := -1;
    finally
      tag.Free;
    end;
    lblInfo.Caption := '指定のアルバムアートを削除してファイルを更新しました。';
  end;
end;

procedure TfrmEditTag.btnEditCoverCancelClick(Sender: TObject);
begin
  tabEditCover.Visible := False;
  tabLyric.Visible := True;
  tabCover.Visible := True;
  SpTBXTabControl1.ActiveTabIndex := 1;
end;

procedure TfrmEditTag.btnRefreshCoverArtClick(Sender: TObject);
var
  sFilename : String;
  bmp : TBitmap;
begin
  if OpenPictureDialog.Execute then
  begin
    sFilename := OpenPictureDialog.FileName;
    bmp := TBitmap.Create;
    try
      imgCoverPreview.Picture.Bitmap := nil;
      ut_CreateCoverArtBMPFromFile(sFilename, bmp);
      ut_ResizeImage(bmp, imgCoverPreview.Picture.Bitmap, 150);
      lblEditCoverSize.Caption  := Format('%d x %d', [bmp.Width, bmp.Height]);
      lblCoverPath.Caption      := sFilename;
//      TlvwCover(lvwCover.Selected).bmp.Assign(bmp);
    finally
      bmp.Free;
    end;
  end;
end;

procedure TfrmEditTag.btnSaveClick(Sender: TObject);
var
  i : Integer;
  item : TlvwList;
begin
  lvwList.Repaint;
  for i := 0 to lvwList.Items.Count-1 do
  begin
    item := TlvwList(lvwList.Items[i]);
    if item.Selected and (item.ImageIndex <> 0) then
    begin
      lblInfo.Caption := 'タグを更新中:' + item.sFullPath;
      Application.ProcessMessages;
    	_SaveTags(i);
    end;
  end;
  lblInfo.Caption := 'タグを更新しました。';
end;

procedure TfrmEditTag.cmbData10Change(Sender: TObject);
begin
  _InputNewValueToListItems(9, cmbData10);
end;

procedure TfrmEditTag.cmbData10DropDown(Sender: TObject);
begin
  _GetValueFromListItems(9, cmbData10);
end;

procedure TfrmEditTag.cmbData11Change(Sender: TObject);
begin
  _InputNewValueToListItems(10, cmbData11);
end;

procedure TfrmEditTag.cmbData11DropDown(Sender: TObject);
begin
  _GetValueFromListItems(10, cmbData11);
  ut_CreateGenreList(cmbData11);
end;

procedure TfrmEditTag.cmbData12Change(Sender: TObject);
begin
  _InputNewValueToListItems(11, cmbData12);
end;

procedure TfrmEditTag.cmbData1Change(Sender: TObject);
var
  item : TlvwList;
  i : Integer;
begin
  if cmbData1.Text = '<ファイル名から作成する>' then
  begin
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TlvwList(lvwList.Items[i]);
      if item.Selected then
      begin
        if radDeletePrefix.Checked then
          item.SubItems[0] := RemoveLeft(item.Caption, Trunc(spnDelete.Value))
        else
          item.SubItems[0] := Item.Caption;
        item.bChanged := True;
      end;
    end;
  end
  else
  begin
    item := TlvwList(lvwList.Selected);
    item.SubItems[0] := cmbData1.Text;
  end;
end;

procedure TfrmEditTag.cmbData1DropDown(Sender: TObject);
begin
  _GetValueFromListItems(0, cmbData1);
  cmbData1.UAddNewItem('<ファイル名から作成する>', atBottom);
end;

procedure TfrmEditTag.cmbData1Select(Sender: TObject);
begin
  if cmbData1.Text = '<ファイル名から作成する>' then
  begin
    grpTitle.Visible := True;
  end else
    grpTitle.Visible := False;
end;

procedure TfrmEditTag._DrawAlbumCover(bmp: TBitmap; iFrameIndex, iPictureID: Integer; sDescription: String);
var
  item : TlvwCover;
  bmpSmall : TBitmap;
begin
  bmpSmall := TBitmap.Create;
  try
    ut_ResizeImage(bmp, bmpSmall, 64);
    imgCover.AddMasked(bmpSmall, clFuchsia);
    item := TlvwCover(lvwCover.Items.Add);
    item.Caption := IntToStr(bmp.Width) + ' x ' + IntToStr(bmp.Height);
    item.SubItems.Add(ut_ConvertPictureID2String(iPictureID));
    item.SubItems.Add(sDescription);
    item.ImageIndex := imgCover.Count-1;// index;
//    item.bmp := TBitmap.Create;
//    item.bmp.Assign(bmp);
    item.iPictureID := iPictureID;
    item.sDescription := sDescription;
  finally
    bmpSmall.Free;
  end;
end;

procedure TfrmEditTag._FreeCoverArtMemory;
//var
//  i : Integer;
begin
//  if lvwCover.Items.Count > 0 then
//  begin
//    for i := lvwCover.Items.Count-1 downto 0 do
//      TlvwCover(lvwCover.Items[i]).bmp.Free;
//  end;
end;

function TfrmEditTag._GetLyricFromLyricsMaser: String;
var
  hnd : Integer;
  s : String;
begin
  Result := '';
  hnd := FindWindow('RBWindow', 'Lyrics Master');
  if hnd = 0 then
    ShowMessage('Lyrics Masterのウィンドウが見つかりません。', mtError)
  else
  begin
    hnd := FindWindowEx(hnd, 0, 'RICHEDIT50W', nil);
    SetLength(s, 10000);
    SendMessage(hnd, WM_GETTEXT, Length(s), longint(PChar(s)));
    Result := s;
  end;
end;

procedure TfrmEditTag._GetValueFromListItems(const idx: Integer;
  cmb: THideComboBox);
var
  item : TlvwList;
  i : Integer;
begin
  cmb.Items.BeginUpdate;
  try
    cmb.Items.Clear;
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TlvwList(lvwList.Items[i]);
      cmb.UAddNewItem(item.SubItems[idx], atBottom);
    end;
    cmb.UAddNewItem('<維持>', atBottom);
  finally
    cmb.Items.EndUpdate;
  end;
end;

procedure TfrmEditTag._InputNewValueToListItems(const idx: Integer; cmb: THideComboBox);
var
  item : TlvwList;
  i, iTruckNo : Integer;
begin
  if cmb.Text = '<維持>' then
    Exit;

  //トラックの場合
  if cmb.Name = 'cmbData4' then
  begin
    iTruckNo := StrToIntDefEx(cmb.Text, 1);
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TlvwList(lvwList.Items[i]);
      if item.Selected then
      begin
        item.SubItems[idx] := IntToStr(iTruckNo);
        item.bChanged := True;
        Inc(iTruckNo);
      end;
    end;
  end
  else
  begin
  //トラック以外の場合
    for i := 0 to lvwList.Items.Count-1 do
    begin
      item := TlvwList(lvwList.Items[i]);
      if item.Selected then
      begin
        item.SubItems[idx] := Trim(cmb.Text);
        item.bChanged := True;
      end;
    end;
  end;
end;

procedure TfrmEditTag._LoadSettings;
var
  ini : TMemIniFile;
  i : Integer;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    for i := 0 to 13 do
      lvwList.Column[i].Width := ini.ReadInteger(Self.Name, 'lvwList.Column[' + IntToStr(i) + '].Width', lvwList.Column[i].Width);
    for i := 0 to 2 do
      lvwCover.Column[i].Width := ini.ReadInteger(Self.Name, 'lvwCover.Column[' + IntToStr(i) + '].Width', lvwCover.Column[i].Width);
    ini.ReadWindowPosition(Self.Name, Self);
    Self.Font.Name := ini.ReadString('Font', 'FontName', '游ゴシック Medium');
    Self.Font.Size := ini.ReadInteger('Font', 'FontSize', 10);
  finally
    ini.Free;
  end;
  tabEditCover.Visible := False;
  imgCoverPreview.Picture.Bitmap.Transparent := True;
  imgCoverPreview.Picture.Bitmap.TransparentColor := clFuchsia;
end;

procedure TfrmEditTag._LoadTags;
begin
  Case frmMain.tvwTree.Selected.ImageIndex of
    ICO_MUSIC_FOLDER_CLOSE, ICO_MUSIC_FOLDER_CLOSE_SYM : _LoadTagsFiles;
    ICO_MUSIC_ALBUM_CLOSE, ICO_MUSIC_ALBUM_CLOSE_SYM   : _LoadTagsFiles;
    ICO_PLAYLIST_FILE                                  : _LoadTagsPlaylist;
  end;
end;

procedure TfrmEditTag._LoadTagsFiles;
var
  ms : TMemoryStream;
  item : TlvwList;
  sl : TStringList;
  s, sExt : String;
  tag : TTags;
  bmpSrc, bmpDst : TBitmap;
  i : Integer;
begin
  sl := TStringList.Create;
  ms := TMemoryStream.Create;
  tag := TTags.Create;
  bmpSrc := TBitmap.Create;
  bmpDst := TBitmap.Create;
  try
    GetFiles(av.sMusicFolder + frmMain.tvwTree.GetFullNodePath(frmMain.tvwTree.Selected), '*.*', sl, True);
    for i := 0 to sl.Count-1do
    begin
      s := sl[i];
      sExt := ExtractFileExt(s);
      if ContainsText(av.sValidExtentions, sExt) then
      begin
        //再生中のファイルは一旦msに読み込んでからタグを読む
        if (s = av.sCurrentSong) and (frmMain.wmp.playState = wmppsPlaying) then
        begin
          ms.LoadFromFile(s);
          tag.LoadFromStream(ms);
        end
        else
          tag.LoadFromFile(s);

        if tag.Loaded then
        begin
          item := TlvwList(lvwList.Items.Add);
          item.Caption := ExtractFileBody(s);
          item.SubItems.Add(tag.GetTag(TAG_TITLE));
          item.SubItems.Add(tag.GetTag(TAG_SUBTITLE));
          item.SubItems.Add(tag.GetTag(TAG_ALBUM));
          item.SubItems.Add(tag.GetTag(TAG_TRACKNUMBER));
          item.SubItems.Add(StrDef(tag.GetTag(TAG_RELEASEDATE), tag.GetTag(TAG_YEAR)));
          item.SubItems.Add(tag.GetTag(TAG_DISCNUMBER));
          item.SubItems.Add(tag.GetTag(TAG_ARTIST));
          item.SubItems.Add(tag.GetTag(TAG_ALBUMARTIST));
          item.SubItems.Add(tag.GetTag(TAG_LYRICIST));
          item.SubItems.Add(tag.GetTag(TAG_COMPOSER));
          item.SubItems.Add(tag.GetTag(TAG_GENRE));
          item.SubItems.Add(tag.GetTag(TAG_COMMENT));
          item.SubItems.Add(ReplaceText(tag.GetTag(TAG_LYRICS), #13#10, '\n'));
          item.sFullPath  := s;
          item.StateIndex := -1;
          try
            tag.LoadCoverArt(bmpSrc, tag, 0);
            ut_ResizeImage(bmpSrc, bmpDst, 24);
            imgList.AddMasked(bmpDst, clFuchsia);
            if bmpSrc.Width > 0 then
              item.StateIndex := imgList.Count-1;
          except
            //
          end;
        end;//if
      end;//if
    end; //for
  finally
    ms.Free;
    tag.Free;
    bmpSrc.Free;
    bmpDst.Free;
    sl.Free;
  end;
end;

procedure TfrmEditTag._LoadTagsPlaylist;
var
  ms : TMemoryStream;
  item : TlvwList;
  tag : TTags;
  bmpSrc, bmpDst : TBitmap;
  sl : TStringList;
  i : Integer;
begin
  ms     := TMemoryStream.Create;
  sl     := TStringList.Create;
  tag    := TTags.Create;
  bmpSrc := TBitmap.Create;
  bmpDst := TBitmap.Create;
  try
    sl.LoadFromFile(Format('%s\%s.m3u', [av.sPlaylistDir, frmMain.tvwTree.Selected.Text]), TEncoding.UTF8);
    for i := 0 to sl.Count-1 do
    begin
      if LeftStr(sl[i], 1) <> '#' then
      begin
        if (sl[i] = av.sCurrentSong) and (frmMain.wmp.playState = wmppsPlaying) then
        begin
          ms.LoadFromFile(sl[i]);
          tag.LoadFromStream(ms);
        end
        else
          tag.LoadFromFile(sl[i]);

        if tag.Loaded then
        begin
          item := TlvwList(lvwList.Items.Add);
          item.Caption := ExtractFileBody(sl[i]);
          item.SubItems.Add(tag.GetTag(TAG_TITLE));
          item.SubItems.Add(tag.GetTag(TAG_SUBTITLE));
          item.SubItems.Add(tag.GetTag(TAG_ALBUM));
          item.SubItems.Add(tag.GetTag(TAG_TRACKNUMBER));
          item.SubItems.Add(StrDef(tag.GetTag(TAG_RELEASEDATE), tag.GetTag(TAG_YEAR)));
          item.SubItems.Add(tag.GetTag(TAG_DISCNUMBER));
          item.SubItems.Add(tag.GetTag(TAG_ARTIST));
          item.SubItems.Add(tag.GetTag(TAG_ALBUMARTIST));
          item.SubItems.Add(tag.GetTag(TAG_LYRICIST));
          item.SubItems.Add(tag.GetTag(TAG_COMPOSER));
          item.SubItems.Add(tag.GetTag(TAG_GENRE));
          item.SubItems.Add(tag.GetTag(TAG_COMMENT));
          item.SubItems.Add(ReplaceText(tag.GetTag(TAG_LYRICS), #13#10, '\n'));
          item.sFullPath := sl[i];
          item.StateIndex := -1;
          //AlbumArt読み込み
          try
            tag.LoadCoverArt(bmpSrc, tag, 0);
            ut_ResizeImage(bmpSrc, bmpDst, 24);
            imgList.AddMasked(bmpDst, clFuchsia);
            if bmpSrc.Width > 0 then
              item.StateIndex := imgList.Count-1;
          except
            //
          end;
        end;
      end;
    end;
  finally
    ms.Free;
    sl.Free;
    tag.Free;
    bmpSrc.Free;
    bmpDst.Free;
  end;
end;

procedure TfrmEditTag._SaveSettings;
var
  ini : TMemIniFile;
  i : Integer;
begin
  ini := TMemIniFile.Create(GetIniFileName, TEncoding.Unicode);
  try
    for i := 0 to 13 do
      ini.WriteInteger(Self.Name, 'lvwList.Column[' + IntToStr(i) + '].Width', lvwList.Column[i].Width);
    for i := 0 to 2 do
      ini.WriteInteger(Self.Name, 'lvwCover.Column[' + IntToStr(i) + '].Width', lvwCover.Column[i].Width);
    ini.WriteWindowPosition(Self.Name, Self);
    ini.UpdateFile;
  finally
    ini.Free;
  end;
end;

procedure TfrmEditTag._SaveTags(const iItemIndex: Integer);
var
  tag : TTags;
  item : TlvwList;
  sFile : String;
begin
  item := TlvwList(lvwList.Items[iItemIndex]);
  sFile := item.sFullPath;
  tag := TTags.Create;
  try
    tag.LoadFromFile(sFile);
    if tag.Loaded then
    begin
      tag.SetTag(TAG_TITLE,       item.SubItems[0]);
      tag.SetTag(TAG_SUBTITLE,    item.SubItems[1]);
      tag.SetTag(TAG_ALBUM,       item.SubItems[2]);
      tag.SetTag(TAG_TRACKNUMBER, item.SubItems[3]);
      tag.SetTag(TAG_YEAR,        item.SubItems[4]);  //.m4aは Year を読まず ReleaseDate を読むため、
      tag.SetTag(TAG_RELEASEDATE, item.SubItems[4]);  //両方保存する
      tag.SetTag(TAG_DISCNUMBER,  item.SubItems[5]);
      tag.SetTag(TAG_ARTIST,      item.SubItems[6]);
      tag.SetTag(TAG_ALBUMARTIST, item.SubItems[7]);
      tag.SetTag(TAG_LYRICIST,    item.SubItems[8]);
      tag.SetTag(TAG_COMPOSER,    item.SubItems[9]);
      tag.SetTag(TAG_GENRE,       item.SubItems[10]);
      tag.SetTag(TAG_COMMENT,     item.SubItems[11]);
      tag.SaveToFile(sFile);
    end;
  finally
    tag.Free;
  end;
end;

end.
