unit uMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, BackgroundWorker, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Vcl.StdCtrls, Vcl.Imaging.GIFImg,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdAttachment, IdAttachmentFile;

type
  TfrmPajak = class(TForm)
    img1: TImage;
    con1: TZConnection;
    qSetup: TZQuery;
    bg1: TBackgroundWorker;
    tmrUpdate: TTimer;
    mmo1: TMemo;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    btnClose: TButton;
    tmrBtn: TTimer;
    Panel1: TPanel;
    lblProses: TPanel;
    qNota: TZQuery;
    qSMTP: TZQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bg1Work(Worker: TBackgroundWorker);
    procedure bg1WorkComplete(Worker: TBackgroundWorker; Cancelled: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrBtnTimer(Sender: TObject);
  private
    { Private declarations }
    vClose: Integer;

    AttachmentList: TStringList;
    function GetDomainFromEmail(const email: string): string;
  public
    { Public declarations }
  end;

var
  frmPajak: TfrmPajak;

implementation

{$R *.dfm}

function TfrmPajak.GetDomainFromEmail(const email: string): string;
var
  atIndex, dotIndex: Integer;
  domainPart: string; // variabel string sementara
begin
  Result := '';
  atIndex := Pos('@', email);
  if atIndex > 0 then
  begin
    domainPart := email; // Salin email ke variabel sementara
    Delete(domainPart, 1, atIndex); // Hapus bagian sebelum '@'
    dotIndex := LastDelimiter('.', domainPart);
    if dotIndex > 0 then
    begin
      Result := Copy(domainPart, 1, dotIndex - 1); // Potong string sebelum '.'
    end;
  end;
end;

procedure TfrmPajak.bg1Work(Worker: TBackgroundWorker);
var
  vServer, vPort, vFilePath, vFilePajak, contentMail: string;
  vSearchPort: Integer;
  Data: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  Attachment: TIdAttachment;
  I: Integer;
  vMailUser, vDomain: string;
begin
  vClose := 3;
  vFilePath := ExtractFilePath(Application.ExeName);
  if (FileExists(vFilePath + '7soft.txt')) then
  begin
    mmo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + '7soft.txt');
  end
  else
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'File path tidak ditemukan';
    lblProses.Refresh;
    Sleep(1000);
    Worker.AcceptCancellation;
    Exit;
  end;

  vSearchPort := pos(':', mmo1.Lines[0]);
  if vSearchPort = 0 then
  begin
    vServer := mmo1.Lines[0];
    vPort := '3306';
  end
  else
  begin
    vServer := copy(mmo1.Lines[0], 1, vSearchPort - 1);
    vPort := copy(mmo1.Lines[0], vSearchPort + 1, length(mmo1.Lines[0]));
  end;

  lblProses.Visible := True;
  lblProses.Caption := 'Connecting database...';
  Sleep(1000);

  if ParamStr(1) = '' then
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'Email customer belum diisikan!';
    Sleep(1000);
    Worker.AcceptCancellation;
  end;

  if ParamStr(2) = '' then
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'File faktur pajak belum di upload!';
    Sleep(1000);
    Worker.AcceptCancellation;
  end;

  if ParamStr(3) = '' then
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'Nomer nota belum dipilih!';
    Sleep(1000);
    Worker.AcceptCancellation;
  end;

  try
    con1.HostName := vServer;
    con1.Password := '73fangfang';
    con1.Port := StrToInt(vPort);
    con1.Database := mmo1.Lines[1];
    con1.LibraryLocation := ExtractFilePath(Application.ExeName) + 'libmySQL.dll';
    con1.Connect;
    lblProses.Caption := con1.HostName + ' on ' + con1.Database;
    Sleep(1000);
    qSetup.Active := True;
    qSMTP.Active := True;
    qNota.Close;
    qNota.ParamByName('DOCUMENT_NO').Value := QuotedStr(ParamStr(3));
    qNota.Open;
  except
    on E: Exception do
    begin
      lblProses.Visible := True;
      lblProses.Caption := e.Message;
      Worker.AcceptCancellation;
    end;
  end;

  if qSetup.FieldByName('EMAIL_USER').AsString = '' then
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'Email belum diisikan!';
    Sleep(1000);
    Worker.AcceptCancellation;
  end;

  SMTP := TIdSMTP.Create(nil);
  Data := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.Method := sslvTLSv1;
    SSL.SSLOptions.Mode := sslmUnassigned;
    SSL.SSLOptions.VerifyMode := [];
    SSL.SSLOptions.VerifyDepth := 0;

    Data.From.Address := qSetup.FieldByName('EMAIL_USER').AsString;
    Data.Recipients.EMailAddresses := ParamStr(1);
    Data.Subject := 'EFAKTU ' + qNota.FieldByName('PERSON_NAME').AsString + ' TANGGAL ' + FormatDateTime('dd mmm yyyy', qNota.FieldByName('DOCUMENT_DATE').AsDateTime);
    contentMail := 'Dear Admin,' + sLineBreak;
    contentMail := contentMail + 'Terlampir kami kirimkan Faktur Pajak atas Invoice nomor :' + sLineBreak + sLineBreak;
    contentMail := contentMail + qNota.FieldByName('DOCUMENT_NO').AsString + sLineBreak;
    contentMail := contentMail + 'Terima kasih.' + sLineBreak + sLineBreak;
    contentMail := contentMail + 'Best Regards,' + sLineBreak;
    contentMail := contentMail + 'Surya Artha Komputama' + sLineBreak;
    contentMail := contentMail + 'Grand Achmad Jais C-9';
    Data.Body.Text := contentMail;

    AttachmentList := TStringList.Create;
    AttachmentList.Delimiter := ';'; // Multiple Attachment dengan ';' sebagai pembatas
    AttachmentList.StrictDelimiter := True;
    AttachmentList.DelimitedText := ParamStr(2);
    for I := 0 to AttachmentList.Count - 1 do
    begin
      if AttachmentList[I] <> '' then
      begin
        vFilePajak := StringReplace(AttachmentList[I], ';', '', [rfReplaceAll]);
        Attachment := TIdAttachmentFile.Create(Data.MessageParts, vFilePajak);
        Attachment.ContentType := 'application/octet-stream';
        Attachment.FileName := ExtractFileName(vFilePajak);
      end;
