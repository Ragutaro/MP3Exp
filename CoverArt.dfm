object frmCoverArt: TfrmCoverArt
  Left = 1567
  Top = 148
  BorderIcons = [biSystemMenu]
  Caption = 'Album Art List'
  ClientHeight = 197
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #12513#12452#12522#12458
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 18
  object lvwList: THideListView
    Left = 0
    Top = 0
    Width = 81
    Height = 197
    Align = alLeft
    Columns = <>
    HideSelection = False
    HotTrackStyles = [htHandPoint, htUnderlineHot]
    LargeImages = imgCover
    ReadOnly = True
    RowSelect = True
    PopupMenu = popCover
    ShowColumnHeaders = False
    SmallImages = imgCover
    TabOrder = 0
    ViewStyle = vsList
    OnCustomDrawItem = lvwListCustomDrawItem
    OnCreateItemClass = lvwListCreateItemClass
    OnSelectItem = lvwListSelectItem
    DefaultSortOrder = soAscending
    EvenColor = clWindow
    HoverColor = 16774117
    HoverFontColor = clTeal
    SortOrder = soAscending
    UnevenColor = 16710392
    WrapAround = True
  end
  object Splitter: TSpTBXSplitter
    Left = 81
    Top = 0
    Width = 4
    Height = 197
    Cursor = crSizeWE
  end
  object SpTBXPanel1: TSpTBXPanel
    Left = 85
    Top = 0
    Width = 226
    Height = 197
    Caption = 'SpTBXPanel1'
    Align = alClient
    TabOrder = 2
    Borders = False
    TBXStyleBackground = True
    DesignSize = (
      226
      197)
    object imgView: TImage
      Left = 0
      Top = 0
      Width = 226
      Height = 168
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      PopupMenu = popView
      ExplicitWidth = 284
      ExplicitHeight = 237
    end
    object lblInfo: TLabel
      Left = 0
      Top = 174
      Width = 223
      Height = 18
      Alignment = taCenter
      Anchors = [akLeft, akRight, akBottom]
      AutoSize = False
      Color = clInfoText
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = #12513#12452#12522#12458
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitTop = 243
      ExplicitWidth = 281
    end
  end
  object imgCover: TImageList
    Height = 90
    Width = 90
    Left = 24
    Top = 10
  end
  object popCover: TSpTBXPopupMenu
    Left = 24
    Top = 60
    object popCoverExport: TSpTBXItem
      Caption = #12450#12523#12496#12512#12450#12540#12488#12434#12456#12463#12473#12509#12540#12488#12377#12427'...'
      OnClick = popCoverExportClick
    end
  end
  object popView: TSpTBXPopupMenu
    Left = 145
    Top = 30
    object popView_Export: TSpTBXItem
      Caption = #12450#12523#12496#12512#12450#12540#12488#12434#12456#12463#12473#12509#12540#12488#12377#12427'...'
      OnClick = popView_ExportClick
    end
  end
end
