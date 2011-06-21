#pragma once

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

class CWEventListener : 
    public IDispatch

{
public:
    CWEventListener(HWND hWndNotification);
    ~CWEventListener(void);

    /***** IUnknown Methods *****/ 
    STDMETHODIMP QueryInterface(REFIID riid, void ** ppvObj);
    STDMETHODIMP_(ULONG) AddRef();
    STDMETHODIMP_(ULONG) Release();

    /***** IDispatch Methods *****/ 
    STDMETHODIMP GetTypeInfoCount(UINT *iTInfo);
    STDMETHODIMP GetTypeInfo(UINT iTInfo, LCID lcid, 
        ITypeInfo **ppTInfo);
    STDMETHODIMP GetIDsOfNames(REFIID riid,  
        OLECHAR **rgszNames, 
        UINT cNames,  LCID lcid,
        DISPID *rgDispId);
    STDMETHODIMP Invoke(DISPID dispIdMember, REFIID riid, LCID lcid,
        WORD wFlags, DISPPARAMS* pDispParams,
        VARIANT* pVarResult, EXCEPINFO* pExcepInfo,
        UINT* puArgErr);


    STDMETHODIMP AttachToSource( IUnknown* pEventSource );
    STDMETHODIMP DetachFromSource();

    void HandleWEvent(long hwnd, long x1, long y1, long x2, long y2);
    void HandleWEventHotkey(long hwnd, long x1, long y1, long id);

protected:
    IConnectionPoint* g_pConnectionPoint;
    DWORD g_dwConnection;
    int g_refCount;
    HWND g_hWndNotification;
};
