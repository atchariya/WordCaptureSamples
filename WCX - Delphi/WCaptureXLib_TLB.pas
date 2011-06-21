unit WCaptureXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 17244 $
// File generated on 08.03.2010 16:28:16 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Deskperience\Word Capture\WCaptureX.dll (1)
// LIBID: {54DE313F-2261-4B8E-A699-9AE1D69BC7C9}
// LCID: 0
// Helpfile: 
// HelpString: WCaptureX 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Hint: Member 'Class' of 'IUIControl' changed to 'Class_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WCaptureXLibMajorVersion = 1;
  WCaptureXLibMinorVersion = 0;

  LIBID_WCaptureXLib: TGUID = '{54DE313F-2261-4B8E-A699-9AE1D69BC7C9}';

  IID_IWCaptureX: TGUID = '{C8C5926E-1113-4A03-B895-820FFAE4E77A}';
  CLASS_WCaptureX: TGUID = '{8F267988-0CA4-418C-8F94-B4BC5862B390}';
  IID_IWInput: TGUID = '{9544B959-24EC-477E-816E-DD1431416962}';
  IID_IWResult: TGUID = '{6629A892-8148-4501-B9FA-30A1F3E6983C}';
  IID_IWHighlightInfo: TGUID = '{3D8A3085-A097-4312-B6A4-49FF1A4A460B}';
  CLASS_WInput: TGUID = '{4B484CCE-9120-49B7-A5F2-B8B183BFD808}';
  CLASS_WResult: TGUID = '{064E314E-2382-46F2-A93A-239C7115579A}';
  CLASS_WHighlightInfo: TGUID = '{BB314C86-A6C0-4B32-B715-88557445EA19}';
  IID_IUIControl: TGUID = '{A9E4599C-B592-4635-BA63-DD9EE840FE40}';
  CLASS_UIControl: TGUID = '{CB8A46E2-6F08-4040-9A1A-ABA98622DFD9}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum W_CAPTURE_OPTIONS
type
  W_CAPTURE_OPTIONS = TOleEnum;
const
  wCaptureOptionsNone = $00000000;
  wCaptureOptionsHighlightWords = $00000001;
  wCaptureOptionsGetContext = $00000002;
  wCaptureOptionsGetBetweenPoints = $00000004;
  wCaptureOptionsGetHighlightCoordinates = $00000008;
  wCaptureOptionsRecognizeLinks = $00000010;
  wCaptureOptionsUseWindowsWordBreaking = $00000020;
  wCaptureOptionsGetParagraph = $00000040;
  wCaptureOptionsGetSelectedText = $00000080;
  wCaptureOptionsGetTessOCRText = $00000100;
  wCaptureOptionsTessOCRLangMask = $0000F000;
  wCaptureOptionsTessOCRLangShift = $0000000C;
  wCaptureOptionsTessOCRLangDefault = $00000000;
  wCaptureOptionsTessOCRLangEnglish = $00000001;
  wCaptureOptionsTessOCRLangSpanish = $00000002;
  wCaptureOptionsTessOCRLangItalian = $00000003;
  wCaptureOptionsTessOCRLangGerman = $00000004;
  wCaptureOptionsTessOCRLangDutch = $00000005;
  wCaptureOptionsTessOCRLangFrench = $00000006;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IWCaptureX = interface;
  IWCaptureXDisp = dispinterface;
  IWInput = interface;
  IWInputDisp = dispinterface;
  IWResult = interface;
  IWResultDisp = dispinterface;
  IWHighlightInfo = interface;
  IWHighlightInfoDisp = dispinterface;
  IUIControl = interface;
  IUIControlDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WCaptureX = IWCaptureX;
  WInput = IWInput;
  WResult = IWResult;
  WHighlightInfo = IWHighlightInfo;
  UIControl = IUIControl;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}


// *********************************************************************//
// Interface: IWCaptureX
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C8C5926E-1113-4A03-B895-820FFAE4E77A}
// *********************************************************************//
  IWCaptureX = interface(IDispatch)
    ['{C8C5926E-1113-4A03-B895-820FFAE4E77A}']
    function Capture(const input: IWInput): IWResult; safecall;
    procedure GetCursorInfo(out Hwnd: Integer; out x: Integer; out y: Integer); safecall;
    procedure GetCaretInfo(out Hwnd: Integer; out x: Integer; out y: Integer); safecall;
    procedure EndCaptureSession; safecall;
  end;

