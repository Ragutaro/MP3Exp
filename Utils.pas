unit Utils;
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, System.StrUtils, System.IOUtils, System.Types, Vcl.StdCtrls,Vcl.Dialogs,
  Vcl.ComCtrls;

  procedure ut_ResizeImage(bmpSrc, bmpDst: TBitmap; iSize: Integer);
  function  ut_ConvertPictureID2String(const iPictureID: Integer): String;
  procedure ut_CreateCoverPictureList(cmb: TComboBox);
  procedure ut_CreateGenreList(cmb: TComboBox);
  procedure ut_ExportAPIC(const sMediaFilename: String; iFrameIndex: Integer);
  function  ut_CreateTotalTime(iTotal: Integer): String;
  procedure ut_CreateCoverArtBMPFromFile(const Filename: String; bmp : TBitmap);
  procedure ut_CalculateTotals(const iTotalTime, iTotalSize: Integer);
  function  ut_IsAlbum(const Path: String): Boolean;
  procedure ut_DrawListItems(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);

const
  ICO_MUSIC_ROOT            = 0;
  ICO_MUSIC_FOLDER_CLOSE    = 1;
  ICO_MUSIC_FOLDER_OPEN     = 2;
  ICO_PLAYLIST_ROOT         = 13;
  ICO_PLAYLIST_FILE         = 14;
  ICO_MUSIC_ALBUM_CLOSE     = 15;
  ICO_MUSIC_ALBUM_OPEN      = 16;
  ICO_MUSIC_FOLDER_CLOSE_SYM= 17;
  ICO_MUSIC_FOLDER_OPEN_SYM = 18;
  ICO_MUSIC_ALBUM_CLOSE_SYM = 19;
  ICO_MUSIC_ALBUM_OPEN_SYM  = 20;


implementation

uses
  TagsLibrary,
  HideUtils,
  Main,
  EditTag,
  CoverArt,
  jpeg,
  PNGImage,
  GIFImg;

procedure ut_ResizeImage(bmpSrc, bmpDst: TBitmap; iSize: Integer);
var
  fRate : Single;
  iWidth, iHeight : Integer;
begin
  //比率を求める
  if bmpSrc.Width > bmpSrc.Height then
    fRate := iSize / bmpSrc.Width
  else
    fRate := iSize / bmpSrc.Height;

  iWidth := Trunc(bmpSrc.Width * fRate);
  iHeight:= Trunc(bmpSrc.Height * fRate);
  bmpDst.SetSize(iSize, iSize);
  bmpDst.Canvas.Brush.Color := clFuchsia;
  bmpDst.Canvas.FillRect(bmpSrc.Canvas.ClipRect);
  SetStretchBltMode(bmpDst.Canvas.Handle, HALFTONE);
  StretchBlt(bmpDst.Canvas.Handle, (iSize div 2)-(iWidth div 2), (iSize div 2)-(iHeight div 2), iWidth, iHeight,
             bmpSrc.Canvas.Handle, 0, 0, bmpSrc.Width, bmpSrc.Height,
             SRCCOPY);
end;

function ut_ConvertPictureID2String(const iPictureID: Integer): String;
begin
  Case iPictureID of
    0 : Result := 'Other';
    1 : Result := '32x32 Icon(PNG)';
    2 : Result := 'Other File Icon';
    3 : Result := 'Front Cover';
    4 : Result := 'Back Cover';
    5 : Result := 'Leaflet';
    6 : Result := 'Media';
    7 : Result := 'Lead artist/Lead performer/Soloist';
    8 : Result := 'Artist/Performer';
    9 : Result := 'Conductor';
   10 : Result := 'Band/Orchestra';
   11 : Result := 'Composer';
   12 : Result := 'Lyricist';
   13 : Result := 'Recording Location';
   14 : Result := 'During Recording';
   15 : Result := 'During Performance';
   16 : Result := 'Movie/Video Screen Capture';
   17 : Result := 'A Bright Coloured Fish';
   18 : Result := 'Illustration';
   19 : Result := 'Band/Artist Logotype';
   20 : Result := 'Publisher/Studio Logotype';
  end;
end;

