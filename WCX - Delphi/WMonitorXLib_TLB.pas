unit WMonitorXLib_TLB;

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
// File generated on 08.03.2010 18:01:27 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Deskperience\Word Capture\WMonitorX.dll (1)
// LIBID: {68D76969-99CA-4057-9C66-9D0C6F497528}
// LCID: 0
// Helpfile: 
// HelpString: WMonitorX 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// Errors:
//   Error creating palette bitmap of (TWMonitorX) : Server C:\Program Files\Deskperience\Word Capture\WMonitorX.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
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
  WMonitorXLibMajorVersion = 1;
  WMonitorXLibMinorVersion = 0;

  LIBID_WMonitorXLib: TGUID = '{68D76969-99CA-4057-9C66-9D0C6F497528}';

  DIID__IWMonitorXEvents: TGUID = '{BB283CBF-EB78-4438-BC3A-7563ED7FEDBF}';
  IID_IWMonitorX: TGUID = '{CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}';
  CLASS_WMonitorX: TGUID = '{C7E06D1D-4099-43D4-8C22-718E39713773}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum W_MOUSE
type
  W_MOUSE = TOleEnum;
const
  wmMouseLeft = $00000001;
  wmMouseRight = $00000002;
  wmMouseMiddle = $00000004;
  wmMouseButtonMask = $00000007;
  wmMouseDoubleClick = $00000008;

// Constants for enum W_KEY
type
  W_KEY = TOleEnum;
const
  wmKeyNone = $00000000;
  wmKeyAlt = $00000001;
  wmKeyCtrl = $00000002;
  wmKeyAltCtrl = $00000003;
  wmKeyShift = $00000004;
  wmKeyShiftAlt = $00000005;
  wmKeyShiftCtrl = $00000006;
  wmKeyShiftAltCtrl = $00000007;
  wmKeyWin = $00000008;
  wmKeyWinAlt = $00000009;
  wmKeyWinCtrl = $0000000A;
  wmKeyWinAltCtrl = $0000000B;
  wmKeyWinShift = $0000000C;
  wmKeyWinShiftAlt = $0000000D;
  wmKeyWinShiftCtrl = $0000000E;
  wmKeyWinShiftAltCtrl = $0000000F;

// Constants for enum W_LINE_STYLE
type
  W_LINE_STYLE = TOleEnum;
const
  wmLineSolid = $00000001;
  wmLineDash = $00000002;
  wmLineDot = $00000003;
  wmLineDashDot = $00000004;
  wmLineDashDotDot = $00000005;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _IWMonitorXEvents = dispinterface;
  IWMonitorX = interface;
  IWMonitorXDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  WMonitorX = IWMonitorX;


// *********************************************************************//
// DispIntf:  _IWMonitorXEvents
// Flags:     (4096) Dispatchable
// GUID:      {BB283CBF-EB78-4438-BC3A-7563ED7FEDBF}
// *********************************************************************//
  _IWMonitorXEvents = dispinterface
    ['{BB283CBF-EB78-4438-BC3A-7563ED7FEDBF}']
    procedure WEvent(hwnd: Integer; x1: Integer; y1: Integer; x2: Integer; y2: Integer); dispid 1;
    procedure WEventHotkey(hwnd: Integer; x: Integer; y: Integer; id: Integer); dispid 2;
  end;

// *********************************************************************//
// Interface: IWMonitorX
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}
// *********************************************************************//
  IWMonitorX = interface(IDispatch)
    ['{CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}']
    procedure Start(key: Integer; mouse: Integer; allow_drag: WordBool); safecall;
    procedure Stop; safecall;
    function Get_LineColor: OLE_COLOR; safecall;
    procedure Set_LineColor(pVal: OLE_COLOR); safecall;
    function Get_LineStyle: Integer; safecall;
    procedure Set_LineStyle(pVal: Integer); safecall;
    procedure Start2(idle_time: Integer); safecall;
    function Get_LineWidth: Integer; safecall;
    procedure Set_LineWidth(pVal: Integer); safecall;
    procedure Start3(keyModifier: Integer; key: Integer; out pID: Integer); safecall;
    property LineColor: OLE_COLOR read Get_LineColor write Set_LineColor;
    property LineStyle: Integer read Get_LineStyle write Set_LineStyle;
    property LineWidth: Integer read Get_LineWidth write Set_LineWidth;
  end;

