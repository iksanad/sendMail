program FT_SEND_MAIL;

uses
  Vcl.Forms,
  uSendMail in '..\unit\uSendMail.pas' {sendMail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TsendMail, sendMail);
  Application.Run;
end.