//      ShowMessage(ExtractFileName(AttachmentList[I]));
//      ShowMessage(AttachmentList[I]);
    end;

    vMailUser := qSetup.FieldByName('EMAIL_USER').AsString;
    vDomain := UpperCase(GetDomainFromEmail(vMailUser));

    SMTP.IOHandler := SSL;
    qSMTP.Locate('provider', vDomain, [loPartialKey]);
    if not qSMTP.IsEmpty then
    begin
      //    SMTP.Host := 'smtp.gmail.com';
      SMTP.Host := qSMTP.FieldByName('smtp').AsString;
      SMTP.Port := qSMTP.FieldByName('port').AsInteger;
  //    SMTP.Port := 587;
      SMTP.Username := qSetup.FieldByName('EMAIL_USER').AsString;
      SMTP.Password := qSetup.FieldByName('EMAIL_PASSWORD').AsString;
    end
    else
    begin
      //    SMTP.Host := 'smtp.gmail.com';
      SMTP.Host := 'smtp.mail.surya-artha.com';
      SMTP.Port := 465;
  //    SMTP.Port := 587;
      SMTP.Username := qSetup.FieldByName('EMAIL_USER').AsString;
      SMTP.Password := qSetup.FieldByName('EMAIL_PASSWORD').AsString;
    end;

    SMTP.UseTLS := utUseExplicitTLS;

    try
      lblProses.Caption := 'SMTP connecting...';
      SMTP.Connect();
      SMTP.Send(Data);
      SMTP.Disconnect();
    except
      on e: Exception do
      begin
        SMTP.Disconnect;
        lblProses.Visible := True;
        lblProses.Caption := E.Message;
        Sleep(3000);
        Worker.AcceptCancellation;
      end;
    end;

  finally
    Data.Free;
    SSL.Free;
    SMTP.Free;
  end;
  Worker.ReportProgress(100);

end;

procedure TfrmPajak.bg1WorkComplete(Worker: TBackgroundWorker; Cancelled: Boolean);
begin
  if not Cancelled then
  begin
    lblProses.Visible := True;
    lblProses.Caption := 'Faktur berhasil di kirim...';
    Sleep(1000);
  end;
//  Application.Terminate;
  btnClose.Visible := True;
  tmrBtn.Enabled := True;
end;

procedure TfrmPajak.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPajak.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bg1.IsWorking then
  begin
    bg1.Cancel;
    bg1.WaitFor;
  end;
end;

procedure TfrmPajak.FormShow(Sender: TObject);
var
  i: Integer;
begin
  (img1.Picture.Graphic as TGIFImage).Animate := True;
  (img1.Picture.Graphic as TGIFImage).AnimationSpeed := 80;
  bg1.Execute;
end;

procedure TfrmPajak.tmrBtnTimer(Sender: TObject);
begin
  vClose := vClose - 1;
  btnClose.Caption := 'Close (' + IntToStr(vClose) + 's)';
  if vClose < 0 then
    Application.Terminate;
end;

end.

