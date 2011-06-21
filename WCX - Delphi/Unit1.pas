{
  import the wmonitorx.dll and the wcapturex.dll to your project
  from component -> import component
  in order to work properly, you should check the option "create wrapper class"
  when you import the wmonitorx.dll
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WMonitorXLib_TLB, WCaptureXLib_TLB, StdCtrls;

type
  TForm1 = class(TForm)
    clickedWord: TEdit;
    leftContext: TEdit;
    rightContext: TEdit;
    paragraph: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }

    nHotkeyCaretID: integer;
    nHotkeyCursorID: integer;
    nHotkeySelectedTextId: integer;

    const HOTKEYF_ALT = $04;
    const HOTKEYF_SHIFT = $01;
    const HOTKEYF_CONTROL = $02;
    const HOTKEYF_EXT = $08;

    function LowWord(value: integer): integer;
    function HighByte(value: integer): integer;
    function LowByte(value: integer): integer;

    procedure Hotkey2MonitorParams(dwHotkey: integer; var nModifier: integer; var nKey: integer);

  public
    { Public declarations }
    wMonitor: TWMonitorX;
    wCapture: WCaptureX;

    procedure StartMonitoring();
    procedure PerformCapture(var wResult: WResult; hwnd: integer; x1: integer; y1: integer; x2: integer; y2: integer);
    procedure StartCapture(Sender: TObject; hwnd: integer; x1: integer; y1: integer; x2: integer; y2: integer);
    procedure StartCaptureHotkey(Sender: TObject; hwnd: integer; x1: integer; y1: integer; id: integer);

  end;
var

  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.LowWord(value: Integer): integer;
begin
    LowWord := value and $FFFF;
end;

function TForm1.LowByte(value: Integer): integer;
begin
    LowByte := value and $FF;
end;

function TForm1.HighByte(value: Integer): integer;
begin
  HighByte := value shr 8;
end;

procedure TForm1.Hotkey2MonitorParams(dwHotkey: integer; var nModifier: integer; var nKey: integer);
var
  wModifiers: integer;
begin
   nModifier := 0;
   nKey := LowByte(LowWord(dwHotkey));

   wModifiers := HighByte(LowWord(dwHotkey));
   if ((wModifiers and HOTKEYF_ALT) <> 0) then
       nModifier := nModifier or wmKeyAlt;

   if ((wModifiers and HOTKEYF_CONTROL) <> 0) then
      nModifier := nModifier or wmKeyCtrl;

   if ((wModifiers and HOTKEYF_EXT) <> 0) then
      nModifier := nModifier or wmKeyWin;

   if ((wModifiers and HOTKEYF_SHIFT) <> 0) then
      nModifier := nModifier or wmKeyShift;

end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  wMonitor := TWMonitorX.Create(Form1);
  wCapture := CoWCaptureX.Create;

  wMonitor.OnWEvent := StartCapture;
  wMonitor.OnWEventHotkey := StartCaptureHotkey;
  StartMonitoring();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  wMonitor.Stop;
  wcapture.EndCaptureSession;
end;

procedure TForm1.StartCapture(Sender: TObject; hwnd: Integer; x1: Integer; y1: Integer; x2: Integer; y2: Integer);
var
  wResult : IWResult;
begin
  wResult := CoWResult.Create;
  PerformCapture(wResult, hwnd, x1, y1, x2, y2);

  // do something with the result

  clickedWord.Text := wResult.Text;
  leftContext.Text := wResult.LeftContext;
  rightContext.Text := wResult.RightContext;
  paragraph.Text := wResult.Paragraph;

end;

procedure TForm1.StartCaptureHotkey(Sender: TObject; hwnd: Integer; x1: Integer; y1: Integer; id: Integer);
var
  wResult : IWResult;
begin

  if (id = nHotkeyCaretId) or (id = nHotkeyCursorId) or (id = nHotkeySelectedtextId) then
  begin
    wResult := CoWResult.Create;
    PerformCapture(wResult, hwnd, x1, y1, x1, y1);

    // do something with the result

    clickedWord.Text := wResult.Text;
    leftContext.Text := wResult.LeftContext;
    rightContext.Text := wResult.RightContext;
    paragraph.Text := wResult.Paragraph;
  end;

end;

procedure TForm1.StartMonitoring();
var
	color: integer;
	wLineStyle: W_LINE_STYLE;
	wKey: W_KEY;
	wMouse: W_MOUSE;
	dwHotkeyCursor: integer;
	dwHotkeyCaret: integer;
	dwIdleTime: integer;
	dwHotkeySelectedText: integer;
	nKey :integer;
	nModifier: integer;
begin

	color := 61440;
	wLineStyle := wmLineDot;
	wKey := wmKeyCtrl;
	wMouse := wmMouseRight;
	dwHotkeyCursor := 845;
	dwHotkeyCaret := 835;
	dwIdleTime := 2;

	wMonitor.LineStyle := wLineStyle;
  wMonitor.LineColor := color;

	dwHotkeySelectedText := 852;

	wMonitor.Start(wKey, wMouse, true);

	wMonitor.Start2(dwIdleTime*1000);

	nModifier := 0;
	nKey := 0;
	Hotkey2MonitorParams(dwHotkeyCursor, nModifier, nKey);
	wMonitor.Start3(nModifier, nKey, nHotkeyCursorId);

	nModifier := 0;
	nKey := 0;
	Hotkey2MonitorParams(dwHotkeyCaret, nModifier, nKey);
	wMonitor.Start3(nModifier, nKey, nHotkeyCaretId);

	nModifier := 0;
	nKey := 0;
	Hotkey2MonitorParams(dwHotkeySelectedText, nModifier, nKey);
	wMonitor.Start3(nModifier, nKey, nHotkeySelectedTextId);
end;

procedure TForm1.PerformCapture(var wResult: WResult; hwnd: integer; x1: integer; y1: integer; x2: integer; y2: integer);
var
	objInput: IWInput;
	wOptions: integer;
	strResult : string;
begin
	objInput := CoWInput.Create;

	// set capture options
	wOptions := 0;

	// set the get paragraph flag
	wOptions := wOptions or wCaptureOptionsGetParagraph;
	// set the highlight word flag
	wOptions := wOptions or wCaptureOptionsHighlightWords;
	// set the getContext flag
	wOptions := wOptions or wCaptureOptionsGetContext;

	//set capture parameters
	objInput.Hwnd := hwnd;
	objInput.StartX := x1;
	objInput.StartY := y1;
	objInput.EndX := x2;
	objInput.EndY := y2;
	objInput.Options := wOptions;

	// set the number of context words
	objInput.ContextWordsLeft := 1;
	objInput.ContextWordsRight := 1;

	wResult := wCapture.Capture(objInput);

	// get the text from the capture
	strResult := wResult.Text;


	//use OCR if native method fails
	if (strResult = '') then
	begin
		wOptions := wOptions or wCaptureOptionsGetTessOCRText;
		objInput.Options := wOptions;
		wResult := wCapture.Capture(objInput);
	end
end;


end.
