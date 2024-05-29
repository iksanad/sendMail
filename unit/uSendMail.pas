unit uSendMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage, IdAttachment, IdAttachmentFile,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, IdFTP;

type
  TsendMail = class(TForm)
    Panel1: TPanel;
    GBMail: TGroupBox;
    GBRecMail: TGroupBox;
    bSend: TButton;
    bClear: TButton;
    StaticText1: TStaticText;
    xMail: TEdit;
    StaticText2: TStaticText;
    xPassword: TEdit;
    StaticText3: TStaticText;
    xRecMail: TEdit;
    xSubject: TEdit;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    xContent: TMemo;
    FileOpenDialog1: TFileOpenDialog;
    bSelectFile: TButton;
    xFileName: TEdit;
    bSettings: TButton;
    GBSettings: TGroupBox;
    StaticText5: TStaticText;
    xSMTP: TEdit;
    StaticText6: TStaticText;
    xPort: TEdit;
    bCloseSettings: TButton;
    Button1: TButton;
    con1: TZConnection;
    qSetup: TZQuery;
    qSetupNAME: TWideStringField;
    qSetupADDRESS_ID: TIntegerField;
    qSetupLOGO_FILENAME: TWideStringField;
    qSetupTEMPLATE_FOLDER: TWideStringField;
    qSetupGAMBAR_FOLDER: TWideStringField;
    qSetupFREPORT_FOLDER: TWideStringField;
    qSetupEXCEL_PASS: TWideStringField;
    qSetupNO_TRANS: TIntegerField;
    qSetupSTOCK_MIN: TIntegerField;
    qSetupLIMIT_PIUT_ORDER: TIntegerField;
    qSetupLIMIT_PIUT_JUAL: TIntegerField;
    qSetupQTYBD_PO: TIntegerField;
    qSetupQTYSJ_SO: TIntegerField;
    qSetupHARGA_SO: TIntegerField;
    qSetupHARGA_JUAL: TIntegerField;
    qSetupDISC_JUAL: TIntegerField;
    qSetupDIRECT_PRINT: TIntegerField;
    qSetupEXPORT_REPORT: TIntegerField;
    qSetupERP_TABLE_ID: TIntegerField;
    qSetupEMPTY_REPORT: TIntegerField;
    qSetupDISC_TOTAL_PERCEN: TWideStringField;
    qSetupTOOLBAR_COLOR: TWideStringField;
    qSetupHEADER_COLOR: TWideStringField;
    qSetupDETAIL_COLOR: TWideStringField;
    qSetupGRID_COLOR: TWideStringField;
    qSetupROW_COLOR: TWideStringField;
    qSetupREPORT_COLOR: TWideStringField;
    qSetupBILL_ROWCOUNT: TIntegerField;
    qSetupPEMBULATAN_PPN: TIntegerField;
    qSetupFLAG_TGL_ACC: TIntegerField;
    qSetupTGL_ACC: TDateField;
    qSetupSCREEN_STOCK: TIntegerField;
    qSetupCHECK_MATCHING: TIntegerField;
    qSetupSHOW_HPP: TIntegerField;
    qSetupJURNAL_AWAL: TIntegerField;
    qSetupSIKLUS_BELI: TIntegerField;
    qSetupSIKLUS_JUAL: TIntegerField;
    qSetupSHOW_JUAL_BARCODE: TIntegerField;
    qSetupSHOW_JUAL_CASH: TIntegerField;
    qSetupQTY: TIntegerField;
    qSetupSTART_DATE: TDateField;
    qSetupCUSTOM1: TWideStringField;
    qSetupCUSTOM2: TWideStringField;
    qSetupCUSTOM3: TWideStringField;
    qSetupCUSTOM4: TWideStringField;
    qSetupCUSTOM5: TWideStringField;
    qSetupCUSTOM6: TWideStringField;
    qSetupCUSTOM7: TWideStringField;
    qSetupCUSTOM8: TWideStringField;
    qSetupCUSTOM9: TWideStringField;
    qSetupCUSTOM10: TWideStringField;
    qSetupEMAIL: TWideStringField;
    qSetupFLAG_EO_PREMIUM: TWideStringField;
    qSetupPERSEN_UKURAN_QR: TIntegerField;
    qSetupMULTI: TWideStringField;
    qSetupNO_PAJAK: TIntegerField;
    qSetupRETUR_TUNJUK: TWideStringField;
    qSetupSN_FLAG: TWideStringField;
    qSetupMANUFAKTUR_FLAG: TWideStringField;
    qSetupTIPE_HARGA_FLAG: TWideStringField;
    qSetupBPB_MULTI: TWideStringField;
    qSetupCASH_MULTI: TWideStringField;
    qSetupKUBIKASI: TWideStringField;
    qSetupHARGA_EXCLUDE: TWideStringField;
    qSetupKOLOM_HARGA: TIntegerField;
    qSetupPPH_FLAG: TWideStringField;
    qSetupPROJECT_FLAG: TWideStringField;
    qSetupRETUR_GUDANG: TIntegerField;
    qSetupNO_AUDIT_TRAIL: TIntegerField;
    qSetupNEW_WAY_HPP: TWideStringField;
    qSetupPO_BUDGET: TIntegerField;
    qSetupCUSTOM11: TWideStringField;
    qSetupCUSTOM12: TWideStringField;
    qSetupCUSTOM13: TWideStringField;
    qSetupCUSTOM14: TWideStringField;
    qSetupCUSTOM15: TWideStringField;
    qSetupWA_ID: TIntegerField;
    qSetupWA_LAST_NOTA_ID: TWideStringField;
    qSetupWA_LAST_TGL: TDateTimeField;
    qSetupHARGA_DASAR: TIntegerField;
    qSetupHOST_FTP: TWideStringField;
    qSetupUSER_FTP: TWideStringField;
    qSetupPASWORD_FTP: TWideStringField;
    qSetupFOLDER_EFAKTUR_UPLOAD: TWideStringField;
    qSetupPORT_FTP: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure bClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bSendClick(Sender: TObject);
    procedure xContentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure xContentEnter(Sender: TObject);
    procedure xContentExit(Sender: TObject);
    procedure bSelectFileClick(Sender: TObject);
    procedure bSettingsClick(Sender: TObject);
    procedure bCloseSettingsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    AttachmentList: TStringList;
    DirList: String;
  public
    { Public declarations }
  end;