procedure ut_CreateCoverPictureList(cmb: TComboBox);
begin
  cmb.Items.BeginUpdate;
  try
    cmb.Items.Clear;
    cmb.Items.Add('Other');
    cmb.Items.Add('32x32 Icon(PNG)');
    cmb.Items.Add('Other File Icon');
    cmb.Items.Add('Front Cover');
    cmb.Items.Add('Back Cover');
    cmb.Items.Add('Leaflet');
    cmb.Items.Add('Media');
    cmb.Items.Add('Lead artist/Lead performer/Soloist');
    cmb.Items.Add('Artist/Performer');
    cmb.Items.Add('Conductor');
    cmb.Items.Add('Band/Orchestra');
    cmb.Items.Add('Composer');
    cmb.Items.Add('Lyricist');
    cmb.Items.Add('Recording Location');
    cmb.Items.Add('During Recording');
    cmb.Items.Add('During Performance');
    cmb.Items.Add('Movie/Video Screen Capture');
    cmb.Items.Add('A Bright Coloured Fish');
    cmb.Items.Add('Illustration');
    cmb.Items.Add('Band/Artist Logotype');
    cmb.Items.Add('Publisher/Studio Logotype');
  finally
    cmb.Items.EndUpdate;
  end;
end;

procedure ut_CreateGenreList(cmb: TComboBox);
begin
  cmb.Items.BeginUpdate;
  try
    cmb.Items.Add('Blues');
    cmb.Items.Add('Classic Rock');
    cmb.Items.Add('Country');
    cmb.Items.Add('Dance');
    cmb.Items.Add('Disco');
    cmb.Items.Add('Funk');
    cmb.Items.Add('Grunge');
    cmb.Items.Add('Hip-Hop');
    cmb.Items.Add('Jazz');
    cmb.Items.Add('Metal');
    cmb.Items.Add('New Age');
    cmb.Items.Add('Oldies');
    cmb.Items.Add('Other');
    cmb.Items.Add('Pop');
    cmb.Items.Add('R&B');
    cmb.Items.Add('Rap');
    cmb.Items.Add('Reggae');
    cmb.Items.Add('Rock');
    cmb.Items.Add('Techno');
    cmb.Items.Add('Industrial');
    cmb.Items.Add('Alternative');
    cmb.Items.Add('Ska');
    cmb.Items.Add('Death Metal');
    cmb.Items.Add('Pranks');
    cmb.Items.Add('Soundtrack');
    cmb.Items.Add('Euro-Techno');
    cmb.Items.Add('Ambient');
    cmb.Items.Add('Trip-Hop');
    cmb.Items.Add('Vocal');
    cmb.Items.Add('Jazz+Funk');
    cmb.Items.Add('Fusion');
    cmb.Items.Add('Trance');
    cmb.Items.Add('Classical');
    cmb.Items.Add('Instrumental');
    cmb.Items.Add('Acid');
    cmb.Items.Add('House');
    cmb.Items.Add('Game');
    cmb.Items.Add('Sound Clip');
    cmb.Items.Add('Gospel');
    cmb.Items.Add('Noise');
    cmb.Items.Add('Alternative Rock');
    cmb.Items.Add('Bass');
    cmb.Items.Add('Soul');
    cmb.Items.Add('Punk');
    cmb.Items.Add('Space');
    cmb.Items.Add('Meditative');
    cmb.Items.Add('Instrumental Pop');
    cmb.Items.Add('Instrumental Rock');
    cmb.Items.Add('Ethnic');
    cmb.Items.Add('Gothic');
    cmb.Items.Add('Darkwave');
    cmb.Items.Add('Techno-Industrial');
    cmb.Items.Add('Electronic');
    cmb.Items.Add('Pop-Folk');
    cmb.Items.Add('Eurodance');
    cmb.Items.Add('Dream');
    cmb.Items.Add('Southern Rock');
    cmb.Items.Add('Comedy');
    cmb.Items.Add('Cult');
    cmb.Items.Add('Gangsta');
    cmb.Items.Add('Top 40');
    cmb.Items.Add('Christian Rap');
    cmb.Items.Add('Pop/Funk');
    cmb.Items.Add('Jungle');
    cmb.Items.Add('Native US');
    cmb.Items.Add('Cabaret');
    cmb.Items.Add('New Wave');
    cmb.Items.Add('Psychadelic');
    cmb.Items.Add('Rave');
    cmb.Items.Add('Showtunes');
    cmb.Items.Add('Trailer');
    cmb.Items.Add('Lo-Fi');
    cmb.Items.Add('Tribal');
    cmb.Items.Add('Acid Punk');
    cmb.Items.Add('Acid Jazz');
    cmb.Items.Add('Polka');
    cmb.Items.Add('Retro');
    cmb.Items.Add('Musical');
    cmb.Items.Add('Rock & Roll');
    cmb.Items.Add('Hard Rock');
    cmb.Items.Add('Folk');
    cmb.Items.Add('Folk-Rock');
    cmb.Items.Add('National Folk');
    cmb.Items.Add('Swing');
    cmb.Items.Add('Fast Fusion');
    cmb.Items.Add('Bebob');
    cmb.Items.Add('Latin');
    cmb.Items.Add('Revival');
    cmb.Items.Add('Celtic');
    cmb.Items.Add('Bluegrass');
    cmb.Items.Add('Avantgarde');
    cmb.Items.Add('Gothic Rock');
    cmb.Items.Add('Progressive Rock');
    cmb.Items.Add('Psychedelic Rock');
    cmb.Items.Add('Symphonic Rock');
    cmb.Items.Add('Slow Rock');
    cmb.Items.Add('Big Band');
    cmb.Items.Add('Chorus');
    cmb.Items.Add('Easy Listening');
    cmb.Items.Add('Acoustic');
    cmb.Items.Add('Humour');
    cmb.Items.Add('Speech');
    cmb.Items.Add('Chanson');
    cmb.Items.Add('Opera');
    cmb.Items.Add('Chamber Music');
    cmb.Items.Add('Sonata');
    cmb.Items.Add('Symphony');
    cmb.Items.Add('Booty Bass');
    cmb.Items.Add('Primus');
    cmb.Items.Add('Porn Groove');
    cmb.Items.Add('Satire');
    cmb.Items.Add('Slow Jam');
    cmb.Items.Add('Club');
    cmb.Items.Add('Tango');
    cmb.Items.Add('Samba');
    cmb.Items.Add('Folklore');
    cmb.Items.Add('Ballad');
    cmb.Items.Add('Power Ballad');
    cmb.Items.Add('Rhytmic Soul');
    cmb.Items.Add('Freestyle');
    cmb.Items.Add('Duet');
    cmb.Items.Add('Punk Rock');
    cmb.Items.Add('Drum Solo');
    cmb.Items.Add('Acapella');
    cmb.Items.Add('Euro-House');
    cmb.Items.Add('Dance Hall');
    cmb.Items.Add('Goa');
    cmb.Items.Add('Drum & Bass');
    cmb.Items.Add('Club-House');
    cmb.Items.Add('Hardcore');
    cmb.Items.Add('Terror');
    cmb.Items.Add('Indie');
    cmb.Items.Add('BritPop');
    cmb.Items.Add('Negerpunk');
    cmb.Items.Add('Polsk Punk');
    cmb.Items.Add('Beat');
    cmb.Items.Add('Christian Gangsta');
    cmb.Items.Add('Heavy Metal');
    cmb.Items.Add('Black Metal');
    cmb.Items.Add('Crossover');
    cmb.Items.Add('Contemporary C');
    cmb.Items.Add('Christian Rock');
    cmb.Items.Add('Merengue');
    cmb.Items.Add('Salsa');
    cmb.Items.Add('Thrash Metal');
    cmb.Items.Add('Anime');
    cmb.Items.Add('JPop');
    cmb.Items.Add('SynthPop');
  finally
    cmb.Items.EndUpdate;
  end;
