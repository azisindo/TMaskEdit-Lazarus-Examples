unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Mask,
  ExtCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    
    Label1, Label2, Label3, Label4, Label5: TLabel;
    Label6, Label7, Label8, Label9: TLabel;
    Label10, Label11, Label12, Label13, Label14, Label15: TLabel;
    
    edtPhone, edtMobile: TMaskEdit;
    edtTimeStart, edtTimeEnd, edtDateTime: TMaskEdit;
    edtDecimal, edtScore, edtPrice: TMaskEdit;
    edtIP, edtMAC, edtHex: TMaskEdit;
    edtFirstName, edtLastName, edtEmail, edtPassport: TMaskEdit;
    
    memoPhoneResult, memoTimeResult: TMemo;
    memoNumericResult, memoAddressResult, memoTextResult: TMemo;
    
    btnPhoneTest, btnTimeTest, btnNumericTest: TButton;
    btnAddressTest, btnTextTest: TButton;
    
    procedure FormCreate(Sender: TObject);
    procedure btnPhoneTestClick(Sender: TObject);
    procedure btnTimeTestClick(Sender: TObject);
    procedure btnNumericTestClick(Sender: TObject);
    procedure btnAddressTestClick(Sender: TObject);
    procedure btnTextTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure InitializePhoneTab;
    procedure InitializeTimeTab;
    procedure InitializeNumericTab;
    procedure InitializeAddressTab;
    procedure InitializeTextTab;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitializePhoneTab;
  InitializeTimeTab;
  InitializeNumericTab;
  InitializeAddressTab;
  InitializeTextTab;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TMainForm.InitializePhoneTab;
begin
  Label1.Caption := 'Landline (00) 0000-0000:';
  Label2.Caption := 'Mobile 99 (99) 9 9999-9999:';
  
  edtPhone.EditMask := '(00) 0000-0000;1;_';
  edtPhone.MaxLength := 14;
  
  edtMobile.EditMask := '99 (99) 9 9999-9999;0;_';
  edtMobile.MaxLength := 19;
  
  memoPhoneResult.ReadOnly := True;
  memoPhoneResult.Lines.Add('PHONE NUMBER EXAMPLES:');
  memoPhoneResult.Lines.Add('');
  memoPhoneResult.Lines.Add('Mask Pattern Explanation:');
  memoPhoneResult.Lines.Add('0 = Required digit');
  memoPhoneResult.Lines.Add('9 = Optional digit');
  memoPhoneResult.Lines.Add('( ) = Literal characters');
  memoPhoneResult.Lines.Add(';1;_ = Save chars, use _ for blank');
end;

procedure TMainForm.InitializeTimeTab;
begin
  Label3.Caption := 'Start Time HH:MM:';
  Label4.Caption := 'End Time HH:MM:';
  Label5.Caption := 'DateTime YYYY:MM:DD HH:MM:SS:';
  
  edtTimeStart.EditMask := '00:00;1;_';
  edtTimeStart.MaxLength := 5;
  edtTimeStart.Text := '09:00';
  
  edtTimeEnd.EditMask := '00:00;1;_';
  edtTimeEnd.MaxLength := 5;
  edtTimeEnd.Text := '17:00';
  
  edtDateTime.EditMask := '9999:99:99 99:99:99;1;0';
  edtDateTime.MaxLength := 19;
  
  memoTimeResult.ReadOnly := True;
  memoTimeResult.Lines.Add('TIME FORMAT EXAMPLES:');
  memoTimeResult.Lines.Add('');
  memoTimeResult.Lines.Add('Simple Time: 00:00 (HH:MM)');
  memoTimeResult.Lines.Add('DateTime: 9999:99:99 99:99:99');
end;

procedure TMainForm.InitializeNumericTab;
begin
  Label6.Caption := 'Decimal 0.00:';
  Label7.Caption := 'Score 00.0:';
  Label8.Caption := 'Price R$ 0,00:';
  
  edtDecimal.EditMask := '0.00;1;_';
  edtDecimal.MaxLength := 5;
  edtDecimal.Text := '1.50';
  
  edtScore.EditMask := '99.9;1;_';
  edtScore.MaxLength := 4;
  edtScore.Text := '10.0';
  
  edtPrice.EditMask := '\R\$ 0,00;1;_';
  edtPrice.MaxLength := 9;
  edtPrice.Text := 'R$ 0,00';
  
  memoNumericResult.ReadOnly := True;
  memoNumericResult.Lines.Add('NUMERIC FORMAT EXAMPLES:');
  memoNumericResult.Lines.Add('');
  memoNumericResult.Lines.Add('Decimal: 0.00');
  memoNumericResult.Lines.Add('Score: 99.9');
  memoNumericResult.Lines.Add('Price: \R\$ 0,00');
end;

procedure TMainForm.InitializeAddressTab;
begin
  Label9.Caption := 'IP Address 000.000.000.000:';
  Label10.Caption := 'MAC Address 00:00:00:00:00:00:';
  Label11.Caption := 'Hexadecimal AA AA AA AA:';
  
  edtIP.EditMask := '099.099.099.099;1;_';
  edtIP.MaxLength := 15;
  edtIP.Text := '192.168.001.001';
  
  edtMAC.EditMask := '00:00:00:00:00:00;1;_';
  edtMAC.MaxLength := 17;
  
  edtHex.EditMask := '>AA\ AA\ AA\ AA;0;_';
  edtHex.MaxLength := 11;
  
  memoAddressResult.ReadOnly := True;
  memoAddressResult.Lines.Add('ADDRESS & HEX EXAMPLES:');
  memoAddressResult.Lines.Add('');
  memoAddressResult.Lines.Add('IP: 099.099.099.099');
  memoAddressResult.Lines.Add('MAC: 00:00:00:00:00:00');
  memoAddressResult.Lines.Add('Hex: >AA\ AA\ AA\ AA');
