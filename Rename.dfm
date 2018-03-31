object frmRename: TfrmRename
  Left = 1391
  Top = 308
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = #12501#12449#12452#12523#21517#12398#22793#26356
  ClientHeight = 338
  ClientWidth = 513
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    513
    338)
  PixelsPerInch = 96
  TextHeight = 18
  object HideBack1: THideBack
    Left = 0
    Top = 0
    Width = 513
    Height = 297
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = ' '
    Color = clWhite
    ParentColor = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 29
    Height = 18
    Caption = #29694#22312':'
  end
  object lblCurrentName: TLabel
    Left = 51
    Top = 14
    Width = 448
    Height = 18
    AutoSize = False
    Caption = 'lblCurrentName'
  end
  object btnOK: TButton
    Left = 347
    Top = 305
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 430
    Top = 305
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 44
    Width = 483
    Height = 243
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #22793#26356#26041#27861
    TabOrder = 0
    object Label2: TLabel
      Left = 37
      Top = 99
      Width = 29
      Height = 18
      Caption = #26360#24335':'
    end
    object radInputName: TRadioButton
      Left = 18
      Top = 28
      Width = 49
      Height = 17
      Caption = #20837#21147
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = radInputNameClick
    end
    object edtInputName: TEdit
      Left = 70
      Top = 24
      Width = 376
      Height = 26
      TabOrder = 1
    end
    object radCreateFromTag: TRadioButton
      Left = 18
      Top = 70
      Width = 159
      Height = 17
      Caption = #12479#12464#12434#21462#24471#12375#12390#20316#25104#12377#12427
      TabOrder = 3
      OnClick = radCreateFromTagClick
    end
    object edtFormat: TEdit
      Left = 70
      Top = 96
      Width = 403
      Height = 26
      Enabled = False
      TabOrder = 4
      Text = '%TrackNum %Title'
    end
    object lblFormat: TStaticText
      Left = 109
      Top = 134
      Width = 361
      Height = 97
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'lblFormat'
      TabOrder = 5
    end
    object spnUpDown: TSpinButton
      Left = 447
      Top = 24
      Width = 23
      Height = 25
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      TabOrder = 2
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = spnUpDownDownClick
      OnUpClick = spnUpDownUpClick
    end
  end
end