// *********************************************************************//
// DispIntf:  IWCaptureXDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C8C5926E-1113-4A03-B895-820FFAE4E77A}
// *********************************************************************//
  IWCaptureXDisp = dispinterface
    ['{C8C5926E-1113-4A03-B895-820FFAE4E77A}']
    function Capture(const input: IWInput): IWResult; dispid 1;
    procedure GetCursorInfo(out Hwnd: Integer; out x: Integer; out y: Integer); dispid 2;
    procedure GetCaretInfo(out Hwnd: Integer; out x: Integer; out y: Integer); dispid 3;
    procedure EndCaptureSession; dispid 4;
  end;

// *********************************************************************//
// Interface: IWInput
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9544B959-24EC-477E-816E-DD1431416962}
// *********************************************************************//
  IWInput = interface(IDispatch)
    ['{9544B959-24EC-477E-816E-DD1431416962}']
    function Get_Hwnd: Integer; safecall;
    procedure Set_Hwnd(pVal: Integer); safecall;
    function Get_StartX: Integer; safecall;
    procedure Set_StartX(pVal: Integer); safecall;
    function Get_StartY: Integer; safecall;
    procedure Set_StartY(pVal: Integer); safecall;
    function Get_EndX: Integer; safecall;
    procedure Set_EndX(pVal: Integer); safecall;
    function Get_EndY: Integer; safecall;
    procedure Set_EndY(pVal: Integer); safecall;
    function Get_ContextWordsLeft: Integer; safecall;
    procedure Set_ContextWordsLeft(pVal: Integer); safecall;
    function Get_ContextWordsRight: Integer; safecall;
    procedure Set_ContextWordsRight(pVal: Integer); safecall;
    function Get_Options: Integer; safecall;
    procedure Set_Options(pVal: Integer); safecall;
    function Get_Separators: WideString; safecall;
    procedure Set_Separators(const pVal: WideString); safecall;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); safecall;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); safecall;
    procedure GetSerializedSize(out pnSize: Integer); safecall;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property StartX: Integer read Get_StartX write Set_StartX;
    property StartY: Integer read Get_StartY write Set_StartY;
    property EndX: Integer read Get_EndX write Set_EndX;
    property EndY: Integer read Get_EndY write Set_EndY;
    property ContextWordsLeft: Integer read Get_ContextWordsLeft write Set_ContextWordsLeft;
    property ContextWordsRight: Integer read Get_ContextWordsRight write Set_ContextWordsRight;
    property Options: Integer read Get_Options write Set_Options;
    property Separators: WideString read Get_Separators write Set_Separators;
  end;

// *********************************************************************//
// DispIntf:  IWInputDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9544B959-24EC-477E-816E-DD1431416962}
// *********************************************************************//
  IWInputDisp = dispinterface
    ['{9544B959-24EC-477E-816E-DD1431416962}']
    property Hwnd: Integer dispid 1;
    property StartX: Integer dispid 2;
    property StartY: Integer dispid 3;
    property EndX: Integer dispid 4;
    property EndY: Integer dispid 5;
    property ContextWordsLeft: Integer dispid 6;
    property ContextWordsRight: Integer dispid 7;
    property Options: Integer dispid 8;
    property Separators: WideString dispid 9;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); dispid 10;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); dispid 11;
    procedure GetSerializedSize(out pnSize: Integer); dispid 12;
  end;

// *********************************************************************//
// Interface: IWResult
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {6629A892-8148-4501-B9FA-30A1F3E6983C}
// *********************************************************************//
  IWResult = interface(IDispatch)
    ['{6629A892-8148-4501-B9FA-30A1F3E6983C}']
    function Get_Text: WideString; safecall;
    procedure Set_Text(const pVal: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(pVal: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const pVal: IFontDisp); safecall;
    function Get_Locale: Integer; safecall;
    procedure Set_Locale(pVal: Integer); safecall;
    function Get_CharIndex: Integer; safecall;
    procedure Set_CharIndex(pVal: Integer); safecall;
    function Get_HighlightLeft: Integer; safecall;
    procedure Set_HighlightLeft(pVal: Integer); safecall;
    function Get_HighlightTop: Integer; safecall;
    procedure Set_HighlightTop(pVal: Integer); safecall;
    function Get_HighlightRight: Integer; safecall;
    procedure Set_HighlightRight(pVal: Integer); safecall;
    function Get_HighlightBottom: Integer; safecall;
    procedure Set_HighlightBottom(pVal: Integer); safecall;
    function Get_LeftContext: WideString; safecall;
    procedure Set_LeftContext(const pVal: WideString); safecall;
    function Get_RightContext: WideString; safecall;
    procedure Set_RightContext(const pVal: WideString); safecall;
    function Get_HighlightInfo: IWHighlightInfo; safecall;
    procedure Set_HighlightInfo(const pVal: IWHighlightInfo); safecall;
    function Get_Paragraph: WideString; safecall;
    procedure Set_Paragraph(const pVal: WideString); safecall;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); safecall;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); safecall;
    procedure GetSerializedSize(out pnSize: Integer); safecall;
    property Text: WideString read Get_Text write Set_Text;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property Locale: Integer read Get_Locale write Set_Locale;
    property CharIndex: Integer read Get_CharIndex write Set_CharIndex;
    property HighlightLeft: Integer read Get_HighlightLeft write Set_HighlightLeft;
    property HighlightTop: Integer read Get_HighlightTop write Set_HighlightTop;
    property HighlightRight: Integer read Get_HighlightRight write Set_HighlightRight;
    property HighlightBottom: Integer read Get_HighlightBottom write Set_HighlightBottom;
    property LeftContext: WideString read Get_LeftContext write Set_LeftContext;
    property RightContext: WideString read Get_RightContext write Set_RightContext;
    property HighlightInfo: IWHighlightInfo read Get_HighlightInfo write Set_HighlightInfo;
    property Paragraph: WideString read Get_Paragraph write Set_Paragraph;
  end;