end;

procedure TMainForm.InitializeTextTab;
begin
  Label12.Caption := 'First Name (>L<l):';
  Label13.Caption := 'Last Name (>L<l):';
  Label14.Caption := 'Email (cccc):';
  Label15.Caption := 'Passport (00 00):';
  
  edtFirstName.EditMask := '>L<llllllllllllllllllll;0;_';
  edtFirstName.MaxLength := 21;
  
  edtLastName.EditMask := '>L<llllllllllllllllllll;0;_';
  edtLastName.MaxLength := 21;
  
  edtEmail.EditMask := 'cccccccccccccccccccccccccccccc;0;_';
  edtEmail.MaxLength := 30;
  
  edtPassport.EditMask := '00 00;1;_';
  edtPassport.MaxLength := 5;
  
  memoTextResult.ReadOnly := True;
  memoTextResult.Lines.Add('TEXT FILTERING EXAMPLES:');
  memoTextResult.Lines.Add('');
  memoTextResult.Lines.Add('L = Required uppercase letter');
  memoTextResult.Lines.Add('l = Optional lowercase letter');
  memoTextResult.Lines.Add('c = Any character allowed');
  memoTextResult.Lines.Add('0 = Required digit');
end;

procedure TMainForm.btnPhoneTestClick(Sender: TObject);
var Result: string;
begin
  Result := 'PHONE TEST RESULTS:' + LineEnding + LineEnding;
  Result := Result + 'Landline - Text: ' + edtPhone.Text + LineEnding;
  Result := Result + 'Landline - EditText: ' + edtPhone.EditText + LineEnding + LineEnding;
  Result := Result + 'Mobile - Text: ' + edtMobile.Text + LineEnding;
  Result := Result + 'Mobile - EditText: ' + edtMobile.EditText;
  
  memoPhoneResult.Clear;
  memoPhoneResult.Lines.Add(Result);
  ShowMessage(Result);
end;

procedure TMainForm.btnTimeTestClick(Sender: TObject);
var Result: string;
begin
  Result := 'TIME TEST RESULTS:' + LineEnding + LineEnding;
  Result := Result + 'Start - Text: ' + edtTimeStart.Text + LineEnding;
  Result := Result + 'Start - EditText: ' + edtTimeStart.EditText + LineEnding + LineEnding;
  Result := Result + 'End - Text: ' + edtTimeEnd.Text + LineEnding;
  Result := Result + 'End - EditText: ' + edtTimeEnd.EditText + LineEnding + LineEnding;
  Result := Result + 'DateTime: ' + edtDateTime.Text;
  
  memoTimeResult.Clear;
  memoTimeResult.Lines.Add(Result);
  ShowMessage(Result);
end;

procedure TMainForm.btnNumericTestClick(Sender: TObject);
var Result: string;
begin
  Result := 'NUMERIC TEST RESULTS:' + LineEnding + LineEnding;
  Result := Result + 'Decimal - Text: ' + edtDecimal.Text + LineEnding;
  Result := Result + 'Decimal - EditText: ' + edtDecimal.EditText + LineEnding + LineEnding;
  Result := Result + 'Score - Text: ' + edtScore.Text + LineEnding;
  Result := Result + 'Score - EditText: ' + edtScore.EditText + LineEnding + LineEnding;
  Result := Result + 'Price - Text: ' + edtPrice.Text + LineEnding;
  Result := Result + 'Price - EditText: ' + edtPrice.EditText;
  
  memoNumericResult.Clear;
  memoNumericResult.Lines.Add(Result);
  ShowMessage(Result);
end;

procedure TMainForm.btnAddressTestClick(Sender: TObject);
var Result: string;
begin
  Result := 'ADDRESS TEST RESULTS:' + LineEnding + LineEnding;
  Result := Result + 'IP - Text: ' + edtIP.Text + LineEnding;
  Result := Result + 'IP - EditText: ' + edtIP.EditText + LineEnding + LineEnding;
  Result := Result + 'MAC - Text: ' + edtMAC.Text + LineEnding;
  Result := Result + 'MAC - EditText: ' + edtMAC.EditText + LineEnding + LineEnding;
  Result := Result + 'Hex - Text: ' + edtHex.Text + LineEnding;
  Result := Result + 'Hex - EditText: ' + edtHex.EditText;
  
  memoAddressResult.Clear;
  memoAddressResult.Lines.Add(Result);
  ShowMessage(Result);
end;

procedure TMainForm.btnTextTestClick(Sender: TObject);
var Result: string;
begin
  Result := 'TEXT FILTERING TEST RESULTS:' + LineEnding + LineEnding;
  Result := Result + 'First Name: ' + edtFirstName.Text + LineEnding;
  Result := Result + 'Last Name: ' + edtLastName.Text + LineEnding;
  Result := Result + 'Email: ' + edtEmail.Text + LineEnding;
  Result := Result + 'Passport: ' + edtPassport.Text;
  
  memoTextResult.Clear;
  memoTextResult.Lines.Add(Result);
  ShowMessage(Result);
end;

end.