end;

procedure ut_ExportAPIC(const sMediaFilename: String; iFrameIndex: Integer);
var
  jpg : TJPEGImage;
  png : TPngImage;
  gif : TGIFImage;
  bmp : TBitmap;
  t : TTags;
  sFilename : String;
begin
  if sMediaFilename = '' then
    Exit;

  if frmMain.SavePictureDialog.Execute then
  begin
    sFileName := RemoveFileExt(frmMain.SavePictureDialog.FileName);
    t := TTags.Create;
    try
      t.LoadFromFile(sMediaFilename);
      if t.Loaded then
      begin
        Case t.CoverArts[iFrameIndex].PictureFormat of
          tpfJPEG :
            begin
              jpg := TJPEGImage.Create;
              try
                jpg.LoadFromStream(t.CoverArts[iFrameIndex].Stream);
                jpg.SaveToFile(sFilename + '.jpg');
              finally
                jpg.Free;
              end;
            end;
          tpfPNG :
            begin
              png := TPngImage.Create;
              try
                png.LoadFromStream(t.CoverArts[iFrameIndex].Stream);
                png.SaveToFile(sFilename + '.png');
              finally
                png.Free;
              end;
            end;
          tpfGIF :
            begin
              gif := TGIFImage.Create;
              try
                gif.LoadFromStream(t.CoverArts[iFrameIndex].Stream);
                gif.SaveToFile(sFilename + '.gif');
              finally
                gif.Free;
              end;
            end;
          tpfBMP :
            begin
              bmp := TBitmap.Create;
              try
                bmp.LoadFromStream(t.CoverArts[iFrameIndex].Stream);
                bmp.SaveToFile(sFilename + '.bmp');
              finally
                bmp.Free;
              end;
            end;
        end;
      end;
    finally
      t.Free;
    end;
  end;