// *********************************************************************//
// DispIntf:  IWMonitorXDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}
// *********************************************************************//
  IWMonitorXDisp = dispinterface
    ['{CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}']
    procedure Start(key: Integer; mouse: Integer; allow_drag: WordBool); dispid 1;
    procedure Stop; dispid 2;
    property LineColor: OLE_COLOR dispid 3;
    property LineStyle: Integer dispid 4;
    procedure Start2(idle_time: Integer); dispid 5;
    property LineWidth: Integer dispid 6;
    procedure Start3(keyModifier: Integer; key: Integer; out pID: Integer); dispid 7;
  end;

// *********************************************************************//
// The Class CoWMonitorX provides a Create and CreateRemote method to          
// create instances of the default interface IWMonitorX exposed by              
// the CoClass WMonitorX. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWMonitorX = class
    class function Create: IWMonitorX;
    class function CreateRemote(const MachineName: string): IWMonitorX;
  end;

  TWMonitorXWEvent = procedure(ASender: TObject; hwnd: Integer; x1: Integer; y1: Integer; 
                                                 x2: Integer; y2: Integer) of object;
  TWMonitorXWEventHotkey = procedure(ASender: TObject; hwnd: Integer; x: Integer; y: Integer; 
                                                       id: Integer) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TWMonitorX
// Help String      : WMonitorX
// Default Interface: IWMonitorX
// Def. Intf. DISP? : No
// Event   Interface: _IWMonitorXEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TWMonitorXProperties= class;
{$ENDIF}
  TWMonitorX = class(TOleServer)
  private
    FOnWEvent: TWMonitorXWEvent;
    FOnWEventHotkey: TWMonitorXWEventHotkey;
    FIntf: IWMonitorX;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TWMonitorXProperties;
    function GetServerProperties: TWMonitorXProperties;
{$ENDIF}
    function GetDefaultInterface: IWMonitorX;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_LineColor: OLE_COLOR;
    procedure Set_LineColor(pVal: OLE_COLOR);
    function Get_LineStyle: Integer;
    procedure Set_LineStyle(pVal: Integer);
    function Get_LineWidth: Integer;
    procedure Set_LineWidth(pVal: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IWMonitorX);
    procedure Disconnect; override;
    procedure Start(key: Integer; mouse: Integer; allow_drag: WordBool);
    procedure Stop;
    procedure Start2(idle_time: Integer);
    procedure Start3(keyModifier: Integer; key: Integer; out pID: Integer);
    property DefaultInterface: IWMonitorX read GetDefaultInterface;
    property LineColor: OLE_COLOR read Get_LineColor write Set_LineColor;
    property LineStyle: Integer read Get_LineStyle write Set_LineStyle;
    property LineWidth: Integer read Get_LineWidth write Set_LineWidth;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TWMonitorXProperties read GetServerProperties;
{$ENDIF}
    property OnWEvent: TWMonitorXWEvent read FOnWEvent write FOnWEvent;
    property OnWEventHotkey: TWMonitorXWEventHotkey read FOnWEventHotkey write FOnWEventHotkey;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TWMonitorX
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TWMonitorXProperties = class(TPersistent)
  private
    FServer:    TWMonitorX;
    function    GetDefaultInterface: IWMonitorX;
    constructor Create(AServer: TWMonitorX);
  protected
    function Get_LineColor: OLE_COLOR;
    procedure Set_LineColor(pVal: OLE_COLOR);
    function Get_LineStyle: Integer;
    procedure Set_LineStyle(pVal: Integer);
    function Get_LineWidth: Integer;
    procedure Set_LineWidth(pVal: Integer);
  public
    property DefaultInterface: IWMonitorX read GetDefaultInterface;
  published
    property LineColor: OLE_COLOR read Get_LineColor write Set_LineColor;
    property LineStyle: Integer read Get_LineStyle write Set_LineStyle;
    property LineWidth: Integer read Get_LineWidth write Set_LineWidth;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoWMonitorX.Create: IWMonitorX;