var
  sendMail: TsendMail;
  mail_username: string;
  mail_password: string;
  mail_to: string;
  mail_subject: string;
  mail_content: string;
  mail_SMTP: string;
  mail_port: integer;

implementation

{$R *.dfm}


procedure SendingMail(UserName, Password, toTarget, subjectMail, contentMail, hostMail: string; portMail: integer; AttachmentList: TStrings);
var
  Data: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  Attachment: TIdAttachment;
  I: Integer;
begin
  SMTP := TIdSMTP.Create(nil);
  Data := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSL.SSLOptions.Method := sslvTLSv1;
    SSL.SSLOptions.Mode := sslmUnassigned;
    SSL.SSLOptions.VerifyMode := [];
    SSL.SSLOptions.VerifyDepth := 0;

    Data.From.Address := UserName;
    Data.Recipients.EMailAddresses := toTarget;
    Data.Subject := subjectMail;
    Data.Body.Text := contentMail;

    for I := 0 to AttachmentList.Count - 1 do
    begin
      Attachment := TIdAttachmentFile.Create(Data.MessageParts, AttachmentList[I]);
      Attachment.ContentType := 'application/octet-stream';
      Attachment.FileName := ExtractFileName(AttachmentList[I]);
//      ShowMessage(ExtractFileName(AttachmentList[I]));
//      ShowMessage(AttachmentList[I]);
    end;
    
    SMTP.IOHandler := SSL;
//    SMTP.Host := 'smtp.gmail.com';
//    SMTP.Port := 587;

    SMTP.Host := hostMail;
    SMTP.Port := portMail;
    SMTP.Username := UserName;
    SMTP.Password := Password;
    SMTP.UseTLS := utUseExplicitTLS;

    SMTP.Connect();
    try
      SMTP.Send(Data);
    finally
      SMTP.Disconnect;
    end;

  finally
    Data.Free;
    SSL.Free;
    SMTP.Free;
  end;
end;

procedure TsendMail.bClearClick(Sender: TObject);
begin
  xRecMail.Text := '';
  xSubject.Text := '';
  xContent.Text := 'Masukkan isi pesan...';
  xFileName.Text := '';
  AttachmentList.Clear;
end;

procedure TsendMail.bCloseSettingsClick(Sender: TObject);
begin
  self.Height:=750;
  bCloseSettings.Visible:=False;
  bSettings.Visible:=True;
  self.Top:=(screen.Height-self.Height) div 2;
  GBSettings.Visible := False;
end;