// *********************************************************************//
// DispIntf:  IWResultDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {6629A892-8148-4501-B9FA-30A1F3E6983C}
// *********************************************************************//
  IWResultDisp = dispinterface
    ['{6629A892-8148-4501-B9FA-30A1F3E6983C}']
    property Text: WideString dispid 1;
    property Color: OLE_COLOR dispid 2;
    property Font: IFontDisp dispid 3;
    property Locale: Integer dispid 4;
    property CharIndex: Integer dispid 5;
    property HighlightLeft: Integer dispid 6;
    property HighlightTop: Integer dispid 7;
    property HighlightRight: Integer dispid 8;
    property HighlightBottom: Integer dispid 9;
    property LeftContext: WideString dispid 10;
    property RightContext: WideString dispid 11;
    property HighlightInfo: IWHighlightInfo dispid 12;
    property Paragraph: WideString dispid 13;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); dispid 14;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); dispid 15;
    procedure GetSerializedSize(out pnSize: Integer); dispid 16;
  end;

// *********************************************************************//
// Interface: IWHighlightInfo
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3D8A3085-A097-4312-B6A4-49FF1A4A460B}
// *********************************************************************//
  IWHighlightInfo = interface(IDispatch)
    ['{3D8A3085-A097-4312-B6A4-49FF1A4A460B}']
    function Get_Hwnd: Integer; safecall;
    procedure Set_Hwnd(pVal: Integer); safecall;
    function Get_Count: Integer; safecall;
    procedure Add(const Text: WideString; left: Integer; top: Integer; right: Integer; 
                  bottom: Integer); safecall;
    procedure Remove(index: Integer); safecall;
    procedure Get(index: Integer; out Text: WideString; out left: Integer; out top: Integer; 
                  out right: Integer; out bottom: Integer); safecall;
    procedure PerformHighlight(delay: Integer); safecall;
    procedure PerformHighlightFull(delay: Integer); safecall;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); safecall;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); safecall;
    procedure GetSerializedSize(out pnSize: Integer); safecall;
    property Hwnd: Integer read Get_Hwnd write Set_Hwnd;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IWHighlightInfoDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {3D8A3085-A097-4312-B6A4-49FF1A4A460B}
// *********************************************************************//
  IWHighlightInfoDisp = dispinterface
    ['{3D8A3085-A097-4312-B6A4-49FF1A4A460B}']
    property Hwnd: Integer dispid 1;
    property Count: Integer readonly dispid 2;
    procedure Add(const Text: WideString; left: Integer; top: Integer; right: Integer; 
                  bottom: Integer); dispid 3;
    procedure Remove(index: Integer); dispid 4;
    procedure Get(index: Integer; out Text: WideString; out left: Integer; out top: Integer; 
                  out right: Integer; out bottom: Integer); dispid 5;
    procedure PerformHighlight(delay: Integer); dispid 6;
    procedure PerformHighlightFull(delay: Integer); dispid 7;
    procedure SerializeTo(var buf: Integer; out pnSize: Integer); dispid 8;
    procedure DeserializeFrom(var buf: Integer; out pnSize: Integer); dispid 9;
    procedure GetSerializedSize(out pnSize: Integer); dispid 10;
  end;