end;

function ut_CreateTotalTime(iTotal: Integer): String;
var
  iHour, iMinute, iSecond : Integer;
begin
  iHour := iTotal div 3600;
  iMinute := (iTotal - (iHour*3600)) div 60;
  iSecond := iTotal - (iHour*3600) - (iMinute*60);
  if iHour = 0 then
    Result := Format('%.2d:%.2d', [iMinute, iSecond])
  else
    Result := Format('%.2d:%.2d:%.2d', [iHour, iMinute, iSecond]);
end;

procedure ut_CreateCoverArtBMPFromFile(const Filename: String; bmp : TBitmap);
var
  jpg : TJPEGImage;
  png : TPngImage;
  gif : TGIFImage;
  sExt : String;
begin
  if Filename = '' then
    Exit;

  sExt := ExtractFileExt(Filename);
  if ContainsText('.jpg.jpeg', sExt) then
  begin
  	jpg := TJPEGImage.Create;
    try
      jpg.LoadFromFile(Filename);
      bmp.Assign(jpg);
    finally
      jpg.Free;
    end;
  end
  else if ContainsText('.png', sExt) then
  begin
  	png := TPngImage.Create;
    try
      png.LoadFromFile(Filename);
      bmp.Assign(png);
    finally
      png.Free;
    end;
  end
  else if ContainsText('.gif', sExt) then
  begin
  	gif := TGIFImage.Create;
    try
      gif.LoadFromFile(Filename);
      bmp.Assign(gif);
    finally
      gif.Free;
    end;
  end
  else if ContainsText('.bmp', sExt) then
  begin
    bmp.LoadFromFile(Filename);
  end;
end;

procedure ut_CalculateTotals(const iTotalTime, iTotalSize: Integer);
var
  item : TListItemEx;
begin
  if frmMain.lvwList.Items.Count > 0 then
  begin
    item := TListItemEx(frmMain.lvwList.Items.Add);
    item.Caption := '';
    item.SubItems.Add(ut_CreateTotalTime(iTotalTime));
    item.SubItems.Add('');
    item.SubItems.Add(FormatFloat('###,###', iTotalSize) + 'KB');
    item.sFullPath := 'path is not permitted';
    item.ImageIndex := -1;
  end;
end;

function ut_IsAlbum(const Path: String): Boolean;
var
  sl : TStringList;
  s, sExt : String;
begin
  Result := False;
  sl := TStringList.Create;
  try
    GetFiles(Path, '*.*', sl, False);
    for s in sl do
    begin
      sExt := ExtractFileExt(s);
      if ContainsText(av.sValidExtentions, sExt) then
      begin
      	Result := True;
        Break;
      end;
    end;
  finally
    sl.Free;
  end;
end;

procedure ut_DrawListItems(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  DefaultDraw := True;

  with Sender.Canvas do
  begin
    Brush.Style := bsSolid;
    if cdsHot in State then
    begin
      Brush.Color := clHover;
      Font.Color  := clWindowText;
      Font.Style  := [fsUnderline];
    end
    else
    begin
      Brush.Color := IfThenColor(Odd(Item.Index), clWindow, $00FEFAF8);
    end;
  end;
end;

end.