begin
  Result := CreateComObject(CLASS_WMonitorX) as IWMonitorX;
end;

class function CoWMonitorX.CreateRemote(const MachineName: string): IWMonitorX;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WMonitorX) as IWMonitorX;
end;

procedure TWMonitorX.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C7E06D1D-4099-43D4-8C22-718E39713773}';
    IntfIID:   '{CDBEF6D7-0FFB-4330-AA62-14B0C11DDA3E}';
    EventIID:  '{BB283CBF-EB78-4438-BC3A-7563ED7FEDBF}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TWMonitorX.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IWMonitorX;
  end;
end;

procedure TWMonitorX.ConnectTo(svrIntf: IWMonitorX);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TWMonitorX.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TWMonitorX.GetDefaultInterface: IWMonitorX;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TWMonitorX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TWMonitorXProperties.Create(Self);
{$ENDIF}
end;

destructor TWMonitorX.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TWMonitorX.GetServerProperties: TWMonitorXProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TWMonitorX.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnWEvent) then
         FOnWEvent(Self,
                   Params[0] {Integer},
                   Params[1] {Integer},
                   Params[2] {Integer},
                   Params[3] {Integer},
                   Params[4] {Integer});
    2: if Assigned(FOnWEventHotkey) then
         FOnWEventHotkey(Self,
                         Params[0] {Integer},
                         Params[1] {Integer},
                         Params[2] {Integer},
                         Params[3] {Integer});
  end; {case DispID}
end;

function TWMonitorX.Get_LineColor: OLE_COLOR;
begin
    Result := DefaultInterface.LineColor;
end;

procedure TWMonitorX.Set_LineColor(pVal: OLE_COLOR);
begin
  DefaultInterface.Set_LineColor(pVal);
end;

function TWMonitorX.Get_LineStyle: Integer;
begin
    Result := DefaultInterface.LineStyle;
end;

procedure TWMonitorX.Set_LineStyle(pVal: Integer);
begin
  DefaultInterface.Set_LineStyle(pVal);
end;

function TWMonitorX.Get_LineWidth: Integer;
begin
    Result := DefaultInterface.LineWidth;
end;

procedure TWMonitorX.Set_LineWidth(pVal: Integer);
begin
  DefaultInterface.Set_LineWidth(pVal);
end;

procedure TWMonitorX.Start(key: Integer; mouse: Integer; allow_drag: WordBool);
begin
  DefaultInterface.Start(key, mouse, allow_drag);
end;

procedure TWMonitorX.Stop;
begin
  DefaultInterface.Stop;
end;

procedure TWMonitorX.Start2(idle_time: Integer);
begin
  DefaultInterface.Start2(idle_time);
end;

procedure TWMonitorX.Start3(keyModifier: Integer; key: Integer; out pID: Integer);
begin
  DefaultInterface.Start3(keyModifier, key, pID);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TWMonitorXProperties.Create(AServer: TWMonitorX);
begin
  inherited Create;
  FServer := AServer;
end;

function TWMonitorXProperties.GetDefaultInterface: IWMonitorX;
begin
  Result := FServer.DefaultInterface;
end;

function TWMonitorXProperties.Get_LineColor: OLE_COLOR;
begin
    Result := DefaultInterface.LineColor;
end;

procedure TWMonitorXProperties.Set_LineColor(pVal: OLE_COLOR);
begin
  DefaultInterface.Set_LineColor(pVal);
end;

function TWMonitorXProperties.Get_LineStyle: Integer;
begin
    Result := DefaultInterface.LineStyle;
end;

procedure TWMonitorXProperties.Set_LineStyle(pVal: Integer);
begin
  DefaultInterface.Set_LineStyle(pVal);
end;

function TWMonitorXProperties.Get_LineWidth: Integer;
begin
    Result := DefaultInterface.LineWidth;
end;

procedure TWMonitorXProperties.Set_LineWidth(pVal: Integer);
begin
  DefaultInterface.Set_LineWidth(pVal);
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TWMonitorX]);
end;

end.
