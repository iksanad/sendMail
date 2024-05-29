object sendMail: TsendMail
  Left = 865
  Top = 232
  Caption = 'FORM SEND MAIL'
  ClientHeight = 827
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 140
  TextHeight = 25
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 827
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Color = 16182204
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 525
    ExplicitHeight = 824
    object GBMail: TGroupBox
      Left = 22
      Top = 20
      Width = 488
      Height = 154
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'YOUR MAIL'
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -18
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 22
        Top = 41
        Width = 53
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'E-Mail'
        TabOrder = 0
      end
      object xMail: TEdit
        Left = 115
        Top = 36
        Width = 352
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        TextHint = 'yourmail@gmail.com'
      end
      object StaticText2: TStaticText
        Left = 22
        Top = 95
        Width = 80
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Password'
        TabOrder = 2
      end
      object xPassword: TEdit
        Left = 115
        Top = 92
        Width = 352
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        PasswordChar = '*'
        TabOrder = 3
      end
    end
    object GBRecMail: TGroupBox
      Left = 22
      Top = 182
      Width = 488
      Height = 414
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'RECIPIENT MAIL'
      DefaultHeaderFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -18
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object xRecMail: TEdit
        Left = 115
        Top = 41
        Width = 352
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        TextHint = 'recipient@gmail.com'
      end
      object xSubject: TEdit
        Left = 22
        Top = 90
        Width = 445
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
        TextHint = 'Subject Mail'
      end
      object StaticText3: TStaticText
        Left = 22
        Top = 43
        Width = 53
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'E-Mail'
        TabOrder = 2
      end
      object xContent: TMemo
        Left = 22
        Top = 131
        Width = 445
        Height = 226
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          'xContent')
        ParentFont = False
        TabOrder = 3
        OnEnter = xContentEnter
        OnExit = xContentExit
      end
      object bSelectFile: TButton
        Left = 22
        Top = 365
        Width = 80
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'File'
        TabOrder = 4
        OnClick = bSelectFileClick
      end
      object xFileName: TEdit
        Left = 115
        Top = 365
        Width = 352
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ReadOnly = True
        TabOrder = 5
      end
    end
    object bSend: TButton
      Left = 283
      Top = 605
      Width = 109
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Send Mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bSendClick
    end
    object bClear: TButton
      Left = 401
      Top = 605
      Width = 109
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Clear Mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = bClearClick
    end
    object bSettings: TButton
      Left = 22
      Top = 604
      Width = 109
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Settings'
      TabOrder = 4
      OnClick = bSettingsClick
    end
    object GBSettings: TGroupBox
      Left = 22
      Top = 670
      Width = 488
      Height = 134
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'SETTINGS'
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -18
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 5
      Visible = False
      object StaticText5: TStaticText
        Left = 22
        Top = 41
        Width = 94
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Host Name'
        TabOrder = 0
      end
      object xSMTP: TEdit
        Left = 137
        Top = 36
        Width = 330
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 1
      end
      object StaticText6: TStaticText
        Left = 22
        Top = 85
        Width = 107
        Height = 29
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Port Number'
        TabOrder = 2
      end
      object xPort: TEdit
        Left = 137
        Top = 82
        Width = 104
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 3
      end
      object Button1: TButton
        Left = 379
        Top = 82
        Width = 88
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Default'
        TabOrder = 4
        OnClick = Button1Click
      end
    end
    object bCloseSettings: TButton
      Left = 139
      Top = 604
      Width = 136
      Height = 44
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Close Settings'
      TabOrder = 6
      Visible = False
      OnClick = bCloseSettingsClick
    end
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 88
    Top = 406
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 376
    Top = 448
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 170
    Top = 449
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 271
    Top = 406
  end
  object con1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    HostName = '192.168.0.38'
    Port = 3306
    Database = 'sak_holding231013'
    User = 'Fatra'
    Password = '73fangfang'
    Protocol = 'mysql'
    LibraryLocation = 'C:\project\pr1\PLATINUM\fmain2010feb -NEW\libmySQL.dll'
    Left = 142
    Top = 362
  end
  object qSetup: TZQuery
    Connection = con1
    SQL.Strings = (
      'SELECT * FROM SETUP')
    Params = <>
    Left = 210
    Top = 361
    object qSetupNAME: TWideStringField
      FieldName = 'NAME'
      Size = 80
    end
    object qSetupADDRESS_ID: TIntegerField
      FieldName = 'ADDRESS_ID'
    end
    object qSetupLOGO_FILENAME: TWideStringField
      FieldName = 'LOGO_FILENAME'
      Size = 80
    end
    object qSetupTEMPLATE_FOLDER: TWideStringField
      FieldName = 'TEMPLATE_FOLDER'
      Size = 80
    end
    object qSetupGAMBAR_FOLDER: TWideStringField
      FieldName = 'GAMBAR_FOLDER'
      Size = 80
    end
    object qSetupFREPORT_FOLDER: TWideStringField
      FieldName = 'FREPORT_FOLDER'
      Size = 80
    end
    object qSetupEXCEL_PASS: TWideStringField
      FieldName = 'EXCEL_PASS'
      Size = 40
    end
    object qSetupNO_TRANS: TIntegerField
      FieldName = 'NO_TRANS'
    end
    object qSetupSTOCK_MIN: TIntegerField
      FieldName = 'STOCK_MIN'
    end
    object qSetupLIMIT_PIUT_ORDER: TIntegerField
      FieldName = 'LIMIT_PIUT_ORDER'
    end
    object qSetupLIMIT_PIUT_JUAL: TIntegerField
      FieldName = 'LIMIT_PIUT_JUAL'
    end
    object qSetupQTYBD_PO: TIntegerField
      FieldName = 'QTYBD_PO'
    end
    object qSetupQTYSJ_SO: TIntegerField
      FieldName = 'QTYSJ_SO'
    end
    object qSetupHARGA_SO: TIntegerField
      FieldName = 'HARGA_SO'
    end
    object qSetupHARGA_JUAL: TIntegerField
      FieldName = 'HARGA_JUAL'
    end
    object qSetupDISC_JUAL: TIntegerField
      FieldName = 'DISC_JUAL'
    end
    object qSetupDIRECT_PRINT: TIntegerField
      FieldName = 'DIRECT_PRINT'
    end
    object qSetupEXPORT_REPORT: TIntegerField
      FieldName = 'EXPORT_REPORT'
    end
    object qSetupERP_TABLE_ID: TIntegerField
      FieldName = 'ERP_TABLE_ID'
    end
    object qSetupEMPTY_REPORT: TIntegerField
      FieldName = 'EMPTY_REPORT'
    end
    object qSetupDISC_TOTAL_PERCEN: TWideStringField
      FieldName = 'DISC_TOTAL_PERCEN'
      Size = 30
    end
    object qSetupTOOLBAR_COLOR: TWideStringField
      FieldName = 'TOOLBAR_COLOR'
    end
    object qSetupHEADER_COLOR: TWideStringField
      FieldName = 'HEADER_COLOR'
    end
    object qSetupDETAIL_COLOR: TWideStringField
      FieldName = 'DETAIL_COLOR'
    end
    object qSetupGRID_COLOR: TWideStringField
      FieldName = 'GRID_COLOR'
    end
    object qSetupROW_COLOR: TWideStringField
      FieldName = 'ROW_COLOR'
    end
    object qSetupREPORT_COLOR: TWideStringField
      FieldName = 'REPORT_COLOR'
    end
    object qSetupBILL_ROWCOUNT: TIntegerField
      FieldName = 'BILL_ROWCOUNT'
    end
    object qSetupPEMBULATAN_PPN: TIntegerField
      FieldName = 'PEMBULATAN_PPN'
    end
    object qSetupFLAG_TGL_ACC: TIntegerField
      FieldName = 'FLAG_TGL_ACC'
    end
    object qSetupTGL_ACC: TDateField
      FieldName = 'TGL_ACC'
    end
    object qSetupSCREEN_STOCK: TIntegerField
      FieldName = 'SCREEN_STOCK'
    end
    object qSetupCHECK_MATCHING: TIntegerField
      FieldName = 'CHECK_MATCHING'
    end
    object qSetupSHOW_HPP: TIntegerField
      FieldName = 'SHOW_HPP'
    end
    object qSetupJURNAL_AWAL: TIntegerField
      FieldName = 'JURNAL_AWAL'
    end
    object qSetupSIKLUS_BELI: TIntegerField
      FieldName = 'SIKLUS_BELI'
    end
    object qSetupSIKLUS_JUAL: TIntegerField
      FieldName = 'SIKLUS_JUAL'
    end
    object qSetupSHOW_JUAL_BARCODE: TIntegerField
      FieldName = 'SHOW_JUAL_BARCODE'
    end
    object qSetupSHOW_JUAL_CASH: TIntegerField
      FieldName = 'SHOW_JUAL_CASH'
    end
    object qSetupQTY: TIntegerField
      FieldName = 'QTY'
    end
    object qSetupSTART_DATE: TDateField
      FieldName = 'START_DATE'
      Required = True
    end
    object qSetupCUSTOM1: TWideStringField
      FieldName = 'CUSTOM1'
      Size = 50
    end
    object qSetupCUSTOM2: TWideStringField
      FieldName = 'CUSTOM2'
      Size = 50
    end
    object qSetupCUSTOM3: TWideStringField
      FieldName = 'CUSTOM3'
      Size = 50
    end
    object qSetupCUSTOM4: TWideStringField
      FieldName = 'CUSTOM4'
      Size = 50
    end
    object qSetupCUSTOM5: TWideStringField
      FieldName = 'CUSTOM5'
      Size = 50
    end
    object qSetupCUSTOM6: TWideStringField
      FieldName = 'CUSTOM6'
      Size = 50
    end
    object qSetupCUSTOM7: TWideStringField
      FieldName = 'CUSTOM7'
      Size = 50
    end
    object qSetupCUSTOM8: TWideStringField
      FieldName = 'CUSTOM8'
      Size = 50
    end
    object qSetupCUSTOM9: TWideStringField
      FieldName = 'CUSTOM9'
      Size = 50
    end
    object qSetupCUSTOM10: TWideStringField
      FieldName = 'CUSTOM10'
      Size = 50
    end
    object qSetupEMAIL: TWideStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object qSetupFLAG_EO_PREMIUM: TWideStringField
      FieldName = 'FLAG_EO_PREMIUM'
      Size = 1
    end
    object qSetupPERSEN_UKURAN_QR: TIntegerField
      FieldName = 'PERSEN_UKURAN_QR'
    end
    object qSetupMULTI: TWideStringField
      FieldName = 'MULTI'
      Size = 50
    end
    object qSetupNO_PAJAK: TIntegerField
      FieldName = 'NO_PAJAK'
    end
    object qSetupRETUR_TUNJUK: TWideStringField
      FieldName = 'RETUR_TUNJUK'
      Size = 2
    end
    object qSetupSN_FLAG: TWideStringField
      FieldName = 'SN_FLAG'
      Size = 2
    end
    object qSetupMANUFAKTUR_FLAG: TWideStringField
      FieldName = 'MANUFAKTUR_FLAG'
      Size = 2
    end
    object qSetupTIPE_HARGA_FLAG: TWideStringField
      FieldName = 'TIPE_HARGA_FLAG'
      Size = 2
    end
    object qSetupBPB_MULTI: TWideStringField
      FieldName = 'BPB_MULTI'
      Size = 2
    end
    object qSetupCASH_MULTI: TWideStringField
      FieldName = 'CASH_MULTI'
      Size = 2
    end
    object qSetupKUBIKASI: TWideStringField
      FieldName = 'KUBIKASI'
      Size = 2
    end
    object qSetupHARGA_EXCLUDE: TWideStringField
      FieldName = 'HARGA_EXCLUDE'
      Size = 2
    end
    object qSetupKOLOM_HARGA: TIntegerField
      FieldName = 'KOLOM_HARGA'
    end
    object qSetupPPH_FLAG: TWideStringField
      FieldName = 'PPH_FLAG'
      Size = 1
    end
    object qSetupPROJECT_FLAG: TWideStringField
      FieldName = 'PROJECT_FLAG'
      Size = 1
    end
    object qSetupRETUR_GUDANG: TIntegerField
      FieldName = 'RETUR_GUDANG'
    end
    object qSetupNO_AUDIT_TRAIL: TIntegerField
      FieldName = 'NO_AUDIT_TRAIL'
    end
    object qSetupNEW_WAY_HPP: TWideStringField
      FieldName = 'NEW_WAY_HPP'
      Size = 10
    end
    object qSetupPO_BUDGET: TIntegerField
      FieldName = 'PO_BUDGET'
    end
    object qSetupCUSTOM11: TWideStringField
      FieldName = 'CUSTOM11'
      Size = 11
    end
    object qSetupCUSTOM12: TWideStringField
      FieldName = 'CUSTOM12'
      Size = 11
    end
    object qSetupCUSTOM13: TWideStringField
      FieldName = 'CUSTOM13'
      Size = 11
    end
    object qSetupCUSTOM14: TWideStringField
      FieldName = 'CUSTOM14'
      Size = 11
    end
    object qSetupCUSTOM15: TWideStringField
      FieldName = 'CUSTOM15'
      Size = 11
    end
    object qSetupWA_ID: TIntegerField
      FieldName = 'WA_ID'
    end
    object qSetupWA_LAST_NOTA_ID: TWideStringField
      FieldName = 'WA_LAST_NOTA_ID'
      Size = 12
    end
    object qSetupWA_LAST_TGL: TDateTimeField
      FieldName = 'WA_LAST_TGL'
    end
    object qSetupHARGA_DASAR: TIntegerField
      FieldName = 'HARGA_DASAR'
    end
    object qSetupHOST_FTP: TWideStringField
      FieldName = 'HOST_FTP'
      Size = 50
    end
    object qSetupUSER_FTP: TWideStringField
      FieldName = 'USER_FTP'
      Size = 50
    end
    object qSetupPASWORD_FTP: TWideStringField
      FieldName = 'PASWORD_FTP'
      Size = 50
    end
    object qSetupFOLDER_EFAKTUR_UPLOAD: TWideStringField
      FieldName = 'FOLDER_EFAKTUR_UPLOAD'
      Size = 50
    end
    object qSetupPORT_FTP: TIntegerField
      FieldName = 'PORT_FTP'
    end
  end
end
