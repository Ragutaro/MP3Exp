object frmRename: TfrmRename
  Left = 321
  Top = 477
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
  object btnOK: TButton
    Left = 347
    Top = 306
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 430
    Top = 306
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 297
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      513
      297)
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
      object imgNext: TImage
        Left = 452
        Top = 25
        Width = 24
        Height = 24
        Cursor = crHandPoint
        Hint = #27425#12398#26354
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000001F94944415478DADDD4CF4B14511C00F0B768
          7952C3C44348F8AB1592B2CC3FC5D33B45E0A15B5159B18697020F468A1B89A9
          2481C11E9550870ED22108AA27048264380BE34E33B33AB33B336FE6EDFCEABB
          296D50AECD3A7BA8EF6586EFE1FB79EFFBDEFBC6509523F6FF027D3717E22840
          C2A7714CAB03DC4A2DC56AEB3E78CC9C5D1FC742E4407F6299D435B7C62D39FD
          CEA1F9EB9F27F056A4C095071CA96FBF7829701D648A5F9582AE3E7299F56A63
          12CB9100978739D20040F1DFF75CC434D9B0556985E9EAC866126F1C1BE84D94
          801F11F8C8B54C6448FC7B5B53C620B3F8E5292E540C5C00A0F157E0A7E3219A
          CD142C559A67467E1452FCF633EC87067AEE73E454E7EFC0BE1220A66BC85484
          353BAF3E8616BE494F613B1470FE5E19E0205C467D73F75BC65432F37C726038
          14D00D40534779C0613400408496BD48270712A18073773972FA901D04D0221B
          5A6428C25B96DF7B1278DECACE74C816750DC10E3AFF7CC8061C32AC3CE5507D
          0452BC385DC121B7DFE14873570928AEDAB10C94CB6C7FB4B46CF1F62C4ACF8F
          714DDB6E9780E2433355D9A0BBD22A3CB487F20C5E3FAAF091C0D903C0775DA4
          095B8AADAB63302A5E6667B0F8B7C5CB02676E2C93FA96D6784EE44981EA57F7
          66231E764D83A9D735274E12C7A653DA5C15C675E3B5856EF8ECE4E6B05169F1
          B24054F1EF03DF01400C1928A32948770000000049454E44AE426082}
        OnClick = imgNextClick
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
        Width = 381
        Height = 26
        TabOrder = 1
      end
      object radCreateFromTag: TRadioButton
        Left = 18
        Top = 70
        Width = 159
        Height = 17
        Caption = #12479#12464#12434#21462#24471#12375#12390#20316#25104#12377#12427
        TabOrder = 2
        OnClick = radCreateFromTagClick
      end
      object edtFormat: TEdit
        Left = 70
        Top = 96
        Width = 403
        Height = 26
        Enabled = False
        TabOrder = 3
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
        TabOrder = 4
      end
    end
  end
end
