#include "stdafx.h"
#include "WEventListener.h"

CWEventListener::CWEventListener(HWND hWndNotification):
g_pConnectionPoint(NULL),
g_dwConnection(0)
{
    g_refCount = 0;
    g_hWndNotification = hWndNotification;
}

CWEventListener::~CWEventListener(void)
{
}

STDMETHODIMP CWEventListener::AttachToSource( IUnknown* pEventSource )
{
    HRESULT hr = S_OK;

    IConnectionPointContainer* pCPC = NULL;
    hr = pEventSource->QueryInterface( IID_IConnectionPointContainer, 
        (void**)&pCPC );
    if (SUCCEEDED(hr)){

        hr = pCPC->FindConnectionPoint( DIID__IWMonitorXEvents, 
            &g_pConnectionPoint );
        if (SUCCEEDED(hr)){

            hr = g_pConnectionPoint->Advise( this, &g_dwConnection );
        }
        pCPC->Release();
    }

    return hr;
}

//******************************************************************************
//*  DetachFromSource -- This method detaches from an event source.
//******************************************************************************/ 
STDMETHODIMP CWEventListener::DetachFromSource()
{
    HRESULT hr = S_OK;
    if (g_pConnectionPoint != NULL){
        g_pConnectionPoint->Unadvise( g_dwConnection );
        g_pConnectionPoint->Release();
        g_pConnectionPoint = NULL;
    }
    return hr;
}

void CWEventListener::HandleWEvent(long hWnd, long x1, long y1, long x2, long y2)
{
    LPWMONITOR_EVENT lpEventData = new WMONITOR_EVENT;
    lpEventData->hWnd = hWnd;
    lpEventData->x1 = x1;
    lpEventData->y1 = y1;
    lpEventData->x2 = x2;
    lpEventData->y2 = y2;
    //will be deallocated when the message is processed 
    ::PostMessage(g_hWndNotification, WM_WONITOREVENT, NULL, (LPARAM)lpEventData);
}

void CWEventListener::HandleWEventHotkey(long hWnd, long x1, long y1, long id)
{
    LPWMONITOR_EVENT lpEventData = new WMONITOR_EVENT;
    lpEventData->hWnd = hWnd;
    lpEventData->x1 = x1;
    lpEventData->y1 = y1;
    lpEventData->id = id;
    //will be deallocated when the message is processed 
    ::PostMessage(g_hWndNotification, WM_WONITOREVENT_HOTKEY, NULL, (LPARAM)lpEventData);
}

//******************************************************************************
//*  QueryInterface -- Determines if this component supports the 
//*  requested interface, places a pointer to that interface in ppvObj if it is 
//*  available, and returns S_OK.  If not, sets ppvObj to NULL and returns 
//*  E_NOINTERFACE.
//******************************************************************************/ 
STDMETHODIMP CWEventListener::QueryInterface(REFIID riid, void ** ppvObj)
{
    if (riid == IID_IUnknown){
        *ppvObj = static_cast<IUnknown*>(this);
    }

    else if (riid == IID_IDispatch){
        *ppvObj = static_cast<IDispatch*>(this);
    }

    else if (riid == DIID__IWMonitorXEvents){
        *ppvObj = static_cast<IDispatch*>(this);
    }

    else{
        *ppvObj = NULL;
        return E_NOINTERFACE;
    }

    static_cast<IUnknown*>(*ppvObj)->AddRef();
    return S_OK;
}

//******************************************************************************
//*  AddRef() -- In order to allow an object to delete itself when 
//*  it is no longer needed, it is necessary to maintain a count of all 
//*  references to this object. When a new reference is created, this function 
//*  increments the count.
//******************************************************************************/ 
STDMETHODIMP_(ULONG) CWEventListener::AddRef()
{
    return ++g_refCount;
}

//******************************************************************************
//*  Release() -- When a reference to this object is removed, this 
//*  function decrements the reference count. If the reference count is 0, then 
//*  this function deletes this object and returns 0.
//******************************************************************************/ 
STDMETHODIMP_(ULONG) CWEventListener::Release()
{
    g_refCount--;

    if (g_refCount == 0)
    {
        delete this;
        return 0;
    }
    return g_refCount;
}

//******************************************************************************
//*   IDispatch Interface -- This interface allows this class to be used as an
//*   automation server, allowing its functions to be called by other COM
//*   objects.
//******************************************************************************/ 
//
//******************************************************************************
//*   GetTypeInfoCount -- This function determines if the class supports type 
//*   information interfaces or not. It places 1 in iTInfo if the class supports
//*   type information and 0 if it does not.
//******************************************************************************/ 
STDMETHODIMP CWEventListener::GetTypeInfoCount(UINT *iTInfo)
{
    *iTInfo = 0;
    return S_OK;
}

//******************************************************************************
//*   GetTypeInfo -- Returns the type information for the class. For classes 
//*   that do not support type information, this function returns E_NOTIMPL;
//******************************************************************************/ 
STDMETHODIMP CWEventListener::GetTypeInfo(UINT /*iTInfo*/, LCID /*lcid*/, ITypeInfo ** /*ppTInfo*/)
{
    return E_NOTIMPL;
}

//******************************************************************************
//*   GetIDsOfNames -- Takes an array of strings and returns an array of DISPIDs
//*   that correspond to the methods or properties indicated. If the name is not 
//*   recognized, returns DISP_E_UNKNOWNNAME.
//******************************************************************************/ 
STDMETHODIMP CWEventListener::GetIDsOfNames(REFIID /*riid*/,  
                                            OLECHAR ** /*rgszNames*/, 
                                            UINT /*cNames*/,  LCID /*lcid*/,
                                            DISPID * /*rgDispId*/)
{
    return E_NOTIMPL;
}

//******************************************************************************
//*   Invoke -- Takes a dispid and uses it to call another of this class's 
//*   methods. Returns S_OK if the call was successful.
//******************************************************************************/ 
STDMETHODIMP CWEventListener::Invoke(DISPID dispIdMember, REFIID /*riid*/, LCID /*lcid*/,
                                     WORD /*wFlags*/, DISPPARAMS* pDispParams,
                                     VARIANT* /*pVarResult*/, EXCEPINFO* /*pExcepInfo*/,
                                     UINT* /*puArgErr*/)
{
    switch(dispIdMember)
    {
    case 0x0001:
       if(pDispParams->cArgs !=5)
           return E_INVALIDARG;
       else
       {
           {
               HandleWEvent(  // Call the function.
                   (pDispParams->rgvarg[4].lVal),
                   (pDispParams->rgvarg[3].lVal),
                   (pDispParams->rgvarg[2].lVal),
                   (pDispParams->rgvarg[1].lVal),
                   pDispParams->rgvarg[0].lVal);
           }
       }
       break;
    case 0x0002:
       if(pDispParams->cArgs !=4)
           return E_INVALIDARG;
       else
       {
           {
               HandleWEventHotkey(  // Call the function.
                   (pDispParams->rgvarg[3].lVal),
                   (pDispParams->rgvarg[2].lVal),
                   (pDispParams->rgvarg[1].lVal),
                   pDispParams->rgvarg[0].lVal);
           }
       }
       break;
    }
    return S_OK;
}