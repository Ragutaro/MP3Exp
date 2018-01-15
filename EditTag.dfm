object frmEditTag: TfrmEditTag
  Left = 317
  Top = 489
  BorderIcons = [biSystemMenu]
  Caption = #12479#12464#12398#32232#38598
  ClientHeight = 383
  ClientWidth = 1171
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    1171
    383)
  PixelsPerInch = 96
  TextHeight = 18
  object lvwList: THideListView
    Left = 0
    Top = 0
    Width = 1171
    Height = 103
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = #12501#12449#12452#12523#21517
      end
      item
        Caption = #12479#12452#12488#12523
      end
      item
        Caption = #12469#12502#12479#12452#12488#12523
      end
      item
        Caption = #12450#12523#12496#12512
      end
      item
        Caption = #12488#12521#12483#12463
      end
      item
        Caption = #35199#26278
      end
      item
        Caption = #12487#12451#12473#12463#26522#25968
      end
      item
        Caption = #12450#12540#12486#12451#12473#12488
      end
      item
        Caption = #12450#12523#12496#12512#12450#12540#12486#12451#12473#12488
      end
      item
        Caption = #20316#35422
      end
      item
        Caption = #20316#26354
      end
      item
        Caption = #12472#12515#12531#12523
      end
      item
        Caption = #12467#12513#12531#12488
      end
      item
        Caption = #27468#35422
      end>
    ColumnClick = False
    DoubleBuffered = True
    HideSelection = False
    HotTrackStyles = [htHandPoint, htUnderlineHot]
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    PopupMenu = popList
    SmallImages = imgList
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = lvwListCustomDrawItem
    OnCreateItemClass = lvwListCreateItemClass
    OnSelectItem = lvwListSelectItem
    SortOrder = soAscending
    WrapAround = False
    DefaultSortOrder = soAscending
  end
  object Panel2: TPanel
    Left = 8
    Top = 114
    Width = 793
    Height = 261
    Anchors = [akLeft, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      793
      261)
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 48
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12479#12452#12488#12523
    end
    object Label2: TLabel
      Left = 12
      Top = 164
      Width = 72
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12469#12502#12479#12452#12488#12523
    end
    object Label3: TLabel
      Left = 270
      Top = 8
      Width = 48
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12450#12523#12496#12512
    end
    object Label4: TLabel
      Left = 270
      Top = 60
      Width = 48
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12488#12521#12483#12463
    end
    object Label5: TLabel
      Left = 360
      Top = 60
      Width = 24
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #35199#26278
    end
    object Label6: TLabel
      Left = 445
      Top = 60
      Width = 72
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12487#12451#12473#12463#26522#25968
    end
    object Label7: TLabel
      Left = 270
      Top = 112
      Width = 72
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12450#12540#12486#12451#12473#12488
    end
    object Label8: TLabel
      Left = 270
      Top = 164
      Width = 120
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12450#12523#12496#12512#12450#12540#12486#12451#12473#12488
    end
    object Label9: TLabel
      Left = 534
      Top = 8
      Width = 24
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #20316#35422
    end
    object Label10: TLabel
      Left = 534
      Top = 60
      Width = 24
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #20316#26354
    end
    object Label11: TLabel
      Left = 534
      Top = 112
      Width = 48
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12472#12515#12531#12523
    end
    object Label12: TLabel
      Left = 534
      Top = 164
      Width = 48
      Height = 18
      Anchors = [akLeft, akBottom]
      Caption = #12467#12513#12531#12488
    end
    object lblInfo: TLabel
      Left = 8
      Top = 232
      Width = 685
      Height = 18
      AutoSize = False
      EllipsisPosition = epPathEllipsis
      ShowAccelChar = False
    end
    object cmbData1: THideComboBox
      Left = 8
      Top = 28
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 0
      OnChange = cmbData1Change
      OnDropDown = cmbData1DropDown
      OnSelect = cmbData1Select
    end
    object cmbData2: THideComboBox
      Left = 8
      Top = 184
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 2
      OnChange = cmbData2Change
      OnDropDown = cmbData2DropDown
    end
    object cmbData3: THideComboBox
      Left = 270
      Top = 28
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 3
      OnChange = cmbData3Change
      OnDropDown = cmbData3DropDown
    end
    object cmbData4: THideComboBox
      Left = 270
      Top = 80
      Width = 75
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 4
      OnChange = cmbData4Change
      OnDropDown = cmbData4DropDown
      OnSelect = cmbData4Select
    end
    object cmbData5: THideComboBox
      Left = 360
      Top = 80
      Width = 75
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 5
      OnChange = cmbData5Change
    end
    object cmbData6: THideComboBox
      Left = 445
      Top = 80
      Width = 75
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 6
      OnChange = cmbData6Change
    end
    object cmbData7: THideComboBox
      Left = 270
      Top = 132
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 7
      OnChange = cmbData7Change
      OnDropDown = cmbData7DropDown
    end
    object cmbData8: THideComboBox
      Left = 270
      Top = 184
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 8
      OnChange = cmbData8Change
      OnDropDown = cmbData8DropDown
    end
    object cmbData9: THideComboBox
      Left = 534
      Top = 28
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 9
      OnChange = cmbData9Change
      OnDropDown = cmbData9DropDown
    end
    object cmbData10: THideComboBox
      Left = 534
      Top = 80
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 10
      OnChange = cmbData10Change
      OnDropDown = cmbData10DropDown
    end
    object cmbData11: THideComboBox
      Left = 534
      Top = 132
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 11
      OnChange = cmbData11Change
      OnDropDown = cmbData11DropDown
    end
    object cmbData12: THideComboBox
      Left = 534
      Top = 184
      Width = 250
      Height = 26
      AutoComplete = False
      Anchors = [akLeft, akBottom]
      DropDownCount = 20
      TabOrder = 12
      OnChange = cmbData12Change
    end
    object grpTitle: TGroupBox
      Left = 12
      Top = 60
      Width = 245
      Height = 98
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      Visible = False
      DesignSize = (
        245
        98)
      object Label14: TLabel
        Left = 103
        Top = 68
        Width = 24
        Height = 18
        Anchors = [akLeft, akBottom]
        Caption = #25991#23383
      end
      object radFileToTitle: TRadioButton
        Left = 12
        Top = 14
        Width = 193
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = #12501#12449#12452#12523#21517#12434#12381#12398#12414#12414#21033#29992
        TabOrder = 0
        OnClick = radFileToTitleClick
      end
      object radDeletePrefix: TRadioButton
        Left = 12
        Top = 37
        Width = 141
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = #25509#38957#35486#12434#21066#38500#12377#12427
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = radDeletePrefixClick
      end
      object spnDelete: TSpTBXSpinEdit
        Left = 52
        Top = 60
        Width = 45
        Height = 26
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        SpinButton.Left = 27
        SpinButton.Top = 0
        SpinButton.Width = 14
        SpinButton.Height = 22
        SpinButton.Align = alRight
        SpinButton.DrawPushedCaption = False
        OnValueChanged = spnDeleteValueChanged
      end
    end
    object btnSave: TButton
      Left = 709
      Top = 226
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #26356#26032
      TabOrder = 13
      OnClick = btnSaveClick
    end
  end
  object SpTBXTabControl1: TSpTBXTabControl
    Left = 812
    Top = 109
    Width = 348
    Height = 261
    Anchors = [akLeft, akRight, akBottom]
    ActiveTabIndex = 0
    TabAutofit = True
    HiddenItems = <>
    object tabLyric: TSpTBXTabItem
      Caption = #27468#35422
      Checked = True
      CustomWidth = 114
    end
    object tabCover: TSpTBXTabItem
      Caption = #12450#12523#12496#12512#12450#12540#12488
      CustomWidth = 114
    end
    object tabEditCover: TSpTBXTabItem
      Caption = #12450#12523#12496#12512#12450#12540#12488#12398#36861#21152
      CustomWidth = 114
    end
    object SpTBXTabSheet3: TSpTBXTabSheet
      Left = 0
      Top = 23
      Width = 348
      Height = 238
      Caption = #12450#12523#12496#12512#12450#12540#12488#12398#36861#21152
      ImageIndex = -1
      DesignSize = (
        348
        238)
      TabItem = 'tabEditCover'
      object imgCoverPreview: TImage
        Left = 15
        Top = 13
        Width = 150
        Height = 150
        Transparent = True
      end
      object Label15: TLabel
        Left = 184
        Top = 11
        Width = 24
        Height = 18
        Caption = #31278#39006
      end
      object Label13: TLabel
        Left = 188
        Top = 73
        Width = 48
        Height = 18
        Caption = #12467#12513#12531#12488
      end
      object lblCoverPath: TLabel
        Left = 184
        Top = 133
        Width = 73
        Height = 18
        Caption = 'lblCoverPath'
        Visible = False
      end
      object lblEditCoverSize: TLabel
        Left = 12
        Top = 169
        Width = 157
        Height = 18
        Alignment = taCenter
        AutoSize = False
      end
      object cmbCoverTYpe: TComboBox
        Left = 184
        Top = 35
        Width = 153
        Height = 26
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 20
        TabOrder = 0
      end
      object edtCover: TEdit
        Left = 184
        Top = 94
        Width = 153
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object btnAddCover: TButton
        Left = 173
        Top = 195
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #36861#21152
        TabOrder = 2
        OnClick = btnAddCoverClick
      end
      object btnEditCoverCancel: TButton
        Left = 262
        Top = 195
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #12461#12515#12531#12475#12523
        TabOrder = 3
        OnClick = btnEditCoverCancelClick
      end
      object btnRefreshCoverArt: TButton
        Left = 12
        Top = 195
        Width = 155
        Height = 25
        Caption = #12450#12523#12496#12512#12450#12540#12488#12398#26356#26032
        TabOrder = 4
        OnClick = btnRefreshCoverArtClick
      end
    end
    object SpTBXTabSheet1: TSpTBXTabSheet
      Left = 0
      Top = 23
      Width = 348
      Height = 238
      Caption = #12450#12523#12496#12512#12450#12540#12488
      ImageIndex = -1
      DesignSize = (
        348
        238)
      TabItem = 'tabCover'
      object lblCoverSize: TLabel
        Left = 8
        Top = 164
        Width = 153
        Height = 18
        Alignment = taCenter
        AutoSize = False
      end
      object btnAddAPIC: TButton
        Left = 264
        Top = 13
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #36861#21152
        TabOrder = 1
        OnClick = btnAddAPICClick
      end
      object btnDeleteAPIC: TButton
        Left = 264
        Top = 164
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #21066#38500
        TabOrder = 2
        OnClick = btnDeleteAPICClick
      end
      object btnDeleteAllAPIC: TButton
        Left = 264
        Top = 195
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #20840#12390#21066#38500
        TabOrder = 3
        OnClick = btnDeleteAllAPICClick
      end
      object lvwCover: THideListView
        Left = 12
        Top = 12
        Width = 246
        Height = 209
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = #12469#12452#12474
          end
          item
            Caption = #31278#39006
          end
          item
            Caption = #12467#12513#12531#12488
          end>
        ColumnClick = False
        HideSelection = False
        HotTrackStyles = [htHandPoint, htUnderlineHot]
        LargeImages = imgCover
        ReadOnly = True
        RowSelect = True
        PopupMenu = popCover
        SmallImages = imgCover
        TabOrder = 0
        ViewStyle = vsReport
        OnCustomDrawItem = lvwCoverCustomDrawItem
        OnCreateItemClass = lvwCoverCreateItemClass
        OnDblClick = lvwCoverDblClick
        SortOrder = soAscending
        WrapAround = False
        DefaultSortOrder = soAscending
      end
    end
    object SpTBXTabSheet2: TSpTBXTabSheet
      Left = 0
      Top = 23
      Width = 348
      Height = 238
      Caption = #27468#35422
      ImageIndex = -1
      ExplicitLeft = 20
      ExplicitTop = 28
      ExplicitWidth = 224
      ExplicitHeight = 233
      DesignSize = (
        348
        238)
      TabItem = 'tabLyric'
      object lblLyricsInfo: TLabel
        Left = 118
        Top = 202
        Width = 219
        Height = 18
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        ExplicitWidth = 100
      end
      object memLyrics: TMemo
        Left = 8
        Top = 12
        Width = 329
        Height = 177
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object toolLyrics: TSpTBXToolWindow
        Left = 7
        Top = 195
        Width = 105
        Height = 29
        Caption = 'toolLyrics'
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        ClientAreaHeight = 29
        ClientAreaWidth = 105
        object SpTBXToolbar1: TSpTBXToolbar
          Left = 4
          Top = 2
          Width = 98
          Height = 22
          Images = frmMain.imgTreeView
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Caption = 'SpTBXToolbar1'
          object tbrSaveLyrics: TSpTBXItem
            Caption = #27468#35422#12384#12369#12434#26356#26032
            Hint = #27468#35422#12384#12369#12434#26356#26032
            ImageIndex = 8
            OnClick = tbrSaveLyricsClick
          end
          object SpTBXSeparatorItem1: TSpTBXSeparatorItem
          end
          object tbrGetLyrics: TSpTBXItem
            Caption = 'Lyrics Master '#12391#27468#35422#12434#26908#32034#12377#12427'...'
            Hint = 'Lyrics Master '#12391#27468#35422#12434#26908#32034#12377#12427'...'
            ImageIndex = 9
            OnClick = tbrGetLyricsClick
          end
          object tbrGetNextLyrics: TSpTBXItem
            Caption = 'Lyrics Master '#12391#27425#12398#26354#12398#27468#35422#12434#26908#32034#12377#12427'...'
            Hint = 'Lyrics Master '#12391#27425#12398#26354#12398#27468#35422#12434#26908#32034#12377#12427'...'
            ImageIndex = 10
            OnClick = tbrGetNextLyricsClick
          end
          object tbrSaveCurrentLyrics: TSpTBXItem
            Caption = 'Lyrics Master '#12391#34920#31034#20013#12398#27468#35422#12434#21462#24471#12375#12390#20445#23384#12377#12427
            Hint = 'Lyrics Master '#12391#34920#31034#20013#12398#27468#35422#12434#21462#24471#12375#12390#20445#23384#12377#12427
            ImageIndex = 11
            OnClick = tbrSaveCurrentLyricsClick
          end
        end
      end
    end
  end
  object imgCover: TImageList
    Height = 64
    Width = 64
    Left = 102
    Top = 35
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 228
    Top = 43
  end
  object imgList: TImageList
    ColorDepth = cd32Bit
    Height = 24
    Width = 24
    Left = 16
    Top = 32
  end
  object popList: TSpTBXPopupMenu
    Left = 60
    Top = 36
    object popListExportAPIC: TSpTBXItem
      Caption = #12450#12523#12496#12512#12450#12540#12488#12434#12456#12463#12473#12509#12540#12488#12377#12427'...'
      OnClick = popListExportAPICClick
    end
    object popListDeletePRIV: TSpTBXItem
      Caption = 'PRIV'#12479#12464#12434#38500#21435#12377#12427
      OnClick = popListDeletePRIVClick
    end
  end
  object popCover: TSpTBXPopupMenu
    Left = 148
    Top = 40
    object popCoverExport: TSpTBXItem
      Caption = #12450#12523#12496#12512#12450#12540#12488#12434#12456#12463#12473#12509#12540#12488#12377#12427'...'
      OnClick = popCoverExportClick
    end
  end
end