procedure TsendMail.bSelectFileClick(Sender: TObject);
var
  OpenDialog: TFileOpenDialog;
  I: Integer;
begin
  OpenDialog := TFileOpenDialog.Create(nil);
  try
    OpenDialog.Title := 'Pilih File';
    OpenDialog.DefaultFolder := qSetup.FieldByName('FOLDER_EFAKTUR_UPLOAD').AsString;
    OpenDialog.Options := [fdoAllowMultiSelect]; // Hanya memilih file, bukan folder
    if OpenDialog.Execute then
    begin
      AttachmentList.Clear;
      DirList := '';
      for I := 0 to OpenDialog.Files.Count - 1 do
      begin
        DirList := DirList + OpenDialog.Files[I] + ';';
        xFileName.Text := xFileName.Text + ExtractFileName(OpenDialog.Files[I]) + ', ';
      end;
      xFileName.Text := Copy(xFileName.Text, 1, Length(xFileName.Text) - 2);
      DirList := Copy(DirList, 1, Length(DirList) - 1);

    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TsendMail.bSendClick(Sender: TObject);
begin
  if xMail.Text = '' then
  begin
    ShowMessage('Email Pengirim tidak boleh kosong!!');
    abort;
  end;

  if xPassword.Text = '' then
  begin
    ShowMessage('Isi Password terlebih dahulu!!');
    abort;
  end;

  if xRecMail.Text = '' then
  begin
    ShowMessage('Email Tujuan tidak boleh kosong!!');
    abort;
  end;

  if xSMTP.Text = '' then
  begin
    ShowMessage('Host Name tidak boleh kosong!!');
    abort;
  end;

  if xPort.Text = '' then
  begin
    ShowMessage('Port Number tidak boleh kosong!!');
    abort;
  end;
  

  if xContent.Text = 'Masukkan isi pesan...' then
    xContent.Text := '';

  mail_username := xMail.Text;
  mail_password := xPassword.Text;
  mail_subject := xSubject.Text;
  mail_content := xContent.Text;
  mail_SMTP := xSMTP.Text;
  mail_port := StrToIntDef(xPort.Text, 25);

  AttachmentList.Delimiter := ';'; // Multiple Attachment dengan ';' sebagai pembatas
  AttachmentList.StrictDelimiter := True;
  AttachmentList.DelimitedText := DirList;

  try
    begin
      mail_to := xRecMail.Text;
      SendingMail(mail_username, mail_password, mail_to, mail_subject, mail_content, mail_SMTP, mail_port, AttachmentList);
      ShowMessage('Berhasil mengirim Email.');
    end;
  except
    on E: Exception do
      ShowMessage('Gagal mengirim Email karena' + #13 + E.Message);
  end;

end;

procedure TsendMail.bSettingsClick(Sender: TObject);
begin
  self.Height:=900;
  bSettings.Visible:=False;
  bCloseSettings.Visible:=True;
  self.Top:=(screen.Height-self.Height) div 2;
  GBSettings.Visible := True;
end;

procedure TsendMail.Button1Click(Sender: TObject);
begin
  xSMTP.Text := 'smtp.gmail.com';
//  xPort.Text := '587';
  xPort.Text := '465';
end;

procedure TsendMail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sendMail := NIL;
end;

procedure TsendMail.FormCreate(Sender: TObject);
begin
  xContent.Text := 'Masukkan isi pesan...';
  AttachmentList := TStringList.Create;
  sendMail.Height := 750;
  bCloseSettings.Left := 22;
//  xSMTP.Text := 'smtp.gmail.com';
//  xSMTP.Text := 'smtp.mail.surya-artha.com';
  xSMTP.Text := 'mail.surya-artha.com';
//  xPort.Text := '587';
  xPort.Text := '465';
  qSetup.Open;
  xMail.Text := qSetup.FieldByName('EMAIL').AsString;
end;

procedure TsendMail.FormDestroy(Sender: TObject);
begin
  sendMail := NIL;
  qSetup.Close;
end;

procedure TsendMail.xContentEnter(Sender: TObject);
begin
  if xContent.Text = 'Masukkan isi pesan...' then
    xContent.Clear;
end;

procedure TsendMail.xContentExit(Sender: TObject);
begin
  if xContent.Text = '' then
    xContent.Text := 'Masukkan isi pesan...';
end;

procedure TsendMail.xContentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0; // Menonaktifkan perilaku bawaan tombol Enter

    xContent.Text := xContent.Text + sLineBreak;
    xContent.SelStart := Length(xContent.Text);
  end;
end;

end.
