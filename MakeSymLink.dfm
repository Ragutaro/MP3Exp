object frmMakeSymLink: TfrmMakeSymLink
  Left = 325
  Top = 481
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #12471#12531#12508#12522#12483#12463#12522#12531#12463#12398#20316#25104
  ClientHeight = 175
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 14
    Top = 12
    Width = 144
    Height = 18
    Caption = #26032#12375#12367#20316#25104#12377#12427#12501#12457#12523#12480#21517
  end
  object edtNewFolder: TEdit
    Left = 14
    Top = 32
    Width = 563
    Height = 26
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 214
    Top = 140
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 300
    Top = 140
    Width = 75
    Height = 25
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = btnCancelClick
  end
  inline fraMusic: TfraOpenFolder
    Left = 5
    Top = 62
    Width = 581
    Height = 72
    TabOrder = 3
    ExplicitLeft = 5
    ExplicitTop = 62
    ExplicitWidth = 581
    ExplicitHeight = 72
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
      OnRightButtonClick = fraMusicedtPathRightButtonClick
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
