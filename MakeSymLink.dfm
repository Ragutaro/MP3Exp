object frmMakeSymLink: TfrmMakeSymLink
  Left = 325
  Top = 481
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #12471#12531#12508#12522#12483#12463#12522#12531#12463#12398#20316#25104
  ClientHeight = 182
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #12513#12452#12522#12458
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  StyleElements = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    594
    182)
  PixelsPerInch = 96
  TextHeight = 18
  object HideBack1: THideBack
    Left = 0
    Top = 0
    Width = 594
    Height = 141
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = ' '
    Color = clWhite
    ParentColor = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 14
    Top = 12
    Width = 144
    Height = 18
    Caption = #26032#12375#12367#20316#25104#12377#12427#12501#12457#12523#12480#21517
  end
  object btnOk: TButton
    Left = 428
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 511
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edtNewFolder: TEdit
    Left = 14
    Top = 32
    Width = 563
    Height = 26
    TabOrder = 2
  end
  inline fraMusic: TfraOpenFolder
    Left = 5
    Top = 64
    Width = 581
    Height = 70
    TabOrder = 3
    ExplicitLeft = 5
    ExplicitTop = 64
    ExplicitWidth = 581
    ExplicitHeight = 70
    inherited lblCaption: TLabel
      Left = 9
      Top = 10
      Width = 168
      Height = 18
      Caption = #38899#27005#12501#12449#12452#12523#12398#12354#12427#12501#12457#12523#12480#21517
      ExplicitLeft = 9
      ExplicitTop = 10
      ExplicitWidth = 168
      ExplicitHeight = 18
    end
    inherited edtPath: TButtonedEdit
      Left = 9
      Top = 34
      Width = 563
      Height = 26
      Text = '('#38899#27005#12501#12449#12452#12523#12398#12354#12427#12501#12457#12523#12480#12434#36984#25246#12375#12390#19979#12373#12356')'
      ExplicitLeft = 9
      ExplicitTop = 34
      ExplicitWidth = 563
      ExplicitHeight = 26
    end
    inherited pngImage: TPngImageList
      Left = 404
      Top = 8
      Bitmap = {}
    end
    inherited OpenDialog: TOpenDialog
      Left = 464
    end
  end
end