// *********************************************************************//
// Interface: IUIControl
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A9E4599C-B592-4635-BA63-DD9EE840FE40}
// *********************************************************************//
  IUIControl = interface(IDispatch)
    ['{A9E4599C-B592-4635-BA63-DD9EE840FE40}']
    function Get_RoleID: Integer; safecall;
    function Get_RoleName: WideString; safecall;
    function Get_Class_: WideString; safecall;
    function Get_Hwnd: Integer; safecall;
    function Get_Value: WideString; safecall;
    procedure GetScreenRect(out px: Integer; out py: Integer; out pw: Integer; out ph: Integer); safecall;
    function GetProcessName: WideString; safecall;
    procedure CreateFromScreenPoint(x: Integer; y: Integer); safecall;
    function Get_Name: WideString; safecall;
    property RoleID: Integer read Get_RoleID;
    property RoleName: WideString read Get_RoleName;
    property Class_: WideString read Get_Class_;
    property Hwnd: Integer read Get_Hwnd;
    property Value: WideString read Get_Value;
    property Name: WideString read Get_Name;
  end;

// *********************************************************************//
// DispIntf:  IUIControlDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {A9E4599C-B592-4635-BA63-DD9EE840FE40}
// *********************************************************************//
  IUIControlDisp = dispinterface
    ['{A9E4599C-B592-4635-BA63-DD9EE840FE40}']
    property RoleID: Integer readonly dispid 1;
    property RoleName: WideString readonly dispid 2;
    property Class_: WideString readonly dispid 3;
    property Hwnd: Integer readonly dispid 4;
    property Value: WideString readonly dispid 5;
    procedure GetScreenRect(out px: Integer; out py: Integer; out pw: Integer; out ph: Integer); dispid 6;
    function GetProcessName: WideString; dispid 7;
    procedure CreateFromScreenPoint(x: Integer; y: Integer); dispid 8;
    property Name: WideString readonly dispid 9;
  end;

// *********************************************************************//
// The Class CoWCaptureX provides a Create and CreateRemote method to          
// create instances of the default interface IWCaptureX exposed by              
// the CoClass WCaptureX. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWCaptureX = class
    class function Create: IWCaptureX;
    class function CreateRemote(const MachineName: string): IWCaptureX;
  end;

// *********************************************************************//
// The Class CoWInput provides a Create and CreateRemote method to          
// create instances of the default interface IWInput exposed by              
// the CoClass WInput. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWInput = class
    class function Create: IWInput;
    class function CreateRemote(const MachineName: string): IWInput;
  end;

// *********************************************************************//
// The Class CoWResult provides a Create and CreateRemote method to          
// create instances of the default interface IWResult exposed by              
// the CoClass WResult. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWResult = class
    class function Create: IWResult;
    class function CreateRemote(const MachineName: string): IWResult;
  end;

// *********************************************************************//
// The Class CoWHighlightInfo provides a Create and CreateRemote method to          
// create instances of the default interface IWHighlightInfo exposed by              
// the CoClass WHighlightInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWHighlightInfo = class
    class function Create: IWHighlightInfo;
    class function CreateRemote(const MachineName: string): IWHighlightInfo;
  end;

// *********************************************************************//
// The Class CoUIControl provides a Create and CreateRemote method to          
// create instances of the default interface IUIControl exposed by              
// the CoClass UIControl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUIControl = class
    class function Create: IUIControl;
    class function CreateRemote(const MachineName: string): IUIControl;
  end;

implementation

uses ComObj;

class function CoWCaptureX.Create: IWCaptureX;
begin
  Result := CreateComObject(CLASS_WCaptureX) as IWCaptureX;
end;

class function CoWCaptureX.CreateRemote(const MachineName: string): IWCaptureX;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WCaptureX) as IWCaptureX;
end;

class function CoWInput.Create: IWInput;
begin
  Result := CreateComObject(CLASS_WInput) as IWInput;
end;

class function CoWInput.CreateRemote(const MachineName: string): IWInput;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WInput) as IWInput;
end;

class function CoWResult.Create: IWResult;
begin
  Result := CreateComObject(CLASS_WResult) as IWResult;
end;

class function CoWResult.CreateRemote(const MachineName: string): IWResult;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WResult) as IWResult;
end;

class function CoWHighlightInfo.Create: IWHighlightInfo;
begin
  Result := CreateComObject(CLASS_WHighlightInfo) as IWHighlightInfo;
end;

class function CoWHighlightInfo.CreateRemote(const MachineName: string): IWHighlightInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WHighlightInfo) as IWHighlightInfo;
end;

class function CoUIControl.Create: IUIControl;
begin
  Result := CreateComObject(CLASS_UIControl) as IUIControl;
end;

class function CoUIControl.CreateRemote(const MachineName: string): IUIControl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UIControl) as IUIControl;
end;

end.
