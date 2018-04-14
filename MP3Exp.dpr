program MP3Exp;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  EditTag in 'EditTag.pas' {frmEditTag},
  Utils in 'Utils.pas',
  Rename in 'Rename.pas' {frmRename},
  CoverArt in 'CoverArt.pas' {frmCoverArt},
  MakeSymLink in 'MakeSymLink.pas' {frmMakeSymLink};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
