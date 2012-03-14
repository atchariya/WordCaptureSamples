#pragma once

static _ATL_FUNC_INFO WEventStruct = {CC_STDCALL, VT_EMPTY, 5, {VT_I4,VT_I4,VT_I4,VT_I4,VT_I4}};
static _ATL_FUNC_INFO WEventHotkeyStruct = {CC_STDCALL, VT_EMPTY, 4, {VT_I4,VT_I4,VT_I4,VT_I4}};

// wmonitor event
typedef struct _tWMONITOR_EVENT
{ 
    long hWnd;
    long x1;
    long y1;
    long x2;
    long y2; 
    long id;
}
WMONITOR_EVENT, *LPWMONITOR_EVENT;

class CWEventListener : public IDispEventSimpleImpl</*nID =*/ 1, CWEventListener, &__uuidof(_IWMonitorXEvents)>
{
public:
    CWEventListener(HWND hWndNotification)
	{
		m_hWndNotification = hWndNotification;
	}
    ~CWEventListener(void);

public:
	BEGIN_SINK_MAP(CWEventListener)
		SINK_ENTRY_INFO(1, __uuidof(_IWMonitorXEvents), 1, &CWEventListener::HandleWEvent, &WEventStruct)
		SINK_ENTRY_INFO(1, __uuidof(_IWMonitorXEvents), 2, &CWEventListener::HandleWEventHotkey, &WEventHotkeyStruct)
	END_SINK_MAP()

    //The event handler functions which have to be implemented.
	void __stdcall HandleWEvent(long hwnd, long x1, long y1, long x2, long y2)
	{
		LPWMONITOR_EVENT lpEventData = new WMONITOR_EVENT;
		lpEventData->hWnd = hwnd;
		lpEventData->x1 = x1;
		lpEventData->y1 = y1;
		lpEventData->x2 = x2;
		lpEventData->y2 = y2;
		//will be deallocated when the message is processed 
		::PostMessage(m_hWndNotification, WM_WONITOREVENT, NULL, (LPARAM)lpEventData);
	}
    void __stdcall HandleWEventHotkey(long hwnd, long x1, long y1, long id)
	{
		LPWMONITOR_EVENT lpEventData = new WMONITOR_EVENT;
		lpEventData->hWnd = hwnd;
		lpEventData->x1 = x1;
		lpEventData->y1 = y1;
		lpEventData->id = id;
		//will be deallocated when the message is processed 
		::PostMessage(m_hWndNotification, WM_WONITOREVENT_HOTKEY, NULL, (LPARAM)lpEventData);
	}

protected:
    HWND m_hWndNotification;
};
